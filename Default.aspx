<%@ Page Title="Brian Chaves's Home page" Language="C#" MasterPageFile="~/BCBaseSite.master"
    AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Brian Chaves's Home Page</title>
    <!--
        Brian Chaves
        September 12,2012
        Assinment 1

        Home Page
    -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p class="style2">
        <strong style="text-align: center">Brian&#39;s Home Page<br />
        </strong>
        <asp:Label ID="lblDate" runat="server" 
            Style="font-size: large; text-align: center;" Text="Today's Date" Font-Bold="True"></asp:Label>
    </p>
</asp:Content>
