*** Settings ***
Resource        ../resource/Resource.robot
Test Setup      Abrir Browser
Test TearDown   Fechar Browser

*** Variables ***

*** Test Case ***
Cenario 01: Validar carrinho vazio
  Dado que estou na página home do site
  Quando eu entrar no meu carrinho vazio
  Então conferir se a mensagem "Your shopping cart is empty" foi listado no site

Cenario 02: Validar continuar ou cancelar compra
  Dado que estou na página home do site
  Quando eu pesquisar e add o produto "Blouse" ao meu carrinho
  Então conferir se tenho a opção de continuar comprando ou finalizar compra

Cenário 04: Adicionar Produtos no Carrinho
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    E adicionar o produto no carrinho
    Então deve ser mostrado os dados e valores do produto "Blouse" (preço unit, total, qtd, valor total da compra)

*** Keywords ***
Dado que estou na página home do site
    Acessar a página home do site

Quando eu entrar no meu carrinho vazio
    Entrar no carrinho

Então conferir se a mensagem "${MENSAGEMVAZIO}" foi listado no site
    Conferir se a mensagem "${MENSAGEMVAZIO}" foi listado no site

Quando eu pesquisar e add o produto "${PRODUTO}" ao meu carrinho
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar
    Sleep    2
    Adicionar produto ao carrinho

Então conferir se tenho a opção de continuar comprando ou finalizar compra
    Conferir as opção continuar comprando e finalizar

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar

E adicionar o produto no carrinho
    Adicionar produto ao carrinho
    Sleep    1
    Clicar no botão "Proceed to checkout"
    Sleep    1

Então deve ser mostrado os dados e valores do produto "${PRODUTO}" (preço unit, total, qtd, valor total da compra)
    Conferir se o produto "${PRODUTO}" foi add e esta sendomostrado todos os dados e valores do produto
