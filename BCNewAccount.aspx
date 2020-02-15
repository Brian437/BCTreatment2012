<%@ Page Title="" Language="C#" MasterPageFile="~/BCBaseSite.master" AutoEventWireup="true"
    CodeFile="BCNewAccount.aspx.cs" Inherits="BCNewAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!--
        Brian Chaves
         Assinment 2
         Sept 27
    -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server">
            <WizardSteps>
                <asp:CreateUserWizardStep runat="server" />
                <asp:CompleteWizardStep runat="server" />
            </WizardSteps>
        </asp:CreateUserWizard>
    </center>
</asp:Content>
