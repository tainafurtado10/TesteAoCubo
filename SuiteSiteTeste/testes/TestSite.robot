*** Settings ***
Resource            ${EXECDIR}/resource/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Case ***
Cenário de teste: Realizar uma Busca de imóvel no portal do corretor.
    Acessar a página home do site
    Realizar o login com o usuário e senha.
    Verifica se logou 

Teste 2
    Acessar a página home do site
    E realizo o login com usuário e senha
    E verifica se logou
    Acessar o menu imóveis 
    E fazer a busca por filtros
    Pesquisa pelo nome: IMOVEL COM TABELA PDF e Incorporadora: BKO
    E filtra preço: 500.000,00 até 501.000,00
    E filtra Tipo de imóvel: Apartamento
    E filtra Estágio da obra: Pronto
    Filtra Características do imóvel: Área Privativa, Dormitórios
    
Teste 3
    Realizar a busca de imóvel através do filtro Cidade ou Bairro
    Realiza a busca da Cidade: São Paulo
    Realiza a busca da Região: Centro
    Em Resultado escolher a opção República.

*** Keywords ***
