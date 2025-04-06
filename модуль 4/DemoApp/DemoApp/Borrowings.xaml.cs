using DemoApp.Entities;
using System.Collections.ObjectModel;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DemoApp;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class Borrowings : Window
{
    DataBase db;
    private ObservableCollection<Borrowing> borrowingsColl { get; set; }
    public Borrowings()
    {
        InitializeComponent();
        db = new DataBase();
        borrowingsColl = new ObservableCollection<Borrowing>();
        LoadData();
    }

    private void LoadData()
    {
        var borrowingList = db.GetBorrowings();
        foreach(var borrow in borrowingList)
        {

            borrowingsColl.Add(borrow);
        }

        borrowLB.ItemsSource = borrowingsColl;
    }

    private void showAllBtn_Click(object sender, RoutedEventArgs e)
    {
        borrowingsColl.Clear();
        LoadData();
    }

    private void filterBtn_Click(object sender, RoutedEventArgs e)
    {
        if(startDate.SelectedDate.HasValue && endPeriod.SelectedDate.HasValue)
        {
            DateOnly selectedStart_date = DateOnly.FromDateTime(startDate.SelectedDate.Value);
            DateOnly selectedEnd_date = DateOnly.FromDateTime(endPeriod.SelectedDate.Value);

            borrowingsColl.Clear();

            var borrowlst = db.FiltredBorrowings(selectedStart_date, selectedEnd_date);
            foreach (var borrow in borrowlst)
            {

                borrowingsColl.Add(borrow);
            }

            borrowLB.ItemsSource = borrowingsColl;
        }
    }

    private void createBtn_Click(object sender, RoutedEventArgs e)
    {
        AddBorrowing addBorrowing = new AddBorrowing();
        if(addBorrowing.ShowDialog() == true)
        {
            borrowingsColl.Clear();
            LoadData();
        }
    }

    private void delBtn_Click(object sender, RoutedEventArgs e)
    {
        Borrowing selectedBorrow = borrowLB.SelectedItem as Borrowing;

        if (selectedBorrow == null)
        {
            MessageBox.Show("Пожалуйста, выберите запись для удаления.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            return;
        }

        if (MessageBox.Show($"Вы действительно хотите удалить запись № {selectedBorrow.Id}?", "Подтверждение удаления", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
        {
            db.DelBorrow(selectedBorrow.Id);
            borrowingsColl.Remove(selectedBorrow);
        }

    }
}