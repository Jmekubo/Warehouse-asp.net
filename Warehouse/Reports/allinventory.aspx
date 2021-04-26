<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="allinventory.aspx.cs" Inherits="Warehouse.Members.Reports.allinventory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            SelectCommand="SELECT * FROM [inventory] ORDER BY [ItemName]">
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="InvID" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
            HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="InvID" HeaderText="InvID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="InvID" />
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" 
                    SortExpression="ItemID" />
                <asp:BoundField DataField="ItemName" HeaderText="ItemName" 
                    SortExpression="ItemName" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                    SortExpression="Quantity" />
                <asp:BoundField DataField="InventoryDate" DataFormatString="{0:d}" 
                    HeaderText="InventoryDate" SortExpression="InventoryDate" />
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
    
    </div>
    </form>
</body>
</html>
