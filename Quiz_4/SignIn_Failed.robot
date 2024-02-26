*** Settings ***
Library                            AppiumLibrary

*** Variables ***
${REMOTE_URL}              http://localhost:4723/wd/hub
${PLATFORM_NAME}           Android

*** Keywords ***
Open Flight Application
    Open Application       remote_url=${REMOTE_URL}   
    ...                    platformName=${PLATFORM_NAME} 
    ...                    platformVersion=9.0    
    ...                    deviceName=emulator-5554    
    ...                    appPackage=com.example.myapplication    
    ...                    appActivity=com.example.myapplication.MainActivity

Click Sign In Button On Home Page
    Click Element                      locator=//android.widget.Button[@resource-id="com.example.myapplication:id/login"]

Input Username
    Wait Until Element Is Visible      locator=//android.widget.EditText[@resource-id="com.example.myapplication:id/username"]
    Input Text                         locator=//android.widget.EditText[@resource-id="com.example.myapplication:id/username"]    text=WrongUser

Input Password
    Input Text                         locator=//android.widget.EditText[@resource-id="com.example.myapplication:id/password"]    text=WrongPassword

Click Sign In Button On Login Page
    Click Element                      locator=//android.widget.Button[@resource-id="com.example.myapplication:id/signIn"]

Verify User Is Fail To Logged In
    Wait Until Page Contains           text=Invalid username/password

Close Flight Application
    Close Application


*** Test Cases ***
Login with Invalid Data
    Open Flight Application
    Click Sign In Button On Home Page
    Input Username
    Input Password
    Click Sign In Button On Login Page
    Verify User Is Fail To Logged In
    Close Flight Application
