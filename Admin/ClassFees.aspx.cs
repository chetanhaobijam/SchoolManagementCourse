using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
            DataTable dt = fn.Fetch(@"Select Row_NUMBER() over (Order by (Select 1)) as [Sl.No.], f.FeesId, f.ClassId,  c.ClassName, f.FeesAmount from Fees f inner join Class c on c.ClassId = f.FeesId");
            GridView_Fees.DataSource = dt;
            GridView_Fees.DataBind();
        }

        protected void GridView_Fees_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView_Fees.PageIndex = e.NewPageIndex;
            GetFees();
        }

        protected void GridView_Fees_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView_Fees.EditIndex = -1;
            GetFees();
        }

        protected void GridView_Fees_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int feesId = Convert.ToInt32(GridView_Fees.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete from Fees where FeesId = '" + feesId + "'");
                Lbl_Alert.Text = "Fees Updated Successfully";
                Lbl_Alert.CssClass = "alert alert-warning";
                GetFees();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')<script>");
            }
        }

        protected void GridView_Fees_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView_Fees.EditIndex = e.NewEditIndex;
            GetFees();
        }

        protected void GridView_Fees_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView_Fees.Rows[e.RowIndex];
                int feesId = Convert.ToInt32(GridView_Fees.DataKeys[e.RowIndex].Values[0]);
                string feesAmt = (row.FindControl("Txt_FeesEdit") as TextBox).Text;
                fn.Query("Update Fees set FeesAmount = '"+feesAmt.Trim()+"' where FeesId = '"+feesId+"' ");
                Lbl_Alert.Text = "Fees Updated Successfully";
                Lbl_Alert.CssClass = "alert alert-success";
                GridView_Fees.EditIndex = -1;
                GetFees();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')<script>");
            }
        }
    }
}