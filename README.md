Procedures:

- insertTo(nome_tabela, campos_a_inserir, valores_dos_campos)
	Exemplo: insertTo("Usuario","nome,email,cpf",' "Bruno Serra","bruno@chipper.com.br","2345678901" ');
	
- updateTo(nome_tabela,campo_com_valor_a_alterar,campo_e_valor_atual)
	Exemplo: updateTo("Usuario",' nome="Nilo Junior" ',' nome="Bruno Serra" ');

- selectFrom(nome_tabela,campos_a_selecionar,condicoes)
	Exemplo: selectFrom("Usuario",' nome,cpf ',' nome="Bruno Serra Barboza" ');


Functions:

- buyPass(nome_usuario, nome_evento, nome_setor, quantidade_ingresso, forma_de_pagamento, parcelas) : retorna varchar
	Executa nova compra atualizando todos os dados envoldidos no sistema.
	Exemplo: buyPass("Bruno Serra Barboza", "Lollapalooza", "Pista", 1, "A vista", 1);
