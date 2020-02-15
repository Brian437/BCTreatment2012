<%@ Page Title="" Language="C#" MasterPageFile="~/BCBaseSite.master" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test_Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
    <asp:Button ID="btnTest" runat="server" onclick="btnTest_Click" Text="Button" />
    <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>
    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
    </asp:RadioButtonList>
    <asp:CheckBoxList ID="cblTest" runat="server">
        <asp:ListItem>item1</asp:ListItem>
        <asp:ListItem>itemA</asp:ListItem>
    </asp:CheckBoxList>
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem>item1</asp:ListItem>
        <asp:ListItem>itemA</asp:ListItem>
    </asp:DropDownList>
    <asp:RadioButtonList ID="rblTest" runat="server">
        <asp:ListItem>g463456</asp:ListItem>
        <asp:ListItem Value="6"></asp:ListItem>
        <asp:ListItem>6f4536</asp:ListItem>
        <asp:ListItem>b65u657</asp:ListItem>
    </asp:RadioButtonList>
</asp:Content>

