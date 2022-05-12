*** Settings ***
#Library    ExcelLibrary
#Library    Collections
Resource    ../Configuration/Import.robot



*** Keywords ***
getExcelData
    [Arguments]    ${path}    ${Row}
    ${data}=    Open Excel Document    ${path}    doc1
    ${data_RowOfName}=    read excel row    1    0    0    ${env}
    log    ${data_RowOfName}
    ${row}=    evaluate    ${Row}+1
    ${data_RowOfData}=    read excel row    ${row}    0    0    ${env}
    ${data_Dict}=    create dictionary
    ${lenght}=    get length    ${data_RowOfName}
    FOR    ${i}    IN RANGE    ${lenght}
        set to dictionary    ${data_Dict}    ${data_RowOfName}[${i}]=${data_RowOfData}[${i}]
    END
    close all excel documents
    return from keyword    ${data_Dict}

getSupListExcelData
    [Arguments]    ${path}    ${Row}
    ${data}=    Open Excel Document    ${path}    doc1
    ${data_RowOfName}=    read excel row    1    0    0    ${env}
    log    ${data_RowOfName}
    ${row}=    evaluate    ${Row}+1
    ${data_RowOfData}=    read excel row    ${row}    0    0    ${env}
    ${data_Dict}=    create dictionary
    ${lenght}=    get length    ${data_RowOfName}
    FOR    ${i}    IN RANGE    ${lenght}
        set to dictionary    ${data_Dict}    ${data_RowOfName}[${i}]=${data_RowOfData}[${i}]
    END
    close all excel documents
    return from keyword    ${data_Dict}

getExcelDataCountRow
    [Arguments]    ${path}    ${Row}
    ${data}=    Open Excel Document    ${path}    doc1
    ${data_ColumnOfCase}=    read excel column    1    0    0    DEV    #${env}
    log    ${data_ColumnOfCase}
    ${countRow}=    get length    ${data_ColumnOfCase}
    #${countRow}=    count row    ${env}
#Exclude column row
    ${CountRow}=     evaluate  ${countRow}-1
    close all excel documents
#    log to console    ${CountRow}
    return from keyword    ${CountRow}