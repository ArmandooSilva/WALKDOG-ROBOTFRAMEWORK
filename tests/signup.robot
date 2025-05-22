*** Settings ***
Documentation        Suite de testes de cadastro de dog walker

Resource    ../resources/base.resource

Test Setup       Start session    
Test Teardown    Finish session

*** Test Cases ***
Deve poder cadastrar um novo dog walker
    [Tags]    smoke
    ${dog_walker}    Create Dictionary    
    ...    name=Armando Alves
    ...    email=Armando@gmail.com
    ...    CPF=00000014141
    ...    CEP=55019105
    ...    number=122
    ...    details=Casa B
    ...    street=Rua Paulo José de Moraes
    ...    district=São João da Escócia
    ...    city_UF=Caruaru/PE
    ...    Cnh=toretto.jpg
    
    Go to signup page
    Fill signup form    ${dog_walker}  
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Não deve cadastrar se os campos obrigatorios nao forem preenchidos
    [Tags]    required

    Go to signup page 
    Submit signup form
    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto (RG ou CHN)

Não deve cadastrar com CPF inválido
    [tags]    cpf_inv
    ${dog_walker}    Create Dictionary    
    ...    name=Armando Alves
    ...    email=Armando@gmail.com
    ...    CPF=005050524242424
    ...    CEP=55019105
    ...    number=122
    ...    details=Casa B
    ...    street=Rua Paulo José de Moraes
    ...    district=São João da Escócia
    ...    city_UF=Caruaru/PE
    ...    Cnh=toretto.jpg
    
    Go to signup page
    Fill signup form    ${dog_walker}  
    Submit signup form
    Should Be True    'CPF inválido'

Deve poder cadastrar um novo dog walker que sabe cuidar de pets
     [Tags]    aservice

    ${dog_walker}    Create Dictionary    
    ...    name=Armando Alves
    ...    email=Armando@gmail.com
    ...    CPF=00000014141
    ...    CEP=55019105
    ...    number=122
    ...    details=Casa B
    ...    street=Rua Paulo José de Moraes
    ...    district=São João da Escócia
    ...    city_UF=Caruaru/PE
    ...    Cnh=toretto.jpg
    
    Go to signup page
    Fill signup form    ${dog_walker}
    Additional Service    Cuidar  
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.       

Deve poder cadastrar um novo dog walker que sabe adestrar de pets
     [Tags]    aservice

    ${dog_walker}    Create Dictionary    
    ...    name=Armando Alves
    ...    email=Armando@gmail.com
    ...    CPF=00000014141
    ...    CEP=55019105
    ...    number=122
    ...    details=Casa B
    ...    street=Rua Paulo José de Moraes
    ...    district=São João da Escócia
    ...    city_UF=Caruaru/PE
    ...    Cnh=toretto.jpg
    
    Go to signup page
    Fill signup form    ${dog_walker}
    Additional Service    Adestrar  
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato. 

