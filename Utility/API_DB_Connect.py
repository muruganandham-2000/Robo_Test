import pandas as pd
import mysql.connector as db
from dbconnection import dbconnection


class API_DB_Connect:
    def Dbconnect(self):
        mysqldbconnection=dbconnection()
        connection_string=mysqldbconnection.dbconnect_string('conn_string')
        conn=db.connect(**connection_string)
        cursor=conn.cursor()
        query_ip=f"SELECT * FROM api_test_table where Run_Indicator='Y';"
        cursor.execute(query_ip)
        column_names = [description[0] for description in cursor.description]
        column_dict = {}
        for column in column_names:
            connection_string=mysqldbconnection.dbconnect_string('conn_string')
            conn=db.connect(**connection_string)
            cursor=conn.cursor()
            cursor.execute("SELECT {} FROM api_test_table where Run_Indicator='Y';".format(column))
            column_values = [row[0] for row in cursor.fetchall()]
            #unique_values = set(column_values)     column_dict[column] = unique_values
            column_dict[column] = column_values
        cursor.close()
        conn.close()
        return column_dict
        
    def DB_Update(self,data):
        mysqldbconnection=dbconnection()
        connection_string=mysqldbconnection.dbconnect_string('conn_string')
        conn=db.connect(**connection_string)
        cursor=conn.cursor()
        query_ip=f"SELECT * FROM api_test_table where Scenario_Name='"+data+"';"
        cursor.execute(query_ip)
        res = cursor.fetchall()
        record = pd.DataFrame(res)
        A1=record[3][0]
        B1=record[4][0]
        C1=record[6][0]
        D1=record[19][0]
        value="FAIL"
        if((A1==B1==C1=="200") | (B1==C1=="200") & (A1!="201") &(D1>'0')):
            value="PASS"
        cursor.execute("UPDATE api_test_table SET Result='"+value+"' WHERE Scenario_Name='"+data+"' and Run_Indicator='Y';")  
        conn.commit()
        cursor.close()
        conn.close()

    def TestCase_Dbconnect(self, Testcase):
        mysqldbconnection = dbconnection()
        connection_string = mysqldbconnection.dbconnect_string('conn_string')
        conn = db.connect(**connection_string)
        cursor = conn.cursor()
        query_ip = f"SELECT * FROM api_test_table where TestCase_ID='{Testcase}' AND Run_Indicator='Y';"
        cursor.execute(query_ip)
        column_names = [description[0] for description in cursor.description]
        column_dict = {}
        for column in column_names:
            connection_string = mysqldbconnection.dbconnect_string('conn_string')
            conn = db.connect(**connection_string)
            cursor = conn.cursor()
            cursor.execute(f"SELECT `{column}` FROM api_test_table where TestCase_ID='{Testcase}' AND Run_Indicator='Y';")
            column_values = [row[0] for row in cursor.fetchall()]
            column_dict[column] = column_values
        cursor.close()
        conn.close()
        return column_dict

    
    def updateExcelfile(self,Result,Scenariotemp):
        A=pd.read_excel('./convert.xlsx',dtype=str) 
        datatemp=pd.DataFrame(A)
        data=datatemp[(datatemp['Scenario']==Scenariotemp) & (datatemp['Run_Indicator']=='Y')]
        A['Result'][data.index]=Result
        A.to_excel('./Excel.xlsx',index=False)
   
    def return_record(self):
        dict = {}
        Ex_cel=pd.read_excel('./convert.xlsx',dtype=str) 
        datatemp=pd.DataFrame(Ex_cel)
        data=datatemp[(datatemp['Run_Indicator']=='Y')]
        final_dataframe=data.fillna('')                    #final_dataframe=fill_na.reset_index()
        for column in final_dataframe.columns:
            dict[column] = final_dataframe[column].tolist()
        return dict


