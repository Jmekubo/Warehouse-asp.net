<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="Warehouse.Inventory.Inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        Manage Inventory</p>
    <p align="center">
        Select Item
        <asp:DropDownList ID="DropDownListItems" runat="server" 
            DataSourceID="SqlDataSItems" DataTextField="ItemName" DataValueField="ItemID">
        </asp:DropDownList>
    </p>
    <p align="center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="InvID" DataSourceID="SqlDataSInventory">
            <Columns>
                <asp:BoundField DataField="InvID" HeaderText="InvID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="InvID" />
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" 
                    SortExpression="ItemID" Visible="False" />
                <asp:BoundField DataField="ItemName" HeaderText="ItemName" 
                    SortExpression="ItemName" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                    SortExpression="Quantity" />
                <asp:BoundField DataField="InventoryDate" HeaderText="InventoryDate" 
                    SortExpression="InventoryDate" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
    </p>
    <p align="center">
        <asp:SqlDataSource ID="SqlDataSInventory" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            DeleteCommand="DELETE FROM [inventory] WHERE [InvID] = @original_InvID AND [ItemID] = @original_ItemID AND [ItemName] = @original_ItemName AND [Quantity] = @original_Quantity AND [InventoryDate] = @original_InventoryDate" 
            InsertCommand="INSERT INTO [inventory] ([ItemID], [ItemName], [Quantity], [InventoryDate]) VALUES (@ItemID, @ItemName, @Quantity, @InventoryDate)" 
            SelectCommand="SELECT * FROM [inventory] WHERE ([ItemName] = @ItemName) ORDER BY [ItemName]" 
            
            UpdateCommand="UPDATE [inventory] SET [ItemID] = @ItemID, [ItemName] = @ItemName, [Quantity] = @Quantity, [InventoryDate] = @InventoryDate WHERE [InvID] = @original_InvID AND [ItemID] = @original_ItemID AND [ItemName] = @original_ItemName AND [Quantity] = @original_Quantity AND [InventoryDate] = @original_InventoryDate" 
            ConflictDetection="CompareAllValues" 
            OldValuesParameterFormatString="original_{0}">
            <DeleteParameters>
                <asp:Parameter Name="original_InvID" Type="Int32" />
                <asp:Parameter Name="original_ItemID" Type="Int32" />
                <asp:Parameter Name="original_ItemName" Type="String" />
                <asp:Parameter Name="original_Quantity" Type="Int32" />
                <asp:Parameter Name="original_InventoryDate" Type="DateTime" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ItemID" Type="Int32" />
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="InventoryDate" Type="DateTime" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListItems" Name="ItemName" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ItemID" Type="Int32" />
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="InventoryDate" Type="DateTime" />
                <asp:Parameter Name="original_InvID" Type="Int32" />
                <asp:Parameter Name="original_ItemID" Type="Int32" />
                <asp:Parameter Name="original_ItemName" Type="String" />
                <asp:Parameter Name="original_Quantity" Type="Int32" />
                <asp:Parameter Name="original_InventoryDate" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSItems" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            SelectCommand="SELECT [ItemID], [ItemName] FROM [items] ORDER BY [ItemName]">
        </asp:SqlDataSource>
    </p>
</asp:Content>
