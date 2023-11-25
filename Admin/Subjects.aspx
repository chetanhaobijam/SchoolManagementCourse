<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Subjects.aspx.cs" Inherits="SchoolManagementProject.Admin.Subjects" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <section class="container p-5">
        <h3 class="text-center oswald-header text-uppercase fs-2 text-primary-blue">New Subjects</h3>
        <div class="subject-form mt-5 row">
            <div class="col-md-6 mb-3 mb-md-0">
                <asp:Label ID="Lbl_DdlClass" class="d-block mb-3 fs-5" runat="server" Text="Class"></asp:Label>
                <asp:DropDownList ID="DdlClass" CssClass="form-select" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="DdlClass_Validator" runat="server" ErrorMessage="Please choose a class" Display="Dynamic" ControlToValidate="DdlClass" SetFocusOnError="True" InitialValue="Select Class" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-6 mb-3 mb-md-0">
                <asp:Label ID="Lbl_Subject" class="d-block mb-3 fs-5" runat="server" Text="Subject"></asp:Label>
                <asp:TextBox ID="Txt_Subject" CssClass="form-control mb-3" runat="server" placeholder="Enter Subject" required></asp:TextBox>
            </div>
            <div class="row">
                <div class="col">
                    <asp:Button ID="Btn_AddSubject" CssClass="btn btn-primary px-4 py-2 mt-md-2" OnClick="Btn_AddSubject_Click" runat="server" Text="Add Subject" />
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="label mt-4">
                        <asp:Label ID="Lbl_Alert" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-lg-8">
                    <asp:GridView ID="GridView_Subject" CssClass="table table-hover table-bordered" EmptyDataText="No Record Present" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="5" OnPageIndexChanging="GridView_Subject_PageIndexChanging" OnRowCancelingEdit="GridView_Subject_RowCancelingEdit" OnRowEditing="GridView_Subject_RowEditing" OnRowUpdating="GridView_Subject_RowUpdating" DataKeyNames="SubjectId">
                        <Columns>
                            <asp:BoundField DataField="Sl.No." HeaderText="Sl.No." ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Class">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DDL_ClassEdit" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName" DataValueField="ClassId" SelectedValue='<%# Eval("ClassId") %>' CssClass="form-select"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolCS %>" SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Lbl_Class_GV" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subject">
                                <EditItemTemplate>
                                    <asp:TextBox ID="Txt_SubjectEdit" CssClass="form-control" Text='<%#Eval("SubjectName")%>' runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Lbl_Subject_GV" runat="server" Text='<%#Eval("SubjectName")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:TemplateField>
                            <asp:CommandField CausesValidation="False" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-outline-primary me-1">
<ControlStyle CssClass="btn btn-outline-primary me-1"></ControlStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:CommandField>
                        </Columns>
                        <HeaderStyle CssClass="table-primary text-center" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
