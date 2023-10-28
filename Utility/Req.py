import requests
import json
from dbconnection import dbconnection
import mysql.connector as db
import time
from dotenv import load_dotenv
import os
import datetime
now1 = datetime.datetime.now()
now =str(now1.strftime("%Y-%m-%d %H_%M_%S"))

class Req:
    load_dotenv()
   
    def API_Request(self,testcase,scenario,F_Name,L_Name,email,password,fromcity,tocity,depdate,retdate,adult,child,travelclass):
        session = requests.Session()
        signin_url=os.getenv('signin_url_v')
        login_url = os.getenv('login_url_v')
        booking_url = os.getenv('booking_url_v')
        Signin_status=""

        if (testcase=="TC002"):
            login_data = {
                'Email': email,
                'Password': password
            }

            data = {
                'From': fromcity,
                'To': tocity,
                'Depart': depdate,
                'Return': retdate,
                'Adult': adult,
                'Child': child,
                'Travel Class': travelclass
            }

            login = session.post(login_url,json=login_data)
            print(login.json())

            json_data = json.dumps(data)
            time.sleep(1)
            booking = session.post(booking_url, data=json_data)
            print(booking.json())

            data_dict = {
                'login_data': login.json(),
                'Booking_data': booking.json()
            }

            with open('./Evidence/'+scenario+'_'+now+'_response.json', 'w') as outfile:
                json.dump(data_dict, outfile,indent=4)

            with open('./Evidence/'+scenario+'_'+now+'_response.json') as response:
                data = json.load(response)
            
            Login_status=str(data['login_data']['status code'])
            book_code=str(data['Booking_data']['Data'][0]['Booking code'])
            book_des=data['Booking_data']['Data'][0]['Booking Status']
            Amount=str(data['Booking_data']['Data'][0]['Amount'])

            print(Amount)

        elif (testcase=="TC001"):
            signin_data = {
                "Email": email,
                "FirstName": F_Name,
                "LastName": L_Name,
                "Password": password
            }
            sss=requests.post(signin_url,json=signin_data)
            print(sss.json())

            login_data = {
                'Email': email,
                'Password': password
            }

            data = {
                'From': fromcity,
                'To': tocity,
                'Depart': depdate,
                'Return': retdate,
                'Adult': adult,
                'Child': child,
                'Travel Class': travelclass
            }

            login = session.post(login_url,json=login_data)
            print(login.json())

            json_data = json.dumps(data)
            time.sleep(1)
            booking = session.post(booking_url, data=json_data)
            print(booking.json())

            data_dict = {
                'Signin_data': sss.json(),
                'Login_data': login.json(),
                'Booking_data': booking.json()
            }

            with open('./Evidence/'+scenario+'_'+now+'_response.json', 'w') as outfile:
                json.dump(data_dict, outfile,indent=4)

            with open('./Evidence/'+scenario+'_'+now+'_response.json') as response:
                data = json.load(response)

            Signin_status=str(data['Signin_data']['status code'])
            Login_status=str(data['Login_data']['status code'])
            book_code=str(data['Booking_data']['Data'][0]['Booking code'])
            book_des=data['Booking_data']['Data'][0]['Booking Status']
            Amount=str(data['Booking_data']['Data'][0]['Amount'])
            print(Signin_status)
        
        
            
        # mysqldbconnection=dbconnection()
        # connection_string=mysqldbconnection.dbconnect_string('conn_string')
        # conn=db.connect(**connection_string)
        # cursor=conn.cursor()
        # cursor.execute("UPDATE api_test_table SET Signin_Status='"+Signin_status+"',Login_Status='"+Login_status+"',Booking_Status='"+book_code+"',Booking_Description='"+book_des+"',API_Amount='"+Amount+"' WHERE Scenario_Name='"+scenario+"' and Run_Indicator='Y';")  
        # conn.commit()
        # cursor.close()
        # conn.close()



print(now)