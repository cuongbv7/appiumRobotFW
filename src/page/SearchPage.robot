*** Settings ***
Resource          ../common/Common.robot

*** Variables ***

${searchTxt}      id=org.wikipedia.alpha:id/search_src_text
${listItemTitle}    id=org.wikipedia.alpha:id/page_list_item_title
${searchEmptyTxt}    id=org.wikipedia.alpha:id/search_empty_text



*** Keywords ***
Enter search keyword
    [Arguments]    ${keyword}
    wait until element visible and input    ${searchTxt}    ${keyword}

Get list title of suggesions
    @{elements}=    wait and get list of elements     ${listItemTitle}
    ${listTitle}=    Create List
    FOR    ${ele_locator}    IN    @{elements}
        ${title}=    wait until element visible and get text    ${ele_locator}
        Append To List    ${listTitle}    ${title}
    END


    [Return]    ${listTitle}

Get search empty text
    ${text}=    wait until element visible and get text    ${searchEmptyTxt}
    [Return]    ${text}
