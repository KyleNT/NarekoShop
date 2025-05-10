/*
$(function(){
	

	$('a.btn-pagamento').click(function(e){
		e.preventDefault();
		$.ajax({
			url:include_path+'ajax/finalizarPagamento.php'
		}).done(function(data){
				
				
				
				var isOpenLightBox = PagSeguroLightbox({
					code:data
				},{
					success: function(transactionCode){
						location.href=include_path;
					},
					abort:function(){
						location.href=include_path;
					}
				});

				console.log(isOpenLightBox);
				
		})

		
	});

	
	
})
	*/

/*
$(function() {
    // Certifique-se de que o jQuery está carregado
    if (typeof jQuery === 'undefined') {
        console.error('jQuery não está carregado.');
        return;
    }

    // Evento de clique no botão de pagamento
    $('a.btn-pagamento').click(function(e) {
        e.preventDefault();

        $.ajax({
            url: include_path + 'ajax/finalizarPagamento.php',
            method: 'POST', // Usar POST para maior segurança
            dataType: 'text', // Espera uma string (o código de checkout)
            beforeSend: function() {
                // Opcional: Exibir um carregando
                console.log('Enviando requisição para finalizarPagamento.php...');
            }
        }).done(function(data) {
            // Verificar se o código de checkout é válido
            if (data && data.trim().length === 32) { // O código de checkout tem 32 caracteres
                console.log('Resposta recebida:', data);
                var isOpenLightbox = PagSeguroLightbox(data.trim(), {
                    success: function(transactionCode) {
                        alert('Pagamento concluído com sucesso! Código da transação: ' + transactionCode);
                        window.location.href = include_path + 'retorno.php?transacao=' + transactionCode;
                    },
                    abort: function() {
                        alert('Pagamento cancelado pelo usuário.');
                        window.location.href = include_path + 'finalizar.php';
                    }
                });

                // Fallback: Se o Lightbox não abrir, redirecionar para a página de pagamento
                if (!isOpenLightbox) {
                    console.log('Lightbox não abriu. Redirecionando para a página de pagamento...');
                    window.location.href = 'https://sandbox.pagseguro.uol.com.br/v2/checkout/payment.html?code=' + data.trim();
                }
            } else {
                console.error('Erro retornado:', data);
                alert('Erro ao gerar o pagamento: ' + data);
            }
        }).fail(function(jqXHR, textStatus, errorThrown) {
            console.error('Erro na requisição AJAX:', textStatus, errorThrown);
            alert('Erro ao processar o pagamento. Verifique sua conexão e tente novamente.');
        });
    });
});
*/

$(function() {
    if (typeof jQuery === 'undefined') {
        console.error('jQuery não está carregado.');
        return;
    }

    $('a.btn-pagamento').click(function(e) {
        e.preventDefault();

        $.ajax({
            url: include_path + 'ajax/finalizarPagamento.php',
            method: 'POST',
            dataType: 'text',
            beforeSend: function() {
                console.log('Enviando requisição para finalizarPagamento.php...');
            }
        }).done(function(data) {
            console.log('Resposta recebida:', data);
            if (data && data.trim().length === 32) {
                // Redirecionar diretamente para a página de pagamento
                console.log('Redirecionando para a página de pagamento...');
                window.location.href = 'https://sandbox.pagseguro.uol.com.br/v2/checkout/payment.html?code=' + data.trim();
            } else {
                console.error('Erro retornado:', data);
                alert('Erro ao gerar o pagamento: ' + data);
            }
        }).fail(function(jqXHR, textStatus, errorThrown) {
            console.error('Erro na requisição AJAX:', textStatus, errorThrown);
            alert('Erro ao processar o pagamento: ' + textStatus);
        });
    });
});