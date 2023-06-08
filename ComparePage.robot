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
    Scroll Element Into View    class:filter-wrap
    Click Element    xpath:/html/body/section//ul[@class='product-wrap']/li[5]
    Wait Until Element Contains    class:price-title    Giá chỉ từ:

    # Breadcrumbs
    ${element} =    Get WebElement    xpath:/html/body/section//ol[@class='breadcrumbs']/li
    ${count} =    Get Element Count     xpath:/html/body/section//ol[@class='breadcrumbs']/li
    Should Be True    ${count} > 2

    # Product-thumb-item
    ${element} =    Get WebElement    xpath:/html/body/section//div[@class='product-thumb']/div
    ${count} =    Get Element Count     xpath:/html/body/section//div[@class='product-thumb']/div
    Should Be True    ${count} > 3

    # Product-thumb-show
    ${element} =    Get WebElement    xpath:/html/body/section//div[@class='product-thumb-show']/img
    ${count} =    Get Element Count     xpath:/html/body/section//div[@class='product-thumb-show']/img
    Should Be True    ${count} > 0

    # Product-container
    ${element} =    Get WebElement    xpath:/html/body/section//ul[@class='store-suggest']/li
    ${count} =    Get Element Count     xpath:/html/body/section//ul[@class='store-suggest']/li
    Should Be True    ${count} > 3

    # Title & filter product compare
    ${element} =    Get WebElement    xpath:/html/body/section//div[@class='compare-action page-section']/div
    ${count} =    Get Element Count     xpath:/html/body/section//div[@class='compare-action page-section']/div
    Should Be True    ${count} > 1

        # Sorted by
    ${element} =    Get WebElement    xpath:/html/body/section//ul[@class='compare-action-child']/li
    ${count} =    Get Element Count     xpath:/html/body/section//ul[@class='compare-action-child']/li
    Should Be True    ${count} > 2

    # Cac sp lien quan
    ${element} =    Get WebElement    xpath:/html/body/section//ul[@class='compare-wrap compare-append']/li
    ${count} =    Get Element Count     xpath:/html/body/section//ul[@class='compare-wrap compare-append']/li
    Should Be True    ${count} > 3
    # Sp dang'quan tam
    ${element} =    Get WebElement    xpath:/html/body/section//div[@class='slick-track']/div
    ${count} =    Get Element Count     xpath:/html/body/section//div[@class='slick-track']/div
    Should Be True    ${count} > 3
    # Tin tuc ve sp
    ${element} =    Get WebElement    xpath:/html/body/section//div[@class='article-sidebar-list']/article
    ${count} =    Get Element Count     xpath:/html/body/section//div[@class='article-sidebar-list']/article
    Should Be True    ${count} > 14
    # Sp khac cung muc gia'
    ${element} =    Get WebElement    xpath:/html/body/section//div[@class='slick-track']/div
    ${count} =    Get Element Count     xpath:/html/body/section//div[@class='slick-track']/div
    Should Be True    ${count} > 2
    # Tin tuc moi nhat
    ${element} =    Get WebElement    xpath:/html/body/section//div[@class='slick-track']/article
    ${count} =    Get Element Count     xpath:/html/body/section//div[@class='slick-track']/article
    Should Be True    ${count} > 6


