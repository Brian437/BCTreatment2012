<%@ Page Title="Medication" Language="C#" MasterPageFile="~/BCBaseSite.master" AutoEventWireup="true" CodeFile="BCMedication.aspx.cs" Inherits="BCMedication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--
        Brian Chaves
        October 31
        Assinment 4
        XML database
    -->
    <asp:DropDownList ID="ddCategory" runat="server" AutoPostBack="True" 
        DataTextField="Category">
        <asp:ListItem></asp:ListItem>
</asp:DropDownList>
    <br /><center>
    <asp:GridView ID="gridViewMedication" runat="server" 
        AutoGenerateColumns="False">
        <Columns>
            <asp:ImageField DataImageUrlField="ImageLocation" 
                DataImageUrlFormatString="~/images/{0}" HeaderText="Image">
            </asp:ImageField>
            <asp:BoundField DataField="MedicationConcentration" 
                HeaderText="Medication Concentration" />
            <asp:BoundField DataField="Units" HeaderText="Units" />
            <asp:BoundField DataField="TotalOnHand" HeaderText="On Hand" />
        </Columns>
    </asp:GridView></center>
</asp:Content>

