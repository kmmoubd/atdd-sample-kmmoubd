*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome

*** Test Cases ***
Multiplication Works Well
    [Template]    Multiplication Workflow
    1    2    2
    10   5    50
    3    4    12
    100  200  20000

*** Keywords ***
Multiplication Workflow
    [Arguments]    ${arg1}    ${arg2}    ${expected}
    Open Application Page
    ${calc_value}=    Calculate In Application Page    ${arg1}    ${arg2}
    Should Be Equal    ${calc_value}    ${expected}
    Close Application Page

Open Application Page
    Open Browser    http://localhost:8080/calculate    ${BROWSER}

Calculate In Application Page
    [Arguments]    ${arg1}    ${arg2}
    Input Text    arg1    ${arg1}
    Input Text    arg2    ${arg2}
    Submit Form
    BuiltIn.Sleep    1
    ${result}=    Get Value    result
    [Return]    ${result}

Close Application Page
    Close Browser