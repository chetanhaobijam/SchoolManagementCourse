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
    public partial class ClassFees : System.Web.UI.Page
    {
        CommonFnx fn = new CommonFnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetClass();
                GetFees();
            }
        }

        private void GetClass()
        {
            DataTable dt = fn.Fetch("Select * from Class");
            DdlClass.DataSource = dt;
            DdlClass.DataTextField = "ClassName";
            DdlClass.DataValueField = "ClassId";
            DdlClass.DataBind();
            DdlClass.Items.Insert(0, "Select Class");
        }

        protected void Btn_AddFees_Click(object sender, EventArgs e)
        {
            try
            {
                string classVal = DdlClass.SelectedItem.Text;
                DataTable dt = fn.Fetch("Select * from Fees where ClassId = '" + DdlClass.SelectedItem.Value + "'");
                if(dt.Rows.Count == 0)
                {
                    string query = "Insert Into Fees values('"+DdlClass.SelectedItem.Value+"','"+ Txt_FeeAmounts.Text.Trim()+"')";
                    fn.Query(query);
                    Lbl_Alert.Text = "Inserted Successfully";
                    Lbl_Alert.CssClass = "alert alert-success";
                    Txt_FeeAmounts.Text = string.Empty;
                    GetFees();
                } else
                {
                    Lbl_Alert.Text = "Fees of " + classVal + " already exists!";
                    Lbl_Alert.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')<script>");
            }
        }

        private void GetFees()
        {
            DataTable dt = fn.Fetch("Select * from Fees");
            GridView_Fees.DataSource = dt;
            GridView_Fees.DataBind();
        }
    }
}