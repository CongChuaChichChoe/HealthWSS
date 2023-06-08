*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TC to Navigation
    [Documentation]    find elements in the home page
#Menu Count 
    Open Browser    https://websosanh.vn/    Chrome
    ${element} =    Get WebElement    class:has-children
    ${count} =    Get Element Count    class:has-children
    Should Be True    ${count} > 21
#Banner-primary 
    ${element} =    Get WebElement    class:slick-slide
    ${count} =    Get Element Count    class:slick-slide
    Should Be True    ${count} > 5
#Banner-second
    ${element} =    Get WebElement    class:ads-wrap
    ${count} =    Get Element Count    class:ads-wrap
    Should Be True    ${count} > 3

TC Cate in Home
# Deal-head Top   
    Open Browser    https://websosanh.vn/    Chrome
    ${element} =    Get WebElement    class:deal-head
    ${count} =    Get Element Count   class:deal-head 
    Should Be True    ${count} > 0    
# Deal-head   
    ${element} =    Get WebElement    class:product-box-head
    ${count} =    Get Element Count   class:product-box-head  
    Should Be True    ${count} > 6
# Deal-menu
    ${element} =    Get WebElement    xpath:/html/body//div[@class='deal-menu']/h3
    ${count} =    Get Element Count   xpath:/html/body//div[@class='deal-menu']/h3
    Should Be True    ${count} > 6
# Product in Deal Menu
    ${element} =    Get WebElement    class:deal-product-item
    ${count} =    Get Element Count    class:deal-product-item
    Should Be True    ${count} > 27
# Product in Menu
    ${element} =    Get WebElement    class:product-box-item
    ${count} =    Get Element Count    class:product-box-item
    Should Be True    ${count} > 50

TC Article
#article-sticky
    Open Browser    https://websosanh.vn/    Chrome
    ${element} =    Get WebElement    class:article-item
    ${count} =    Get Element Count    class:article-item
    Should Be True    ${count} > 9 
    
