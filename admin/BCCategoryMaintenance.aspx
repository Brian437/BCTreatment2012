<%@ Page Title="" Language="C#" MasterPageFile="~/BCAdmin.master" AutoEventWireup="true"
    CodeFile="BCCategoryMaintenance.aspx.cs" Inherits="admin_BCCategoryMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style4
        {
            height: 194px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td width="70%" class="style4"><center>
                <asp:GridView ID="gridCategory" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="categoryId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display."
                    OnRowUpdated="gridCategory_RowUpdated" 
                    OnRowDeleted="gridCategory_RowDeleted" onrowupdating="gridCategory_RowUpdating">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update" ValidationGroup="Edit" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text="Edit" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you sure about this?');"
                                    CommandName="Delete" Text="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="categoryId" HeaderText="categoryId" ReadOnly="True" SortExpression="categoryId" />
                        <asp:TemplateField HeaderText="name" SortExpression="name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCategoryName" runat="server" Text='<%# Bind("name") %>' 
                                    ValidationGroup="Edit"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="valEditName" runat="server" ControlToValidate="txtCategoryName"
                                    Display="Dynamic" ErrorMessage="Category Name Required" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </center>
            </td>
            <td class="style4">
                &nbsp;<asp:DetailsView ID="DetailsViewCategory" runat="server" 
                    DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" 
                    oniteminserted="DetailsViewCategory_ItemInserted" Width="125px" 
                    AutoGenerateRows="False">
                    <Fields>
                        <asp:BoundField DataField="categoryId" HeaderText="categoryId" 
                            InsertVisible="False" ReadOnly="True" SortExpression="categoryId" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:TemplateField ShowHeader="False">
                            <InsertItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                    CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                    CommandName="New" Text="New" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:patientSQLConnectionString1 %>"
        DeleteCommand="DELETE FROM [category] WHERE [categoryId] = @categoryId" InsertCommand="INSERT INTO category(name) VALUES (@name)"
        ProviderName="<%$ ConnectionStrings:patientSQLConnectionString1.ProviderName %>"
        SelectCommand="SELECT [categoryId], [name] FROM [category]" 
        UpdateCommand="UPDATE [category] SET [name] = @name WHERE [categoryId] = @categoryId">
        <DeleteParameters>
            <asp:Parameter Name="categoryId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="categoryId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary" runat="server" ForeColor="Red" />
</asp:Content>
