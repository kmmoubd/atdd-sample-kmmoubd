*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Multiply Three Numbers
    [Template]    Mul3 Workflow
    2    3    4    24
    5    2    1    10

*** Keywords ***
Mul3 Workflow
    [Arguments]    ${a}    ${b}    ${c}    ${expected}
    Open Application Page
    Input Text    name=arg1    ${a}
    Input Text    name=arg2    ${b}
    Input Text    name=arg3    ${c}
    Select From List By Value    name=operation    mul3
    Submit Form
    BuiltIn.Sleep    1
    ${result}=    Get Value    id=result
    Should Be Equal    ${result}    ${expected}
    Close Application Page

Open Application Page
    Open Browser    http://localhost:8080/calculate    chrome

Close Application Page
    Close Browser
