*** Settings ***
Resource    ../resources/keywordGist.robot
Suite Setup    Open Browser To Home Page

*** Test Cases ***
As_A_User_I_Want_To_Login
    Go To Login Page
    Blank Login Page
    Valid Login

As_A_User_I_Want_To_Create_A_Public_Gist
    Go To Create Gists
    Create Public Gist

As_A_User_I_Want_To_Edit_An_Existing_Gist
    Edit Public Gist

As_A_User_I_Want_To_Delete_An_Existing_Gist
    Delete Public Gist

As_A_User_I_Want_To_See_My_List_Of_Gist
    See My List