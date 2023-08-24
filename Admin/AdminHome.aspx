<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="SchoolManagementProject.Admin.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="hero position-relative d-flex flex-column align-items-center justify-content-center text-dark">
        <h2 class="text-uppercase oswald-header">Dummy School of Learning</h2>
        <p class="mt-4">Journey to the Excellence</p>
    </section>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolCS %>" DeleteCommand="DELETE FROM [Class] WHERE [classID] = @classID" InsertCommand="INSERT INTO [Class] ([className]) VALUES (@className)" SelectCommand="SELECT * FROM [Class]" UpdateCommand="UPDATE [Class] SET [className] = @className WHERE [classID] = @classID">
        <DeleteParameters>
            <asp:Parameter Name="classID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="className" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="className" Type="String" />
            <asp:Parameter Name="classID" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
