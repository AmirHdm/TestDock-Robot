*** Settings ***
Library    SeleniumLibrary
Resource    D:/RobotFramework/PROJECTS/E-commerce_WebSite/Resources/POM/Locators/PagePath.resource
*** Keywords ***
START NAVIGATION
    [Arguments]     ${Site_url}     ${VerificationLogo}     ${SelectedBrowser}
    Run Keyword If    '${SelectedBrowser}' == 'Firefox' or '${SelectedBrowser}' == 'firefox'
    ...     Open Browser    ${Site_url}     browser=${Firefox}[var1]    alias=${Firefox}[var2]      executable_path=${Firefox}[var3]
    ...     ELSE IF    '${SelectedBrowser}' == 'Chrome' or '${SelectedBrowser}' == 'chrome'
    ...     Open Browser    ${Site_url}     browser=${Chrome}[var1]    alias=${Chrome}[var2]        executable_path=${Chrome}[var3]
    ...     ELSE
    ...     Fail    '${SelectedBrowser}' is not a supported browser.
    Sleep    1s
    SeleniumLibrary.Wait Until Element Is Visible    ${VerificationLogo}    timeout=5s    error=Page loaded slowly

EXIT BROWSER
    builtin.sleep    3
    close browser