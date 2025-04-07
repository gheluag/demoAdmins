using DemoApp.Entities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoApp
{
    public class DataBase
    {
        // необходимо установить пакет mysql.data

        MySqlConnection connection = new MySqlConnection("server=localhost; user=root;password=1234;port=3306; database=HotelDemo"); // строка подключения к бд

        public List<Borrowing> GetBorrowings() 
        {
            List<Borrowing> borrowlst = new List<Borrowing>(); 

            string query = "select idBorrowing, firstname, lastname, middlename, categoryName, entrydate, departureDate, roomId " +
                "from borrowing " +
                "join roomers on roomerId = idRoomer " +
                "join roomCategory on categoryId = idCategory";

            try
            {
                connection.Open();

                MySqlCommand command = new MySqlCommand(query, connection);

                MySqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Borrowing borrowings = new Borrowing();

                    borrowings.Id = Convert.ToInt32(reader["idBorrowing"]);
                    borrowings.EntryDate = DateOnly.FromDateTime(Convert.ToDateTime(reader["entryDate"]));
                    borrowings.DepartureDate = reader["departureDate"] != DBNull.Value
                ? DateOnly.FromDateTime(Convert.ToDateTime(reader["departureDate"]))
                : (DateOnly?)null;
                    borrowings.Category = reader["categoryName"].ToString();

                    borrowlst.Add(borrowings);
                }

                reader.Close();
            }

            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            finally
            {
                connection.Close();
            }

            return borrowlst;

        }

        public List<Borrowing> FiltredBorrowings(DateOnly startDate, DateOnly endDate)
        {
            List<Borrowing> borrowlst = new List<Borrowing>();

            string query = "select idBorrowing, firstname, lastname, middlename, categoryName, entrydate, departureDate, roomId " +
                "from borrowing " +
                "join roomers on roomerId = idRoomer " +
                "join roomCategory on categoryId = idCategory " +
                "where entryDate between @startDate and @endDate";

            string startDateStr = startDate.ToString("yyyy-MM-dd");
            string endDateStr = endDate.ToString("yyyy-MM-dd");

            try
            {
                connection.Open();

                MySqlCommand command = new MySqlCommand(query, connection);

                command.Parameters.AddWithValue("@startDate", startDateStr);
                command.Parameters.AddWithValue("@endDate", endDateStr);

                MySqlDataReader reader = command.ExecuteReader();

               


                while (reader.Read())
                {
                    Borrowing borrowings = new Borrowing();

                    borrowings.Id = Convert.ToInt32(reader["idBorrowing"]);
                    borrowings.EntryDate = DateOnly.FromDateTime(Convert.ToDateTime(reader["entryDate"]));
                    borrowings.DepartureDate = reader["departureDate"] != DBNull.Value
                        ? DateOnly.FromDateTime(Convert.ToDateTime(reader["departureDate"]))
                        : (DateOnly?)null;
                    borrowings.Category = reader["categoryName"].ToString();

                    borrowlst.Add(borrowings);
                }

                reader.Close();
            }

            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            finally
            {
                connection.Close();
            }

            return borrowlst;

        }


        public void AddBorrow(int roomId, DateOnly entryDate, string firstname, string lastname, string middlename)
        {
            string roomerQuery = "insert into roomers (firstname, lastname, middlename) " +
                "values (@firstname, @lastname, @middlename)";

            string query = "insert into borrowing (roomerId, roomId, entryDate, categoryId) " +
               "values (@roomerId, " +
               "@roomId, @entryDate, (select categoryId from rooms where numRoom = @roomId))";

            string updQuery = "update rooms set statusId = (select idStatus from roomStatus where statusName = 'Занят') " +
                "where numRoom = @roomId";

            try
            {
                connection.Open();

                MySqlCommand commandRoomer = new MySqlCommand(roomerQuery, connection);

                commandRoomer.Parameters.AddWithValue("@firstname", firstname);
                commandRoomer.Parameters.AddWithValue("@lastname", lastname);
                commandRoomer.Parameters.AddWithValue("@middlename", middlename);

                commandRoomer.ExecuteNonQuery();

                long roomerId = commandRoomer.LastInsertedId;

                MySqlCommand command = new MySqlCommand(query, connection);

                command.Parameters.AddWithValue("@roomerId", roomerId);
                command.Parameters.AddWithValue("@roomId", roomId);
                command.Parameters.AddWithValue("@entryDate", entryDate.ToString("yyyy-MM-dd"));

                command.ExecuteNonQuery();

                MySqlCommand updCommand = new MySqlCommand(updQuery, connection);
                updCommand.Parameters.AddWithValue("@roomId", roomId);
                updCommand.ExecuteNonQuery();

            }

            catch(Exception ex)
            {
                Console.WriteLine(ex);
            }
            finally
            {
                connection.Close();
            }
        }

        public List<Rooms> GetRooms()
        {
            List<Rooms> roomList = new List<Rooms>();

            string query = "select * from rooms " +
                "where statusId = (select idStatus from roomStatus where statusName = 'Чистый')";

            try
            {
                connection.Open();

                MySqlCommand command = new MySqlCommand(query, connection);

                MySqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Rooms rooms = new Rooms();
                    rooms.Id = Convert.ToInt32(reader["numRoom"]);
                    roomList.Add(rooms);
                }
                reader.Close();
            }

            catch(Exception ex)
            {
                Console.WriteLine(ex);
            }
            finally
            {
                connection.Close();
            }

            return roomList;
        }

        public void DelBorrow(int idBorrow)
        {
            string query = "delete from borrowing where idBorrowing = @idBorrow";
            string updQuery = "update rooms set statusId = (select idStatus from roomStatus where statusName = 'Грязный')";
            

            try
            {
                connection.Open();

                MySqlCommand command = new MySqlCommand(query, connection);

                command.Parameters.AddWithValue("@idBorrow", idBorrow);

                command.ExecuteNonQuery();

                MySqlCommand updCommand = new MySqlCommand(updQuery, connection);
                updCommand.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            finally
            {
                connection.Close();
            }
        }
    }


    

}
