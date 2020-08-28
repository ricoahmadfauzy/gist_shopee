*** Settings ***
Library    Selenium2Library
Variables    ../ENV.py
Variables    ../pages/allPage.py

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Validate Home Page

Validate Home Page
    Title Should Be    Discover gists · GitHub

Go To Login Page
    Wait Until Element Is Visible    ${signInBtn}
    Click Element    ${signInBtn}

Blank Login Page
    Wait Until Element Is Visible     ${loginBtn}
    Click Element    ${loginBtn}
    Wait Until Element Is Visible     ${loginError}
    Element Should Contain    ${loginError}    Incorrect username or password.

Valid Login
    Input Text    ${emailTxt}    ${username}
    Input Password    ${passwordTxt}    ${password}
    Click Element    ${loginBtn}
    Wait Until Element Is Visible    ${validateLoggedin}
    Element Should Contain    ${validateLoggedin}    Discover gists
    Sleep    5

Go To Create Gists
    Wait Until Element Is Visible    ${createGistLink}
    Click Element    ${createGistLink}

Create Public Gist
    Click Element    ${descTxt} 
    Input Text    ${descTxt}    Test
    Click Element    ${fileNamingTxt}
    Input Text    ${fileNamingTxt}    Test321
    Click Element    ${createLine1}
    Input Text    ${createLine1}    public gist for test
    Wait Until Element Is Visible    ${selectPublish}
    Click Element    ${selectPublish}
    Wait Until Element Is Visible    ${publicBtn}
    Click Element    ${publicBtn}

Edit Public Gist
    Wait Until Element Is Visible    ${editGistLink}
    Click Element    ${editGistLink}
    Click Element    ${descTxt} 
    Input Text    ${descTxt}    just test
    Click Element    ${fileNamingTxt}
    Input Text    ${fileNamingTxt}    just test
    Click Element    ${createLine1}
    Input Text    ${createLine1}    public gist for test just test
    Wait Until Element Is Visible    ${updateBtn}
    Click Element    ${updateBtn}

Delete Public Gist
    Wait Until Element Is Visible    ${deleteGistLink}
    Click Element    ${deleteGistLink}
    Sleep    3
    Confirm Action
    Wait Until Element Is Visible    ${validateDeleted}

See My List
    Go To    ${URL}${username}
    Element Should Contain    ${validateList}    All gists