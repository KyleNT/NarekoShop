<?php
	session_start();
	date_default_timezone_set('America/Sao_Paulo');
	$autoload = function($class){
    // Caso especial para a classe Email
    if ($class == 'Email') {
        require_once('classes/phpmailer/PHPMailerAutoload.php');
    }

    // Converte o namespace em um caminho de arquivo
    $classPath = str_replace('\\', '/', $class) . '.php';
    $file = 'classes/' . $classPath;

    // Verifica se o arquivo existe antes de incluir
    if (file_exists($file)) {
        include $file;
    } else {
        // Opcional: Adicione um log ou mensagem para debug
         echo "Arquivo não encontrado: $file";
    }
	};

	spl_autoload_register($autoload);


	define('INCLUDE_PATH','https://crowphilis.42web.io/NarekoShop/');
	define('INCLUDE_PATH_PAINEL',INCLUDE_PATH.'painel/');

	define('BASE_DIR_PAINEL',__DIR__.'/painel');


    define('HOST', 'sql207.infinityfree.com');
    define('PORT', '3307');
    define('DBNAME', 'if0_35777390_crowphilis');
    define('USER', 'if0_35777390');
    define('PASS', 'EMx9ekTmWE');


	//Constantes para o painel de controle
	define('NOME_EMPRESA','Karium Network');
?>