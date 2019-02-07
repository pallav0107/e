using Microsoft.Office.Interop.Excel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace EffortEstimationExcelEngine
{
    public class ActualForecast
    {
        private string _excelFilePath;
        public ActualForecast()
        {

        }
        OleDbConnection SqlConnection;
        OleDbCommand cmd;
        OleDbDataReader drs;
        OleDbDataReader drs1;
        DataSet rs;
        DataSet rs1;
        DataSet rs2;
        string strCon;
        string strSQL;
        string strSQL1;
        string strSQL2;

        long srno = 7;
        decimal Util_Nov_18;
        decimal Util_Dec_18;
        decimal Util_Jan_18;
        decimal Util_Feb_18;
        decimal Util_Mar_18;
        decimal Util;
        string summary = "Summary";

        public string DataFetchDb(string filePath, string month,string scrumTeamName)
        {

            try
            {
                using (var context = new EffortEstEntities())
                {

                    var excel = new Microsoft.Office.Interop.Excel.Application();
                    Microsoft.Office.Interop.Excel.Workbook workbook = excel.Workbooks.Open(
                                    Filename: Path.GetDirectoryName(filePath) + "\\Summary.xlsx",
                                    UpdateLinks: false,
                                    ReadOnly: false,
                                    Format: Type.Missing,
                                    Password: Type.Missing,
                                    WriteResPassword: Type.Missing,
                                    IgnoreReadOnlyRecommended: true,
                                    Origin: Type.Missing,
                                    Delimiter: Type.Missing,
                                    Editable: false,
                                    Notify: false,
                                    Converter: Type.Missing,
                                    AddToMru: false,
                                    Local: true,
                                    CorruptLoad: Type.Missing);
                    Microsoft.Office.Interop.Excel.Sheets xlBigSheet = workbook.Worksheets;
                    Microsoft.Office.Interop.Excel.Worksheet xlWorkSheet = (Microsoft.Office.Interop.Excel.Worksheet)xlBigSheet.get_Item("Sheet1");
                    var result = context.SummaryFA().ToList().Where(i => i.ProjectName == scrumTeamName);
                    foreach (var item in result)
                    {
                        // Copy PR Code
                        xlWorkSheet.Cells[srno, 1] = item.PRCode; 
                        //' Copy Description
                        xlWorkSheet.Cells[srno, 2].Value = item.Description; 
                        //' Copy Cost Center
                        xlWorkSheet.Cells[srno, 3].Value = item.ProjectCostCentre; 
                        //' Copy Tribe
                        xlWorkSheet.Cells[srno, 4].Value = item.Tribe;
                        //' Copy Salary Id
                        xlWorkSheet.Cells[srno, 5].Value = item.ProjectName;
                        
                        var ACTData = context.SP_Act_19(item.SalaryID, month).FirstOrDefault();
                        if (month == "JAN")
                        {
                            xlWorkSheet.Cells[srno, 6].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 8].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 7].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 9].Value = ACTData.Effort11;
                        }
                        if (month == "FEB")
                        {
                            xlWorkSheet.Cells[srno, 10].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 11].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 12].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 13].Value = ACTData.Effort11;
                        }
                        if (month == "MAR")
                        {
                            xlWorkSheet.Cells[srno, 14].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 15].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 16].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 17].Value = ACTData.Effort11;
                        }
                        if (month == "MAR")
                        {
                            xlWorkSheet.Cells[srno, 14].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 15].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 16].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 17].Value = ACTData.Effort11;
                        }
                        if (month == "APR")
                        {
                            xlWorkSheet.Cells[srno, 18].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 19].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 20].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 21].Value = ACTData.Effort11;
                        }
                        if (month == "MAY")
                        {
                            xlWorkSheet.Cells[srno, 22].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 23].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 24].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 25].Value = ACTData.Effort11;
                        }
                        if (month == "JUN")
                        {
                            xlWorkSheet.Cells[srno, 26].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 27].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 28].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 29].Value = ACTData.Effort11;
                        }
                        if (month == "JUL")
                        {
                            xlWorkSheet.Cells[srno, 30].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 31].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 32].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 33].Value = ACTData.Effort11;
                        }

                        if (month == "AUG")
                        {
                            xlWorkSheet.Cells[srno, 34].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 35].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 36].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 37].Value = ACTData.Effort11;
                        }
                        if (month == "SEP")
                        {
                            xlWorkSheet.Cells[srno, 38].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 39].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 40].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 41].Value = ACTData.Effort11;
                        }
                        if (month == "OCT")
                        {
                            xlWorkSheet.Cells[srno, 42].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 43].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 44].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 45].Value = ACTData.Effort11;
                        }

                        if (month == "NOV")
                        {
                            xlWorkSheet.Cells[srno, 46].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 47].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 48].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 49].Value = ACTData.Effort11;
                        }
                        if (month == "DEC")
                        {
                            xlWorkSheet.Cells[srno, 50].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 51].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 52].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 53].Value = ACTData.Effort11;
                        }
                        //'   Calculate actual efforts for Dec-18
                        
                        xlWorkSheet.Cells[srno, 55].Value = item.SalaryID;
                        //' Copy Project Name
                        xlWorkSheet.Cells[srno, 56].Value = item.ResourceName; 
                        //' Copy PR Code
                        xlWorkSheet.Cells[srno, 57].Value = item.PRCode;
                        //' Copy Tribe
                        xlWorkSheet.Cells[srno, 58].Value = item.Tribe;
                        xlWorkSheet.Cells[srno, 59].Value = item.ProjectName;
 
                        var FData = context.SP_Forec_191(item.SalaryID,month).FirstOrDefault();
                        var ForceData = FData.ForceData;
                        if (FData.ForceData != null)
                        {
                            Util = Convert.ToDecimal(ForceData) * 100;
                        }
                        if (ACTData.Effort11 != 0)
                        {
                            Util = Math.Round((Convert.ToDecimal(ACTData.Effort11) / Util), 2);
                        }
                        else
                        {
                            Util = 0;
                        }
                        
                        if (month == "JAN")
                        {
                            xlWorkSheet.Cells[srno, 60] = FData.ForceData;
                            xlWorkSheet.Cells[srno, 72].Value = Util * 100;
                        }
                        if (month == "FEB")
                        {
                            xlWorkSheet.Cells[srno, 61] = FData.ForceData;
                            xlWorkSheet.Cells[srno, 73].Value = Util * 100;
                        }
                        if (month == "MAR")
                        {
                            xlWorkSheet.Cells[srno, 62] = FData.ForceData;
                            xlWorkSheet.Cells[srno, 74].Value = Util * 100;
                        }
                        
                        if (month == "APR")
                        {
                            xlWorkSheet.Cells[srno, 63] = FData.ForceData;
                            xlWorkSheet.Cells[srno, 75].Value = Util * 100;
                        }
                        if (month == "MAY")
                        {
                            xlWorkSheet.Cells[srno, 64] = FData.ForceData;
                            xlWorkSheet.Cells[srno, 76].Value = Util * 100;
                        }
                        if (month == "JUN")
                        {
                            xlWorkSheet.Cells[srno, 65] = FData.ForceData;
                            xlWorkSheet.Cells[srno, 77].Value = Util * 100;
                        }
                        if (month == "JUL")
                        {
                            xlWorkSheet.Cells[srno, 66] = FData.ForceData;
                            xlWorkSheet.Cells[srno, 78].Value = Util * 100;
                        }

                        if (month == "AUG")
                        {
                            xlWorkSheet.Cells[srno, 67] = FData.ForceData;
                            xlWorkSheet.Cells[srno, 79].Value = Util * 100;
                        }
                        if (month == "SEP")
                        {
                            xlWorkSheet.Cells[srno, 68] = FData.ForceData;
                            xlWorkSheet.Cells[srno, 80].Value = Util * 100;
                        }
                        if (month == "OCT")
                        {
                            xlWorkSheet.Cells[srno, 69] = FData.ForceData;
                            xlWorkSheet.Cells[srno, 81].Value = Util * 100;
                        }

                        if (month == "NOV")
                        {
                            xlWorkSheet.Cells[srno, 70] = FData.ForceData;
                            xlWorkSheet.Cells[srno, 82].Value = Util * 100;
                        }
                        if (month == "DEC")
                        {
                            xlWorkSheet.Cells[srno, 71] = FData.ForceData;
                            xlWorkSheet.Cells[srno, 83].Value = Util * 100;
                        }
                     

                        srno = srno + 1;
                    }


                    var result2 = context.SummaryFA().ToList().Where(i => i.ProjectName != scrumTeamName);
                    foreach (var item in result2)
                    {
                        // Copy PR Code
                        xlWorkSheet.Cells[srno, 1] = item.PRCode;//.GetString(2);
                        //' Copy Description
                        xlWorkSheet.Cells[srno, 2].Value = item.Description;//.GetString(3);
                        //' Copy Cost Center
                        xlWorkSheet.Cells[srno, 3].Value = item.ProjectCostCentre;//.GetString(5);
                        //' Copy Tribe
                        xlWorkSheet.Cells[srno, 4].Value = item.Tribe;//.GetString(1);
                        //' Copy Salary Id
                        xlWorkSheet.Cells[srno, 5].Value = item.ProjectName;

                        var ACTData = context.SP_Act_19(item.SalaryID, month).FirstOrDefault();
                        if (month == "JAN")
                        {
                            xlWorkSheet.Cells[srno, 6].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 8].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 7].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 9].Value = ACTData.Effort11;
                        }
                        if (month == "FEB")
                        {
                            xlWorkSheet.Cells[srno, 10].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 11].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 12].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 13].Value = ACTData.Effort11;
                        }
                        if (month == "MAR")
                        {
                            xlWorkSheet.Cells[srno, 14].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 15].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 16].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 17].Value = ACTData.Effort11;
                        }
                        if (month == "MAR")
                        {
                            xlWorkSheet.Cells[srno, 14].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 15].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 16].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 17].Value = ACTData.Effort11;
                        }
                        if (month == "APR")
                        {
                            xlWorkSheet.Cells[srno, 18].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 19].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 20].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 21].Value = ACTData.Effort11;
                        }
                        if (month == "MAY")
                        {
                            xlWorkSheet.Cells[srno, 22].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 23].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 24].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 25].Value = ACTData.Effort11;
                        }
                        if (month == "JUN")
                        {
                            xlWorkSheet.Cells[srno, 26].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 27].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 28].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 29].Value = ACTData.Effort11;
                        }
                        if (month == "JUL")
                        {
                            xlWorkSheet.Cells[srno, 30].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 31].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 32].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 33].Value = ACTData.Effort11;
                        }

                        if (month == "AUG")
                        {
                            xlWorkSheet.Cells[srno, 34].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 35].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 36].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 37].Value = ACTData.Effort11;
                        }
                        if (month == "SEP")
                        {
                            xlWorkSheet.Cells[srno, 38].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 39].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 40].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 41].Value = ACTData.Effort11;
                        }
                        if (month == "OCT")
                        {
                            xlWorkSheet.Cells[srno, 42].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 43].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 44].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 45].Value = ACTData.Effort11;
                        }

                        if (month == "NOV")
                        {
                            xlWorkSheet.Cells[srno, 46].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 47].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 48].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 49].Value = ACTData.Effort11;
                        }
                        if (month == "DEC")
                        {
                            xlWorkSheet.Cells[srno, 50].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 51].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 52].Value = ACTData.Effort11;
                            xlWorkSheet.Cells[srno, 53].Value = ACTData.Effort11;
                        }
                        //'   Calculate actual efforts for Dec-18

                        xlWorkSheet.Cells[srno, 55].Value = item.SalaryID;
                        //' Copy Project Name
                        xlWorkSheet.Cells[srno, 56].Value = item.ResourceName;//.GetString(4);
                        //' Copy PR Code
                        xlWorkSheet.Cells[srno, 57].Value = item.PRCode;//.GetString(2);
                        //' Copy Tribe
                        xlWorkSheet.Cells[srno, 58].Value = item.Tribe;//.GetString(1);
                        xlWorkSheet.Cells[srno, 59].Value = item.ProjectName;

                        var FData2 = context.SP_Forec_191(item.SalaryID, month).FirstOrDefault();
                        var ForceData2 = FData2.ForceData;
                        if (FData2.ForceData != null)
                        {
                            Util = Convert.ToDecimal(ForceData2) * 100;
                        }
                        if (ACTData.Effort11 != 0)
                        {
                            Util = Math.Round((Convert.ToDecimal(ACTData.Effort11) / Util),2);
                        }
                        else
                        {
                            Util = 0;
                        }

                        if (month == "JAN")
                        {
                            xlWorkSheet.Cells[srno, 60] = FData2.ForceData;
                            xlWorkSheet.Cells[srno, 72].Value = Util * 100;
                        }
                        if (month == "FEB")
                        {
                            xlWorkSheet.Cells[srno, 61] = FData2.ForceData;
                            xlWorkSheet.Cells[srno, 73].Value = Util * 100;
                        }
                        if (month == "MAR")
                        {
                            xlWorkSheet.Cells[srno, 62] = FData2.ForceData;
                            xlWorkSheet.Cells[srno, 74].Value = Util * 100;
                        }

                        if (month == "APR")
                        {
                            xlWorkSheet.Cells[srno, 63] = FData2.ForceData;
                            xlWorkSheet.Cells[srno, 75].Value = Util * 100;
                        }
                        if (month == "MAY")
                        {
                            xlWorkSheet.Cells[srno, 64] = FData2.ForceData;
                            xlWorkSheet.Cells[srno, 76].Value = Util * 100;
                        }
                        if (month == "JUN")
                        {
                            xlWorkSheet.Cells[srno, 65] = FData2.ForceData;
                            xlWorkSheet.Cells[srno, 77].Value = Util * 100;
                        }
                        if (month == "JUL")
                        {
                            xlWorkSheet.Cells[srno, 66] = FData2.ForceData;
                            xlWorkSheet.Cells[srno, 78].Value = Util * 100;
                        }

                        if (month == "AUG")
                        {
                            xlWorkSheet.Cells[srno, 67] = FData2.ForceData;
                            xlWorkSheet.Cells[srno, 79].Value = Util * 100;
                        }
                        if (month == "SEP")
                        {
                            xlWorkSheet.Cells[srno, 68] = FData2.ForceData;
                            xlWorkSheet.Cells[srno, 80].Value = Util * 100;
                        }
                        if (month == "OCT")
                        {
                            xlWorkSheet.Cells[srno, 69] = FData2.ForceData;
                            xlWorkSheet.Cells[srno, 81].Value = Util * 100;
                        }

                        if (month == "NOV")
                        {
                            xlWorkSheet.Cells[srno, 70] = FData2.ForceData;
                            xlWorkSheet.Cells[srno, 82].Value = Util * 100;
                        }
                        if (month == "DEC")
                        {
                            xlWorkSheet.Cells[srno, 71] = FData2.ForceData;
                            xlWorkSheet.Cells[srno, 83].Value = Util * 100;
                        }
                        
                        srno = srno + 1;
                    }


                    excel.DisplayAlerts = false;
                   
                    string extension = Path.GetExtension(filePath);
                    string filename = Path.GetFileName(filePath);
                    string filenameNoExtension = Path.GetFileNameWithoutExtension(summary);
                    string root = Path.GetDirectoryName(filePath);
                    string path = root + '\\' + filenameNoExtension + extension;

                    workbook.SaveAs(path, XlFileFormat.xlWorkbookDefault, Type.Missing, Type.Missing, true, false, XlSaveAsAccessMode.xlNoChange, XlSaveConflictResolution.xlLocalSessionChanges, Type.Missing, Type.Missing);
                    workbook.Close(true, Type.Missing, Type.Missing);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return null;
        }

        public string DataAddActual(string filepath)
        {
            string ssqltable = "Actuals";
            // make sure your sheet name is correct, here sheet name is sheet1, 
            //so you can change your sheet name if have    different
            string myexceldataquery = "select [Project Name],[Project ID],[Project Cost Centre],[Payroll Cost Centre],[Manager],[Manager ID],[Resource Name],[Salary ID],[Resource Rate],[Date],[Hours Per Day Uncapped],[Hours Per Day Capped],[Hours per day Variance],[Daily Charge Uncapped],[Daily Charge Capped],[Approver],[Approver ID] from [Sheet1$]";
            try
            {
                var ExcelSupport = ConfigurationManager.AppSettings["ExcelSupport"];
                string sexcelconnectionstring = "";
                //create our connection strings   
                if(ExcelSupport=="OLEDB12.0")
                {
                sexcelconnectionstring = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filepath + ";Extended Properties=Excel 12.0;";
                }
                if(ExcelSupport=="OLEDB4.0")
                {
                sexcelconnectionstring = @"provider=microsoft.jet.oledb.4.0;data source=" + filepath + ";extended properties=" + "\"excel 8.0;hdr=yes;\"";
                }
                string ssqlconnectionstring = ConfigurationManager.ConnectionStrings["SQLWPFConnection"].ToString();
                //execute a query to erase any previous data from our destination table   
                string sclearsql = "Truncate table " + ssqltable;
                SqlConnection sqlconn = new SqlConnection(ssqlconnectionstring);
                SqlCommand sqlcmd = new SqlCommand(sclearsql, sqlconn);
                sqlconn.Open();
                sqlcmd.ExecuteNonQuery();
                sqlconn.Close();
                //series of commands to bulk copy data from the excel file into our sql table   
                OleDbConnection oledbconn = new OleDbConnection(sexcelconnectionstring);
                OleDbCommand oledbcmd = new OleDbCommand(myexceldataquery, oledbconn);
                oledbconn.Open();
                OleDbDataReader dr = oledbcmd.ExecuteReader();
                SqlBulkCopy bulkcopy = new SqlBulkCopy(ssqlconnectionstring);
                bulkcopy.DestinationTableName = ssqltable;
                while (dr.Read())
                {
                    bulkcopy.WriteToServer(dr);
                }
                dr.Close();
                oledbconn.Close();
                dr.Dispose();
                oledbconn.Dispose();
                return "success";
            }
            catch (Exception ex)
            {
                //handle exception   
                return ex.Message;
            }
        }

        public string DataAddForcast(string filepath)
        {
            string ssqltable = "Forecast";
            // make sure your sheet name is correct, here sheet name is sheet1, 
            //so you can change your sheet name if have    different
            string myexceldataquery = "select * from [Sheet1$]";
            try
            {
                //create our connection strings   
                //string sexcelconnectionstring = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filepath + ";Extended Properties=Excel 12.0;";
                var ExcelSupport = ConfigurationManager.AppSettings["ExcelSupport"];
                string sexcelconnectionstring = "";
                //create our connection strings   
                if (ExcelSupport == "OLEDB12.0")
                {
                    sexcelconnectionstring = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filepath + ";Extended Properties=Excel 12.0;";
                }
                if (ExcelSupport == "OLEDB4.0")
                {
                    sexcelconnectionstring = @"provider=microsoft.jet.oledb.4.0;data source=" + filepath + ";extended properties=" + "\"excel 8.0;hdr=yes;\"";
                }


                string ssqlconnectionstring = ConfigurationManager.ConnectionStrings["SQLWPFConnection"].ToString();
                //execute a query to erase any previous data from our destination table   
                
                string sclearsql = "TRUNCATE TABLE " + ssqltable;
                SqlConnection sqlconn = new SqlConnection(ssqlconnectionstring);
                SqlCommand sqlcmd = new SqlCommand(sclearsql, sqlconn);
                sqlconn.Open();
                sqlcmd.ExecuteNonQuery();
                sqlconn.Close();
                //series of commands to bulk copy data from the excel file into our sql table   
                OleDbConnection oledbconn = new OleDbConnection(sexcelconnectionstring);
                OleDbCommand oledbcmd = new OleDbCommand(myexceldataquery, oledbconn);
                oledbconn.Open();
                OleDbDataReader dr;
                dr = oledbcmd.ExecuteReader();
                SqlBulkCopy bulkcopy = new SqlBulkCopy(ssqlconnectionstring);
                bulkcopy.DestinationTableName = ssqltable;
                while (dr.Read())
                {
                    bulkcopy.WriteToServer(dr);
                }
                dr.Close();
                oledbconn.Close();
                dr.Dispose();
                oledbconn.Dispose();
                return "success";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }

    }
}

