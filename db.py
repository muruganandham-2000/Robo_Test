import mysql.connector as db
conn=db.connect(host='localhost',user='root',password='Muruga@2000')
cursor=conn.cursor()
cursor.execute("UPDATE pydatabase.py_automate SET Result='PASS' WHERE Scenario='Scenario_01'and Run_Indicator='Y';")
conn.commit()
cursor.close()
conn.close()