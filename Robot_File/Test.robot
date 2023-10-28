*** Settings ***
Library    String
Library    Selenium2Library
Library    py_db_robo.py
Library    ../Excel_func/hehehe.py  

#Library        ../util.py
#Variables
#Log    ${DB_Conn.get("SCENARIO")}

*** Variables ***
${Main_Page}        https://automationtesting.co.uk
${Form}        https://automationtesting.co.uk/contactForm.html
${FName_1}        //form[@id='contact_form']/input[@name='first_name']
${LName_1}        //form[@id='contact_form']/input[@name='last_name']
${EMail_1}        //form[@id='contact_form']/input[@name='email']
${COmment_1}        //form[@id='contact_form']/textarea[@name='message']
${Submit_1}        //div[@id='form_buttons']/input[@value='SUBMIT']
${Screenshot_path}        ./Evidence/temp

*** Keywords ***    
I connect to DB
    ${DB_Conn}=   Db Connection
    RETURN    ${DB_Conn}

Opening the Main page 
    Open Browser    ${Main_Page}    chrome
    Maximize Browser Window

Goto Form section
    Go To    ${Form}
    #Set Selenium Implicit Wait    60 seconds
    Capture Page Screenshot    ${Screenshot_path}/Screen1.png
    Wait Until Element Is Visible    ${FName_1}
    #Screenshot    Form section opened

I fill the form
    [Arguments]        ${Fname}    ${Lname}    ${Email}    ${Comment}
    Wait Until Element Is Visible    ${FName_1}
    Input Text    ${FName_1}    ${Fname}
    Input Text    ${LName_1}    ${Lname}
    Input Text    ${EMail_1}    ${Email}
    Input Text    ${COmment_1}    ${Comment}
    Sleep    1s
    Capture Page Screenshot    ${Screenshot_path}/Screen2.png
    #Screenshot    All details filled
    ${ISElementvisible}=    Run Keyword And Return Status    Element Should Be Visible    ${Submit_1}
    Run Keyword If    ${ISElementvisible}    Click Element    ${Submit_1}
    Capture Page Screenshot    ${Screenshot_path}/Screen3.png
   # Screenshot    Form is submitted

I Update Result in DB_1
    [Arguments]        ${Result}
    ${Title}=    Get Title
     IF   "${Title}" == "Automation Testing - Homepage"
        DB Update    PASS    ${Result}
    ELSE
        DB Update    FAIL    ${Result}
    END

I Update Result in DB
    [Arguments]        ${Result}
    ${ISnamecontain}=     Get Title
    ${ISnamecontain1}=    Run Keyword And Return If    "${ISnamecontain}"=="Automation Testing - Homepage"     DB Update    PASS    ${Result}
    Run Keyword If    "${ISnamecontain1}"=="None"    DB Update    FAIL    ${Result}

Converting Screenshot to Word
    [Arguments]    ${Val}
    Word Cov    ${Val}


I connect to Excel
    ${Excel_conn}=    Num Of Record
    RETURN    ${Excel_conn}

I Update Result in Excel
    [Arguments]        ${Result}
    ${ISnamecontain}=     Get Title
    ${ISnamecontain1}=    Run Keyword And Return If    "${ISnamecontain}"=="Automation Testing - Homepage"     Update Excelfile    PASS    ${Result}
    Run Keyword If    "${ISnamecontain1}"=="None"    Update Excelfile    FAIL    ${Result}

I connect to DB_alter
    ${DB_Conn}=   Alter
    RETURN    ${DB_Conn}

I connect to Excel_alter
    ${Excel_conn}=    Return Record
    RETURN    ${Excel_conn}


Take Evidence
    [Arguments]    ${Val}
    Word Cov Alter    ${Val}


