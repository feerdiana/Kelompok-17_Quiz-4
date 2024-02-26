*** Settings ***
Resource             ../pageObjects/HomePage/home-page.robot
Resource             ../pageObjects/LoginPage/login-page.robot

*** Test Cases ***
Login with Invalid Data
    Open Flight Application
    Click Sign In Button On Home Page
    Input Username
    login-page.Input Password
    Click Sign In Button On Login Page
    Verify User Is Fail To Logged In
    Close Flight Application
