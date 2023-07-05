using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для Tracking.xaml
    /// </summary>
    public partial class Tracking : Window
    {
        public ActivityUsers tracker = new ActivityUsers();
        public Tracking(ActivityUsers infoActive)
        {
            if (infoActive != null)
            {
                tracker = infoActive;
            }
            InitializeComponent();
            TextError.Text = $"No logout detected for you last login on {tracker.Date} at {tracker.LoginTime}";
        }
        private void Confirm_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder error = new StringBuilder();
            string value = "00:00:00";
            tracker.LogoutTime = TimeSpan.Parse(value);
            tracker.TimeSpent = TimeSpan.Parse(value);
            tracker.TypeError = ErrorText.Text;
            if (string.IsNullOrWhiteSpace(ErrorText.Text))
            {
                error.AppendLine("Reason cannot be empty.");
                MessageBox.Show("Reason cannot be empty.");
            }

            if (error.Length > 0)
            {
                return;
            }
            try
            {
                Session1_22Entities.GetContext().ActivityUsers.Add(tracker);
                Session1_22Entities.GetContext().SaveChanges();
                MessageBox.Show("Done!");
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}
