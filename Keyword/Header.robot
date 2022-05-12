*** Settings ***
Library    Collections
Resource    ../Configuration/Import.robot

*** Keywords ***
Header
    #create header
    ${header}=    create dictionary    Content-Type=${contentType}
    #set to dictionary    ${header}    requestUID    ${IV}
    set to dictionary    ${header}    Authorization    ${token}
    #set global variable    ${requestUID}    ${IV}
    return from keyword    ${header}
