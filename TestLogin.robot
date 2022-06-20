*** Settings ***
Library                         SeleniumLibrary
Test Setup                     Open Browser                    ${base_url}             ${browser_type}
Test Teardown                  Close Browser

*** Variables ***
${base_url}                     https://pub-eish-dev.keponet.com/frontend/login
${browser_type}                 Chrome
${email_user}                   jenareishsatu@yopmail.com
${password_user}                12345678
${invalid_email}                rudianto.s@gmail.com
${invalid_password}             123456789
${no_email}
${no_password}

*** Test Cases ***
I login with valid Email and valid Password
    Maximize Browser Window
    Input Text                  //input[@id="email"]            ${email_user}
    Input Text                  //input[@id="password"]         ${password_user}
    Click Element               //button[@type="submit"]
    Element Should Be Visible   //img[@id="menu-logo"]

I login with invalid Email and valid Password
    Maximize Browser Window
    Input Text                  //input[@id="email"]            ${invalid_email}
    Input Text                  //input[@id="password"]         ${password_user}
    Click Element               //button[@type="submit"]
    Element Should Not Be Visible   //img[@id="menu-logo"]

I login with valid Email and invalid Password
    Maximize Browser Window
    Input Text                  //input[@id="email"]            ${email_user}
    Input Text                  //input[@id="password"]         ${invalid_password}
    Click Element               //button[@type="submit"]
    Element Should Not Be Visible   //img[@id="menu-logo"]

I login without filling Email and Password
    Maximize Browser Window
    Input Text                  //input[@id="email"]            ${no_email}
    Input Text                  //input[@id="password"]         ${no_password}
    Click Element               //button[@type="submit"]
    Element Should Not Be Visible   //img[@id="menu-logo"]