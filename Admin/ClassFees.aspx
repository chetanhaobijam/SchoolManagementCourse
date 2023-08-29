<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ClassFees.aspx.cs" Inherits="SchoolManagementProject.Admin.ClassFees" MaintainScrollPositionOnPostback="True" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="container p-5">
        <h3 class="text-center oswald-header text-uppercase fs-2 text-primary-blue">New Class Fees</h3>
        <div class="fees-form mt-5 row">
            <div class="col-md-6">
                <asp:Label ID="Lbl_DdlClass" class="d-block mb-3 fs-5" runat="server" Text="Class"></asp:Label>
                <asp:DropDownList ID="DdlClass" Cssclass="form-control" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="DdlClass_Validator" runat="server" ErrorMessage="Please choose a class" Display="Dynamic" ControlToValidate="DdlClass" SetFocusOnError="True" InitialValue="Select Class"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-6">
                <asp:Label ID="Lbl_Fees" class="d-block mb-3 fs-5" runat="server" Text="Fees (Annual)"></asp:Label>
                <asp:TextBox ID="Txt_FeeAmounts" CssClass="form-control mb-3" runat="server" placeholder="Enter Fees Amount" TextMode="Number" required></asp:TextBox>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:Button ID="Btn_AddFees" CssClass="btn btn-primary" OnClick="Btn_AddFees_Click" runat="server" Text="Add Fees" />
                </div>
            </div>
        </div>
        <div class="label mt-4">
            <asp:Label ID="Lbl_Alert" runat="server"></asp:Label>
        </div>
        <asp:GridView ID="GridView_Fees" runat="server"></asp:GridView>
    </section>
</asp:Content>
