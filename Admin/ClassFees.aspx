<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ClassFees.aspx.cs" Inherits="SchoolManagementProject.Admin.ClassFees" MaintainScrollPositionOnPostback="True" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="container p-5">
        <h3 class="text-center oswald-header text-uppercase fs-2 text-primary-blue">New Class Fees</h3>
        <div class="fees-form mt-5 row">
            <div class="col-md-6 mb-3 mb-md-0">
                <asp:Label ID="Lbl_DdlClass" class="d-block mb-3 fs-5" runat="server" Text="Class"></asp:Label>
                <asp:DropDownList ID="DdlClass" Cssclass="form-select" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="DdlClass_Validator" runat="server" ErrorMessage="Please choose a class" Display="Dynamic" ControlToValidate="DdlClass" SetFocusOnError="True" InitialValue="Select Class" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-6 mb-3 mb-md-0">
                <asp:Label ID="Lbl_Fees" class="d-block mb-3 fs-5" runat="server" Text="Fees (Annual)"></asp:Label>
                <asp:TextBox ID="Txt_FeeAmounts" CssClass="form-control mb-3" runat="server" placeholder="Enter Fees Amount" TextMode="Number" required></asp:TextBox>
            </div>
            <div class="row">
                <div class="col">
                    <asp:Button ID="Btn_AddFees" CssClass="btn btn-primary px-4 py-2 mt-md-2" OnClick="Btn_AddFees_Click" runat="server" Text="Add Fees" />
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
                    <asp:GridView ID="GridView_Fees" CssClass="table table-hover table-bordered" EmptyDataText="No Record Present" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="5" OnPageIndexChanging="GridView_Fees_PageIndexChanging" OnRowCancelingEdit="GridView_Fees_RowCancelingEdit" OnRowDeleting="GridView_Fees_RowDeleting" OnRowEditing="GridView_Fees_RowEditing" OnRowUpdating="GridView_Fees_RowUpdating" DataKeyNames="FeesId">
                        <Columns>
                            <asp:BoundField DataField="Sl.No." HeaderText="Sl.No." ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="ClassName" HeaderText="Class" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Fees (Annual)">
                                <EditItemTemplate>
                                    <asp:TextBox ID="Txt_FeesEdit" CssClass="form-control" Text='<%#Eval("FeesAmount")%>' runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Lbl_Fees" runat="server" Text='<%#Eval("FeesAmount")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:TemplateField>
                            <asp:CommandField CausesValidation="False" ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-outline-primary me-1">
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
