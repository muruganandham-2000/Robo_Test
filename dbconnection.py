import mysql.connector as db
from dotenv import load_dotenv
import os

class dbconnection:
    load_dotenv()
    def dbconnect_string(self,str):
        if str.lower() == "conn_string":
            service = os.environ.get('host_v')
            user = os.environ.get('username_v')
            pwd = os.environ.get('password_v')
            db = os.environ.get('database_v')
        conn_params = {
            'host': service,
            'user': user,
            'password': pwd,
            'database': db
        }
        return conn_params


"""print(dbconnect_string('conn_string'))
ddd=dbconnect_string('conn_string')
conn = db.connect(**ddd)
if conn.is_connected():
    print("DB Connected...")
else:
    print("connection not established...")"""
