*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Multiplication Works Well
    [Template]    Multiplication Workflow
    10    5    50
    2    3    6
    100    2    200

*** Keywords ***
Multiplication Workflow
    [Arguments]    ${arg1}    ${arg2}    ${expected}
    Open Browser    http://localhost:8080/calculate    chrome
    Maximize Browser Window
    Input Text    name=arg1    ${arg1}
    Input Text    name=arg2    ${arg2}
    Select From List By Value    name=operation    mul
    Submit Form
    Sleep    2s
    ${result}=    Get Value    id=result
    ${result}=    Strip String    ${result}
    Should Be Equal    ${result}    ${expected}
    Close Browser