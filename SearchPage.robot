*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
Open BR
    Open Browser    https://websosanh.vn/    Chrome


*** Test Cases ***
Seach bar
    Open BR
    # Check placeholder
    ${webelement}=  Get WebElement  id:inputFilter
    ${placeholder}=  Call Method  ${webelement}  get_attribute  placeholder
    Should Be Equal    ${placeholder}    Flash Sale - Đồng Giá 1k, 9k, 99k
    # Click Seach bar
    Click Element    class:search-wrap
    Wait Until Element Contains    class:ads-search    Flash Sale - Đồng Giá 1k, 9k, 99k
    ${count} =    Get Element Count    xpath://div[3]/ul/li/a
    Should Be True    ${count} == 6
    ${count} =    Get Element Count    xpath://div[4]/ul/li/a
    Should Be True    ${count} == 6

    Click Element    xpath://div[3]/ul/li/a[1]
    Go Back
    Click Element    class:search-wrap
    Click Element    xpath://div[4]/ul/li/a[1]
    Go Back

    Input Text    id:inputFilter    nồi chiên
    Wait Until Page Contains Element    id:resultFilter

    # Click Element    xpath://div[1]/div/ol/li[8]/a
TC Keyword sai chinh ta
    Open BR
    Click Element    class:search-wrap
    Input Text    id:inputFilter    iponee
    Click Button    id:btnFilter
    Wait Until Page Contains Element    class:product-empty-text
TC Keyword chua ki tu dac biet
    Open BR
    Click Element    class:search-wrap
    Input Text    id:inputFilter    iphone!@#$%^&*
    Click Button    id:btnFilter
    Wait Until Element Contains    class:page-text    kết quả tìm kiếm cho từ khóa
TC Keyword qua dai
    Open BR
    Click Element    class:search-wrap
    Input Text    id:inputFilter    hjldsfgdfghdfjghfhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
    Click Button    id:btnFilter
    Wait Until Page Contains Element    class:product-empty-text
TC Search Results
    Open BR
    Click Element    class:search-wrap
    Input Text    id:inputFilter    nồi chiên
    Click Button    id:btnFilter
    # Page-header 
    Wait Until Element Contains    class:page-text    kết quả tìm kiếm cho từ khóa
    # Title san pham match Keyword
    # ${elements}=    Get WebElements    xpath://div[@class='list-product']//div[@class='product-item-content']//h3
    # FOR    ${element}    IN    @{elements}
    #    Should Contain Any    ${element.text}    Nồi Chiên   Nồi chiên               
    # END

    
    # Breadcrumbs
    ${count} =    Get Element Count     xpath:/html/body/section/ol/li/a
    Should Be True    ${count} == 2

    # Category-sort
    ${count} =    Get Element Count    xpath:/html/body//select[@class='category-sort']/option
    Should Be True    ${count} == 3

    # Filter-wrap => filter-item
    ${count} =    Get Element Count    xpath:/html/body//div[@class='filter-wrap']/div
    Should Be True    ${count} == 4

    # Filter-list-item
    ${count} =    Get Element Count    class:filter-name
    Should Be True    ${count} > 200

    # Product-item count
    ${count} =    Get Element Count    class:product-item
    Should Be True    ${count} > 40
    
    # Pagination
    ${count} =    Get Element Count    xpath:/html/body//ul[@class='pagination']/li
    Should Be True    ${count} > 3

    #article-sticky
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
    Should Be True    ${count} > 200

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
    Sleep    4
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
    Should Be True    ${count} > 200

    # Product-item
    ${element} =    Get WebElement    class:product-item
    ${count} =    Get Element Count    class:product-item
    Should Be True    ${count} > 39
        

