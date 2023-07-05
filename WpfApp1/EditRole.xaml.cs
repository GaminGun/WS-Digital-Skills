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
    /// Логика взаимодействия для EditRole.xaml
    /// </summary>
    public partial class EditRole : Page
    {
        public Users _currentUser = new Users();
        public EditRole(Users selectedUser)
        {
            if (selectedUser != null)
            {
                _currentUser = selectedUser;
            }
            InitializeComponent();
            Session1_22Entities.GetContext().Users.ToList();
            DataContext = _currentUser;
            OfficeSelect.ItemsSource = Session1_22Entities.GetContext().Offices.ToList();
            if (_currentUser.RoleID == 1)
            {
                AdminRole.IsChecked = true;
            } else
            {
                UserRole.IsChecked = true;
            }
        }
        private void ApplyBtn_Click(object sender, RoutedEventArgs e)
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
            if (_currentUser.Offices.Title == null)
            {
                errors.AppendLine("Выберите офис.");
            }
            if (AdminRole.IsChecked == true)
                _currentUser.RoleID = 1;
            else
                _currentUser.RoleID = 2;

            if (errors.Length > 0)
            { MessageBox.Show(errors.ToString()); return; }

            if (_currentUser.ID == 0)
            {
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
            if ((inp < 'a' || inp > 'z') && (inp < 'A' || inp > 'Z') && (inp < '0' || inp > '9') && (inp < '.' || inp > '@'))
                e.Handled = true;
        }

        private void OfficeSelect_SelectionChanged()
        {

        }
    }
}
