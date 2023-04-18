*** Settings ***
Resource          ../common/Common.robot

*** Variables ***

${searchTextBox}    id=org.wikipedia.alpha:id/search_container


*** Keywords ***
Click to search text box
    wait until element visible and click    ${searchTextBox}
