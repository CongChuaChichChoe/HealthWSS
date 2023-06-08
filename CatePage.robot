*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TC to Navigation
    [Documentation]    find elements in the home page
#Menu Count 
    Open Browser    https://websosanh.vn/    Chrome
    Maximize Browser Window
    Click Element    class:has-children
    Wait Until Element Contains    class:page-text    sản phẩm

    # Breadcrumbs
    ${element} =    Get WebElement    xpath:/html/body/section//ol[@class='breadcrumbs']/li
    ${count} =    Get Element Count     xpath:/html/body/section//ol[@class='breadcrumbs']/li
    Should Be True    ${count} > 1
    # Sidebar-menu-wrap Các cate nhỏ
    ${element} =    Get WebElement    xpath:/html/body/section//ol[@class='sidebar-menu-wrap']/li
    ${count} =    Get Element Count     xpath:/html/body/section//ol[@class='sidebar-menu-wrap']/li
    Should Be True    ${count} > 1


    # Category-sort  Chon cach sap xep
    ${element} =    Get WebElement    xpath:/html/body//select[@class='category-sort']/option
    ${count} =    Get Element Count    xpath:/html/body//select[@class='category-sort']/option
    Should Be True    ${count} > 2

    # Filter-wrap 3 div to gom`bo loc sp, dia chi noi ban, gia sp
    ${element} =    Get WebElement    xpath:/html/body//div[@class='filter-wrap']/div
    ${count} =    Get Element Count    xpath:/html/body//div[@class='filter-wrap']/div
    Should Be True    ${count} > 2

    # Filter-list-item cac li trong bo loc
    ${element} =    Get WebElement    class:filter-name
    ${count} =    Get Element Count    class:filter-name
    Should Be True    ${count} > 100

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
    Click Element    class:has-children
    Wait Until Element Contains    class:page-text    sản phẩm

    # Page-header 
    Scroll Element Into View    id:zone-web_category_bottom
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
    Should Be True    ${count} > 2

    # Filter-list-item
    ${element} =    Get WebElement    class:filter-name
    ${count} =    Get Element Count    class:filter-name
    Should Be True    ${count} > 100

    # Product-item
    ${element} =    Get WebElement    class:product-item
    ${count} =    Get Element Count    class:product-item
    Should Be True    ${count} > 39

