using System.Data.SqlClient;

namespace Competetion.Data
{
    public class DBHelper
    {
        public static SqlConnection GetConnection()
        {
            SqlConnection con = new SqlConnection(@"Data Source =.; Initial Catalog = competetion; Integrated Security = True");
         return con;
        }
    }
}
