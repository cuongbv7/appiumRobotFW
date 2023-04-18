*** Settings ***
Resource          BaseTest.robot

*** Variables ***




*** Keywords ***
wait until element is visible with timeout
    [Arguments]    ${ele_locator}    ${wait_timeout}=10
    Run Keyword And Ignore Error    wait until element is visible    ${ele_locator}    ${wait_timeout}

wait until page contains element with timeout
    [Arguments]    ${ele}    ${wait_timeout}=10
    wait until page contains element    ${ele}    ${wait_timeout}

wait until element visible and click
    [Arguments]    ${ele_locator}
    wait until element is visible with timeout    ${ele_locator}    10
    click element    ${ele_locator}

wait until element visible and input
    [Arguments]    ${ele_locator}    ${input}
    wait until element is visible with timeout    ${ele_locator}
    Input Text    ${ele_locator}    ${input}

wait until element visible and get text
    [Arguments]    ${ele_locator}
    wait until element is visible with timeout    ${ele_locator}
    ${txt}=    Get Text    ${ele_locator}
    [Return]    ${txt}

wait and get list of elements
    [Arguments]    ${ele_locator}
    wait until element is visible with timeout    ${ele_locator}
    ${listElements}=    Get Webelements    ${ele_locator}
    [Return]    ${listElements}
