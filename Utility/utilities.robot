*** Settings ***
Library    RequestsLibrary
Library    API_DB_Connect.py
Library    Req.py
Library    dotenv
Library    Selenium2Library
Library    OperatingSystem

*** Keywords ***
I Connect to DB
    ${data}=    Dbconnect
    RETURN    ${data}


I connect to Excel
    ${Excel_conn}=    Return Record
    RETURN    ${Excel_conn}
    
Sending API Request
    [Arguments]    ${TestCase}    ${scenario}    ${FName}    ${LName}    ${email}    ${password}    ${fromcity}    ${tocity}    ${depdate}    ${retdate}    ${adult}    ${child}    ${travelclass}
    API Request    ${TestCase}    ${scenario}    ${FName}    ${LName}    ${email}    ${password}    ${fromcity}    ${tocity}    ${depdate}    ${retdate}    ${adult}    ${child}    ${travelclass}

I Update Result in DB
    [Arguments]    ${result}
    DB Update    ${result}


TestCase Wise Run
    [Arguments]    ${Tcs}    ${Scn}    ${fne}    ${lne}    ${eml}    ${pwd}    ${fcit}    ${tcit}    ${dep}    ${ret}    ${Adu}    ${chi}    ${Trav}
    When Sending API Request    ${Tcs}    ${Scn}    ${fne}    ${lne}    ${eml}    ${pwd}    ${fcit}    ${tcit}    ${dep}    ${ret}    ${Adu}    ${chi}    ${Trav}
    Then I Update Result in DB    ${Scn}
    #END

*** Test Cases ***
API_TestCase
    ${dict}=    When I connect to Excel
    FOR    ${dict.get("TestCase_ID")}    ${dict.get("Scenario_Name")}    ${dict.get("First_Name")}    ${dict.get("Last_Name")}    ${dict.get("Email_ID")}    ${dict.get("Password")}    ${dict.get("From_City")}    ${dict.get("To_City")}    ${dict.get("Depart_Date")}    ${dict.get("Return_Date")}    ${dict.get("Adult")}    ${dict.get("Child")}    ${dict.get("Travel_Class")}    IN ZIP    ${dict.get("TestCase_ID")}    ${dict.get("Scenario_Name")}    ${dict.get("First_Name")}    ${dict.get("Last_Name")}    ${dict.get("Email_ID")}    ${dict.get("Password")}    ${dict.get("From_City")}    ${dict.get("To_City")}    ${dict.get("Depart_Date")}    ${dict.get("Return_Date")}    ${dict.get("Adult")}    ${dict.get("Child")}    ${dict.get("Travel_Class")}
        AND Sending API Request    ${dict.get("TestCase_ID")}    ${dict.get("Scenario_Name")}    ${dict.get("First_Name")}    ${dict.get("Last_Name")}    ${dict.get("Email_ID")}    ${dict.get("Password")}    ${dict.get("From_City")}    ${dict.get("To_City")}    ${dict.get("Depart_Date")}    ${dict.get("Return_Date")}    ${dict.get("Adult")}    ${dict.get("Child")}    ${dict.get("Travel_Class")}
    END

# API_TestCase_Alternative
#     ${dict}=    When I Connect to DB
#     Log    ${dict.get("TestCase_ID")}
#     FOR    ${dict.get("TestCase_ID")}    ${dict.get("Scenario_Name")}    ${dict.get("First_Name")}    ${dict.get("Last_Name")}    ${dict.get("Email_ID")}    ${dict.get("Password")}    ${dict.get("From_City")}    ${dict.get("To_City")}    ${dict.get("Depart_Date")}    ${dict.get("Return_Date")}    ${dict.get("Adult")}    ${dict.get("Child")}    ${dict.get("Travel_Class")}    IN ZIP    ${dict.get("TestCase_ID")}    ${dict.get("Scenario_Name")}    ${dict.get("First_Name")}    ${dict.get("Last_Name")}    ${dict.get("Email_ID")}    ${dict.get("Password")}    ${dict.get("From_City")}    ${dict.get("To_City")}    ${dict.get("Depart_Date")}    ${dict.get("Return_Date")}    ${dict.get("Adult")}    ${dict.get("Child")}    ${dict.get("Travel_Class")}
#     Run Keyword If    "${dict.get("TestCase_ID")}"=="TC001"    TestCase Wise Run    ${dict.get("TestCase_ID")}    ${dict.get("Scenario_Name")}    ${dict.get("First_Name")}    ${dict.get("Last_Name")}    ${dict.get("Email_ID")}    ${dict.get("Password")}    ${dict.get("From_City")}    ${dict.get("To_City")}    ${dict.get("Depart_Date")}    ${dict.get("Return_Date")}    ${dict.get("Adult")}    ${dict.get("Child")}    ${dict.get("Travel_Class")}
#     Run Keyword If    "${dict.get("TestCase_ID")}"=="TC002"    TestCase Wise Run    ${dict.get("TestCase_ID")}    ${dict.get("Scenario_Name")}    ${dict.get("First_Name")}    ${dict.get("Last_Name")}    ${dict.get("Email_ID")}    ${dict.get("Password")}    ${dict.get("From_City")}    ${dict.get("To_City")}    ${dict.get("Depart_Date")}    ${dict.get("Return_Date")}    ${dict.get("Adult")}    ${dict.get("Child")}    ${dict.get("Travel_Class")}
#     END

