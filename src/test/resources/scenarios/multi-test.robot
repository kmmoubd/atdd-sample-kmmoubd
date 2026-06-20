*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Multiplication Works Well
    Open Browser    http://localhost:8080/calculate    chrome
    Maximize Browser Window

    Input Text    name=arg1    10
    Input Text    name=arg2    5

    # IMPORTANT FIX: operation field
    Select From List By Value    name=operation    mul

    Submit Form

    Sleep    2s

    ${result}=    Get Value    id=result
    ${result}=    Strip String    ${result}

    Should Be Equal    ${result}    50

    Close Browser