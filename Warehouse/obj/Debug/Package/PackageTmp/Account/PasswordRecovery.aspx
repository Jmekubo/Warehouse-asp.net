﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PasswordRecovery.aspx.cs" Inherits="Warehouse.Account.PasswordRecovery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:PasswordRecovery ID="RecoveryPwd" runat="server">
</asp:PasswordRecovery>
<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Home.aspx">Home</asp:HyperLink>
</asp:Content>
