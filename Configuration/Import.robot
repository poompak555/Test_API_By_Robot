*** Settings ***
Library    Collections
Library    DateTime
Library    ExcelLibrary
Library    JSONLibrary
Library    OperatingSystem
Library    RequestsLibrary
Library    String
Library    DatabaseLibrary

Resource    ../Configuration/Config.robot
Resource    ../Configuration/GlobalVariable.robot

Resource    ../Utility/CheckFormat.robot
Resource    ../Utility/GetExcel.robot
Resource    ../Utility/DictAndList.robot

Library    ../Library/checkDict.py
Library    ../Library/dateTime.py
Library    ../Library/InitialVector.py

Resource    ../Keyword/Header.robot
Resource    ../Keyword/StopCheque.robot
Resource    ../Keyword/StopChequeTestcase.robot

