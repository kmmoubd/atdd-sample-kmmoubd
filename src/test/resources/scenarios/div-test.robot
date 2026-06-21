*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Division Works
    [Template]    Div Workflow
    10    2    5
    20    4    5

*** Keywords ***
Div Workflow
    [Arguments]    ${a}    ${b}    ${expected}
    Open Application Page
    Input Text    name=arg1    ${a}
    Input Text    name=arg2    ${b}
    Select From List By Value    name=operation    div
    Submit Form
    BuiltIn.Sleep    1
    ${result}=    Get Value    id=result
    Should Be Equal    ${result}    ${expected}
    Close Application Page

Open Application Page
    Open Browser    http://localhost:8080/calculate    chrome

Close Application Page
    Close Browser
