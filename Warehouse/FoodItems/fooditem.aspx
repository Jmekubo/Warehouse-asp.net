<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="fooditem.aspx.cs" Inherits="Warehouse.fooditem" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        <br />
        FoodItems</p>
    <asp:GridView ID="GVfooditem" runat="server" AllowPaging="True" 
        CellPadding="4" DataSourceID="SqlDtfooditem" ForeColor="#333333" 
        GridLines="None" HorizontalAlign="Center" Width="469px" 
        onselectedindexchanged="GVfooditem_SelectedIndexChanged" 
        DataKeyNames="ItemID">
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
        <asp:SqlDataSource ID="SqlDtfooditem" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbConn %>" 
            DeleteCommand="DELETE FROM fooditem WHERE ItemID = ?" 
            ProviderName="<%$ ConnectionStrings:warehousedbConn.ProviderName %>" 
            SelectCommand="SELECT ItemID, FoodItemName, Category, Units, UnitPrice FROM fooditem" 
        
        
        UpdateCommand="UPDATE fooditem SET FoodItemName = ?, Category = ?, Units = ?, UnitPrice = ?, receipts_RecptID = ?, inventory_InventoryID = ? WHERE ItemID = ?">
            <DeleteParameters>
                <asp:ControlParameter ControlID="GVfooditem" Name="ItemID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="GVfooditem" Name="FoodItemName" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="GVfooditem" Name="Category" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="GVfooditem" Name="Units" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="GVfooditem" Name="UnitPrice" 
                    PropertyName="SelectedValue" Type="Decimal" />
                <asp:ControlParameter ControlID="GVfooditem" Name="receipts_RecptID" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="GVfooditem" Name="inventory_InventoryID" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="GVfooditem" Name="ItemID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <p>
    </p>
</asp:Content>
