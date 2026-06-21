*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Calculator Should Support Multiple Operations
    [Template]    Perform Calculation
    10    5    add    15
    10    5    mul    50
    10    5    sub    5
    10    5    div    2

*** Keywords ***
Perform Calculation
    [Arguments]    ${arg1}    ${arg2}    ${operation}    ${expected}
    Open Browser    http://localhost:8080/calculate    chrome
    Maximize Browser Window
    Input Text    name=arg1    ${arg1}
    Input Text    name=arg2    ${arg2}
    Select From List By Value    name=operation    ${operation}
    Submit Form
    Sleep    2s
    ${result}=    Get Value    id=result
    ${result}=    Strip String    ${result}
    Should Be Equal    ${result}    ${expected}
    Close Browser
