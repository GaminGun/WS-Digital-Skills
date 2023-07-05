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
using System.Windows.Threading;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для UserWin.xaml
    /// </summary>
    public partial class UserWin : Window
    {
        public Users trackUser;
        public ActivityUsers tracker = new ActivityUsers();
        public UserWin(Users info)
        {
            InitializeComponent();
            Welcome.Text = $"Hi {info.FirstName}, Welcome to AMONIC Airlines.";
            trackUser = info;
            using (var db = new Session1_22Entities())
            {
                var error = db.ActivityUsers.AsNoTracking().FirstOrDefault(p => info.ID == p.IDUser && p.LogoutTime == null);
                if (error != null)
                {
                    db.Entry(error).State = System.Data.Entity.EntityState.Deleted;
                    db.SaveChanges();
                    Tracking track = new Tracking(infoActive: error);
                    track.ShowDialog();
                }
                var user = db.ActivityUsers.AsNoTracking().FirstOrDefault(p => info.ID == p.IDUser);
                var timeNoNull = db.ActivityUsers.AsNoTracking().FirstOrDefault(p => info.ID == p.IDUser && p.AllTimeSpent != TimeSpan.Zero);
                if (user == null || user.AllTimeSpent == TimeSpan.Zero && timeNoNull == null)
                {
                    tracker.AllTimeSpent = TimeSpan.Zero;
                }
                else
                {
                    UserInfo.ItemsSource = Session1_22Entities.GetContext().ActivityUsers.ToList().FindAll(p => info.ID == p.IDUser);
                    tracker.AllTimeSpent = timeNoNull.AllTimeSpent;
                }
            }
            CrashNumber();
            tracker.IDUser = trackUser.ID;
            tracker.Date = DateTime.Now;
            TimerStart();
            tracker.LoginTime = TimeSpan.Parse(DateTime.Now.ToLongTimeString());
            Session1_22Entities.GetContext().ActivityUsers.Add(tracker);
            try
            {
                Session1_22Entities.GetContext().SaveChanges();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
        private void ExitBtn_Click(object sender, RoutedEventArgs e)
        {
            tracker.LogoutTime = TimeSpan.Parse(DateTime.Now.ToLongTimeString());
            tracker.TimeSpent = tracker.LogoutTime - tracker.LoginTime;
            try
            {
                tracker.AllTimeSpent += tracker.TimeSpent;
                Session1_22Entities.GetContext().SaveChanges();
                this.Close();
            }
            catch (Exception ex)
            {
                tracker.AllTimeSpent += TimeSpan.Zero;
                MessageBox.Show(ex.Message.ToString());
                this.Close();
            }
            this.Close();
        }

        private void Window_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                Session1_22Entities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                UserInfo.ItemsSource = Session1_22Entities.GetContext().ActivityUsers.ToList().FindAll(p => trackUser.ID == p.IDUser);
            }
        }
        DispatcherTimer timer = null;
        int hour = 0, min = 0, sec = 0;
        public void TimerStart()
        {
            timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromSeconds(1);
            timer.Tick += new EventHandler(TimerTick);
            timer.Start();
        }

        void TimerTick(object sender, EventArgs e)
        {
            sec++;
            if (sec == 60)
            {
                sec = 0;
                min++;
            }
            if (min == 60)
            {
                min = 0;
                hour++;
            }
            TimeOutput(hour, min, sec);
        }
        void TimeOutput(int hour, int min, int sec)
        {
            string _hour, _min, _sec;
            if (sec < 10)
                _sec = $"0{sec}";
            else
                _sec = $"{sec}";

            if (min < 10)
                _min = $"0{min}";
            else
                _min = $"{min}";

            if (hour < 10)
                _hour = $"0{hour}";
            else
                _hour = $"{hour}";
            Time.Text = $"{_hour}:{_min}:{_sec}";
        }
        void CrashNumber()
        {
            List<ActivityUsers> users = Session1_22Entities.GetContext().ActivityUsers.ToList().FindAll(p => p.TypeError != null);
            NumberCrashing.Text = users.Count().ToString();
        }
    }
}