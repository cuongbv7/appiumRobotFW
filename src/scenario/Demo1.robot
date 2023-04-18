*** Settings ***
Library           AppiumLibrary

*** Variables ***
${id}             ljalfkdjlfkdsa
@{addd}           dddd
@{list}           1    2    3    333    2
&{aa}             key1=20
&{bb}             key1=1    key2=2

*** Test Cases ***
TC01
    log    "hello world"
    Should Be Equal    ${bb.key1}    1
