*** Settings ***
Resource          ../page/PageManager.robot

*** Keywords ***


User go to search text box and enter '${searchKeyword}'
    Click to search text box
    Enter search keyword    ${searchKeyword}

List of suggestions related to '${searchKeyword}' should be shown
    ${listSuggesion}=    Get list title of suggesions
    FOR    ${title}    IN    ${listSuggesion}
        Should Contain    ${title}    ${searchKeyword}
    END

'${emptyTxt}' text should be shown
    ${actual}=    Get search empty text
    Should Be Equal    ${emptyTxt}    ${actual}
