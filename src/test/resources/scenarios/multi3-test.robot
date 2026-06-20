*** Test Cases ***
Multiply Three Numbers
    [Template]    Mul3 Workflow
    2    3    4    24
    1    5    6    30

*** Keywords ***
Mul3 Workflow
    [Arguments]    ${a}    ${b}    ${c}    ${expected}
    Open Application Page
    Input Text    arg1    ${a}
    Input Text    arg2    ${b}
    Input Text    arg3    ${c}
    Select From List By Value    operation    mul3
    Submit Form
    BuiltIn.Sleep    1
    ${result}=    Get Value    result
    Should Be Equal    ${result}    ${expected}
    Close Browser