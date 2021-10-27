*** Settings ***
Resource         ${EXECDIR}/resource/Commons/Base.robot
Resource         ${EXECDIR}/resource/pageObject/pageLogin.robot
Resource         ${EXECDIR}/resource/pageObject/pagePesquisa.robot

Suite Setup      Abrir navegador
Test Teardown    Fechar navegador

*** Variables ***

*** Test Case ***

001: TesteSiteBDD
    Acessar a página home do site
    E realizo o login com usuário e senha
    E verifica se logou
    Acessar o menu imóveis 
    E fazer a busca por filtros
    Pesquisa pelo nome: IMOVEL COM TABELA PDF e Incorporadora: BKO
    Filtrar preço: 500.000,00 até 501.000,00
    Filtrar Tipo de imóvel: Apartamento
    Filtrar Estágio da obra: Pronto
    Filtrar Características do imóvel: Área Privativa, Dormitórios
    Realiza a busca de imóvel através do filtro Cidade ou Bairro
    Realiza a busca da Cidade: São Paulo
    Realiza a busca da Região: Centro
    Em Resultado escolher a opção República