*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
Setup Page for Cate Page
    [Documentation]    find elements in the home page
#Menu Count 
    Open Browser    https://websosanh.vn/    Chrome
    Maximize Browser Window
    Click Element    class:has-children
    Wait Until Element Contains    class:page-text    sản phẩm

*** Test Cases ***
TC to Navigation
    [Documentation]    find elements in the home page
#Menu Count 
    Setup Page for Cate Page
    # Breadcrumbs
    ${count} =    Get Element Count     xpath:/html/body/section//ol[@class='breadcrumbs']/li
    Should Be True    ${count} > 1
    # Sidebar-menu-wrap Các cate nhỏ
    ${count} =    Get Element Count     xpath:/html/body/section//ol[@class='sidebar-menu-wrap']/li
    Should Be True    ${count} > 1


    # Category-sort  Chon cach sap xep
    ${count} =    Get Element Count    xpath:/html/body//select[@class='category-sort']/option
    Should Be True    ${count} > 2

    # Filter-wrap 3 div to gom`bo loc sp, dia chi noi ban, gia sp
    ${count} =    Get Element Count    xpath:/html/body//div[@class='filter-wrap']/div
    Should Be True    ${count} > 2

    # Filter-list-item cac li trong bo loc
    ${count} =    Get Element Count    class:filter-name
    Should Be True    ${count} > 100

    # Product-item
    ${count} =    Get Element Count    class:product-item
    Should Be True    ${count} > 40
    
    # Pagination
    ${count} =    Get Element Count    xpath:/html/body//ul[@class='pagination']/li
    Should Be True    ${count} > 3

    #article-sticky
    ${count} =    Get Element Count    class:article-item
    Should Be True    ${count} > 11

TC Search Results Page 2
    Setup Page for Cate Page

    # Page-header 
    Scroll Element Into View    id:zone-web_category_bottom
    Click Element    xpath:/html/body/section//ul[@class='pagination']/li[2]/a

    # Breadcrumbs
    ${count} =    Get Element Count     xpath:/html/body/section//ol[@class='breadcrumbs']/li
    Should Be True    ${count} > 1

    # Category-sort
    ${count} =    Get Element Count    xpath:/html/body//select[@class='category-sort']/option
    Should Be True    ${count} > 2

    # Filter-wrap => filter-item
    ${count} =    Get Element Count    xpath:/html/body//div[@class='filter-wrap']/div
    Should Be True    ${count} > 2

    # Filter-list-item
    ${count} =    Get Element Count    class:filter-name
    Should Be True    ${count} > 100

    # Product-item
    ${count} =    Get Element Count    class:product-item
    Should Be True    ${count} > 39

