*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${URL}    http://automationpractice.com
${BROWSER}    chrome

*** Keywords ***

### Setup and TearDown ####

Abrir Browser
    Open Browser    about:blank   ${BROWSER}
    Maximize Browser Window

Fechar Browser
    Close Browser

#Açoes
Acessar a página home do site
    Go To               http://automationpractice.com/index.php
    Title Should Be    My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text    name=search_query     ${PRODUTO}

Clicar no botão pesquisar
    Click Element   submit_search

Entrar no carrinho
      Wait Until Element Is Visible   xpath=//*[@id="header"]/div[3]/div/div/div[3]/div/a
      Click Element                   xpath=//*[@id="header"]/div[3]/div/div/div[3]/div/a
      Sleep    3


Adicionar produto ao carrinho
      Wait Until Element Is Visible   xpath=//*[@id="center_column"]//img[@alt="Blouse"]
      Click Element                   xpath=//*[@id="center_column"]//img[@alt="Blouse"]
      Wait Until Element Is Visible   xpath=//*[@id="add_to_cart"]/button
      Click Button                    xpath=//*[@id="add_to_cart"]/button



Clicar no botão "Proceed to checkout"
    Wait Until Element Is Visible   xpath=//*[@id="layer_cart"]//a[@title="Proceed to checkout"]
    Click Element                   xpath=//*[@id="layer_cart"]//a[@title="Proceed to checkout"]

Adicionar o produto "${PRODUTO}" no carrinho
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar
    Clicar no botão "Proceed to checkout"


#Validações

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible     css=#center_column > h1
    Title Should Be                   Search - My Store
    Page Should Contain Image         xpath=//*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img
    Page Should Contain Link          xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),${PRODUTO})]

Conferir mensagem de erro "${MENSAGEMERRO}"
    Wait Until Element Is Visible     css=#center_column > h1
    Title Should Be                   Search - My Store
    Wait Until Element Is Visible     //*[@id="center_column"]/p
    Element Should Contain            //*[@id="center_column"]/p    ${MENSAGEMERRO}

Conferir se foi exibido total de resultados "${RESULTADO}"
      Wait Until Element Is Visible   //*[@id="center_column"]/h1/span[2]
      Element Should Contain          //*[@id="center_column"]/h1/span[2]        ${RESULTADO}

Conferir se produto foi exibido no formato grid e list
      Wait Until Element Is Visible   xpath=//*[@id="grid"]/a/i
      Click Element                   xpath=//*[@id="grid"]/a/i
      #verifica se botão add to card não esta visivel
      Element Should Not Be Visible   xpath=//*[@id="center_column"]/ul/li/div/div/div[3]/div
      Click Element                   xpath=//*[@id="list"]/a/i
      #verifica se botão add to card ao trocado por modo list esta visivel
      Element Should Be Visible       xpath=//*[@id="center_column"]/ul/li/div/div/div[3]/div


Conferir o total de itens e quantidade por pagina "${SHOWITENS}"
      Wait Until Element Is Visible   xpath=//*[@id="center_column"]/div[2]/div/div[2]
      Element Should Contain          xpath=//*[@id="center_column"]/div[2]/div/div[2]        ${SHOWITENS}

Conferir as opção continuar comprando e finalizar
      Page Should Contain    Continue shopping
      Page Should Contain    Proceed to checkout


Conferir se a mensagem "${MENSAGEMVAZIO}" foi listado no site
      Element Should Contain          xpath=//*[@id="center_column"]/p    ${MENSAGEMVAZIO}


Conferir se o produto "${PRODUTO}" foi add e esta sendomostrado todos os dados e valores do produto
    Wait Until Element Is Visible  xpath=//*[@id="cart_title"][contains(text(),"Shopping-cart summary")]
    Element Text Should Be         xpath=//*[@class="cart_description"]/*[@class="product-name"]       Blouse
    Element Text Should Be         xpath=//*[@class="cart_unit"]/*[@class="price"]/span   $27.00
    Element Text Should Be         xpath=//*[@id="product_price_2_7_0"]/span             $27.00
    Element Text Should Be         id=total_price               $29.00
    Input Text                     xpath=//*[@id="product_2_7_0_0"]/td[5]/input[2]    1
