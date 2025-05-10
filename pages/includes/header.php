<!DOCTYPE html>
<html>
<head>
	<title>NarekoShop</title>
	<meta charset="viewport" content="width=device-width;initial-scale=1.0;maximum-scale=1.0">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
	<link rel="stylesheet" href="<?php echo INCLUDE_PATH ?>estilo/font-awesome.min.css">
	<link rel="stylesheet" href="<?php echo INCLUDE_PATH ?>estilo/style.css">
</head>
<body>
<base base="<?php echo INCLUDE_PATH; ?>" />

<header>
	<div class="container">
		<div class="logo"><a href="<?php echo INCLUDE_PATH ?>"> NarekoShop</a></div>
		<nav class="desktop">
			<ul>
				<li><a href="javascript:void(0);"><i class="fa fa-shopping-cart"></i> Carrinho(<?php echo \models\homeModel::getTotalItemsCarrinho()?>)</a></li>
				<!--<li style="background:#1e88e5;"><a href="<?php #echo INCLUDE_PATH ?>finalizar">Finalizar pedido</a></li>-->
				<li style="background:#1e88e5;"><a href="<?php echo INCLUDE_PATH?>finalizar">Finalizar pedido</a></li>
			</ul>
		</nav>
		<div class="clear"></div>
	</div><!-- Container-->
</header>