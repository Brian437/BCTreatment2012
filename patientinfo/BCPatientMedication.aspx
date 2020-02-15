<%@ Page Title="" Language="C#" MasterPageFile="~/BCBaseSite.master"
    AutoEventWireup="true" CodeFile="BCPatientMedication.aspx.cs" Inherits="patientInfo_XXPatientMedication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%">
        <tr>
            <td colspan="2">
                <h3 style="text-align: center">
                    Patient Medication</h3>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                Patient:
                <asp:DropDownList ID="ddPatient" runat="server" DataSourceID="dsPatients" 
                    AutoPostBack="True" DataTextField="fullName" DataValueField="patientId">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 50%" align="center" valign="top">
                Diagnosis:<br />
                <asp:DropDownList ID="ddDiagnosis" runat="server" DataSourceID="dsDiagnosis" 
                    AutoPostBack="True" DataTextField="name" DataValueField="diagnosisId">
                </asp:DropDownList>
                <br />
                Treatments for Diagnosis:<br />
                <asp:ListBox ID="lstTreatments" runat="server" DataSourceID="dsTreatments" DataTextField="name"
                    DataValueField="treatmentId" Width="272px"></asp:ListBox>
                <br />
                <asp:Button ID="btnAddTreatment" runat="server" Text="Prescribe Treatment" OnClick="btnPrescribeTreatment_Click" />
            </td>
            <td style="width: 50%" align="center" valign="top">
                Treatments Prescribed<br />
                for Patient<br />
                <asp:ListBox ID="lstPatientTreatments" runat="server" Width="267px" DataSourceID="dsPatientTreatments"
                    Rows="6" AutoPostBack="True" DataTextField="name" 
                    DataValueField="patientTreatmentId"></asp:ListBox>
                <br />
                <asp:Button ID="btnDeletePatientTreatment" runat="server" Text="Delete Patient-Treatment"
                    OnClick="btnDeletePatientTreatment_Click" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <h4>
                    Medication for Prescribed Treatment<asp:GridView ID="gvPatientMedication" 
                        runat="server" DataSourceID="dsPatientMedications"
                    Width="259px" DataKeyNames="DIN" 
                        onselectedindexchanged="gvPatientMedication_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                    </Columns>
                    <SelectedRowStyle BackColor="#FFCC99" />
                </asp:GridView>
                </h4>
            </td>
            <td align="center" valign="top">
                <h4>
                    <asp:Label ID="lblDetails" runat="server" Text="Details of Selected Medication"></asp:Label>
                <asp:DetailsView ID="dvPatientMedication" runat="server" Height="50px" Width="400px"
                    DataSourceID="dsPatientMedication" AllowPaging="True" AutoGenerateRows="False" 
                        oniteminserted="dvPatientMedication_ItemInserted" 
                        onitemupdated="dvPatientMedication_ItemUpdated" 
                        onitemupdating="dvPatientMedication_ItemUpdating">
                    <Fields>
                        <asp:BoundField DataField="patientTreatmentId" HeaderText="ID" />
                        <asp:TemplateField HeaderText="Medication">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddMedication" runat="server" DataSourceID="dsMedications" 
                                    DataTextField="name" DataValueField="name" 
                                    SelectedValue='<%# Bind("name") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddMedication" runat="server" 
                                    DataSourceID="dsMedications" DataTextField="name" 
                                    DataValueField="din" SelectedValue='<%# Bind("name") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="dose" HeaderText="Dose" />
                        <asp:BoundField DataField="frequency" HeaderText="Frequency" />
                        <asp:TemplateField HeaderText="Frequency Period">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddFrequencyPeriod" runat="server" 
                                    SelectedValue='<%# Bind("frequencyPeriod") %>'>
                                    <asp:ListItem Value="day">day</asp:ListItem>
                                    <asp:ListItem>week</asp:ListItem>
                                    <asp:ListItem>month</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddFrequencyPeriod" runat="server" 
                                    SelectedValue='<%# Bind("frequencyPeriod") %>'>
                                    <asp:ListItem Value="day">day</asp:ListItem>
                                    <asp:ListItem>week</asp:ListItem>
                                    <asp:ListItem>month</asp:ListItem>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("frequencyPeriod") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Exact/Min/Max">
                            <EditItemTemplate>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                    RepeatDirection="Horizontal" SelectedValue='<%# Bind("exactMinMax") %>'>
                                    <asp:ListItem Value="exact">exact</asp:ListItem>
                                    <asp:ListItem>min</asp:ListItem>
                                    <asp:ListItem>max</asp:ListItem>
                                    <asp:ListItem>n/a</asp:ListItem>
                                </asp:RadioButtonList>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                    RepeatDirection="Horizontal" SelectedValue='<%# Bind("exactMinMax") %>'>
                                    <asp:ListItem Value="exact">Exact</asp:ListItem>
                                    <asp:ListItem>min</asp:ListItem>
                                    <asp:ListItem>max</asp:ListItem>
                                    <asp:ListItem>n/a</asp:ListItem>
                                </asp:RadioButtonList>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("exactMinMax") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                            ShowEditButton="True" ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
                </h4>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ObjectDataSource ID="dsPatients" runat="server" SelectMethod="GetPatients" TypeName="BCPatientDAL">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsDiagnosis" runat="server" SelectMethod="GetDiagnosis"
                    TypeName="BCDiagnosisDAL"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsTreatments" runat="server" SelectMethod="GetTreatment"
                    TypeName="BCTreatmentDAL">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddDiagnosis" Name="diagnosisId" PropertyName="SelectedValue"
                            Type="Int32" DefaultValue="0" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsPatientTreatments" runat="server" SelectMethod="GetPatientTreatment"
                    TypeName="BCPatientTreatmentDAL">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddPatient" Name="patientId" PropertyName="SelectedValue"
                            Type="Int32" DefaultValue="-1" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td>
                <asp:ObjectDataSource ID="dsPatientMedications" runat="server" SelectMethod="GetPatientMedications"
                    TypeName="BCPatientMedicationDAL">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lstPatientTreatments" Name="patientTreatmentId"
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsPatientMedication" runat="server" SelectMethod="GetPatientMedication"
                    TypeName="BCPatientMedicationDAL" DataObjectTypeName="BCPatientMedicationDAL"
                    DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Edit">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvPatientMedication" Name="din"
                            PropertyName="SelectedValue" Type="String" DefaultValue="0" />
                        <asp:ControlParameter ControlID="ddPatient" DefaultValue="0" 
                            Name="patientId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsMedications" runat="server" SelectMethod="GetMedications"
                    TypeName="BCMedicationDAL"></asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
