*** Settings ***
Resource    ../main.robot

*** Variables ***
${CAMPO_NOME}      id:form-nome
${CAMPO_CARGO}     id:form-cargo
${CAMPO_IMAGEM}    id:form-imagem
${CAMPO_TIME}      class:lista-suspensa
${BOTAO_CARD}      id:form-botao 
@{selecionar_times}       
...    //option[contains(.,'Programação')]
...    //option[contains(.,'Front-End')]
...    //option[contains(.,'Data Science')]
...    //option[contains(.,'Devops')]
...    //option[contains(.,'UX e Design')]
...    //option[contains(.,'Mobile')]
...    //option[contains(.,'Inovação')]


*** Keywords ***

Dado que eu preencha os campos do formulário
    ${Nome}    First Name
    Input Text    ${CAMPO_NOME}    ${Nome}

    ${Cargo}    Job
    Input Text    ${CAMPO_CARGO}    ${Cargo}

    ${IMAGEM}    Image Url
    Input Text    ${CAMPO_IMAGEM}    ${IMAGEM}    

    Click Element    ${CAMPO_TIME}
    Click Element    ${selecionar_times}[1]

E clique no botão "Criar Card"    
    Click Element    ${BOTAO_CARD}

Então identificar o card no time esperado
    Element Should Be Visible    class:colaborador
    Sleep    5s

Então identificar 3 card no time esperado
    FOR    ${i}    IN RANGE    1    4
        Dado que eu preencha os campos do formulário
        E clique no botão "Criar Card"
    END
    Sleep    5s

Então criar e identificar 1 card em cada time disponivel
    FOR    ${indice}    ${time}    IN ENUMERATE    @{selecionar_times}
        Dado que eu preencha os campos do formulário
        Click Element    ${time}
        E clique no botão "Criar Card"
        
    END

    Sleep    10s


Dado que eu clique no botao criar card
    Click Element    ${BOTAO_CARD}

