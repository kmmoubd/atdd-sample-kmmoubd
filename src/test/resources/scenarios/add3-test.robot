*** Test Cases ***
Add Three Numbers
    [Template]    Add3 Workflow
    1    2    3    6
    10   20   30   60

*** Keywords ***
Add3 Workflow
    [Arguments]    ${a}    ${b}    ${c}    ${expected}
    Open Application Page
    Input Text    arg1    ${a}
    Input Text    arg2    ${b}
    Input Text    arg3    ${c}
    Select From List By Value    operation    add3
    Submit Form
    BuiltIn.Sleep    1
    ${result}=    Get Value    result
    Should Be Equal    ${result}    ${expected}
    Close Browser