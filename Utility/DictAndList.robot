*** Keywords ***
changeListToDict
    [Arguments]    ${myList}
    ${myDict}=    create dictionary
    FOR    ${i}    IN    @{myList}
        set to dictionary    ${myDict}    ${i}[TotalName]    ${i}
        log    ${myDict}
#        remove from dictionary    ${myDict}[${i}[TotalName]]    TotalName
#        log    ${myDict}
    END
    return from keyword    ${myDict}

changeDictToList
    [Arguments]    ${myDict}
    ${myList}=    create list
    FOR    ${i}    IN    @{myDict}
        append to list    ${myList}    ${myDict}[${i}]
        log    ${myList}
    END
    return from keyword    ${myList}