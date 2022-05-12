*** Settings ***
Resource    Configuration/Import.robot


*** Keywords ***
CreateFood
    [Arguments]    ${path}    ${row}
    ${body}=    CreateFoodBody    ${path}    ${row}
    ${header}=    Header
    create session    CreateFoodEndpoint    ${url}    verify=true
    ${response}=    POST On Session    CreateFoodEndpoint     ${CreateFoodEndpoint}    headers=${header}    data=${body}      expected_status=any
    log     res = ${response.text}

GetFood
    [Arguments]    ${path}    ${row}
    ${header}=    Header
    create session    GetFoodEndpoint    ${url}    verify=true
    ${response}=    GET On Session    GetFoodEndpoint     ${GetFoodEndpoint}    headers=${header}       expected_status=any
    log     res = ${response.text}

    CheckGetFoodResponse    ${response.text}    ${path}    ${row}