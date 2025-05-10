<div class="chamada-escolher">
    <div class="container">
        <h2>Feche o seu pedido! </h2>
    </div>
</div><!-- Chamada escolher -->

<div class="tabela-pedidos">
    <div class="container">
        <h2><i class="fa fa-shopping-cart"></i> Carrinho: </h2>
        <table>
            <tr>
                <td>Nome do Produto</td>
                <td>Quantidade</td>
                <td>Valor</td>
                <td>Ação</td> <!-- Nova coluna para o botão de exclusão -->
            </tr>
            <?php
                // Processar exclusão do item
                if (isset($_GET['remover'])) {
                    $idProduto = (int)$_GET['remover']; // Sanitiza o ID
                    if (isset($_SESSION['carrinho'][$idProduto])) {
                        unset($_SESSION['carrinho'][$idProduto]); // Remove o item do carrinho
                        // Redireciona para evitar reenvio do formulário ao recarregar
                        header("Location: ".INCLUDE_PATH. "retorno.php");
                        exit;
                    }
                }

                $itemsCarrinho = $_SESSION['carrinho'];
                $total = 0;
                foreach ($itemsCarrinho as $key => $value) {
                    $idProduto = $key;
                    $produto = \MySql::conectar()->prepare("SELECT * FROM `tb_admin.estoque` WHERE id = ?");
                    $produto->execute(array($idProduto));
                    $produto = $produto->fetch();
                    $valor = $value * $produto['preco'];
                    $total+=$valor;
            ?>
            <tr>
                <td><?php echo htmlspecialchars($produto['nome']); ?></td>
                <td><?php echo $value; ?></td>
                <td><?php echo Painel::convertMoney($valor); ?></td>
                <td>
                    <a href="?remover=<?php echo $idProduto; ?>" class="btn-remover" onclick="return confirm('Deseja remover este item do carrinho?');">
                        <i class="fa fa-trash"></i> Remover
                    </a>
                </td>
            </tr>
            <?php
                }
            ?>
        </table>
    </div><!-- container -->
</div><!--tabela-pedidos-->

<div class="finalizar-pedido">
<div class="container">
    <h2>Total: R$ <?php echo Painel::convertMoney($total); ?></h2>
    <div class="clear"></div>
    <a href="" class="btn-pagamento"> Comprar </a>
    <div class="clear"></div>
</div>
</div><!-- Finalizar pedido -->

<script src="<?php echo INCLUDE_PATH ?>js/jquery.js"></script>
<script>
    var include_path = '<?php echo INCLUDE_PATH; ?>';
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://stc.sandbox.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.directpayment.js"></script>
<script type="text/javascript" src="<?php echo INCLUDE_PATH ?>js/pagseguro.lightbox.js"></script>
<script src="<?php echo INCLUDE_PATH ?>js/constants.js"></script>
<script src="<?php echo INCLUDE_PATH ?>js/scripts.js"></script>