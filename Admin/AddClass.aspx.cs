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
    public partial class AddClass : System.Web.UI.Page
    {
        CommonFnx fn = new CommonFnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetClass();
            }
        }

        private void GetClass()
        {
            DataTable dt = fn.Fetch("Select Row_NUMBER() over (Order by (Select 1)) as [Sl.No.], ClassId, ClassName from Class");
            GridView_Class.DataSource = dt;
            GridView_Class.DataBind();
        }

        protected void Btn_AddClass_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = fn.Fetch("Select * from Class where ClassName = '"+Txt_ClassName.Text.Trim()+"'");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Class values('"+Txt_ClassName.Text.Trim()+"')";
                    fn.Query(query);
                    Lbl_Alert.Text = "Inserted Successfully";
                    Lbl_Alert.CssClass = "alert alert-success";
                    Txt_ClassName.Text = string.Empty;
                    GetClass();
                }
                else
                {
                    Lbl_Alert.Text = "Class already exists";
                    Lbl_Alert.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('"+ ex.Message +"')<script>");
            }
        }

        protected void GridView_Class_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView_Class.PageIndex = e.NewPageIndex;
            GetClass();
        }

        protected void GridView_Class_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView_Class.EditIndex = -1;
            GetClass();
        }

        protected void GridView_Class_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView_Class.EditIndex = e.NewEditIndex;
        }

        protected void GridView_Class_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView_Class.Rows[e.RowIndex];
                int cId = Convert.ToInt32(GridView_Class.DataKeys[e.RowIndex].Values[0]);
                string className = (row.FindControl("Txt_ClassEdit") as TextBox).Text;
                fn.Query("Update Class set ClassName = '" + className + "' where ClassId = '" + cId + "'");
                Lbl_Alert.Text = "Class Updated Successfully";
                Lbl_Alert.CssClass = "alert alert-success";
                GridView_Class.EditIndex = -1;
                GetClass();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')<script>");
            }
        }

        protected void GridView_Class_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}