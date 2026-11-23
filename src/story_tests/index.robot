*** Settings ***
Resource  resource.robot
Suite Setup      Open And Configure Browser
Suite Teardown   Close Browser

*** Test Cases ***
Home Page Loads
    Go To Home Page
    Title Should Be  BibTeX-viitesovellus

