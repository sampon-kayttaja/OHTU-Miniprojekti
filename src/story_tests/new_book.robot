*** Settings ***
Resource  resource.robot
Suite Setup      Open And Configure Browser
Suite Teardown   Close Browser

*** Test Cases ***
User Can Add A New Book
    Go To New Book Page
    Add Book  Khaled Hosseini  Tuhat loistavaa aurinkoa  2007  Otava