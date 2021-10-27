*** Settings ***
Resource    ${EXECDIR}/resource/Commons/Base.robot
Library     SeleniumLibrary
Library     Process

*** Variables ***

${INPUT_PESQUISA}    xpath=//*[@id="textSearch"]
${INPUT_VALOR1}      xpath=//input[@value='R$ 0,00']
${INPUT_VALOR2}      xpath=//input[@value='R$ 0,00']
${INPUT_AREA1}       xpath=//input[@value='0']
${INPUT_AREA2}       xpath=//input[@value='0']
${RESULTADO_BUSCA}   xpath=//*[@id="__next"]/div/main/div[2]/div[1]

*** Keywords ***

Acessar o menu imóveis
    #clica no botão imóveis
    Click Element    xpath=//*[@id="__next"]/div/aside/div/ul/div/li[2]/a/img

E fazer a busca por filtros
    #Essa keyword para pesquisar o elemento
    Wait Until Element is Visible    ${INPUT_PESQUISA} 
    Input Text                       ${INPUT_PESQUISA}      IMOVEL COM TABELA PDF
    Click Button                     Buscar
    Capture Page Screenshot          004_Tela_filtro.png

Pesquisa pelo nome: IMOVEL COM TABELA PDF e Incorporadora: BKO

    Click Button                     Incorporadora
    Wait Until Element is Visible    css:button:nth-child(11)
    Click Element                    css:button:nth-child(11)
    Sleep                            2
    Element Should Contain           ${RESULTADO_BUSCA}   IMOVEL COM TABELA PDF    ignore_case=true
    Capture Page Screenshot          005_Tela_filtro.png

Filtrar preço: 500.000,00 até 501.000,00

    Mouse Over       css:#__next > div > main > section > ul > li:nth-child(1) > button    
    Click Element    xpath=//input[@value='R$ 0,00']
    Input Text       ${INPUT_VALOR1}                                                       500.000,00
    Click Element    xpath=//input[@value='R$ 0,00']
    Input Text       ${INPUT_VALOR2}                                                       501.000,00
    Click Button     Filtrar 
    Element Should Contain           ${RESULTADO_BUSCA}   IMOVEL COM TABELA PDF    ignore_case=true
    Sleep            3

Filtrar Tipo de imóvel: Apartamento
    Mouse Over       css:#__next > div > main > section > ul > li:nth-child(2) > button
    Click Element    id = 1
    Click Button     Filtrar
    Element Should Contain           ${RESULTADO_BUSCA}   IMOVEL COM TABELA PDF    ignore_case=true
    Sleep            3

Filtrar Estágio da obra: Pronto
    Mouse Over       css:#__next > div > main > section > ul > li:nth-child(3) > button
    Click Element    id=COMPLETE
    Click Button     Filtrar
    Element Should Contain           ${RESULTADO_BUSCA}   IMOVEL COM TABELA PDF    ignore_case=true
    Sleep            3

Filtrar Características do imóvel: Área Privativa, Dormitórios
    Mouse Over                 css:#__next > div > main > section > ul > li:nth-child(4) > button
    Click Element              xpath=//input[@value='0']
    Input Text                 ${INPUT_AREA1}                                                                                40m²
    Click Element              xpath=//input[@value='0']
    Input Text                 ${INPUT_AREA2}                                                                                60m²
    Sleep                      1
    Click Element              xpath=(.//*[normalize-space(text()) and normalize-space(.)='até'])[1]/following::button[2]
    Click Button               Filtrar
    Sleep                      3
    Capture Page Screenshot    006_Tela_filtro.png

Realiza a busca de imóvel através do filtro Cidade ou Bairro
    Click Button                     Cidade ou bairro
    Click Element                    xpath=//*[@id="__next"]/div/main/section/article/article/article/label[2]/button
    Sleep                            1
    Click Element                    xpath=//*[@id="__next"]/div/main/section/article/article/article/label[2]/button
    Sleep                            1
    Wait Until Element Is Visible    css:div.css-kovx5y.e1j7hizk0
    Sleep                            3

Realiza a busca da Cidade: São Paulo
    Click Element    css:div.dropdown_input>input[type=text]
    Click Element    xpath=//*[contains(text(),'São Paulo - SP')]
    Sleep            2

Realiza a busca da Região: Centro
    Click Element    xpath =//div[2]/div/div/input
    Click Element    xpath=//*[contains(text(),'Centro')]
    Sleep            1

Em Resultado escolher a opção República
    Click Element              xpath=//li[15]/input 
    Capture Page Screenshot    007_Tela_filtro.png
    Click Button               Buscar
    Capture Page Screenshot    008_Tela_filtro.png
    Element Should Contain           ${RESULTADO_BUSCA}   IMOVEL COM TABELA PDF    ignore_case=true
















