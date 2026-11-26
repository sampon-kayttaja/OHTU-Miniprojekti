*** Settings ***
Resource  resource.robot
Suite Setup      Open And Configure Browser
Suite Teardown   Close Browser

*** Test Cases ***
Add Book
    Go To New Book Page

    Fill Text  id=author  Khaled Hosseini
    Fill Text  id=title  Tuhat loistavaa aurinkoa
    Fill Text  id=year  2007
    Fill Text  id=publisher  Otava
    Click  text=Tallenna
