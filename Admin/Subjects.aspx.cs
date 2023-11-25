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
    public partial class Subjects : System.Web.UI.Page
    {
        CommonFnx fn = new CommonFnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
                GetSubject();
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

        protected void Btn_AddSubject_Click(object sender, EventArgs e)
        {
            try
            {
                string classVal = DdlClass.SelectedItem.Text;
                DataTable dt = fn.Fetch("Select * from Subject where ClassId = '" + DdlClass.SelectedItem.Value +"' and SubjectName = '"+Txt_Subject.Text.Trim()+"'");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert Into Subject values('" + DdlClass.SelectedItem.Value + "', '" + Txt_Subject.Text.Trim() + "')";
                    fn.Query(query);
                    Lbl_Alert.Text = "Inserted Successfully";
                    Lbl_Alert.CssClass = "alert alert-success";
                    DdlClass.SelectedIndex = 0;
                    Txt_Subject.Text = string.Empty;
                    GetSubject();
                }
                else
                {
                    Lbl_Alert.Text = "Subject of " + classVal + " already exists!";
                    Lbl_Alert.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')<script>");
            }
        }

        private void GetSubject()
        {
            DataTable dt = fn.Fetch(@"Select Row_NUMBER() over (Order by (Select 1)) as [Sl.No.], s.SubjectId, s.ClassId,  c.ClassName, s.SubjectName from Subject s inner join Class c on c.ClassId = s.ClassId");
            GridView_Subject.DataSource = dt;
            GridView_Subject.DataBind();
        }

        protected void GridView_Subject_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView_Subject.PageIndex = e.NewPageIndex;
            GetSubject();
        }

        protected void GridView_Subject_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView_Subject.EditIndex = -1;
            GetSubject();
        }

        protected void GridView_Subject_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView_Subject.EditIndex = e.NewEditIndex;
            GetSubject();
        }

        protected void GridView_Subject_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView_Subject.Rows[e.RowIndex];
                int subjectId = Convert.ToInt32(GridView_Subject.DataKeys[e.RowIndex].Values[0]);
                string classId = ((DropDownList)GridView_Subject.Rows[e.RowIndex].Cells[2].FindControl("DDL_ClassEdit")).SelectedValue;
                string subjectName = (row.FindControl("Txt_SubjectEdit") as TextBox).Text;
                fn.Query("Update Subject set ClassId = '"+classId+"', SubjectName = '" + subjectName + "' where SubjectId = '" + subjectId + "'");
                Lbl_Alert.Text = "Subject Updated Successfully";
                Lbl_Alert.CssClass = "alert alert-success";
                GridView_Subject.EditIndex = -1;
                GetSubject();

            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert('" + ex.Message + "')<script>");
                throw ex;
            }
        }
    }
}