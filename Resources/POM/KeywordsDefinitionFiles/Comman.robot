*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
START NAVIGATION
            [Arguments]     ${Site_url}     ${VerificationLogo}
            open browser    ${Site_url}     Firefox     firefox
            BuiltIn.sleep    1
            SeleniumLibrary.wait until element is visible    ${VerificationLogo}    5      Page loaded slowly

EXIT BROWSER
            builtin.sleep    3
            close browser