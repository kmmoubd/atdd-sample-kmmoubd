*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Subtraction Works
    [Template]    Sub Workflow
    10    5    5
    20    8    12

*** Keywords ***
Sub Workflow
    [Arguments]    ${a}    ${b}    ${expected}
    Open Application Page
    Input Text    name=arg1    ${a}
    Input Text    name=arg2    ${b}
    Select From List By Value    name=operation    sub
    Submit Form
    BuiltIn.Sleep    1
    ${result}=    Get Value    id=result
    Should Be Equal    ${result}    ${expected}
    Close Application Page

Open Application Page
    Open Browser    http://localhost:8080/calculate    chrome

Close Application Page
    Close Browser
