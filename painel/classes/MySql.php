<?php
	class MySql{

		private static $pdo;

		public static function conectar(){
			if(self::$pdo == null){
                //Trywan
                try {
                    //Parâmetro extra para por UTF-8
                    self::$pdo = new PDO('mysql:host=' . HOST . ';dbname=' . DBNAME, USER, PASS, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
                    self::$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                } catch (Exception $e) {
                    die('Erro ao conectar ao banco de dados: ' . $e->getMessage());
                }
			}

			return self::$pdo;
		}

	}
?>