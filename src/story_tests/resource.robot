*** Settings ***
Library  Browser

*** Variables ***
${SERVER}     127.0.0.1:5000
${DELAY}      500ms
${HOME_URL}   http://${SERVER}
${BROWSER}    chromium
${HEADLESS}   false

*** Keywords ***
Open And Configure Browser
    IF  $HEADLESS == 'true'
        New Browser  browser=${BROWSER}  headless=True
    ELSE
        New Browser  browser=${BROWSER}  headless=False  slowMo=${DELAY}
    END
    New Context
    New Page  about:blank

Go To Home Page
    Go To  ${HOME_URL}

Title Should Be
    [Arguments]  ${expected_title}
    ${actual_title}=  Get Title
    Should Be Equal  ${actual_title}  ${expected_title}