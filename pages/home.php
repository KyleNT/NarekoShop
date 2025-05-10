<div class="chamada-escolher">
    <div class="container">
    <h2>O futuro começa agora, com os nossos produtos! </h2>
    </div>
</div><!-- Chamada escolher -->

<div class="lista-items">
    <div class="container">
       <div class="produtos-container">
            <?php
                $items = \models\homeModel::getLojaItems();
                foreach ($items as $key => $value) {
                    # code...
                    $imagem = \MySql::conectar()->prepare("SELECT * FROM `tb_admin.estoque_imagens` WHERE produto_id = ?");
                    $imagem->execute([$value['id']]);
                    $imagem = $imagem->fetch()['imagem'];
                    $nomeCurso = \MySql::conectar()->prepare("SELECT * FROM `tb_admin.estoque` WHERE id = ?");
                    $nomeCurso->execute([$value['id']]);
            ?>
                    <div class="produto-single-box">
                    <img src="<?php echo INCLUDE_PATH_PAINEL ?>uploads/<?php echo htmlspecialchars($imagem); ?>" 
                 alt="Imagem do produto <?php echo htmlspecialchars($value['nome']); ?>" 
                 loading="lazy">
                        <p><?php echo htmlspecialchars($value['nome']); ?></p>
                        <p>Preço: R$<?php echo Painel::convertMoney($value['preco']); ?></p>
                        <!--<a href="<?php #echo INCLUDE_PATH ?>?addCart=<?php #echo $value['id']; ?>">Adicionar no carrinho!</a>-->
                        <a href="<?php echo INCLUDE_PATH?>?addCart=<?php echo $value['id']; ?>">Adicionar no carrinho!</a>
                    </div> <!-- produto-single-box -->
            <?php
                }
            ?>
        </div> <!-- Produtos Container -->
    </div> <!-- Container -->
</div> <!-- lista-items -->