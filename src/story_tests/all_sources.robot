*** Settings ***
Resource  resource.robot
Suite Setup      Open And Configure Browser
Suite Teardown   Close Browser

*** Test Cases ***
User Can List All Added Sources
    Add Book  Khaled Hosseini  Tuhat loistavaa aurinkoa  2007  Otava
    Add Book  Mika Waltari  Sinuhe egyptiläinen  1945  WSOY

    Go To All Sources Page

    Get Text  h1  contains  Kaikki lähteet
    Get Text  body  contains  Tuhat loistavaa aurinkoa
    Get Text  body  contains  Sinuhe egyptiläinen
    