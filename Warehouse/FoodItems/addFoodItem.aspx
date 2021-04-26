<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addFoodItem.aspx.cs" Inherits="Warehouse.addSupplier" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        New Food Item<br />
    </p>
    <p>
        <asp:DetailsView ID="DVFItem" runat="server" AllowPaging="True" 
            CellPadding="4" DataSourceID="SqlDtFoodItem" ForeColor="#333333" 
            GridLines="None" Height="50px" HorizontalAlign="Center" Width="363px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
    </p>
    <asp:SqlDataSource ID="SqlDtFoodItem" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbConn %>" 
        InsertCommand="INSERT INTO fooditem(ItemID, FoodItemName, Category, Units, UnitPrice) VALUES (?,?,?,?,?)" 
        ProviderName="<%$ ConnectionStrings:warehousedbConn.ProviderName %>" 
        
        SelectCommand="SELECT ItemID, FoodItemName, Category, Units, UnitPrice FROM fooditem">
        <InsertParameters>
            <asp:ControlParameter ControlID="DVFItem" Name="ItemID" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DVFItem" Name="FoodItemName" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DVFItem" Name="Category" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DVFItem" Name="Units" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DVFItem" Name="UnitPrice" 
                PropertyName="SelectedValue" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
