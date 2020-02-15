<%@ Page Title="" Language="C#" MasterPageFile="~/BCAdmin.master" AutoEventWireup="true"
    CodeFile="BCDiagnosisMaintenance.aspx.cs" Inherits="admin_BCDiagnosisMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td width="70%">
                <asp:GridView ID="GridViewDiagnosis" runat="server" AutoGenerateColumns="False" DataKeyNames="diagnosisId"
                    DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display."
                    AllowPaging="True" PageSize="5" AllowSorting="True" 
                    OnRowDeleted="GridViewDiagnosis_RowDeleted" OnRowUpdated="GridViewDiagnosis_RowUpdated"
                    OnRowUpdating="GridViewDiagnosis_RowUpdating">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text="Edit" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" OnClientClick="return confirm('Delete this?')"
                                    CommandName="Delete" Text="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="diagnosisId" HeaderText="diagnosisId" ReadOnly="True"
                            SortExpression="diagnosisId" />
                        <asp:TemplateField HeaderText="name" SortExpression="name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>' 
                                    ValidationGroup="Edit"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="A diagnosis name is required" 
                                    ForeColor="Red" ValidationGroup="Edit">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="categoryId" SortExpression="categoryId">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("categoryId") %>' 
                                    Visible="False"></asp:TextBox>
                                <asp:DropDownList ID="DropDownList3" runat="server" 
                                    DataSourceID="SqlDataSourceCategory" DataTextField="name" 
                                    DataValueField="categoryId" SelectedValue='<%# Bind("categoryId") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("categoryId") %>' 
                                    Visible="False"></asp:Label>
                                <asp:DropDownList ID="DropDownList2" runat="server" 
                                    DataSourceID="SqlDataSourceCategory" DataTextField="name" 
                                    DataValueField="categoryId" Enabled="False" 
                                    SelectedValue='<%# Bind("categoryId") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerSettings FirstPageText="&lt;&lt;" LastPageText="&gt;&gt;" Mode="NextPreviousFirstLast"
                        NextPageText="&gt;" PreviousPageText="&lt;" />
                </asp:GridView>
            </td>
            <td width="30%">
                &nbsp;
                <asp:DetailsView ID="DetailsViewDiagnosis" runat="server" 
                    AutoGenerateRows="False" DataSourceID="SqlDataSource1" DefaultMode="Insert" 
                    Height="50px" oniteminserted="DetailsViewDiagnosis_ItemInserted" 
                    oniteminserting="DetailsViewDiagnosis_ItemInserting" Width="125px">
                    <Fields>
                        <asp:BoundField DataField="diagnosisId" HeaderText="diagnosisId" 
                            InsertVisible="False" ReadOnly="True" SortExpression="diagnosisId" />
                        <asp:TemplateField HeaderText="name" SortExpression="name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                <asp:Label ID="lblNameRequired" runat="server" ForeColor="Red" 
                                    Text="a diagnosis name is required" Visible="False"></asp:Label>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="categoryId" SortExpression="categoryId">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("categoryId") %>' 
                                    Visible="False"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("categoryId") %>' 
                                    Visible="False"></asp:TextBox>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="SqlDataSourceCategory" DataTextField="name" 
                                    DataValueField="categoryId" SelectedValue='<%# Bind("categoryId") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("categoryId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
        ValidationGroup="Edit" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:patientSQLConnectionString1 %>"
        DeleteCommand="DELETE FROM [diagnosis] WHERE [diagnosisId] = @diagnosisId" InsertCommand="INSERT INTO [diagnosis] ([name], [categoryId]) VALUES (@name, @categoryId)"
        ProviderName="<%$ ConnectionStrings:patientSQLConnectionString1.ProviderName %>"
        SelectCommand="SELECT [diagnosisId], [name], [categoryId] FROM [diagnosis]" UpdateCommand="UPDATE [diagnosis] SET [name] = @name, [categoryId] = @categoryId WHERE [diagnosisId] = @diagnosisId">
        <DeleteParameters>
            <asp:Parameter Name="diagnosisId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="categoryId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="categoryId" Type="Int32" />
            <asp:Parameter Name="diagnosisId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" 
        ConnectionString="<%$ ConnectionStrings:patientSQLConnectionString1 %>" 
        DeleteCommand="DELETE FROM [category] WHERE [categoryId] = @categoryId" 
        InsertCommand="INSERT INTO [category] ([name]) VALUES (@name)" 
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
</asp:Content>
