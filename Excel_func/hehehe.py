import pandas as pd
import mysql.connector as db
from dotenv import load_dotenv
import os
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager

class hehehe:
   load_dotenv()
   def Num_0f_rows_Excel(self):
      A=pd.read_excel('D:/End to End/Excel_func/Excel.xlsx',dtype=str) 
      datatemp=pd.DataFrame(A)
      data=datatemp[(datatemp['Run_Indicator']=='Y')]
      return data.shape[0]

   def get_driver_path_with_browser(self,browser_name):
      if browser_name.lower() == 'chrome':
         driver_path = ChromeDriverManager().install()
      elif browser_name.lower() == 'firefox':
         driver_path = GeckoDriverManager().install()
      print(driver_path)
      return driver_path

   def Num_of_record(self):
      A=pd.read_excel('D:/End to End/Excel_func/Excel.xlsx',dtype=str) 
      datatemp=pd.DataFrame(A)
      data=datatemp[(datatemp['Run_Indicator']=='Y')]
      data2=data.fillna('')
      data1=data2.reset_index()
      Scenario,F_Name,L_Name,Email,Comment = ([] for i in range(5))
      for i in range (len(data1)):
         Scenario.append(data1['Scenario'][i])
         F_Name.append(data1['First_Name'][i])
         L_Name.append(data1['Last_Name'][i])
         Email.append(data1['Email'][i])
         Comment.append(data1['Comment'][i])
         mydict={"SCENARIO":Scenario,"F_NAME":F_Name,"L_NAME":L_Name,"EMAIL":Email,"COMMENT":Comment}
      return mydict

   def updateExcelfile(self,Result,Scenariotemp):
      A=pd.read_excel('D:/End to End/Excel_func/Excel.xlsx',dtype=str) 
      datatemp=pd.DataFrame(A)
      data=datatemp[(datatemp['Scenario']==Scenariotemp) & (datatemp['Run_Indicator']=='Y')]
      A['Result'][data.index]=Result
      A.to_excel('D:/End to End/Excel_func/Excel.xlsx',index=False)
   
   def return_record(self):
      dict = {}
      Ex_cel=pd.read_excel('D:/End to End/Excel_func/Excel.xlsx',dtype=str) 
      datatemp=pd.DataFrame(Ex_cel)
      data=datatemp[(datatemp['Run_Indicator']=='Y')]
      final_dataframe=data.fillna('')                    #final_dataframe=fill_na.reset_index()
      for column in final_dataframe.columns:
         dict[column] = final_dataframe[column].tolist()
      return dict


