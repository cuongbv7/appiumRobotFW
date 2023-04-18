*** Settings ***
Test Setup        Run Keywords    BaseTest.Setup Test
Test Teardown     Run Keywords    BaseTest.Teardown Test
Force Tags        search
Resource          ../step/Steps.robot
Resource          ../common/BaseTest.robot

*** Variables ***




*** Test Cases ***
Search with valid keyword
    [Tags]    smoke    regression
    When User go to search text box and enter 'Harry Potter'
    Then List of suggestions related to 'Harry Potter' should be shown

Search with invalid keyword
    [Tags]    regression
    When User go to search text box and enter 'xxxxxaasdvsd'
    Then 'No results found' text should be shown

Search with special keyword
    [Tags]    smoke    regression
    When User go to search text box and enter '@#112 Potter'
    Then List of suggestions related to 'Adele' should be shown
