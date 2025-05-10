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
	define('NOME_EMPRESA','');

	//Funções do painel
	function pegaCargo($indice){
		return Painel::$cargos[$indice];
	}

	function selecionadoMenu($par){
		/*<i class="fa fa-angle-double-right" aria-hidden="true"></i>*/
		$url = explode('/',@$_GET['url'])[0];
		if($url == $par){
			echo 'class="menu-active"';
		}
	}

	function verificaPermissaoMenu($permissao){
		if($_SESSION['cargo'] >= $permissao){
			return;
		}else{
			echo 'style="display:none;"';
		}
	}

	function verificaPermissaoPagina($permissao){
		if($_SESSION['cargo'] >= $permissao){
			return;
		}else{
			include('painel/pages/permissao_negada.php');
			die();
		}
	}

	function recoverPost($post){
		if(isset($_POST[$post])){
			echo $_POST[$post];
		}
	}
?>