*** Settings ***
#Library    ExcelLibrary
#Library    Collections
#Library    String
Resource    ../Configuration/Import.robot



*** Keywords ***
checkDateFormat_dd/mm/yy
    [Arguments]    ${date}

    ${listOfDate}=    split string to characters    ${date}
    ${day}=    convert to integer    ${listOfDate}[0]${listOfDate}[1]
    ${month}=    convert to integer    ${listOfDate}[3]${listOfDate}[4]
    ${year}=    convert to integer    ${listOfDate}[6]${listOfDate}[7]
    run keyword if    ${day} > ${31}    fail    incorrectDate
    run keyword if    ${month} > ${12}    fail    incorrectDate
#    run keyword if    ${year} > ${30}    fail    incorrectDate
    should be equal    ${listOfDate}[2]    /
    should be equal    ${listOfDate}[5]    /

checkTimeFormat_hh:mm:ss
    [Arguments]    ${time}

    ${listOfTime}=    split string to characters    ${time}
    ${hour}=    convert to integer    ${listOfTime}[0]${listOfTime}[1]
    ${minute}=    convert to integer    ${listOfTime}[3]${listOfTime}[4]
    ${second}=    convert to integer    ${listOfTime}[6]${listOfTime}[7]
    run keyword if    ${hour} > ${23}    fail    incorrectTime
    run keyword if    ${minute} > ${59}    fail    incorrectTime
    run keyword if    ${second} > ${59}    fail    incorrectTime
    should be equal    ${listOfTime}[2]    :
    should be equal    ${listOfTime}[5]    :

checkTimeFormat_hh:mm
    [Arguments]    ${time}

    ${listOfTime}=    split string to characters    ${time}
    ${hour}=    convert to integer    ${listOfTime}[0]${listOfTime}[1]
    ${minute}=    convert to integer    ${listOfTime}[3]${listOfTime}[4]
    run keyword if    ${hour} > ${23}    fail    incorrectTime
    run keyword if    ${minute} > ${59}    fail    incorrectTime
    should be equal    ${listOfTime}[2]    :

checkAmountFormat_N_Digit
    [Arguments]    ${amount}    ${n}
    ${length}=    get length    ${amount}
    should be equal as strings    ${length}    ${n}

checkDateTimeFormat_yyyy-mm-dd_hh:mm:ss
    [Arguments]    ${dateTime}
    #['2', '0', '2', '1', '-', '0', '6', '-', '2', '3', ' ', '1', '4', ':', '2', '0', ':', '3', '1']
    ${listOfDateTime}=    split string to characters    ${dateTime}

    ${year}=    convert to integer    ${listOfDateTime}[0]${listOfDateTime}[3]
    ${month}=    convert to integer    ${listOfDateTime}[5]${listOfDateTime}[6]
    ${day}=    convert to integer    ${listOfDateTime}[8]${listOfDateTime}[9]
    run keyword if    ${year} > ${2030}    fail    incorrectDate
    run keyword if    ${month} > ${12}    fail    incorrectDate
    run keyword if    ${day} > ${30}    fail    incorrectDate
    should be equal    ${listOfDateTime}[4]    -
    should be equal    ${listOfDateTime}[7]    -
    should be equal    ${listOfDateTime}[10]    ${SPACE}

checkBoolean
    [Arguments]    ${Boolean}

    run keyword if    '${Boolean}'=='True'    Should Be Equal    ${Boolean}    ${True}    Custom error    values=True
    ...    ELSE    Should Be Equal    ${Boolean}    ${False}    Custom error    values=False

checkDateTimeFormat_dd/mm/yy_And_dd/mm/yy
    [Arguments]    ${dateTime}
    #['0', '1', '/', '1', '0', '/', '2', '0', ' ', ',', ' ', '0', '6', '/', '0', '7', '/', '2', '1']
    #01/10/20 , 06/07/21
    ${listOfDateAndDate}=    split string to characters    ${dateTime}

    ${dayFirst}=    convert to integer    ${listOfDateAndDate}[0]${listOfDateAndDate}[1]
    ${monthFirst}=    convert to integer    ${listOfDateAndDate}[3]${listOfDateAndDate}[4]
    ${yearFirst}=    convert to integer    ${listOfDateAndDate}[6]${listOfDateAndDate}[7]
    ${daySecond}=    convert to integer    ${listOfDateAndDate}[11]${listOfDateAndDate}[12]
    ${monthSecond}=    convert to integer    ${listOfDateAndDate}[14]${listOfDateAndDate}[15]
    ${yearSecond}=    convert to integer    ${listOfDateAndDate}[17]${listOfDateAndDate}[18]

    run keyword if    ${dayFirst} > ${31}    fail    incorrectDate
    run keyword if    ${monthFirst} > ${12}    fail    incorrectDate
    run keyword if    ${yearFirst} > ${99}    fail    incorrectDate
    run keyword if    ${daySecond} > ${31}    fail    incorrectDate
    run keyword if    ${monthSecond} > ${12}    fail    incorrectDate
    run keyword if    ${yearSecond} > ${99}    fail    incorrectDate

    should be equal    ${listOfDateAndDate}[2]    /
    should be equal    ${listOfDateAndDate}[5]    /
    should be equal    ${listOfDateAndDate}[8]    ${SPACE}
    should be equal    ${listOfDateAndDate}[9]    ,
    should be equal    ${listOfDateAndDate}[10]    ${SPACE}
    should be equal    ${listOfDateAndDate}[13]    /
    should be equal    ${listOfDateAndDate}[16]    /

checkRefNo
    [Arguments]    ${refNo}    ${withSlip}
    ${char}=    Split String To Characters    ${refNo}
    log    ${char} and ${char}[16]
    run keyword if    '${withSlip}'=='N'    should be equal    ${char}[16]    E
    ...    ELSE IF    '${withSlip}'=='Y'    should be equal    ${char}[16]    P

checkDigitDecimal
    [Arguments]    ${amount}    ${n}
    ${lenstr}=    split string    ${amount}    .
    ${length}=    get length    ${lenstr}[1]
    should be equal as strings    ${length}    ${n}
