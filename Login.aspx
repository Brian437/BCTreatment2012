<%@ Page Title="" Language="C#" MasterPageFile="~/BCBaseSite.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!--
        Brian Chaves
        Assinment 2
        Sept 27
    -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Default.aspx" 
            DisplayRememberMe="False" 
            RememberMeText="This text should not apper" 
            CreateUserText="Create new account" CreateUserUrl="~/BCNewAccount.aspx" 
            VisibleWhenLoggedIn="False">
        </asp:Login>
    </center>
</asp:Content>

