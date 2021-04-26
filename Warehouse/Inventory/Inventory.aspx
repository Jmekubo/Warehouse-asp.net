<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="Warehouse.employees" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        <br />
        Inventory</p>
    <asp:GridView ID="GVinventory" runat="server" AllowPaging="True" 
        CellPadding="4" DataSourceID="SqlDtInventory" ForeColor="#333333" 
        GridLines="None" HorizontalAlign="Center" Width="469px" 
        onselectedindexchanged="GVemployees_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
        <asp:SqlDataSource ID="SqlDtInventory" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbConn %>" 
            DeleteCommand="DELETE FROM inventory WHERE InventoryID= ?" 
            ProviderName="<%$ ConnectionStrings:warehousedbConn.ProviderName %>" 
            SelectCommand="SELECT * FROM inventory" 
        
        UpdateCommand="UPDATE inventory SET ItemID = ?, Quantity = ?,InventoryDate = ? WHERE InventoryID = ?">
            <DeleteParameters>
                <asp:ControlParameter ControlID="GVinventory" Name="InventoryID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="GVinventory" Name="ItemID" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="GVinventory" Name="Quantity" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="GVinventory" Name="InventoryDate" 
                    PropertyName="SelectedValue" Type="DateTime" />
                <asp:ControlParameter ControlID="GVinventory" Name="InventoryID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <p>
    </p>
</asp:Content>
