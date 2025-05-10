-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Tempo de geração: 10-Maio-2025 às 19:35
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `devweb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_admin.agenda`
--

CREATE TABLE `tb_admin.agenda` (
  `id` int(11) NOT NULL,
  `tarefa` varchar(255) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_admin.agenda`
--

INSERT INTO `tb_admin.agenda` (`id`, `tarefa`, `data`) VALUES
(1, 'Dar comida para o rocky', '2017-10-02'),
(2, 'Ir para academia', '2017-10-02'),
(3, 'Ir ao médico', '2017-10-03'),
(4, 'Outra tarefa', '2017-09-01'),
(5, 'kkk', '2017-09-01'),
(6, 'Minha tarefa dia 02', '2017-10-02'),
(7, 'Outra tarefa', '2017-10-02'),
(8, 'tarefa para o dia 03', '2017-10-03'),
(9, 'Tarefa nova', '2017-10-02'),
(10, 'tarefa 2 para o dia 03', '2017-10-03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_admin.alunos`
--

CREATE TABLE `tb_admin.alunos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_admin.alunos`
--

INSERT INTO `tb_admin.alunos` (`id`, `nome`, `email`, `senha`) VALUES
(1, 'Karium Margatroid', 'alicemargatroid@magic.com', '123123'),
(2, 'Margatroid 2', 'margatroid@alice.com', '123123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_admin.aulas`
--

CREATE TABLE `tb_admin.aulas` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `modulo_id` int(11) NOT NULL,
  `link_aula` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_admin.aulas`
--

INSERT INTO `tb_admin.aulas` (`id`, `nome`, `modulo_id`, `link_aula`) VALUES
(1, 'Aula 1 - O Hino da Suécia', 1, 'https://www.youtube.com/embed/huSsm22bXzA?autoplay=1&showinfo=0&controls=0&rel=0'),
(2, 'Aula 2 - O Idioma Sueco', 1, 'https://www.youtube.com/embed/0ZUhr4ommOw?autoplay=1&showinfo=0&controls=0&rel=0'),
(3, 'Aula 3 - História da Suécia', 1, 'https://www.youtube.com/embed/KqCA7GfXHqc?autoplay=1&showinfo=0&controls=0&rel=0'),
(4, 'Aula 1 - Introdução ao PHP', 2, 'https://www.youtube.com/embed/KBT2gmAfav4?autoplay=1&showinfo=0&controls=0&rel=0'),
(5, 'Aula 2 - História dos Servidores WEB e do PHP', 2, 'https://www.youtube.com/embed/-cNUfqz-HU0?autoplay=1&showinfo=0&controls=0&rel=0'),
(6, 'Aula 3 - Primeiros passos no XAMPP', 2, 'https://www.youtube.com/embed/aYA7B6xQC3Q?autoplay=1&showinfo=0&controls=0&rel=0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_admin.chat`
--

CREATE TABLE `tb_admin.chat` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mensagem` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_admin.clientes`
--

CREATE TABLE `tb_admin.clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `cpf_cnpj` varchar(255) NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_admin.clientes`
--

INSERT INTO `tb_admin.clientes` (`id`, `nome`, `email`, `tipo`, `cpf_cnpj`, `imagem`) VALUES
(1, 'Guilherme', 'gui_grillo1@hotmail.com', 'Admin', '09888181', ''),
(2, 'Joao', 'joao@hotmail.com', 'funcionario', '090909090', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_admin.curso_controle`
--

CREATE TABLE `tb_admin.curso_controle` (
  `id` int(11) NOT NULL,
  `aluno_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_admin.curso_controle`
--

INSERT INTO `tb_admin.curso_controle` (`id`, `aluno_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_admin.empreendimentos`
--

CREATE TABLE `tb_admin.empreendimentos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `preco` varchar(255) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_admin.empreendimentos`
--

INSERT INTO `tb_admin.empreendimentos` (`id`, `nome`, `tipo`, `preco`, `imagem`, `slug`, `order_id`) VALUES
(3, 'Teste', 'residencial', '9,00', '59e960c6c520f.jpg', 'teste', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_admin.estoque`
--

CREATE TABLE `tb_admin.estoque` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `largura` int(11) NOT NULL,
  `altura` int(11) NOT NULL,
  `comprimento` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_admin.estoque`
--

INSERT INTO `tb_admin.estoque` (`id`, `nome`, `descricao`, `largura`, `altura`, `comprimento`, `peso`, `quantidade`, `preco`) VALUES
(1, 'Curso de Einheitsübersetzung', 'Um curso sobre a Bíblia Católica Alemã', 0, 0, 0, 0, 5, '299.00'),
(2, 'Curso de PHP em Sueco', 'Um incrível curso de como criar sites em php, no idioma Sueco', 0, 0, 0, 0, 5, '199.99'),
(3, 'Código de Teste para Blog Holandês', 'Um pequeno código de teste para ser colocando em um Blog Holandês', 0, 0, 0, 0, 5, '10.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_admin.estoque_imagens`
--

CREATE TABLE `tb_admin.estoque_imagens` (
  `id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_admin.estoque_imagens`
--

INSERT INTO `tb_admin.estoque_imagens` (`id`, `produto_id`, `imagem`) VALUES
(3, 1, '681cacc66b09e.png'),
(4, 2, '681cace51bdf8.png'),
(5, 3, '681cbea922e47.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_admin.financeiro`
--

CREATE TABLE `tb_admin.financeiro` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `vencimento` date NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_admin.imagens_imoveis`
--

CREATE TABLE `tb_admin.imagens_imoveis` (
  `id` int(11) NOT NULL,
  `imovel_id` int(11) NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_admin.imoveis`
--

CREATE TABLE `tb_admin.imoveis` (
  `id` int(11) NOT NULL,
  `empreend_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `area` int(11) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_admin.modulos`
--

CREATE TABLE `tb_admin.modulos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_admin.modulos`
--

INSERT INTO `tb_admin.modulos` (`id`, `nome`) VALUES
(1, 'Introdução da Suécia'),
(2, 'Introdução ao PHP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_admin.pedidos`
--

CREATE TABLE `tb_admin.pedidos` (
  `id` int(11) NOT NULL,
  `reference_id` varchar(255) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_admin.pedidos`
--

INSERT INTO `tb_admin.pedidos` (`id`, `reference_id`, `produto_id`, `amount`, `status`) VALUES
(13, '59fe42bb254a1', 3, 2, 'pago'),
(14, '59fe42bb254a1', 4, 2, 'pago'),
(15, '681ccced54f52', 3, 1, 'pendente'),
(16, '681cce3720967', 3, 1, 'pendente'),
(17, '681cd0d235b6b', 3, 1, 'pendente'),
(18, '681cd133e5195', 3, 1, 'pendente'),
(19, '681cd3046bfd7', 3, 1, 'pendente'),
(20, '681cd51b60faa', 3, 1, 'pendente'),
(21, '681cd56149e43', 3, 1, 'pendente'),
(22, '681cd73856163', 3, 1, 'pendente'),
(23, '681cd837b713d', 3, 1, 'pendente'),
(24, '681cd95ba6034', 3, 1, 'pendente'),
(25, '681cd9a97f13f', 3, 1, 'pendente'),
(26, '681cdd983f0cd', 3, 1, 'pendente'),
(27, '681ce0a558fe7', 3, 2, 'pendente'),
(28, '681ce18caa2ea', 3, 1, 'pendente'),
(29, '681ce214280d5', 3, 1, 'pendente'),
(30, '681ce397e81b1', 3, 1, 'pendente'),
(31, '681cef07a8174', 3, 1, 'pendente'),
(32, '681cf3307924d', 3, 1, 'pendente'),
(33, '681d04cb1d898', 1, 1, 'pendente'),
(34, '681df2d3c5e38', 3, 1, 'pendente'),
(35, '681df4af88f5a', 3, 1, 'pendente'),
(36, '681df5cd5da79', 3, 1, 'pendente'),
(37, '681df61217d1c', 3, 1, 'pendente'),
(38, '681df79c6655d', 3, 1, 'pendente'),
(39, '681df7d0e9e51', 3, 1, 'pendente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_admin.usuarios`
--

CREATE TABLE `tb_admin.usuarios` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_admin.usuarios`
--

INSERT INTO `tb_admin.usuarios` (`id`, `user`, `password`, `img`, `nome`, `cargo`) VALUES
(1, 'admin', 'admin', '681c7a082a0a8.png', 'Karium Margatroid', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_site.categorias`
--

CREATE TABLE `tb_site.categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_site.categorias`
--

INSERT INTO `tb_site.categorias` (`id`, `nome`, `slug`, `order_id`) VALUES
(1, 'Esportes', 'esportes', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_site.config`
--

CREATE TABLE `tb_site.config` (
  `titulo` varchar(255) NOT NULL,
  `nome_autor` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `icone1` varchar(255) NOT NULL,
  `descricao1` text NOT NULL,
  `icone2` varchar(255) NOT NULL,
  `descricao2` text NOT NULL,
  `icone3` varchar(255) NOT NULL,
  `descricao3` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_site.config`
--

INSERT INTO `tb_site.config` (`titulo`, `nome_autor`, `descricao`, `icone1`, `descricao1`, `icone2`, `descricao2`, `icone3`, `descricao3`) VALUES
('Projeto editado', 'Guilherme Grillo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur commodo consequat finibus. Integer luctus, lacus vitae pretium venenatis, nisl ante fermentum lorem, non volutpat neque ex quis erat. Sed nec turpis et mauris condimentum vestibulum ut sed dui. Morbi eget orci quam. Cras vel augue nec diam tempus efficitur. Aliquam et posuere libero. Integer malesuada justo sit amet ullamcorper pretium. Phasellus pellentesque tincidunt congue. Aliquam dictum ipsum aliquam, elementum massa quis, viverra nibh.\r\n\r\nDuis in hendrerit felis. Aliquam consequat augue quis urna aliquam, id tempor arcu lacinia. Donec egestas leo porttitor lacus laoreet varius. Nam ut pellentesque sapien. Pellentesque placerat dignissim rutrum. Praesent ex mauris, fringilla in tempor id, pharetra nec nibh. Curabitur a ligula sapien. Maecenas condimentum pellentesque fermentum. Fusce blandit lobortis erat, eu mattis metus convallis eleifend. Integer tincidunt ac arcu ut feugiat. Aliquam ac est interdum massa gravida tincidunt a ac leo. Maecenas elit magna, tempus ut eleifend a, sollicitudin et arcu. Aliquam sed tempor velit, at pulvinar tortor. Vestibulum eu lorem sit amet risus porta fringilla ut in nisl.', 'fa fa-css3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur commodo consequat finibus. Integer luctus, lacus vitae pretium venenatis, nisl ante fermentum lorem, non volutpat neque ex quis erat. Sed nec turpis et mauris condimentum vestibulum ut sed dui. Morbi eget orci quam.', 'fa fa-html5', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur commodo consequat finibus. Integer luctus, lacus vitae pretium venenatis, nisl ante fermentum lorem, non volutpat neque ex quis erat. Sed nec turpis et mauris condimentum vestibulum ut sed dui. Morbi ege', 'fa fa-gg-circle', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur commodo consequat finibus. Integer luctus, lacus vitae pretium venenatis, nisl ante fermentum lorem, non volutpat neque ex quis erat. Sed nec turpis et mauris condimentum vestibulum ut sed dui. Morbi eget orci quam. ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_site.depoimentos`
--

CREATE TABLE `tb_site.depoimentos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `depoimento` text NOT NULL,
  `data` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_site.noticias`
--

CREATE TABLE `tb_site.noticias` (
  `id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `conteudo` text NOT NULL,
  `capa` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_site.noticias`
--

INSERT INTO `tb_site.noticias` (`id`, `categoria_id`, `data`, `titulo`, `conteudo`, `capa`, `slug`, `order_id`) VALUES
(1, 1, '2017-09-08', 'Futebol', '<h2><strong>Ano do mes</strong></h2>\r\n<p>Ol&aacute; mundo</p>', '59b31c00ed5d0.jpg', 'futebol', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_site.servicos`
--

CREATE TABLE `tb_site.servicos` (
  `id` int(11) NOT NULL,
  `servico` text NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_site.slides`
--

CREATE TABLE `tb_site.slides` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `slide` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_admin.agenda`
--
ALTER TABLE `tb_admin.agenda`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_admin.alunos`
--
ALTER TABLE `tb_admin.alunos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_admin.aulas`
--
ALTER TABLE `tb_admin.aulas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_admin.chat`
--
ALTER TABLE `tb_admin.chat`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_admin.clientes`
--
ALTER TABLE `tb_admin.clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_admin.curso_controle`
--
ALTER TABLE `tb_admin.curso_controle`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_admin.empreendimentos`
--
ALTER TABLE `tb_admin.empreendimentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_admin.estoque`
--
ALTER TABLE `tb_admin.estoque`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_admin.estoque_imagens`
--
ALTER TABLE `tb_admin.estoque_imagens`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_admin.financeiro`
--
ALTER TABLE `tb_admin.financeiro`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_admin.imagens_imoveis`
--
ALTER TABLE `tb_admin.imagens_imoveis`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_admin.imoveis`
--
ALTER TABLE `tb_admin.imoveis`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_admin.modulos`
--
ALTER TABLE `tb_admin.modulos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_admin.pedidos`
--
ALTER TABLE `tb_admin.pedidos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_admin.alunos`
--
ALTER TABLE `tb_admin.alunos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_admin.aulas`
--
ALTER TABLE `tb_admin.aulas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tb_admin.curso_controle`
--
ALTER TABLE `tb_admin.curso_controle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tb_admin.estoque`
--
ALTER TABLE `tb_admin.estoque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_admin.estoque_imagens`
--
ALTER TABLE `tb_admin.estoque_imagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tb_admin.modulos`
--
ALTER TABLE `tb_admin.modulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_admin.pedidos`
--
ALTER TABLE `tb_admin.pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
