*** Settings ***
Documentation       Login Page POM
Library      SeleniumLibrary
Variables    ../Locators/locators.py
Variables    ../TestData/TestData.py
*** Keywords ***
GO TO LOGIN PAGE
            seleniumlibrary.set screenshot directory        D:/RobotFramework/PROJECTS/E-commerce_WebSite/Outputs/Screenshots/LoginPagePOM
            seleniumlibrary.title should be    ${home_page_title}      Wrong page title
LOGIN
            SeleniumLibrary.input text    ${usernamefield}     ${username}
            SeleniumLibrary.input text    ${passwordfield}      ${password}
            builtin.sleep    2
            seleniumlibrary.capture page screenshot         POM-Login-Page-screenshot-{index}.png
            seleniumlibrary.click button    ${loginsubmitbtn}



