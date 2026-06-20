*** Test Cases ***
Division Works
    [Template]    Div Workflow
    10    2    5
    20    4    5

*** Keywords ***
Div Workflow
    [Arguments]    ${a}    ${b}    ${expected}
    Open Application Page
    Input Text    arg1    ${a}
    Input Text    arg2    ${b}
    Select From List By Value    operation    div
    Submit Form
    BuiltIn.Sleep    1
    ${result}=    Get Value    result
    Should Be Equal    ${result}    ${expected}
    Close Browser