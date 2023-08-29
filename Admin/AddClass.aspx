<%@ Page Title="" Language="C#"  MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddClass.aspx.cs" Inherits="SchoolManagementProject.Admin.AddClass" MaintainScrollPositionOnPostback="True"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <section class="container p-5">
        <h3 class="text-center oswald-header text-uppercase fs-2 text-primary-blue">New Class</h3>
        <div class="class-form mt-5">
            
            <asp:Label ID="Lbl_ClassName" class="d-block mb-3 fs-5" runat="server" Text="Class Name"></asp:Label>
            <asp:TextBox ID="Txt_ClassName" CssClass="form-control mb-3" runat="server" placeholder="Enter Class Name" required></asp:TextBox>
            <asp:Button ID="Btn_AddClass" CssClass="btn btn-primary" OnClick="Btn_AddClass_Click" runat="server" Text="Add Class" />
        </div>
        <div class="label mt-4">
            <asp:Label ID="Lbl_Alert" runat="server"></asp:Label>
        </div>
        <asp:GridView ID="GridView_Class" Cssclass="table table-hover table-bordered mt-4" runat="server" AutoGenerateColumns="False" EmptyDataText="No Record Found" DataKeyNames="ClassId" OnPageIndexChanging="GridView_Class_PageIndexChanging" OnRowCancelingEdit="GridView_Class_RowCancelingEdit" OnRowEditing="GridView_Class_RowEditing" OnRowUpdating="GridView_Class_RowUpdating" AllowPaging="True" PageSize="5">
            <Columns>
                <asp:BoundField DataField="Sl.No." HeaderText="Sl. No." ReadOnly="True">
                <HeaderStyle CssClass="text-center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Class">
                    <HeaderStyle CssClass="text-center" />
                    <ItemStyle HorizontalAlign="Center" />
                    <EditItemTemplate>
                        <asp:TextBox ID="Txt_ClassEdit" CssClass="form-control" Text='<%#Eval("ClassName")%>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Lbl_Class" runat="server" Text='<%#Eval("ClassName")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField CausesValidation="False" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-primary me-2" ItemStyle-HorizontalAlign="Center" >
<ControlStyle CssClass="btn btn-primary me-2"></ControlStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:CommandField>
            </Columns>
            <HeaderStyle CssClass="table-primary"/>
            <PagerStyle HorizontalAlign="Center" />
        </asp:GridView>
    </section>
</asp:Content>
