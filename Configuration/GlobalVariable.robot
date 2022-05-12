*** Settings ***

Resource    ../Configuration/Import.robot

*** Keywords ***
globalVariable

    ${dateList}=    getDate
    set global variable    ${dateToday}    ${dateList}[0]
    set global variable    ${dateForUpdate}    ${dateList}[1]



    IF      '${env}'=='DEV'
            set global variable    ${url}    http://murphy.thddns.net:5151

    ELSE IF    '${env}'=='SIT'    
            set global variable    ${url}    http://murphy.thddns.net:5151

    ELSE IF    '${env}'=='UAT'    
            set global variable    ${url}    http://murphy.thddns.net:5151

    END


    set global variable    ${contentType}    application/x-www-form-urlencoded
    set global variable    ${token}     eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImJvb2tiYW5nMTYiLCJlbWFpbCI6ImFAZ21haWwuY29tIiwiaWF0IjoxNjUyMjc3MzMyLCJleHAiOjE2NTQ4NjkzMzJ9.RpABrf7GMhP6qe0Ef47MaN6388Z97c4cc8mqn7Sg5sM


    set global variable    ${GetFoodEndpoint}       /food/get-food
    set global variable    ${CreateFoodEndpoint}    /food/create-food

