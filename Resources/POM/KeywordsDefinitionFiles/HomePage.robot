*** Settings ***
Documentation    Home Page POM
Library      SeleniumLibrary
Variables    ../Locators/locators.py

*** Keywords ***
VERIFY HOME PAGE
                seleniumlibrary.set screenshot directory        D:/RobotFramework/PROJECTS/E-commerce_WebSite/Outputs/Screenshots/HomePagePOM/
                seleniumlibrary.title should be    ${home_page_title}      Wrong page title
                builtin.sleep    2
                seleniumlibrary.capture page screenshot         POM-Home-Page-screenshot-{index}.png

LOGOUT HOME PAGE
                seleniumlibrary.click element       xpath:${UserIcon}
                builtin.sleep    2
                seleniumlibrary.click element       xpath:${LogoutBtn}
