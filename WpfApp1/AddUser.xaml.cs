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
using System.Text.RegularExpressions;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для AddUser.xaml
    /// </summary>
    public partial class AddUser : Page
    {
        private Users _currentUser = new Users();
        public AddUser()
        {
            InitializeComponent();
            DataContext = _currentUser;
            OfficeSelect.ItemsSource = Session1_22Entities.GetContext().Offices.ToList();
        }
        private void SaveUser_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentUser.Email))
            {
                errors.AppendLine("Строка Email-адреса не может быть пустым.");
            }
            else
            {
                if (Regex.IsMatch(_currentUser.Email, @"[a-zA-Z0-9]@amonic.com"))
                { }
                else { errors.AppendLine("Email-адрес должен содержать символ @ и amonic.com."); }
            }
            if (string.IsNullOrWhiteSpace(_currentUser.FirstName))
            {
                errors.AppendLine("Имя пользователя не может быть пустым.");
            }
            if (string.IsNullOrWhiteSpace(_currentUser.LastName))
            {
                errors.AppendLine("Фамилия пользователя не может быть пустым.");
            }
            if (DateSelect.SelectedDate == null)
            {
                errors.AppendLine("Необходимо выбрать дату рождения.");
            }
            if (OfficeSelect.SelectedItem == null)
            {
                errors.AppendLine("Выберите офис.");
            }
            if (string.IsNullOrWhiteSpace(_currentUser.Password))
            {
                errors.AppendLine("Пароль не может быть пустым.");
            }
            if (errors.Length > 0)
            { MessageBox.Show(errors.ToString()); return; }

            if (_currentUser.ID == 0)
            {
                _currentUser.RoleID = 2;
                _currentUser.Active = true;
                _currentUser.Birthdate = DateSelect.SelectedDate;
                Session1_22Entities.GetContext().Users.Add(_currentUser);
            }

            try
            {
                Session1_22Entities.GetContext().SaveChanges();
                MessageBox.Show("Данные сохранены.");
                LoadPage.Loading.Navigate(new Admin());
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void CancelBtn_Click(object sender, RoutedEventArgs e)
        {
            LoadPage.Loading.Navigate(new Admin());
        }

        private void Check_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            char inp = e.Text[0];
            if ((inp < 'a' || inp > 'z') && (inp < 'A' || inp > 'Z'))
                e.Handled = true;
        }

        private void PassEmail_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            char inp = e.Text[0];
            if ((inp < 'a' || inp > 'z') && (inp < 'A' || inp > 'Z') && (inp < '0' || inp > '9') && (inp < '!' || inp > '@'))
                e.Handled = true;
        }
    }
}
