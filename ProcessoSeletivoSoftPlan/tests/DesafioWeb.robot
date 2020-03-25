*** Settings ***
Resource        ../resource/Resource.robot
Test Setup      Abrir Browser
Test TearDown   Fechar Browser

*** Variables ***

*** Test Case ***
Cenario 01: Pesquisar produto existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então conferir se o produto "Blouse" foi listado no site

Cenario 02: Pesquisar produto inexistente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "itemNãoexistente"
    Então conferir mensagem de erro "No results were found for your search "itemNãoexistente""


Cenario 03: Exibir total de resultados
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então conferir se foi exibido total de resultados "1 result has been found."

Cenario 04: Exibir total de resultados
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então conferir se produto foi exibido no formato de grid e list

Cenario 05: Exibir total de itens e quantidade por pagina
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então conferir o total de itens e quantidade por pagina "Showing 1 - 1 of 1 item"


*** Keywords ***
Dado que estou na página home do site
    Acessar a página home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar

Então conferir se o produto "${PRODUTO}" foi listado no site
    Conferir se o produto "${PRODUTO}" foi listado no site

Então conferir mensagem de erro "${MENSAGEMERRO}"
    Conferir mensagem de erro "${MENSAGEMERRO}"

Então conferir se foi exibido total de resultados "${RESULTADO}"
    Conferir se foi exibido total de resultados "${RESULTADO}"

Então conferir se produto foi exibido no formato de grid e list
    Conferir se produto foi exibido no formato grid e list

Então conferir o total de itens e quantidade por pagina "${SHOWITENS}"
    Conferir o total de itens e quantidade por pagina "${SHOWITENS}"
