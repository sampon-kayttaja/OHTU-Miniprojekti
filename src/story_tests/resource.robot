*** Settings ***
Library  Browser

*** Variables ***
${SERVER}     127.0.0.1:5000
${DELAY}      500ms
${HOME_URL}   http://${SERVER}
${NEW_BOOK_URL}  http://${SERVER}/new_book
${ALL_SOURCES_URL}  http://${SERVER}/all_sources
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

Go To New Book Page
    Go To  ${NEW_BOOK_URL}

Go To All Sources Page
    Go To  ${ALL_SOURCES_URL}

Title Should Be
    [Arguments]  ${expected_title}
    ${actual_title}=  Get Title
    Should Be Equal  ${actual_title}  ${expected_title}

Add Book
    [Arguments]  ${author}  ${title}  ${year}  ${publisher}
    Go To New Book Page
    Fill Text  id=author  ${author}
    Fill Text  id=title  ${title}
    Fill Text  id=year  ${year}
    Fill Text  id=publisher  ${publisher}
    Click  text=Tallenna
