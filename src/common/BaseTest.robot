*** Settings ***
Library           AppiumLibrary    timeout=20    run_on_failure=Capture Page Screenshot
Library           OperatingSystem
Library           String
Library           Collections
Library           Process
Library           pabot.PabotLib
Resource          ../../resource/import.robot

*** Variable ***


*** Keywords ***
Setup Test
    ${valuesetname}=    Acquire Value Set
    Log to console    ${valuesetname}
    ${udid}=    Get Value From Set    udid
    Set Global Variable    ${udid}
    ${platformName}=    Get Value From Set    platformName
    Set Global Variable    ${platformName}
    ${deviceName}=    Get Value From Set     deviceName
    Set Global Variable    ${deviceName}
    ${system_port}=    Get Value From Set     system_port
    Set Global Variable    ${system_port}
    ${package}=    Set Variable    org.wikipedia.alpha
    Set Tags    ${deviceName}
    Open Application     ${appium_server}    platformName=${platformName}    appPackage=${package}    appActivity=org.wikipedia.main.MainActivity    noReset=false    fullReset=true    udid=${udid}    systemPort=${systemPort}    newCommandTimeout=10000    autoGrantPermissions=true    app=${EXECDIR}/app/WikipediaSample.apk
    implicit wait    10

Teardown Test
    Release value set
    Close Application
