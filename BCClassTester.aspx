<%@ Page Title="Class Tester" Language="C#" MasterPageFile="~/BCBaseSite.master"
    AutoEventWireup="true" CodeFile="BCClassTester.aspx.cs" Inherits="BCClassTester" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Class Tester</title>
    <!--
        Brian Chaves
        September 12,2012
        Assinment 1

        Class Tester Page
    -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p>
        Test Text:<asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="btnIsNumber" runat="server" onclick="btnIsNumber_Click" 
            Text="Is Number/Integer" />
        <asp:Button ID="btnIsDate" runat="server" onclick="btnIsDate_Click" 
            Text="Is Date" />
        <asp:Button ID="btnIsPresent" runat="server" onclick="btnIsPresent_Click" 
            Text="Is Present" />
        <asp:Button ID="btnIsPostalCode" runat="server" onclick="btnIsPostalCode_Click" 
            Text="Is Postal Code" />
    </p>
    <p>
        <asp:Label ID="lblResult" runat="server"></asp:Label>
        <asp:GridView ID="gridTester" runat="server">
        </asp:GridView>
    </p>
</asp:Content>
