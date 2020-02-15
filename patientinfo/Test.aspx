<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="patientinfo_Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
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
                <asp:ObjectDataSource ID="dsPatientMedications" runat="server" SelectMethod="GetPatientMedications"
                    TypeName="BCPatientMedicationDAL">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lstPatientTreatments" Name="patientId"
                            PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsPatientMedication" runat="server" SelectMethod="GetPatientMedication"
                    TypeName="BCPatientMedicationDAL" DataObjectTypeName="BCPatientMedicationDAL"
                    DeleteMethod="Delete" InsertMethod="Insert">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvPatientMedication" Name="din"
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="lstPatientTreatments" DefaultValue="0" 
                            Name="treatmentId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsMedications" runat="server" SelectMethod="GetMedications"
                    TypeName="BCMedicationDAL"></asp:ObjectDataSource>
                <br />
                <asp:DropDownList ID="ddDiagnosis" runat="server" DataSourceID="dsDiagnosis" 
                    AutoPostBack="True" DataTextField="name" DataValueField="diagnosisId">
                </asp:DropDownList>
                <br />
                <asp:DropDownList ID="ddPatient" runat="server" DataSourceID="dsPatients" 
                    AutoPostBack="True" DataTextField="fullName" DataValueField="patientId">
                </asp:DropDownList>
                <br />
                <asp:ListBox ID="lstPatientTreatments" runat="server" Width="267px" DataSourceID="dsPatientTreatments"
                    Rows="6" AutoPostBack="True" DataTextField="name" 
                    DataValueField="patientTreatmentId"></asp:ListBox>
                <br />
                <asp:GridView ID="gvPatientMedication" runat="server" DataSourceID="dsPatientMedications"
                    Width="259px" DataKeyNames="DIN">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <SelectedRowStyle BackColor="#FFCC99" />
                </asp:GridView>
                <asp:DetailsView ID="dvPatientMedication" runat="server" Height="50px" Width="400px"
                    DataSourceID="dsPatientMedication">
                </asp:DetailsView>
                <asp:GridView ID="gvTest" runat="server" DataSourceID="dsPatientMedication">
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
