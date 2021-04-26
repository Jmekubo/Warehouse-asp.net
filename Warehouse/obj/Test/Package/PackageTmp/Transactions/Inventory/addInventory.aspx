<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addInventory.aspx.cs" Inherits="Warehouse.addEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        New Inventory<br />
    </p>
    <p>
        <asp:DetailsView ID="DVemployee1" runat="server" AllowPaging="True" 
            CellPadding="4" DataSourceID="SqlDtInventory" ForeColor="#333333" 
            GridLines="None" Height="50px" HorizontalAlign="Center" Width="363px" 
            AutoGenerateRows="False" DataKeyNames="InvID">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="InvID" HeaderText="InvID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="InvID" />
                <asp:TemplateField HeaderText="ItemName">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDtItems" 
                            DataTextField="ItemName" DataValueField="ItemID">
                        </asp:DropDownList>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                    SortExpression="Quantity" />
                <asp:BoundField DataField="InventoryDate" HeaderText="InventoryDate" 
                    SortExpression="InventoryDate" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
    </p>
    <asp:SqlDataSource ID="SqlDtInventory" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
        InsertCommand="INSERT INTO [inventory] ([ItemID], [Quantity], [InventoryDate]) VALUES (@ItemID, @Quantity, @InventoryDate)" 
        SelectCommand="SELECT * FROM [inventory]" 
        
        
    
        
        
        UpdateCommand="UPDATE [inventory] SET [ItemID] = @ItemID, [Quantity] = @Quantity, [InventoryDate] = @InventoryDate WHERE [InvID] = @original_InvID AND [ItemID] = @original_ItemID AND [Quantity] = @original_Quantity AND [InventoryDate] = @original_InventoryDate" 
        ConflictDetection="CompareAllValues" 
        OldValuesParameterFormatString="original_{0}" 
        DeleteCommand="DELETE FROM [inventory] WHERE [InvID] = @original_InvID AND [ItemID] = @original_ItemID AND [Quantity] = @original_Quantity AND [InventoryDate] = @original_InventoryDate">
        <DeleteParameters>
            <asp:Parameter Name="original_InvID" Type="Int32" />
            <asp:Parameter Name="original_ItemID" Type="Int32" />
            <asp:Parameter Name="original_Quantity" Type="Int32" />
            <asp:Parameter Name="original_InventoryDate" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ItemID" Type="Int32" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="InventoryDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ItemID" Type="Int32" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="InventoryDate" Type="DateTime" />
            <asp:Parameter Name="original_InvID" Type="Int32" />
            <asp:Parameter Name="original_ItemID" Type="Int32" />
            <asp:Parameter Name="original_Quantity" Type="Int32" />
            <asp:Parameter Name="original_InventoryDate" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDtItems" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
        SelectCommand="SELECT * FROM [items] ORDER BY [ItemName]" 
        OldValuesParameterFormatString="original_{0}">
    </asp:SqlDataSource>
</asp:Content>
