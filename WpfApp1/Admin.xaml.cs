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
    /// Логика взаимодействия для Admin.xaml
    /// </summary>
    public partial class Admin : Page
    {
        public Admin()
        {
            InitializeComponent();
            Session1_22Entities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            var allTypes = Session1_22Entities.GetContext().Offices.ToList();
            allTypes.Insert(0, new Offices
            {
                Title = "All types"
            });
            OfficeSelectSearch.ItemsSource = allTypes;
            OfficeSelectSearch.SelectedIndex = 0;
            var currentUsers = Session1_22Entities.GetContext().Users.ToList();
            UserInfo.ItemsSource = currentUsers;
        }
        private void OfficeSelectSearch_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var currentUsers = Session1_22Entities.GetContext().Users.ToList();
            if (OfficeSelectSearch.SelectedIndex > 0)
                currentUsers = currentUsers.Where(p => p.Offices.ID == (OfficeSelectSearch.SelectedItem as Offices).ID).ToList();
            UserInfo.ItemsSource = currentUsers;
        }
        private void ChangeRole_Click(object sender, RoutedEventArgs e)
        {
            if (UserInfo.SelectedItem == null)
            {
                MessageBox.Show("Выберите пользователя для редактирования.");
            } else
            {
                Users userSelected = (UserInfo.SelectedItem) as Users;
                LoadPage.Loading.Navigate(new EditRole(userSelected));
            }
        }

        private void EnDsLogin_Click(object sender, RoutedEventArgs e)
        {
            Users user = (UserInfo.SelectedItem) as Users;
            try
            {
                if (user.Roles.Title == "User")
                {
                    if (user.Active == true)
                    {
                        user.Active = false;
                        MessageBox.Show("Доступ запрещён.");
                    }
                    else if (user.Active == false)
                    {
                        user.Active = true;
                        MessageBox.Show("Доступ разрешён.");
                    }
                    else
                        user.Active = false;
                }
                else MessageBox.Show("Нельзя отключить доступ администратору.");
                Session1_22Entities.GetContext().SaveChanges();
                Session1_22Entities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                var currentUsers = Session1_22Entities.GetContext().Users.ToList();
                UserInfo.ItemsSource = currentUsers;
                if (OfficeSelectSearch.SelectedIndex > 0)
                {
                    Users listUsers = new Users();
                    currentUsers = currentUsers.Where(p => p.Offices.ID == (OfficeSelectSearch.SelectedItem as Offices).ID).ToList();
                }
                UserInfo.ItemsSource = currentUsers;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        private void Window_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                Session1_22Entities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                UserInfo.ItemsSource = Session1_22Entities.GetContext().Users.ToList();
            }
        }
    }
}
