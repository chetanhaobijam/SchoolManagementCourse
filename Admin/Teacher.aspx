<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="SchoolManagementProject.Admin.Teacher" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="container p-5">
        <h3 class="text-center oswald-header text-uppercase fs-2 text-primary-blue">New Teachers</h3>
        <div class="teacher-form mt-5 row">
            <div class="row">
                <div class="col-md-6 mb-3 mb-md-0">
                    <!-- Name -->
                    <asp:Label ID="Lbl_Name" class="d-block mb-3 fs-5" runat="server" Text="Name"></asp:Label>
                    <asp:TextBox ID="Txt_Name" CssClass="form-control mb-3" runat="server" placeholder="Enter Name" required></asp:TextBox>
                    <asp:RegularExpressionValidator ID="NameRegexValidator" runat="server" ErrorMessage="Name should be in characters" ControlToValidate="Txt_Name" ValidationExpression="^[A-Za-z\s]*$" Display="Dynamic" SetFocusOnError="true" CssClass="text-danger"></asp:RegularExpressionValidator>
                </div>
                <div class="col-md-6 mb-3 mb-md-0">
                    <!-- Date of Birth -->
                    <asp:Label ID="Lbl_DoB" class="d-block mb-3 fs-5" runat="server" Text="Date of Birth"></asp:Label>
                    <asp:TextBox ID="Txt_DoB" CssClass="form-control mb-3" runat="server" placeholder="Enter Date of Birth" TextMode="Date" required></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3 mb-md-0">
                    <!-- Gender -->
                    <asp:Label ID="Lbl_Gender" class="d-block mb-3 fs-5" runat="server" Text="Gender"></asp:Label>
                    <asp:DropDownList ID="Ddl_Gender" CssClass="form-select" runat="server">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                        <asp:ListItem Value="1">Male</asp:ListItem>
                        <asp:ListItem Value="2">Female</asp:ListItem>
                        <asp:ListItem Value="3">Others</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="GenderRqValidator" runat="server" ErrorMessage="Please choose a gender" InitialValue="Select" SetFocusOnError="true" CssClass="text-danger" ControlToValidate="Ddl_Gender" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6 mb-3 mb-md-0">
                    <!-- Mobile -->
                    <asp:Label ID="Lbl_Mobile" class="d-block mb-3 fs-5" runat="server" Text="Mobile"></asp:Label>
                    <asp:TextBox ID="Txt_Mobile" CssClass="form-control mb-3" runat="server" placeholder="10 Digit Mobile No." TextMode="Number" required></asp:TextBox>
                    <asp:RegularExpressionValidator ID="MobileRgexValidator" runat="server" ErrorMessage="Invalid Mobile No." ControlToValidate="Txt_Mobile" ValidationExpression="[0-9]{10}" Display="Dynamic" SetFocusOnError="true" CssClass="text-danger"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3 mb-md-0">
                    <!-- Email -->
                    <asp:Label ID="Lbl_Email" class="d-block mb-3 fs-5" runat="server" Text="Email"></asp:Label>
                    <asp:TextBox ID="Txt_Email" CssClass="form-control mb-3" runat="server" placeholder="Enter Email" required></asp:TextBox>
                    <asp:RegularExpressionValidator ID="EmailRgexValidator" runat="server" ErrorMessage="Invalid Email" ControlToValidate="Txt_Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" SetFocusOnError="true" CssClass="text-danger"></asp:RegularExpressionValidator>
                </div>
                <div class="col-md-6 mb-3 mb-md-0">
                    <!-- Password -->
                    <asp:Label ID="Lbl_Password" class="d-block mb-3 fs-5" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox ID="Txt_Password" CssClass="form-control mb-3" runat="server" placeholder="Enter Password" TextMode="Password" required></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-12 mb-3 mb-md-0">
                    <!-- Address -->
                    <asp:Label ID="Lbl_Address" class="d-block mb-3 fs-5" runat="server" Text="Address"></asp:Label>
                    <asp:TextBox ID="Txt_Address" CssClass="form-control mb-3" runat="server" placeholder="Enter Address" TextMode="Multiline" required></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <asp:Button ID="Btn_AddTeacher" CssClass="btn btn-primary px-4 py-2 mt-md-2" OnClick="Btn_AddTeacher_Click" runat="server" Text="Add Teacher" />
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
                <div class="col-12 table-responsive">
                    <asp:GridView ID="GridView_Teacher" CssClass="table table-hover table-bordered" EmptyDataText="No Record Present" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="5" DataKeyNames="TeacherId" OnRowDeleting="GridView_Teacher_RowDeleting" OnRowUpdating="GridView_Teacher_RowUpdating" OnPageIndexChanging="GridView_Teacher_PageIndexChanging" OnRowCancelingEdit="GridView_Teacher_RowCancelingEdit" OnRowEditing="GridView_Teacher_RowEditing">
                        <Columns>
                            <asp:BoundField DataField="Sl. No." HeaderText="Sl.No." ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="Txt_Name" runat="server" CssClass="form-control" Text='<%# Eval("Name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Lbl_Name" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Mobile">
                                <EditItemTemplate>
                                    <asp:TextBox ID="Txt_Mobile" CssClass="form-control" Text='<%#Eval("Mobile")%>' runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Lbl_Mobile" runat="server" Text='<%#Eval("Mobile")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Subject">
                                <ItemTemplate>
                                    <asp:Label ID="Lbl_Email" runat="server" Text='<%#Eval("Email")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Mobile">
                                <EditItemTemplate>
                                    <asp:TextBox ID="Txt_Password" CssClass="form-control" Text='<%#Eval("Password")%>' runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Lbl_Password" runat="server" Text='<%#Eval("Password")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Address">
                                <EditItemTemplate>
                                    <asp:TextBox ID="Txt_Address" CssClass="form-control" Text='<%#Eval("Address")%>' runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Lbl_Address" runat="server" Text='<%#Eval("Address")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:TemplateField>

                            <asp:CommandField CausesValidation="False" ShowEditButton="True" ShowDeleteButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-outline-primary me-1">
                                <ControlStyle CssClass="btn btn-outline-primary me-1"></ControlStyle>
                                <ItemStyle HorizontalAlign="Center" CssClass="d-flex flex-row"></ItemStyle>
                            </asp:CommandField>
                        </Columns>
                        <HeaderStyle CssClass="table-primary text-center" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
