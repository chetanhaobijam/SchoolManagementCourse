using SchoolManagementProject.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagementProject.Models.CommonFunctions;

namespace SchoolManagementProject.Admin
{
    public partial class Teacher : System.Web.UI.Page
    {
        CommonFnx fn = new CommonFnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetTeachers();
            }
        }

        protected void Btn_AddTeacher_Click(object sender, EventArgs e)
        {
            try
            {
                if(Ddl_Gender.SelectedIndex != 0)
                {
                    string email = Txt_Email.Text.Trim();
                    DataTable dt = fn.Fetch("Select * from Teacher where Email = '" + email + "' ");
                    if(dt.Rows.Count == 0)
                    {
                        string query = "Insert into Teacher values ('" + Txt_Name.Text.Trim() + "', '" + Txt_DoB.Text.Trim() + "', '" + Ddl_Gender.SelectedValue + "', '" + Txt_Mobile.Text.Trim() + "', '" + Txt_Email.Text.Trim() + "', '" + Txt_Address.Text.Trim() + "', '" + Txt_Password.Text.Trim() + "') ";
                        fn.Query(query);
                        Lbl_Alert.Text = "Teacher inserted Successfully";
                        Lbl_Alert.CssClass = "alert alert-success";
                        Ddl_Gender.SelectedIndex = 0;
                        Txt_Name.Text = Txt_DoB.Text = Txt_Mobile.Text = Txt_Email.Text = Txt_Address.Text = Txt_Password.Text = "";
                        GetTeachers();
                    }
                    else
                    {
                        Lbl_Alert.Text = "Entered <strong>" + email + "</strong> already exists";
                        Lbl_Alert.CssClass = "alert alert-danger";
                    }
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GetTeachers()
        {
            DataTable dt = fn.Fetch("Select ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS [Sl. No.], TeacherId, [Name], DoB, Gender, Mobile, Email, [Address], [Password] from Teacher");
            GridView_Teacher.DataSource = dt;
            GridView_Teacher.DataBind();
        }
    }

}