using DemoApp.Entities;
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

namespace DemoApp
{
    /// <summary>
    /// Логика взаимодействия для AddBorrowing.xaml
    /// </summary>
    public partial class AddBorrowing : Window
    {
        DataBase db;

       
        public AddBorrowing()
        {
            InitializeComponent();
            db = new DataBase();
            LoadComboBox();
        }

        private void LoadComboBox()
        {
            var roomslst = db.GetRooms();
            roomCB.ItemsSource = roomslst;
            roomCB.DisplayMemberPath = "Id";
            roomCB.SelectedValuePath = "Id";
        }

        private void borrowBtn_Click(object sender, RoutedEventArgs e)
        {
            string firstname = fNameTB.Text.Trim();
            string lastname = lNameTB.Text.Trim();
            string middlename = mNameTB.Text.Trim();
            var selectedDate = DateOnly.FromDateTime(entryDP.SelectedDate.Value);
            Rooms selectedRoom = (Rooms)roomCB.SelectedItem;

            int roomId = selectedRoom.Id;

            if (string.IsNullOrEmpty(firstname) || string.IsNullOrEmpty(lastname)
                || string.IsNullOrEmpty(middlename) || !entryDP.SelectedDate.HasValue
                || roomCB.SelectedItem == null)
            {
                MessageBox.Show("Пожалуйста, заполните все поля.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            

            db.AddBorrow(roomId, selectedDate, firstname, lastname, middlename);

           

            DialogResult = true;
            Close();

        }
    }
}
