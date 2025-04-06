using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoApp.Entities
{
    public class Borrowing
    {
        public int Id { get; set; }
       /* public string RoomerFirstname { get; set; }
        public string RoomerLastname { get; set; }
        public string RoomerMiddlename { get; set; }
*/
        public string Category { get; set; }
      /*  public int Room { get; set; }*/

        public DateOnly EntryDate { get; set; }
        public DateOnly? DepartureDate { get; set; }
    }

}
