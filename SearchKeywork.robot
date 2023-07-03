*** Settings ***
Library    SeleniumLibrary
Library    CSVLib
Library    CSVLibrary
Library    Telnet
Library    csv
# Library    RPA.Browser.Selenium

*** Variables ***
${BROWSER}        chrome
${WEBSITE_URL}    https://admin:wss@2020@test.websosanh.org/
${EXCEL_FILE}     C:\projects\HealthWSS\Keywork.csv
${SEARCH_BAR}     id:inputFilter
${SEARCH_BUTTON}  id:btnFilter
*** Test Cases ***
Search Keywords from Excel
    # Create Webdriver    Chrome
    # Go To    https://admin:wss@2020@test.websosanh.org/
    Open Browser    ${WEBSITE_URL}    ${BROWSER}
    ${keywords}     Reader  ${EXCEL_FILE}
     FOR    ${keyword}    IN    @{keywords}
        Maximize Browser Window
        Input Text    ${SEARCH_BAR}    ${keyword}
        Click Button    ${SEARCH_BUTTON}
        Sleep    0.5
        Set Selenium Timeout    0.1
        Go Back
        # Perform desired actions on search results
    END