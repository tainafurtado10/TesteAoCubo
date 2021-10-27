*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${Browser}      chrome
${URL}          http://dev.aocubo.com/corretor
*** Keywords ***

Abrir navegador
    Sleep   5
    Open Browser      ${URL}     ${Browser}

Fechar navegador
    Close Browser