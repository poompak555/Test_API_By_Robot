*** Settings ***
Resource    ../Configuration/Import.robot

*** Variables ***
${SET_ENV}    DEV


*** Keywords ***
config
    set global variable    ${env}    ${SET_ENV}
    globalVariable




