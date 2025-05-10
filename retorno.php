<?php
include('includeConstants.php');

if(isset($_POST['notificatonType']) && $_POST['notificationType' == 'transaction']){

    $email = 'nes.wil.con64@gmail.com';
    $token = '6791891720DC4D7F947FFD38D1BA32C0';

    $url = 'https://ws.sandbox.pagseguro.uol.com.br/v2/transactions/notifications/'.$_POST['notificationCode'].'?email='.$email.'$token='.$token;

    $curl = curl_init($url);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER ,true);
    $transaction = curl_exec($curl);
    curl_close($curl);

    if($transaction == 'Unauthorized'){
        die('Um erro ocorreu!');
    }

    $transation = simplexml_load_string($transaction);
    $transactionStatus = $transation->status;
    if($transactionStatus == 1){
        $transactionStatus = 'Aguardando pagamento';
    } elseif($transactionStatus == 2){
        $transactionStatus = 'Em análise';
    } elseif($transactionStatus == 3){
        $transactionStatus = 'Paga';
        $reference_id = $transation->reference;
        \MySql::conectar()->exec("UPDATE `tb_admin.pedidos` SET `status` = 'pago' WHERE reference_id = '$reference_id'");
    } elseif($transactionStatus == 4){
        $transactionStatus = 'Disponível';
    } elseif($transactionStatus == 5){
        $transactionStatus = 'Em disputa';
    } elseif($transactionStatus == 6){
        $transactionStatus = 'Devolvida';
    } elseif($transactionStatus == 7){
        $transactionStatus = 'Cancelada';
    }

    
}

?>