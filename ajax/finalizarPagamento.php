<?php

include('../includeConstants.php');

// Verificar se o carrinho existe
if (!isset($_SESSION['carrinho']) || empty($_SESSION['carrinho'])) {
    die('Erro: Carrinho vazio.');
}

$data = [
    'token' => '',
    'email' => '',
    'currency' => 'BRL',
    'notificationURL' => INCLUDE_PATH . 'retorno.php',
    'reference' => uniqid()
];

$index = 1;
$itemsCarrinho = $_SESSION['carrinho'];
try {
    $pdo = \MySql::conectar();
    foreach ($itemsCarrinho as $idProduto => $quantidade) {
        $produto = $pdo->prepare("SELECT * FROM `tb_admin.estoque` WHERE id = ?");
        $produto->execute([$idProduto]);
        $produto = $produto->fetch(PDO::FETCH_ASSOC);

        if (!$produto) {
            continue;
        }

        $data["itemId$index"] = $index;
        $data["itemQuantity$index"] = $quantidade;
        $data["itemDescription$index"] = $produto['nome'];
        $data["itemAmount$index"] = number_format($produto['preco'], 2, '.', '');
        $index++;

		$sql = $pdo->prepare("INSERT INTO `tb_admin.pedidos` VALUES (null,?,?,?,?)");
		$sql->execute([$data['reference'], $idProduto, $quantidade, 'pendente']);
		
    }

    if ($index === 1) {
        die('Erro: Nenhum item válido no carrinho.');
    }

    file_put_contents('pagseguro_request.log', print_r($data, true));

    $url = 'https://ws.sandbox.pagseguro.uol.com.br/v2/checkout';
    $data = http_build_query($data);

    $curl = curl_init($url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false); // Apenas para testes
    curl_setopt($curl, CURLOPT_POST, true);
    curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
    curl_setopt($curl, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
    $xml = curl_exec($curl);

    if ($xml === false) {
        $error = curl_error($curl);
        curl_close($curl);
        die('Erro na requisição cURL: ' . $error);
    }

    curl_close($curl);
    file_put_contents('pagseguro_response.log', $xml);

    $xml = simplexml_load_string($xml);
    if ($xml === false || !isset($xml->code)) {
        $errorMessage = 'Erro ao obter o código de checkout. Resposta: ' . print_r($xml, true);
        if (isset($xml->error)) {
            $errorMessage .= ' Detalhes do erro: ' . $xml->error->message;
        }
        die($errorMessage);
    }

    echo trim((string)$xml->code);
    $_SESSION['carrinho'] = [];
} catch (Exception $e) {
    file_put_contents('error.log', $e->getMessage());
    die('Erro: ' . $e->getMessage());
}

?>