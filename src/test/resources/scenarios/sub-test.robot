*** Test Cases ***
Subtraction Works
    [Template]    Sub Workflow
    10    5    5
    20    8    12

*** Keywords ***
Sub Workflow
    [Arguments]    ${a}    ${b}    ${expected}
    Open Application Page
    Input Text    arg1    ${a}
    Input Text    arg2    ${b}
    Select From List By Value    operation    sub
    Submit Form
    BuiltIn.Sleep    1
    ${result}=    Get Value    result
    Should Be Equal    ${result}    ${expected}
    Close Browser