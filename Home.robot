*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    OperatingSystem

*** Variables ***
${url}=    https://websosanh.vn/        Chrome
${data_title}    ${EMPTY}

*** Test Cases ***
TC in Header
    Open Browser    https://websosanh.vn/    Chrome
# Logo
    Element Should Be Visible    class:logo
# Bán hàng cùng Websosanh & hotline
    Element Text Should Be    class:bussiness-section    Bán hàng cùng Websosanh
    Element Text Should Be    xpath:/html/body/section/div/div/div/a    096.789.5454
# Dang nhap & click-doi form dang nhap xuat hien
    Element Text Should Be    class:login-title    Đăng nhập
    Click Element   class:login-title
    Wait Until Element Is Enabled    class:auth-container
    Reload Page
# Ads duoi nut dang nhap
    Page Should Contain Element    xpath://header/div/div/a/img
# Seach bar
    # placeholder
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
TC to Navigation
    [Documentation]    find elements to Navigation in Home Page
    Open Browser    https://websosanh.vn/    Chrome
# Promotion text 
    ${count} =    Get Element Count    xpath://div[4]/div[2]/ol/li
    Should Be True    ${count} == 5
#Menu Count    
    ${count} =    Get Element Count    class:has-children
    Should Be True    ${count} > 21
#Banner-primary 
    ${count} =    Get Element Count    class:slick-slide
    Should Be True    ${count} > 5
    # Get Element Attribute    xpath://div[1]/div/div/div/div/a/img    href
#Banner-second
    ${count} =    Get Element Count    class:ads-wrap
    Should Be True    ${count} > 3

TC Cate in Home
    [Documentation]    find elements to Cate in Home Page
# Deal-head Top   
    Open Browser    https://websosanh.vn/    Chrome
    ${count} =    Get Element Count   class:deal-head 
    Should Be True    ${count} > 0    
# # Deal-head   
#     ${count} =    Get Element Count   class:product-box-head  
#     Should Be True    ${count} > 6
# # Deal-menu
#     ${count} =    Get Element Count   xpath:/html/body//div[@class='deal-menu']/h3
#     Should Be True    ${count} > 6
# # Product in Deal Menu
#     ${count} =    Get Element Count    class:deal-product-item
#     Should Be True    ${count} > 27
# # Product in Menu
#     ${count} =    Get Element Count    class:product-box-item
#     Should Be True    ${count} > 50
# Product-box-price & Product-box-store check gia' va noi ban'
    # ${elements}=    Get WebElements    xpath://div[@class='product-box-wrap']//span[@class='product-box-price']
    # FOR    ${elementsprice}    IN    @{elements}
    #     Log    ${elementsprice}
    #     # Click Element    xpath://div[@class='product-box-wrap']//li[@class='product-box-item']/a
    # END

    


    # ${textprice}=    Get Text    xpath://div[7]/div[2]/ul/li[2]/span[1]
    # Log    ${textprice}
    
    # ${price}=    Get Text    xpath://div[8]/div[2]/ul/li[1]/span[1]
    # ${title}=    Get Text    xpath://div[8]/div[2]/ul/li[1]/a/h3
    # ${quantity}=    Get Text        xpath://div[8]/div[2]/ul/li[1]/span[2]
    # Click Element    xpath://div[8]/div[2]/ul/li[1]
    # Wait Until Page Contains Element    xpath://div[4]/div/div/div

    # ${priceinsize}=    Get Text    xpath:/html/body/section/div/div/div/div[@class='price-title']/span
    # ${titleinsize}=    Get Text    xpath://section/div[4]/div/h1
    # ${quantityinsize}=    Get Text       xpath:/html/body/section/div/div/div/div[@class='compare-action-label']/span
    # Should Be Equal    ${title}    ${titleinsize}
    # Log    ${quantity}
    # Log    ${quantityinsize}
    # Should Contain Any    ${quantity}    ${quantityinsize}
    # # Should Contain Any    ${price}    ${priceinsize}
    # # ${textpriceinsize}=    Get Text    xpath:/html/body/section/div/div/div/div[@class='price-title']/span


    
    





TC Article
    [Documentation]    find elements to Article in Home Page
# Article-Sticky Duplicates
    Open Browser    https://websosanh.vn/    Chrome
    ${list}=    Create List      xpath://article[1]/a/h3    xpath://article[2]/a/h3    xpath://article[3]/a/h3    xpath://article[4]/a/h3    xpath://article[5]/a/h3    xpath://article[6]/a/h3    xpath://article[7]/a/h3    xpath://article[8]/a/h3    xpath://article[9]/a/h3
    List Should Not Contain Duplicates    ${list}
    
# Article-Sticky Count
    ${count} =    Get Element Count    class:article-item
    Should Be True    ${count} > 9
    
