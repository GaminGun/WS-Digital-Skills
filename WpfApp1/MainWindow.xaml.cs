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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        private void LoginBtn_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (Application.Current.Windows.Count > 2)
            {
                MessageBox.Show("Завершите сессию.");
            }
            else
            {
                using (var db = new Session1_22Entities())
                {
                    var user = db.Users.AsNoTracking().FirstOrDefault(u => u.Email == LoginInput.Text && u.Password == PasswordInput.Password);
                    var login = db.Users.AsNoTracking().FirstOrDefault(u => u.Email == LoginInput.Text);
                    if (login == null)
                    {
                        ErrorAutho.Text = "Пользователь не найден.";
                        errors.AppendLine("Пользователь не найден.");
                    }
                    else if (user == null)
                    {
                        ErrorAutho.Text = "Неверный пароль.";
                        errors.AppendLine("Неверный пароль.");
                    }
                    else if (user.Active == false)
                    {
                        ErrorAutho.Text = "Вы заблокированы.";
                        errors.AppendLine("Вы заблокированы.");
                    }
                    if (errors.Length == 0)
                    {
                        if (user.RoleID == 1)
                        {
                            AccessWin adminWin = new AccessWin();
                            adminWin.Show();
                        }
                        else if (user.RoleID == 2)
                        {
                            UserWin userWin = new UserWin(user);
                            userWin.Show();
                        }
                    }
                }
            }
        }

        private void ExitBtn_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
        private void PassEmail_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            char inp = e.Text[0];
            if ((inp < 'a' || inp > 'z') && (inp < 'A' || inp > 'Z') && (inp < '0' || inp > '9') && (inp < '!' || inp > '@'))
                e.Handled = true;
        }
    }
}
