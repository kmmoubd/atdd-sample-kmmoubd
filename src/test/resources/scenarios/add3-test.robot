*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Add Three Numbers
    [Template]    Add3 Workflow
    1    2    3    6
    10    20    30    60

*** Keywords ***
Add3 Workflow
    [Arguments]    ${a}    ${b}    ${c}    ${expected}
    Open Application Page
    Input Text    name=arg1    ${a}
    Input Text    name=arg2    ${b}
    Input Text    name=arg3    ${c}
    Select From List By Value    name=operation    add3
    Submit Form
    BuiltIn.Sleep    1
    ${result}=    Get Value    id=result
    Should Be Equal    ${result}    ${expected}
    Close Application Page

Open Application Page
    Open Browser    http://localhost:8080/calculate    chrome

Close Application Page
    Close Browser
