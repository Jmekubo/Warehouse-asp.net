<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="fooditem.aspx.cs" Inherits="Warehouse.fooditem" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        <br />
        FoodItems</p>
    <asp:GridView ID="GVfooditem" runat="server" AllowPaging="True" 
        CellPadding="4" ForeColor="#333333" 
        GridLines="None" HorizontalAlign="Center" Width="469px" 
         DataKeyNames="ItemID" 
        DataSourceID="SqlDItems" AutoGenerateColumns="False">
        <Columns>

    <asp:BoundField DataField = "ItemID" HeaderText = "ItemID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ItemID" />

            <asp:TemplateField HeaderText="ItemName" SortExpression="ItemName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" 
                        Text='<%# Bind("ItemName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category" SortExpression="Category">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True" 
                        Text='<%# Bind("Category") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Units" SortExpression="Units">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" 
                        Text='<%# Bind("Units") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Units") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="UnitPrice" SortExpression="UnitPrice">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtUPrice" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtUPrice" ErrorMessage="Unit Price is Required" 
                        ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToValidate="txtUPrice" ErrorMessage="Unit price must be a decimal value" 
                        ForeColor="Red" Operator="GreaterThan" Type="Double" ValueToCompare="0">*</asp:CompareValidator>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                        ShowMessageBox="True" ShowSummary="False" />
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowEditButton="True" />

</Columns>
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
    <table class="style1">
        <tr>
            <td align="center">
                <asp:Button ID="btnaddfooditem" runat="server" 
                    PostBackUrl="~/Admin/FoodItems/addFoodItem.aspx" Text="Add New Food Item" />
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                    PostBackUrl="~/Admin/FoodItems/searchItems.aspx" Text="Search for item" />
                <br />
                <br />
                </td>
        </tr>
    </table>
    <br />
        
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDcat" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
        SelectCommand="SELECT * FROM [Categories] ORDER BY [Category]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDItems" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
        DeleteCommand="DELETE FROM [items] WHERE [ItemID] = @ItemID" 
        InsertCommand="INSERT INTO [items] ([ItemName], [Category], [Units], [UnitPrice]) VALUES (@ItemName, @Category, @Units, @UnitPrice)" 
        SelectCommand="SELECT * FROM [items]" 
        UpdateCommand="UPDATE [items] SET [ItemName] = @ItemName, [Category] = @Category, [Units] = @Units, [UnitPrice] = @UnitPrice WHERE [ItemID] = @ItemID">
        <DeleteParameters>
            <asp:Parameter Name="ItemID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ItemName" Type="String" />
            <asp:Parameter Name="Category" Type="String" />
            <asp:Parameter Name="Units" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ItemName" Type="String" />
            <asp:Parameter Name="Category" Type="String" />
            <asp:Parameter Name="Units" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="ItemID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <p>
        <asp:SqlDataSource ID="SqlDunits" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            SelectCommand="SELECT * FROM [Units] ORDER BY [Units]"></asp:SqlDataSource>
    </p>
</asp:Content>
