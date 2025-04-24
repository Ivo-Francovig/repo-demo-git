*** Settings ***

Resource  ../Settings/common_settings.robot
Resource  ../Variables/common_variables.robot

*** Keywords ***

Open Application And Login
    [Arguments]    ${username}    ${password}
    Go To    ${LOGIN_URL}
    Input Text    id=username    ${username}
    Input Password    id=password    ${password}
    Click Button    id=loginButton
    Wait Until Page Contains    Welcome to the Dashboard

Verify Dashboard Is Displayed
    Location Should Be    ${DASHBOARD_URL}
    Wait Until Element Is Visible    css:.dashboard-title
    Element Should Contain    css:.dashboard-title    Dashboard

Logout From Application
    Click Link    css=.logout-button
    Wait Until Page Contains    You have been logged out