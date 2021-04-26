﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="searchTransporter.aspx.cs" Inherits="Warehouse.Admin.Transporters.searchTransporter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    Enter transporters name<br />
    <br />
    <asp:TextBox ID="txttransp" runat="server"></asp:TextBox>
    <asp:Button ID="btnsearch" runat="server" onclick="btnsearch_Click1" 
        Text="Search" />
    <br />
    <br />
    <asp:GridView ID="GVtransp" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <br />
    <asp:Button ID="Button1" runat="server" CausesValidation="False" 
        PostBackUrl="~/Admin/Transporters/transporters.aspx" 
        Text="Back to transporters" />
    <br />
    <br />
</asp:Content>
