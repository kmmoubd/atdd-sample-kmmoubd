*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome

*** Test Cases ***
Add Operation Works Well
    [Template]    Add Operation Workflow
    1    1    2
    100    200    300
    XYZ    150    N/A

*** Keywords ***
Add Operation Workflow
    [Arguments]    ${arg1}    ${arg2}    ${expected}
    Open Application Page
    ${calc_value}=    Calculate In Application Page    ${arg1}    ${arg2}    add
    Should Be Equal    ${calc_value}    ${expected}
    Close Application Page

Open Application Page
    Open Browser    http://localhost:8080/calculate    ${BROWSER}

Calculate In Application Page
    [Arguments]    ${arg1}    ${arg2}    ${operation}
    Input Text    name=arg1    ${arg1}
    Input Text    name=arg2    ${arg2}
    Select From List By Value    name=operation    ${operation}
    Submit Form
    BuiltIn.Sleep    1
    ${result}=    Get Value    id=result
    [Return]    ${result}

Close Application Page
    Close Browser