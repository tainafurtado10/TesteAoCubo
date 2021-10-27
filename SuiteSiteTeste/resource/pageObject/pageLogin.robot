*** Settings ***
Resource    ${EXECDIR}/resource/Commons/Base.robot
Library     SeleniumLibrary
Library     Process

*** Variables ***

${INPUT_EMAIL}       xpath=//*[@id="__next"]/section/main/div/form/div/div[1]/input
${INPUT_SENHA}       xpath=//*[@id="__next"]/section/main/div/form/div/div[2]/input

*** Keywords ***

Acessar a página home do site
    Title Should Be                  Corretor AoCubo
    Click Button                     Login
    #aguarda o elemento ficar visivel para poder prosseguir com o teste
    Wait Until Element is Visible    xpath=//*[@id="__next"]/section/main/div/form/div    timeout=10s
    Capture Page Screenshot          001_Tela_home.png

E realizo o login com usuário e senha
    #digita nos campos
    Input Text        ${INPUT_EMAIL}    vsantos.lvieira@gmail.com
    Input Password    ${INPUT_SENHA}    Lopo@2812
    Capture Page Screenshot          002_Tela_login.png
    #clica no botao
    Click Button      Fazer login       

E verifica se logou
    #Essa keyword verifica se o texto está na página
    Wait Until Element is Visible    xpath=//*[@id="__next"]/div/main/div[1]/div[1]    
    Element Should Contain           xpath=//*[@id="__next"]/div/main/div[1]/div[1]    Boa tarde, Vinícius Lopo
    Capture Page Screenshot          003_Tela_logado.png                                