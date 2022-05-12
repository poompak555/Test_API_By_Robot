*** Settings ***
Documentation    Suite description
Resource    ../Configuration/Import.robot



Suite Setup    config

*** Test Cases ***
Food
    #CreateFood   Data/Food_data.xlsx    1
    GetFood      Data/Food_data.xlsx    1


