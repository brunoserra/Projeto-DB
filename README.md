Procedures:

- insertTo(nome_tabela, campos_a_inserir, valores_dos_campos)

	Exemplo: call insertTo("Usuario","nome,email,cpf",' "Bruno Serra","bruno[@]uptune.com.br","2345678901" ');
	
- updateTo(nome_tabela,campo_com_valor_a_alterar,campo_e_valor_atual)

	Exemplo: call updateTo("Usuario",' nome="Nilo Junior" ',' nome="Bruno Serra" ');

- selectFrom(nome_tabela,campos_a_selecionar,condicoes)

	Exemplo: call selectFrom("Usuario",' nome,cpf ',' nome="Bruno Serra Barboza" ');

-  ingressosDisponiveis('') ou  ingressosDisponiveis('nome_evento')

	Lista quantidade de ingressos disponíveis de todos os eventos ou de um específico.

	Exemplo: call ingressosDisponiveis("Lollapalooza");

-  ingressosReservados()

	Lista de usuarios que reservaram ingressos.

	Exemplo: call ingressosReservados();

-  listUsers('') ou listUsers('parte_nome_usuario')

	Lista usuarios ou pesquisa usuarios a partir de strirng.

	Exemplo: call listUsers('serra');

-  buysPerUser('') ou buysPerUser('nome_usuario')

	Lista todos os usuarios e quantas vezes já compraram ou usuario específico.

	Exemplo: call buysPerUser('Bruno Serra');

-  lucrePerEvent('') ou lucrePerEvent('nome_evento')

	Lista todos os eventos e quanto foi arrecadado ou evento específico.

	Exemplo: call lucrePerEvent('Lollapalooza');

-  membersPerEvent('') ou membersPerEvent('nome_evento')

	Lista quantos integrantes cada evento tem ou lista quem sao de terminado evento.

	Exemplo: call membersPerEvent('Lollapalooza');

-  toReceive()

	Mostra total que falta receber das parcelas em aberto

	Exemplo: call membersPerEvent('Lollapalooza');

-  toReceiveFromUser('nome_usuario')

	Mostra total que falta receber das parcelas em aberto de determinado usuario

	Exemplo: call toReceiveFromUser('Bruno Serra');

-  inadimplente()

	Mostra parcelas e usuarios que não pagaram suas parcelas

	Exemplo: call toReceiveFromUser('Bruno Serra');

-  eventsPerPlace('nome_ambiente')

	Lista os eventos que ocorreram no ambiente dado

	Exemplo: call toReceiveFromUser('Morumbi');


Functions:

- buyPass(nome_usuario, nome_evento, nome_setor, quantidade_ingresso, forma_de_pagamento, parcelas) : retorna varchar

	Executa nova compra atualizando todos os dados envoldidos no sistema.

	Exemplo: buyPass("Bruno Serra Barboza", "Lollapalooza", "Pista", 1, "A vista", 1);

- newEvent(nome_evento, nome_local, descricao, data_evento, tipo_evento, integrantes_evento) : retorna varchar

	Cria novo evento atualizando todos os dados envoldidos no sistema. Campo de integrantes deve ser preenchido separando-os por vírgula.

	Exemplo: newEvent("Planeta Terra 2015", "Jockey Sao Paulo", "O maior evento hipster do brasil", "25/02/2013", "Festival", "Maria, Paula, Marcos, Bruno Serra");


Events:

- remove_reservas() : roda de todo dia removendo as reservas com mais de 24h

