*** Settings ***
Resource        ../../resource/Resource.robot
Test Setup      Abrir Browser
Test TearDown   Fechar Browser

*** Variables ***

*** Test Case ***
Cenario 01: Validar se no menu Women seus submenus e categorias estão sendo exibidos
  Dado que estou na página home do site
  #verifiicando se "WOMEN","DRESSES" e "T-SHIRTS" estão sendo exibidos
  Quando verificar os menus "WOMEN","DRESSES" e "T-SHIRTS" estão sendo exibidos
  Então conferir se esta sendo exibido os submenus "TOP" "DRESSES" esta exibindo suas respectivas categorias "T-shirts" "Blouses" "Casual Dresses" "Evening Dresses" "Summer Dresses"

Cenario 02: Validar se no menu Dresses suas categoria estão sendo exibidas
  Dado que estou na página home do site
  #verifiicando se "WOMEN","DRESSES" e "T-SHIRTS" estão sendo exibidos
  Quando verificar os menus "WOMEN","DRESSES" e "T-SHIRTS" estão sendo exibidos
  Então conferir se esta sendo exibido as categorias "CASUAL DRESSES" "EVENING DRESSES" "SUMMER DRESSES"

#validando se menus são clicaveis e verificando se produtos estão sendo carregados pelo total de produtos
Cenario 03: Validar se menu Women é clicável
  Dado que estou na página home do site
  Quando clicar no menu Women
  Então conferir se os produtos das categorias do menu Women foram exibidos "There are 7 products."

Cenario 04: Validar se menu Dresses é clicável
  Dado que estou na página home do site
  Quando clicar no menu Dresses
  Então conferir se os produtos das categorias do menu Dresses foram exibidos "There are 5 products."

Cenario 05: Validar se menu Tshirts é clicável
  Dado que estou na página home do site
  Quando clicar no menu Tshirts
  Então conferir se os produtos das categorias do menu Tshirts foram exibidos "There is 1 product."

*** Keywords ***
Dado que estou na página home do site
    Acessar a página home do site

Quando verificar os menus "${MENU1}","${MENU2}" e "${MENU3}" estão sendo exibidos
    Verificar os menus "${MENU1}","${MENU2}" e "${MENU3}" estão sendo exibidos

Então conferir se esta sendo exibido os submenus "TOP" "DRESSES" esta exibindo suas respectivas categorias "${CAT1}" "${CAT2}" "${CAT3}" "${CAT4}" "${CAT5}"
    Verificar submenus "TOP" "DRESSES" e suas respectivas categorias "${CAT1}" "${CAT2}" "${CAT3}" "${CAT4}" "${CAT5}"

Então conferir se esta sendo exibido as categorias "${CAT1}" "${CAT2}" "${CAT3}"
    Verificar se esta sendo exibido as categorias "${CAT1}" "${CAT2}" "${CAT3}"

Quando clicar no menu Women
    Clicar no menu Women

Então conferir se os produtos das categorias do menu Women foram exibidos "${QTDPRODCATEGORIAS}"
        Verificar se os produtos das categorias do menu foram exibidos "${QTDPRODCATEGORIAS}"

Quando clicar no menu Dresses
    Clicar no menu Dresses

Então conferir se os produtos das categorias do menu Dresses foram exibidos "${QTDPRODCATEGORIAS}"
    Verificar se os produtos das categorias do menu foram exibidos "${QTDPRODCATEGORIAS}"

Quando clicar no menu Tshirts
    Clicar no menu Tshirts

Então conferir se os produtos das categorias do menu Tshirts foram exibidos "${QTDPRODCATEGORIAS}"
    Verificar se os produtos das categorias do menu foram exibidos "${QTDPRODCATEGORIAS}"
