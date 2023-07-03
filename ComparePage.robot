*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections



*** Variables ***
${condition}    so-sanh.htm
@{ROBOTS}=        xpath://div/a/h3
${MAX_PAGES}    5    # Số lượng trang muốn lấy kết quả
${RESULTS}    Create List
${HAS_NEXT_PAGE}    Set Variable    ${True}

*** Keywords ***

    

    

*** Test Cases ***
TC CatePage and Compare
    [Documentation]    find elements in the home page        
    Open Browser    https://websosanh.vn/    Chrome
    Maximize Browser Window
    Click Element    class:has-children
    Wait Until Element Contains    class:page-text    sản phẩm
    
    # Lấy title trên trang Cate
    ${h3_elements}    Get WebElements    xpath://div/a[contains(@href, 'so-sanh.htm')]/h3
    ${title_list}    Create List
    FOR    ${element}    IN    @{h3_elements}
        ${h3_text}    Get Text    ${element}
        Append To List    ${title_list}    ${h3_text} 
    END
    Log    H3 List: ${title_list}

    # Lay gia' tren trang cate
    ${prices}    Get WebElements    xpath://span/a[contains(@href, 'so-sanh.htm')]/span
    ${price_list}    Create List
    FOR    ${price}    IN    @{prices}
        ${span_text}    Get Text    ${price}
        ${span}    Evaluate    $span_text.split()
        Append To List    ${price_list}    ${span}[2]
        Log    ${price_list}
    END

    # Lay noi ban tren Trang cate
    ${total_result}    Get WebElements    xpath://li/div/span/span[@class='product-store row-full']
    ${total_result_list}    Create List
    FOR    ${element}    IN    @{total_result}
        ${span_text}    Get Text    ${element}
        ${span_location}    Evaluate    $span_text.split()
        Append To List    ${total_result_list}    ${span_location}[3]
        Log    ${total_result_list}
    END
    

    # Kiem tra ki tu dac biet/Special Characters Test
    # FOR    ${text}    IN    @{h3_list}
    #     ${is_special}    Run Keyword And Return Status    Should Match Regexp    ${text}    .*[!@#$%^&*].*
    #     IF    ${is_special}
    #         Log    Text "${text}" contains special characters.
    #     ELSE
    #         Log    Text "${text}" does not contain special characters.
    #     END
    # END



    # Lấy title trong trang chi tiết sp
    # @{anchors}    Get WebElements    xpath://li/div/div/a[2][contains(@href, 'so-sanh.htm')]

    # ${num_anchors}    Get Length    ${anchors}
    # ${title_list_insize}    Create List
    # FOR    ${index}    IN RANGE    ${num_anchors}
    #     ${anchor}    Set Variable    ${anchors}[${index}]
    #     ${href}    Get Element Attribute    ${anchor}    href
    #     # ${h1_text}    Execute JavaScript    window.open('${href}')
    #     Open Browser    ${href}    Chrome
    #     ${h1_element}    Get WebElements    class:title
    #     ${h1_text}    Get Text    ${h1_element}
    #     Append To List    ${title_list_insize}    ${h1_text}
    #     Log    ${title_list_insize}
    #     Close Browser
    #     # BREAK
    #     Sleep    0.1
    # END

    # Lay gia, noi ban, title trong trang chi tiet sp
    @{anchors}    Get WebElements    xpath://li/div/div/span[2]/a[contains(@href, 'so-sanh.htm')]
    ${num_anchors}    Get Length    ${anchors}
    ${total_result_list}    Create List
    FOR    ${index}    IN RANGE    ${num_anchors}
        ${anchor}    Set Variable    ${anchors}[${index}]
        ${href}    Get Element Attribute    ${anchor}    href
        Open Browser    ${href}    Chrome
        ${price_element}    Get WebElements    class:price-from
        ${price_text_insize}    Get Text    ${price_element}

        ${total_result_insize}    Get WebElement    class:total-result
        ${location_insize_text}    Get Text    ${total_result_insize}
        Append To List    ${total_result_list}    ${location_insize_text}

        ${h1_element}    Get WebElements    class:title
        ${title_insize_text}    Get Text    ${h1_element}
        
        Log    ${price_text_insize}
        Log    ${total_result_list}
        Log    ${title_insize_text}
        Close Browser
        BREAK
        Sleep    0.1
    END

    # Lists Should Be Equal        ${location_list}    ${location_insize_list}
    # Lists Should Be Equal        ${title_list}        ${title_list_insize}
    
TC ComparePage Inzise
    Open Browser    https://websosanh.vn/    Chrome
    Maximize Browser Window
    Click Element    class:has-children
    Wait Until Element Contains    class:page-text    sản phẩm
        
    # Truy cap tung the a
    @{anchors}    Get WebElements    xpath://li/div/div/a[2][contains(@href, 'so-sanh.htm')]

    ${num_anchors}    Get Length    ${anchors}
    FOR    ${index}    IN RANGE    ${num_anchors}
        ${anchor}    Set Variable    ${anchors}[${index}]
        ${href}    Get Element Attribute    ${anchor}    href
        # ${h1_text}    Execute JavaScript    window.open('${href}')
        Open Browser    ${href}    Chrome
        Page Should Contain    Bán hàng cùng Websosanh        Đăng nhập
        Page Should Contain    Hotline:      
        Page Should Contain Button    id:btnFilter
        Page Should Contain Element    class:search-wrap
        Page Should Contain Element    class:logo      
        Page Should Contain Image    xpath://header/div/a/img 
        Page Should Contain Image    xpath://header/div/div/a/img
        ${count} =    Get Element Count     xpath://div[3]/div[1]/ol/li/a
        Should Be True    ${count} == 23
        ${count} =    Get Element Count     xpath://section/div[3]/div[2]/ol/li
        Should Be True    ${count} == 5
        ${count} =    Get Element Count     xpath://div[4]/ol/li/a
        Should Be True    ${count} == 3
        # Thong so ki thuat
        Page Should Contain    So sánh giá    Thông số kỹ thuật
        Page Should Contain Element    xpath://ol/li/span
        Click Element    xpath://ol/li[2]/span
        Wait Until Page Contains Element     id:specifications
        Click Element    xpath://section/div/div/div/span
        Page Should Contain    Rút gọn
        Click Element    xpath://section/div/div/div/span
        # Image product
        Page Should Contain Image    xpath://div[1]/div[1]/div/img
        Page Should Contain Image    xpath://section/div/div/div/div/img

        Close Browser
        BREAK
        Sleep    0.1
    END
TC in Filter
    Open Browser    https://websosanh.vn/    Chrome
    Maximize Browser Window
    Click Element    class:has-children
    Wait Until Element Contains    class:page-text    sản phẩm       
    
    @{anchors}    Get WebElements    xpath://li/div/div/a[2][contains(@href, 'so-sanh.htm')]
    ${count_product_list}    Create List
    ${num_anchors}    Get Length    ${anchors}
    FOR    ${index}    IN RANGE    ${num_anchors}
        ${anchor}    Set Variable    ${anchors}[${index}]
        ${href}    Get Element Attribute    ${anchor}    href
        Open Browser    ${href}    Chrome
        Maximize Browser Window
        Wait Until Element Is Visible    class:product-single-wrap
        ${results}    Get WebElements    class:compare-item
        ${count}    Get Length    ${results}
        # Log    ${results}
        Append To List    ${count_product_list}    ${count}
        
        Log    ${count_product_list}
        
        ${page}    Set Variable       4
        ${MAX_PAGES_PLUS_ONE}    Evaluate    ${MAX_PAGES} + 1 
        ${next_button}    Run Keyword And Return Status    Element Should Be Visible    xpath://ul[2]/li/a[contains(@title, 'Trang tiếp')]
        FOR    ${index}    IN RANGE    4    ${MAX_PAGES_PLUS_ONE}    
            Scroll Element Into View    class:product-same-title
            Exit For Loop If    not ${next_button}
            ${results}    Get WebElements    class:compare-item
            Append To List    ${RESULTS}    ${results}
            ${next_button}    Run Keyword And Return Status    Element Should Be Visible    xpath://ul[2]/li/a[contains(@title, 'Trang tiếp')]
            ${page}    Evaluate    ${page} + 1
            ${count}    Get Length    ${RESULTS}
        Log    ${count}
        Close Browser
        END
    END









# #Menu Count 
#     Click Element    class:has-children
#     Wait Until Element Contains    class:page-text    sản phẩm
#     Scroll Element Into View    class:filter-wrap

#     Click Element    xpath:/html/body/section//ul[@class='product-wrap']/li[5]
#     Wait Until Element Contains    class:price-title    Giá chỉ từ:

#     # Breadcrumbs
#     ${count} =    Get Element Count     xpath:/html/body/section//ol[@class='breadcrumbs']/li
#     Should Be True    ${count} > 2

#     # Product-thumb-item
#     ${count} =    Get Element Count     xpath:/html/body/section//div[@class='product-thumb']/div
#     Should Be True    ${count} > 3

#     # Product-thumb-show
#     ${count} =    Get Element Count     xpath:/html/body/section//div[@class='product-thumb-show']/img
#     Should Be True    ${count} > 0

#     # Product-container
#     ${count} =    Get Element Count     xpath:/html/body/section//ul[@class='store-suggest']/li
#     Should Be True    ${count} > 3

#     # Title & filter product compare
#     ${count} =    Get Element Count     xpath:/html/body/section//div[@class='compare-action page-section']/div
#     Should Be True    ${count} > 1

#         # Sorted by
#     ${count} =    Get Element Count     xpath:/html/body/section//ul[@class='compare-action-child']/li
#     Should Be True    ${count} > 2

#     # Cac sp lien quan
#     ${count} =    Get Element Count     xpath:/html/body/section//ul[@class='compare-wrap compare-append']/li
#     Should Be True    ${count} > 3
#     # Sp dang'quan tam
#     ${count} =    Get Element Count     xpath:/html/body/section//div[@class='slick-track']/div
#     Should Be True    ${count} > 3
#     # Tin tuc ve sp
#     ${count} =    Get Element Count     xpath:/html/body/section//div[@class='article-sidebar-list']/article
#     Should Be True    ${count} > 14
#     # Sp khac cung muc gia'
#     ${count} =    Get Element Count     xpath:/html/body/section//div[@class='slick-track']/div
#     Should Be True    ${count} > 2
#     # Tin tuc moi nhat
#     ${count} =    Get Element Count     xpath:/html/body/section//div[@class='slick-track']/article
#     Should Be True    ${count} > 6


