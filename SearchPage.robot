*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TC Search Results
    Open Browser    https://websosanh.vn/    Chrome
    Input Text    id:inputFilter    nồi chiên
    Click Button    id:btnFilter

    # Page-header 
    Wait Until Element Contains    class:page-text    kết quả tìm kiếm cho từ khóa

    # Breadcrumbs
    ${element} =    Get WebElement    xpath:/html/body/section//ol[@class='breadcrumbs']/li
    ${count} =    Get Element Count     xpath:/html/body/section//ol[@class='breadcrumbs']/li
    Should Be True    ${count} > 1

    # Category-sort
    ${element} =    Get WebElement    xpath:/html/body//select[@class='category-sort']/option
    ${count} =    Get Element Count    xpath:/html/body//select[@class='category-sort']/option
    Should Be True    ${count} > 2

    # Filter-wrap => filter-item
    ${element} =    Get WebElement    xpath:/html/body//div[@class='filter-wrap']/div
    ${count} =    Get Element Count    xpath:/html/body//div[@class='filter-wrap']/div
    Should Be True    ${count} > 3

    # Filter-list-item
    ${element} =    Get WebElement    class:filter-name
    ${count} =    Get Element Count    class:filter-name
    Should Be True    ${count} > 221

    # Product-item
    ${element} =    Get WebElement    class:product-item
    ${count} =    Get Element Count    class:product-item
    Should Be True    ${count} > 40
    
    # Pagination
    ${element} =    Get WebElement    xpath:/html/body//ul[@class='pagination']/li
    ${count} =    Get Element Count    xpath:/html/body//ul[@class='pagination']/li
    Should Be True    ${count} > 3

    #article-sticky
    ${element} =    Get WebElement    class:article-item
    ${count} =    Get Element Count    class:article-item
    Should Be True    ${count} > 11

TC Search Results Page 2
    Open Browser    https://websosanh.vn/    Chrome
    Maximize Browser Window
    Input Text    id:inputFilter    nồi chiên
    Click Button    id:btnFilter

    # Page-header 
    Wait Until Element Contains    class:page-text    kết quả tìm kiếm cho từ khóa
    Scroll Element Into View    id:zone-web_search_bottom
    Click Element    xpath:/html/body/section//ul[@class='pagination']/li[2]/a

    # Breadcrumbs
    ${element} =    Get WebElement    xpath:/html/body/section//ol[@class='breadcrumbs']/li
    ${count} =    Get Element Count     xpath:/html/body/section//ol[@class='breadcrumbs']/li
    Should Be True    ${count} > 1

    # Category-sort
    ${element} =    Get WebElement    xpath:/html/body//select[@class='category-sort']/option
    ${count} =    Get Element Count    xpath:/html/body//select[@class='category-sort']/option
    Should Be True    ${count} > 2

    # Filter-wrap => filter-item
    ${element} =    Get WebElement    xpath:/html/body//div[@class='filter-wrap']/div
    ${count} =    Get Element Count    xpath:/html/body//div[@class='filter-wrap']/div
    Should Be True    ${count} > 3

    # Filter-list-item
    ${element} =    Get WebElement    class:filter-name
    ${count} =    Get Element Count    class:filter-name
    Should Be True    ${count} > 221

    # Product-item
    ${element} =    Get WebElement    class:product-item
    ${count} =    Get Element Count    class:product-item
    Should Be True    ${count} > 39
TC Search Results Page 3
    Open Browser    https://websosanh.vn/    Chrome
    Maximize Browser Window
    Input Text    id:inputFilter    nồi chiên
    Click Button    id:btnFilter

    # Page-header 
    Wait Until Element Contains    class:page-text    kết quả tìm kiếm cho từ khóa
    Scroll Element Into View    id:zone-web_search_bottom
    Click Element    xpath:/html/body/section//ul[@class='pagination']/li[3]/a

    # Breadcrumbs
    ${element} =    Get WebElement    xpath:/html/body/section//ol[@class='breadcrumbs']/li
    ${count} =    Get Element Count     xpath:/html/body/section//ol[@class='breadcrumbs']/li
    Should Be True    ${count} > 1

    # Category-sort
    ${element} =    Get WebElement    xpath:/html/body//select[@class='category-sort']/option
    ${count} =    Get Element Count    xpath:/html/body//select[@class='category-sort']/option
    Should Be True    ${count} > 2

    # Filter-wrap => filter-item
    ${element} =    Get WebElement    xpath:/html/body//div[@class='filter-wrap']/div
    ${count} =    Get Element Count    xpath:/html/body//div[@class='filter-wrap']/div
    Should Be True    ${count} > 3

    # Filter-list-item
    ${element} =    Get WebElement    class:filter-name
    ${count} =    Get Element Count    class:filter-name
    Should Be True    ${count} > 221

    # Product-item
    ${element} =    Get WebElement    class:product-item
    ${count} =    Get Element Count    class:product-item
    Should Be True    ${count} > 39
        

