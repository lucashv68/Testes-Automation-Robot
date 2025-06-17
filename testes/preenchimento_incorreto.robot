*** Settings ***

Resource           ../resources/main.robot
Test Setup         Dado que eu acesse o Organo
Test Teardown      Fechar o navegador

*** Variables ***

${BOTAO_CARD}      id:form-botao
${MENSAGEM_ERRO_NOME}    id:form-nome-erro    
${MENSAGEM_ERRO_CARGO}    id:form-cargo-erro
${MENSAGEM_ERRO_TIME}    ID:form-times-erro

*** Test Cases ***
Verificar se quando um campo obrigatorio, ficar em branco, vai aparecer uma mensagem de campo obrigatorio
    Dado que eu clique no botao criar card
    Entao sistema deve apresentar mensagem de campo obrigatorio



