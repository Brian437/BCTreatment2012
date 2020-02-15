<%@ Page Title="" Language="C#" MasterPageFile="~/BCAdmin.master" AutoEventWireup="true"
    CodeFile="BCTreatmentMaintenance.aspx.cs" Inherits="admin_BCTreatmentMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <asp:DetailsView ID="DetailsViewTreatment" runat="server" AutoGenerateRows="False"
            DataKeyNames="treatmentId" DataSourceID="SqlDataSourceTreatment" Height="50px"
            Width="125px" AllowPaging="True" 
            onitemcommand="DetailsViewTreatment_ItemCommand" 
            oniteminserted="DetailsViewTreatment_ItemInserted" 
            onitemupdated="DetailsViewTreatment_ItemUpdated">
            <Fields>
                <asp:TemplateField HeaderText="treatmentId" InsertVisible="False" 
                    SortExpression="treatmentId">
                    <ItemTemplate>
                        <asp:Label ID="lblTreatmentID" runat="server" Text='<%# Bind("treatmentId") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("treatmentId") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                <asp:TemplateField HeaderText="diagnosisId" SortExpression="diagnosisId">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("diagnosisId") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("diagnosisId") %>' 
                            Visible="False"></asp:TextBox>
                        <asp:DropDownList ID="ddDiagnosisID" runat="server" 
                            DataSourceID="SqlDataSourceDiagnosis" DataTextField="name" 
                            DataValueField="diagnosisId" SelectedValue='<%# Bind("diagnosisId") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("diagnosisId") %>' 
                            Visible="False"></asp:TextBox>
                        <asp:DropDownList ID="ddDiagnosisID" runat="server" 
                            DataSourceID="SqlDataSourceDiagnosis" DataTextField="name" 
                            DataValueField="diagnosisId" SelectedValue='<%# Bind("diagnosisId") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                            CommandName="New" Text="New" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" />
                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </center>
    <asp:SqlDataSource ID="SqlDataSourceTreatment" runat="server" ConnectionString="<%$ ConnectionStrings:patientSQLConnectionString1 %>"
        DeleteCommand="DELETE FROM [treatment] WHERE [treatmentId] = @treatmentId" InsertCommand="INSERT INTO [treatment] ([name], [description], [diagnosisId]) VALUES (@name, @description, @diagnosisId)"
        ProviderName="<%$ ConnectionStrings:patientSQLConnectionString1.ProviderName %>"
        SelectCommand="SELECT [treatmentId], [name], [description], [diagnosisId] FROM [treatment] WHERE ([treatmentId] = @treatmentId)"
        
        UpdateCommand="UPDATE [treatment] SET [name] = @name, [description] = @description, [diagnosisId] = @diagnosisId WHERE [treatmentId] = @treatmentId">
        <DeleteParameters>
            <asp:Parameter Name="treatmentId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="diagnosisId" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="treatmentId" QueryStringField="TreatmentID" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="diagnosisId" Type="Int32" />
            <asp:Parameter Name="treatmentId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDiagnosis" runat="server" 
        ConnectionString="<%$ ConnectionStrings:patientSQLConnectionString1 %>" 
        SelectCommand="SELECT * FROM [diagnosis]"></asp:SqlDataSource>
</asp:Content>
