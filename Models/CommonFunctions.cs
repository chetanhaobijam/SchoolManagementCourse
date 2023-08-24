using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace SchoolManagementProject.Models
{
    public class CommonFunctions
    {

        public class CommonFnx
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolCS"].ConnectionString);
            public void Query(string query)
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }

            public DataTable Fetch(string query)
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                return dt;

            }
        }
    }
}