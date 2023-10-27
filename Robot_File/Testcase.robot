*** Settings ***
Resource    Test.robot
Library    ../Excel_func/hehehe.py

*** Variables ***

*** Keywords ***

*** Test Cases ***
Testcase via DB
    ${dict}    When I connect to DB
    AND Opening the Main page
    FOR    ${dict.get("SCENARIO")}    ${dict.get("F_NAME")}    ${dict.get("L_NAME")}    ${dict.get("EMAIL")}    ${dict.get("COMMENT")}    IN ZIP    ${dict.get("SCENARIO")}    ${dict.get("F_NAME")}    ${dict.get("L_NAME")}    ${dict.get("EMAIL")}    ${dict.get("COMMENT")}
        Then Goto Form section
        WHEN I fill the form    ${dict.get("F_NAME")}    ${dict.get("L_NAME")}    ${dict.get("EMAIL")}    ${dict.get("COMMENT")}
        AND I Update Result in DB    ${dict.get("SCENARIO")}
        THEN Converting Screenshot to Word    ${dict.get("SCENARIO")}
    END
    Close Browser

# Testcase via Excel
#     ${dict}    When I connect to Excel
#     AND Opening the Main page
#     FOR    ${dict.get("SCENARIO")}    ${dict.get("F_NAME")}    ${dict.get("L_NAME")}    ${dict.get("EMAIL")}    ${dict.get("COMMENT")}    IN ZIP    ${dict.get("SCENARIO")}    ${dict.get("F_NAME")}    ${dict.get("L_NAME")}    ${dict.get("EMAIL")}    ${dict.get("COMMENT")}
#         Then Goto Form section
#         WHEN I fill the form    ${dict.get("F_NAME")}    ${dict.get("L_NAME")}    ${dict.get("EMAIL")}    ${dict.get("COMMENT")}
#         AND I Update Result in Excel    ${dict.get("SCENARIO")}
#         THEN Converting Screenshot to Word    ${dict.get("SCENARIO")}
#     END
#     Close Browser

# Testcase via DB_alter
#     ${dict}    When I connect to DB_alter
#     AND Opening the Main page
#     FOR    ${dict.get("Scenario")}    ${dict.get("First_Name")}    ${dict.get("Last_Name")}    ${dict.get("Email")}    ${dict.get("Comment")}    IN ZIP    ${dict.get("Scenario")}    ${dict.get("First_Name")}    ${dict.get("Last_Name")}    ${dict.get("Email")}    ${dict.get("Comment")}
#         Then Goto Form section
#         WHEN I fill the form    ${dict.get("First_Name")}    ${dict.get("Last_Name")}    ${dict.get("Email")}    ${dict.get("Comment")}
#         AND I Update Result in DB    ${dict.get("Scenario")}
#         THEN Converting Screenshot to Word    ${dict.get("Scenario")}
#     END
#     Close Browser

# Testcase via Excel_Alter
#     ${dict}    When I connect to Excel_alter
#     AND Opening the Main page
#     FOR    ${dict.get("Scenario")}    ${dict.get("First_Name")}    ${dict.get("Last_Name")}    ${dict.get("Email")}    ${dict.get("Comment")}    IN ZIP    ${dict.get("Scenario")}    ${dict.get("First_Name")}    ${dict.get("Last_Name")}    ${dict.get("Email")}    ${dict.get("Comment")}
#         Then Goto Form section
#         WHEN I fill the form    ${dict.get("First_Name")}    ${dict.get("Last_Name")}    ${dict.get("Email")}    ${dict.get("Comment")}
#         AND I Update Result in Excel    ${dict.get("Scenario")}
#         #THEN Converting Screenshot to Word    ${dict.get("Scenario")}
#         THEN Take Evidence    ${dict.get("Scenario")}
#     END
#     Close Browser



