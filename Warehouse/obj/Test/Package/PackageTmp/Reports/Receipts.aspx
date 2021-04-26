<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Receipts.aspx.cs" Inherits="Warehouse.Reports.Receipts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
    </p>
    <p align="center">
        Recepits</p>
    <p>
        &nbsp;</p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="RecptID" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
            HorizontalAlign="Center" 
           >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="RecptID" HeaderText="RecptID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="RecptID" />
                <asp:BoundField DataField="WayBillNumber" HeaderText="WayBillNumber" 
                    SortExpression="WayBillNumber" />
                <asp:BoundField DataField="OriginLocation" HeaderText="OriginLocation" 
                    SortExpression="OriginLocation" />
                <asp:BoundField DataField="empID" HeaderText="empID" SortExpression="empID" 
                    Visible="False" />
                <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" 
                    SortExpression="EmployeeName" />
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" 
                    Visible="False" />
                <asp:BoundField DataField="ItemName" HeaderText="ItemName" 
                    SortExpression="ItemName" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                    SortExpression="Quantity" />
                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" 
                    SortExpression="UnitPrice" />
                <asp:BoundField DataField="Condition" HeaderText="Condition" 
                    SortExpression="Condition" />
                <asp:BoundField DataField="TruckReg" HeaderText="TruckReg" 
                    SortExpression="TruckReg" />
                <asp:BoundField DataField="Driversname" HeaderText="Driversname" 
                    SortExpression="Driversname" />
                <asp:BoundField DataField="ReceiptDate" DataFormatString="{0:d}" 
                    HeaderText="ReceiptDate" SortExpression="ReceiptDate" />
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
        <p>
            &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            SelectCommand="SELECT * FROM [receipts] ORDER BY [WayBillNumber]">
        </asp:SqlDataSource>
        </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
