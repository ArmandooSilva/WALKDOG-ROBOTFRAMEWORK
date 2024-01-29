*** Settings ***
Documentation    Acções, steps e funcionalidade de cadastro

Library        Browser

*** Keywords ***
Go to signup page
    Click                      css=a[href="/signup"]       
    Wait For Elements State    form h1    visible    5000
    Get Text                   form h1    equal    Faça seu cadastro

Fill signup form
    [Arguments]    ${dog_walker}
    Fill Text                    css=input[placeholder^=Nome]                ${dog_walker}[name]
    Fill Text                    css=input[placeholder$=mail]                ${dog_walker}[email]
    Fill Text                    css=input[placeholder^=CPF]                 ${dog_walker}[CPF]
    Fill Text                    css=input[name="cep"]                       ${dog_walker}[CEP]
    Fill Text                    css=input[placeholder^="Número"]            ${dog_walker}[number]
    Fill Text                    css=input[placeholder^="Complemento"]       ${dog_walker}[details]
    Click                        css=input[type=button][value="Buscar CEP"]
    Get Property                 css=input[name="addressStreet"][placeholder="Rua"]         value    equal   ${dog_walker}[street]
    Get Property                 css=input[name="addressDistrict"][placeholder="Bairro"]    value    equal   ${dog_walker}[district]
    Get Property                 css=input[name="addressCityUf"][placeholder="Cidade/UF"]   value    equal  ${dog_walker}[city_UF]  
    Upload File By Selector      css=input[type="file"]    ${EXECDIR}/resources/fixtures/${dog_walker}[Cnh]

Additional Service
    [Arguments]    ${Additional_service}
    Click                        xpath=//span[text()="${Additional_service}"]/..  

Submit signup form
    Click                        css=button[class="button-register"]

Popup should be
    [Arguments]    ${Mensagem_esperada}
    Wait For Elements State      css=div[class="swal2-html-container"]    visible    5
    Get Text                     css=div[class="swal2-html-container"]    equal    ${Mensagem_esperada}
Alert should be
    [Arguments]    ${expetecd_text}
    
    Wait For Elements State    css=.alert-error >> text=${expetecd_text}
    ...    visible    5