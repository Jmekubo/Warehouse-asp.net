<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewDispatches.aspx.cs" Inherits="Warehouse.Reports.ViewDispatches" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    Dispatches<br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DispID" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
        HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="DispID" HeaderText="DispID" InsertVisible="False" 
                ReadOnly="True" SortExpression="DispID" />
            <asp:BoundField DataField="WayBillNumber" HeaderText="WayBillNumber" 
                SortExpression="WayBillNumber" />
            <asp:BoundField DataField="TranspID" HeaderText="TranspID" 
                SortExpression="TranspID" Visible="False" />
            <asp:BoundField DataField="TransporterName" HeaderText="TransporterName" 
                SortExpression="TransporterName" />
            <asp:BoundField DataField="empID" HeaderText="empID" SortExpression="empID" 
                Visible="False" />
            <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" 
                SortExpression="EmployeeName" />
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" 
                Visible="False" />
            <asp:BoundField DataField="ItemName" HeaderText="ItemName" 
                SortExpression="ItemName" />
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" 
                SortExpression="UnitPrice" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                SortExpression="Quantity" />
            <asp:BoundField DataField="TruckReg" HeaderText="TruckReg" 
                SortExpression="TruckReg" />
            <asp:BoundField DataField="Driversname" HeaderText="Driversname" 
                SortExpression="Driversname" />
            <asp:BoundField DataField="Destination" HeaderText="Destination" 
                SortExpression="Destination" />
            <asp:BoundField DataField="DispatchDate" HeaderText="DispatchDate" 
                SortExpression="DispatchDate" Visible="False" />
        </Columns>
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
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
        onselecting="SqlDataSource1_Selecting" 
        SelectCommand="SELECT * FROM [dispatches] ORDER BY [TransporterName]">
    </asp:SqlDataSource>
</asp:Content>
