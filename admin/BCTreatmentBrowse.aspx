<%@ Page Title="" Language="C#" MasterPageFile="~/BCAdmin.master" AutoEventWireup="true"
    CodeFile="BCTreatmentBrowse.aspx.cs" Inherits="admin_BCTreatmentBrowse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <asp:DropDownList ID="ddDiagnosisID" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceDiagnosis"
            DataTextField="name" DataValueField="diagnosisId" OnSelectedIndexChanged="ddDiagnosisID_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:GridView ID="GridViewTreatment" runat="server" AutoGenerateColumns="False" DataKeyNames="treatmentId"
            DataSourceID="SqlDataSourceTreatment" 
            EmptyDataText="There are no data records to display." 
            onrowdeleted="GridViewTreatment_RowDeleted" 
            onselectedindexchanging="GridViewTreatment_SelectedIndexChanging">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                         OnClientClick="return confirm('Do you realy want to do this?')"
                            CommandName="Delete" Text="Delete" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="treatmentId" InsertVisible="False" 
                    SortExpression="treatmentId" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="lblTreatmentID" runat="server" Text='<%# Bind("treatmentId") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("treatmentId") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="name" SortExpression="name">
                    <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Select" Text="">
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label></asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="description" HeaderText="description" 
                    SortExpression="description" />
                <asp:BoundField DataField="diagnosisId" HeaderText="diagnosisId" SortExpression="diagnosisId"
                    Visible="False" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnAddNewTreatment" runat="server" Text="Add New Treatment" 
            onclick="btnAddNewTreatment_Click" />
    </center>
    <asp:SqlDataSource ID="SqlDataSourceTreatment" runat="server" ConnectionString="<%$ ConnectionStrings:patientSQLConnectionString1 %>"
        ProviderName="<%$ ConnectionStrings:patientSQLConnectionString1.ProviderName %>"
        DeleteCommand= "DELETE FROM [treatment] WHERE [treatmentId] = @treatmentId"
        SelectCommand="SELECT * FROM [treatment] WHERE ([diagnosisId] = @diagnosisId)">
        
        <SelectParameters>
            <asp:ControlParameter ControlID="ddDiagnosisID" DefaultValue="0" 
                Name="diagnosisId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDiagnosis" runat="server" ConnectionString="<%$ ConnectionStrings:patientSQLConnectionString1 %>"
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
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
</asp:Content>
