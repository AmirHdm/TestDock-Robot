*** Settings ***
Documentation    E-commerce WebApp Test Run

Resource    D:/RobotFramework/PROJECTS/E-commerce_WebSite/Resources/POM/KeywordsDefinitionFiles/Comman.robot
Resource    D:/RobotFramework/PROJECTS/E-commerce_WebSite/Resources/POM/KeywordsDefinitionFiles/LoginPage.robot
Resource    D:/RobotFramework/PROJECTS/E-commerce_WebSite/Resources/POM/KeywordsDefinitionFiles/HomePage.robot

Resource    D:/RobotFramework/PROJECTS/E-commerce_WebSite/Resources/POM/Locators/PagePath.resource

Library    OperatingSystem
Library    SeleniumLibrary


*** Variables ***
${localFilePath}    D:\\RobotFramework\\PROJECTS\\E-commerce_WebSite\\Resources\\POM\\TestData\\amir.jpg
${uploadedFile}     amir.jpg
${savedfilepath}    D:\\RobotFramework\\PROJECTS\\E-commerce_WebSite\\Outputs\\OutputFiles\\amir.txt


*** Test Cases ***
Verify LogIn/Out in MHR WEBAPP
         [Documentation]    A complete Test of WebApp
         [Tags]    POM
         START NAVIGATION       ${home_page_url}        ${campanylogo}      firefox
         GO TO LOGIN PAGE
         LOGIN
         VERIFY HOME PAGE
         LOGOUT HOME PAGE
         EXIT BROWSER

Upload a local file test
        [Documentation]    Upload a file from local machine
        [Tags]    Integration
        START NAVIGATION        ${uploadGUIUrl}     ${flagUploadGUI}    firefox
        UPLOAD A FILE           ${localFilePath}
        EXIT BROWSER

*** Keywords ***
UPLOAD A FILE
        [Arguments]    ${filepath}
        seleniumlibrary.choose file     id:file-upload        ${filepath}
        seleniumlibrary.click element   id:file-submit
        element should be visible    //h3[contains(.,'File Uploaded!')]        ERROR: File doesn't get uploaded !
        ${expectedFile}=    seleniumlibrary.get text    xpath://div[contains(@id,'uploaded-files')]
        SAVE ELEMENT TO TXT     ${savedfilepath}    ${expectedFile}
        should contain      ${expectedFile}     ${uploadedFile}     Wrong file name





