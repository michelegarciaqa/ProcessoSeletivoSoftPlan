*** Settings ***
Documentation   Documentação da API: https://fakerestapi.azurewebsites.net/swagger/ui/index#!/Books
Library         RequestsLibrary
Library         Collections

*** Variable ***
${URL_API}        https://fakerestapi.azurewebsites.net/api/
&{BOOK_344}   ID=344
...         Title=SoftPlan
...         Description=Magos e Bruxos em ação
...         PageCount=5443
...         Excerpt=Teste de API
...         PublishDate=2020-10-08T01:24:45.557Z

&{BOOK_13}      ID=13
...             Title=Book 13
...             PageCount=1300

*** Keywords ***
#### setup and tear down ####
Conectar API
    Create Session    API    ${URL_API}
    ${HEADERS}        Create Dictionary    content-type=application/json
    Set Suite Variable    ${HEADERS}

#aço~es
Cadastrar livro
    ${RESPOSTA}  Post Request   API   Books
    ...                         data={"ID": ${BOOK_344.ID},"Title": "${BOOK_344.Title}","Description": "${BOOK_344.Description}","PageCount": ${BOOK_344.PageCount},"Excerpt": "${BOOK_344.Excerpt}", "PublishDate": "${BOOK_344.PublishDate}"}
    ...                         headers=${HEADERS}
    Log         ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Retornar livros cadastrados
    ${RESPOSTA}    Get Request    API    Books
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Requisitar livro "${ID}"
    ${RESPOSTA}    Get Request    API    Books/${ID}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

#conferencias
Conferir status code
    [Arguments]      ${STATUSCODE}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE}

Conferir reason
    [Arguments]    ${REASON}
    Should Be Equal As Strings    ${RESPOSTA.reason}     ${REASON}

Conferir se são "${QUANTIDADE}" livros cadastrados
    Length Should Be      ${RESPOSTA.json()}     ${QUANTIDADE}


Conferir livro cadastrado
  Dictionary Should Contain Item    ${RESPOSTA.json()}    ID            ${BOOK_344.ID}
  Dictionary Should Contain Item    ${RESPOSTA.json()}    Title         ${BOOK_344.Title}
  Dictionary Should Contain Item    ${RESPOSTA.json()}    Description   ${BOOK_344.Description}
  Dictionary Should Contain Item    ${RESPOSTA.json()}    PageCount     ${BOOK_344.PageCount}
  Dictionary Should Contain Item    ${RESPOSTA.json()}    Excerpt       ${BOOK_344.Excerpt}

Conferir dados livro 13
    Dictionary Should Contain Item    ${RESPOSTA.json()}    ID              ${BOOK_13.ID}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    Title           ${BOOK_13.Title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    PageCount       ${BOOK_13.PageCount}
    Should Not Be Empty    ${RESPOSTA.json()["Description"]}
    Should Not Be Empty    ${RESPOSTA.json()["Excerpt"]}
    Should Not Be Empty    ${RESPOSTA.json()["PublishDate"]}
