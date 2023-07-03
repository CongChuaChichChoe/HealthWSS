*** Settings ***
Library    RPA.Database

*** Keywords ***
*** Variables ***
${DBName}    Databases
${DBUser}    dangtester
${DBPass}    SgNFAeg4tMcviY
${DBHost}    172.22.1.83
${DBPort}    1433
*** Test Cases ***
Connect to DB
    Connect To Database    	pymssql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}
    # ${orders}    Query    Select * FROM 
    # FOR    ${order}    IN    @{orders}
        
    # END