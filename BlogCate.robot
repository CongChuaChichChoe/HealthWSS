*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TC to Header
    [Documentation]    find elements in the home page
#Menu Count 
    Open Browser    https://websosanh.vn/tin-tuc.htm    Chrome
    Maximize Browser Window

    # Breadcrumbs
    ${element} =    Get WebElement    xpath:/html/body/section//ol[@class='breadcrumbs']/li
    ${count} =    Get Element Count     xpath:/html/body/section//ol[@class='breadcrumbs']/li
    Should Be True    ${count} > 1

#     # navigation-blog Thanh menu trên cùng
#     ${element} =    Get WebElement    xpath:/html/body/section//ol[@class='navigation-blog']/li
#     ${count} =    Get Element Count     xpath:/html/body/section//ol[@class='navigation-blog']/li
#     Should Be True    ${count} > 8

#     # Blog-sticky Bài blog Tin Tức đầu tiên
#     ${element} =    Get WebElement    xpath:/html/body/section//article[@class='blog-sticky']/article
#     ${count} =    Get Element Count     xpath:/html/body/section//article[@class='blog-sticky']/article
#     Should Be True    ${count} > 5


# TC Cate in Giá tốt mỗi ngày
# # Deal-head Top   
#     Open Browser    https://websosanh.vn/tin-tuc.htm    Chrome
#     Maximize Browser Window

#     ${element} =    Get WebElement    class:deal-head
#     ${count} =    Get Element Count   class:deal-head 
#     Should Be True    ${count} > 0    

# # Deal-menu
#     ${element} =    Get WebElement    xpath:/html/body//div[@class='deal-menu']/h3
#     ${count} =    Get Element Count   xpath:/html/body//div[@class='deal-menu']/h3
#     Should Be True    ${count} > 6
# # Product in Deal Menu
#     ${element} =    Get WebElement    class:deal-product-item
#     ${count} =    Get Element Count    class:deal-product-item
#     Should Be True    ${count} > 27

# # Article các Cate trong Blog
#     ${element} =    Get WebElement    class:blog-category-head
#     ${count} =    Get Element Count    class:blog-category-head
#     Should Be True    ${count} > 8
# # Button Xem thêm
#     ${element} =    Get WebElement    class:blog-category-more
#     ${count} =    Get Element Count    class:blog-category-more
#     Should Be True    ${count} > 8

# # Các bai viet trong Blog
#     ${element} =    Get WebElement    class:blog-category-item
#     ${count} =    Get Element Count    class:blog-category-item
#     Should Be True    ${count} > 44