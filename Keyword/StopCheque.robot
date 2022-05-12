*** Settings ***
Resource    ../Configuration/Import.robot


*** Keywords ***
#-------------- inquiryStopCheque ------------------#
CreateFoodBody
    [Arguments]    ${path}    ${row}
    ${excelData}=    getExcelData    ${path}    ${row}

    ${food_calories}=    convert to string    ${excelData}[food_calories]
    ${name_th}=    convert to string    ${excelData}[name_th]
    ${name_en}=     convert to string    ${excelData}[name_en]
    ${image_url}=   convert to string   ${excelData}[image_url]

    ${p_requestUID}=    get IV
    set global variable    ${IV}    ${p_requestUID}

    #create list of fieldName
    ${fieldName}=    create list    name_en    name_th     food_calories    image_url    

    #create list of fieldData
    ${fieldData}=    create list    ${name_en}     ${name_th}    ${food_calories}     ${image_url}


    #create body
    ${body}=    create dictionary
    ${lenght}=    get length    ${fieldName}
    FOR    ${i}    IN RANGE    0    ${lenght}
        set to dictionary    ${body}    ${fieldName}[${i}]    ${fieldData}[${i}]
    END
    ${body}=    checkDict    ${body}
    log    body is : ${body}

    #convert to json
    ${json}=    Evaluate    json.dumps($body)    modules=json
    log    json is : ${json}


    return from keyword    ${body}
    #return from keyword    ${json}

CheckGetFoodResponse
    [Arguments]    ${Response}    ${path}    ${row}
    ${excelData}=    getExcelData    ${path}    ${row}

    ${response}=    evaluate    json.loads($Response)

    ${dataLength}=      Get Length      ${response}[data]
    ${index}=   evaluate    ${dataLength} - 1

    Should Not Be Empty    ${response}[data][${index}][name_en]    
    Should Not Be Empty    ${response}[data][${index}][name_th]    
    ${cal}= convert to string    ${response}[data][${index}][calories]     
    Should Not Be Empty    ${response}[data][${index}][image_url]    