<%@ Page Title="" Language="C#" MasterPageFile="~/BCAdmin.master" AutoEventWireup="true" CodeFile="BCMedicationMaintenance.aspx.cs" Inherits="BCMedicationMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!--
         Brian Chaves
         Assinment 2
         Sept 27
    -->
    <style type="text/css">
        .style4
        {
            text-align: right;
        }
    </style>
    <script language="javascript" type="text/javascript">


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    Medication Maintance<table width="100%">
    <tr>
        <td width="40%" style="text-align: right">
            DIN</td>
        <td width="60%" style="text-align: left">
            <asp:TextBox ID="txtDIN" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="valDIN" runat="server" 
                ControlToValidate="txtDIN" 
                ErrorMessage="Invalid DIN - DIN must be 1 to 8 numbers with an optional letter" ForeColor="Red" 
                ValidationExpression="\d{1,8}[a-zA-Z]?" 
                Display="Dynamic" SetFocusOnError="True">*</asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="valDIN_IsEmpty" runat="server" 
                ControlToValidate="txtDIN" 
                ErrorMessage="Invalid DIN - DIN must be 1 to 8 numbers with an optional letter" 
                ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style4">
            Brand Name</td>
        <td class="siteMap">
            <asp:TextBox ID="txtBrandName" runat="server" CausesValidation="True"></asp:TextBox>
            <asp:RequiredFieldValidator ID="valBrandName" runat="server" 
                ControlToValidate="txtBrandName" Display="Dynamic" 
                ErrorMessage="Invalid Brand Nmae" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style4">
            Image File to Upload</td>
        <td class="siteMap">
            <asp:FileUpload ID="upldImage" runat="server" EnableViewState="False" />
            Save As<asp:TextBox ID="txtSaveAs" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style4">
            Type of medication</td>
        <td class="siteMap">
            <asp:CheckBoxList ID="chkListMedicationType" runat="server" RepeatColumns="3" 
                RepeatDirection="Horizontal">
            </asp:CheckBoxList>
            </td>
    </tr>
    <tr>
        <td class="style4">
            Dispensing Unit</td>
        <td class="siteMap">
            <asp:DropDownList ID="ddDispensingUnit" runat="server" 
                onselectedindexchanged="lstDispensingUnit_SelectedIndexChanged">
            </asp:DropDownList>
            </td>
    </tr>
    <tr>
        <td class="style4">
            Concentration</td>
        <td class="siteMap">
            <asp:TextBox ID="txtConcentration" runat="server" ></asp:TextBox>
            <asp:DropDownList ID="ddConcentration" runat="server">
            </asp:DropDownList>
            <asp:RegularExpressionValidator ID="valConcentration" runat="server" 
                ErrorMessage="Conentration must be a number" ForeColor="Red" 
                ControlToValidate="txtConcentration" ValidationExpression="\d+\.?\d*">*</asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="valConcentrationIsNull" runat="server" 
                ErrorMessage="Conentration must be a number" ForeColor="Red" 
                ControlToValidate="txtConcentration">*</asp:RequiredFieldValidator>
            </td>
    </tr>
    <tr>
        <td class="style4">
            <asp:Button ID="btnSave" 
                runat="server" onclick="btnSave_Click" Text="Save" />
        </td>
        <td class="siteMap">
            <asp:Button ID="btnCancle" runat="server" Text="Cancle" />
        </td>
    </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
<asp:Label ID="lblImageMessage" runat="server"></asp:Label>
</asp:Content>

