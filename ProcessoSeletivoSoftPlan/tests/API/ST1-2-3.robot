*** Settings ***
Documentation   Documentação da API: https://fakerestapi.azurewebsites.net/swagger/ui/index#!/Books
Resource        ../../resource/ResourceAPI.robot
Suite Setup     Conectar API

*** Test Case ***
Cadastrar Livro
    Cadastrar livro
    Conferir status code    200
    Conferir reason   OK
    Conferir livro cadastrado

Retornar livros cadastrados
    Retornar livros cadastrados
    Conferir status code    200
    Conferir reason   OK
    Conferir se são "200" livros cadastrados

Retornar apenas um livro
    Requisitar livro "13"
    Conferir status code    200
    Conferir reason   OK
    Conferir dados livro 13
