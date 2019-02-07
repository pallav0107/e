using EffortEstimationExcelEngine;
using System;
using System.ComponentModel;
using System.Threading;
using System.Windows;
using System.Windows.Controls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace EffortEstimation
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            BindComboBox(cmbScrumTeam);
        }
        public void BindComboBox(ComboBox comboBoxName)
        {
            string ssqlconnectionstring = ConfigurationManager.ConnectionStrings["SQLWPFConnection"].ToString();
                SqlConnection sqlconn = new SqlConnection(ssqlconnectionstring);
            sqlconn.Open();
            SqlDataAdapter da = new SqlDataAdapter("Select ScrumTeamId,ScrumTeam FROM tblScrumTeam", sqlconn);
            DataSet ds = new DataSet();
            da.Fill(ds, "tblScrumTeam");
            sqlconn.Close();
            comboBoxName.ItemsSource = ds.Tables[0].DefaultView;
            comboBoxName.DisplayMemberPath = ds.Tables[0].Columns["ScrumTeam"].ToString();
            comboBoxName.SelectedValuePath = ds.Tables[0].Columns["ScrumTeamId"].ToString();
        }
        private void ForecastSheetBrowseButton_Click(object sender, RoutedEventArgs e)
        {
            // Create OpenFileDialogForecastSheet
            Microsoft.Win32.OpenFileDialog openFileDlg = new Microsoft.Win32.OpenFileDialog();

            // Launch OpenFileDialog by calling ShowDialog method
            Nullable<bool> result = openFileDlg.ShowDialog();
            // Get the selected file name and display in a TextBox.
            // Load content of file in a TextBlock
            if (result == true)
            {
                ForecastSheetTextBox.Text = openFileDlg.FileName;
            }
        }

        private void ActualsSheetBrowseButton_Click(object sender, RoutedEventArgs e)
        {
            // Create OpenFileDialogForecastSheet
            Microsoft.Win32.OpenFileDialog openFileDlg = new Microsoft.Win32.OpenFileDialog();

            // Launch OpenFileDialog by calling ShowDialog method
            Nullable<bool> result = openFileDlg.ShowDialog();
            // Get the selected file name and display in a TextBox.
            // Load content of file in a TextBlock
            if (result == true)
            {
                ActualsSheetTextBox.Text = openFileDlg.FileName;
            }
        }
        string AfilePath;
        string FfilePath;
        string ActualSheetName;
        string month;
        string ScrumTeam;
        private void RunButton_Click(object sender, RoutedEventArgs e)
        {
            AfilePath = this.ActualsSheetTextBox.Text.Trim();
            FfilePath = this.ForecastSheetTextBox.Text.Trim();
            ScrumTeam = cmbScrumTeam.Text;
  
            int lstIndexOfSelectedPath = AfilePath.LastIndexOf("\\");
            ActualSheetName = AfilePath.Substring(lstIndexOfSelectedPath + 1);
            month = ActualSheetName.Substring(0, 3).ToUpper().ToString();

            if (month == "JAN" || month == "FEB" || month == "MAR" || month == "APR" || month == "MAY" || month == "JUN" || month == "JUL" || month == "AUG" || month == "SEP" || month == "OCT" || month == "NOV" || month == "DEC")
            {
                ListViewConsole.Items.Clear();
                BackgroundWorker worker = new BackgroundWorker();
                worker.RunWorkerCompleted += worker_RunWorkerCompleted;
                worker.WorkerReportsProgress = true;
                worker.DoWork += worker_DoWork;
                worker.ProgressChanged += worker_ProgressChanged;
                worker.RunWorkerAsync();
            }
            else
            {
                ListViewConsole.Items.Add("Please select correct actuals file. First three characters of the file name must be first three characters of the month");
                MessageBox.Show("Process Termiated");
            }
            //worker.CancelAsync();
        }

        void worker_DoWork(object sender, DoWorkEventArgs e)
        {
            
            ActualForecast md = new ActualForecast();
            
            for (int i = 0; i < 100; i++)
            {
                if(i == 0)
                {
                    var result3 = md.DataAddForcast(FfilePath);
                }
                if(i == 1)
                {
                    var result2 = md.DataAddActual(AfilePath);
                }
                if (i == 90)
                {
                    var result4 = md.DataFetchDb(AfilePath, month,ScrumTeam);
                }
                (sender as BackgroundWorker).ReportProgress(i);
                Thread.Sleep(100);
                
            }
        }

        void worker_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            pbStatus.Value = e.ProgressPercentage;
            if(e.ProgressPercentage == 0)
            {
                ListViewConsole.Items.Add("Forecast data read to store.");
            }
            if(e.ProgressPercentage == 25)
            {
                ListViewConsole.Items.Add("");
                ListViewConsole.Items.Add("Actual data read to store.");
              
            }
            if (e.ProgressPercentage == 50)
            {
                ListViewConsole.Items.Add("");
                ListViewConsole.Items.Add("Calculating summary report .......");
            }
            if (e.ProgressPercentage == 100)
            {
                ListViewConsole.Items.Add("");
                ListViewConsole.Items.Add("Summary report generated successfully.");
            }
        }

        void worker_RunWorkerCompleted(object sender,RunWorkerCompletedEventArgs e)
        {
            ListViewConsole.Items.Add("");
            ListViewConsole.Items.Add("Summary report generated successfully.");
            MessageBox.Show("Summary report generated successfully!");
           
        }
    }
}
