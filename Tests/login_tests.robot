*** Settings ***

Resource  ../Resources/Keywords/login_keywords.robot
Variables  ../Resources/Keywords/common_variables_2.py

Suite Setup       Open Browser    http://example.com    chrome
Suite Teardown    Close All Browsers

*** Test Cases ***

Valid Login Scenario
    [Tags]  login  valid
    [Documentation]    Verify that a user can log in with valid credentials.
    Open Application And Login    ${USERNAME}    ${PASSWORD}
    Verify Dashboard Is Displayed
    Logout From Application

Invalid Login Scenario
    [Tags]  login  invalid
    [Documentation]    Verify that login fails with invalid credentials.
    Open Application And Login    invalidUser    wrongPassword
    Wait Until Page Contains    Invalid username or password

Valid Login Scenario with secret variables
    [Tags]  login  secret
    [Documentation]    Verify that a user can log in with valid credentials.
    Open Application And Login    ${USERNAME_SECRET}    ${PASSWORD_SECRET}
    Verify Dashboard Is Displayed
    Logout From Application

*** Comments ***

Codigo base de ejecucion de suite:  
...    robot login_tests.robot

Incluir un solo test:  
...    robot -i valid login_tests.robot

Elegir el directorio para reportes:  
...    robot -d ./Results login_tests.robot

Reemplazar valores de variables:  
...    robot -v USERNAME:Usuario1 -v PASSWORD:Password1 login_tests.robot

Cargar variables de un archivo no vinculado al framework:  
...    robot -d ./Results -i secret -V ../Resources/Variables/common_variables_2.py login_tests.robot

Todas combinadas:  
...    robot -i login -d ./Results -v USERNAME:Usuario1 -v PASSWORD:Password1 -V ../Resources/Variables/common_variables_2.py login_tests.robot