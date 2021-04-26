<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addFoodItem.aspx.cs" Inherits="Warehouse.addFoodItem" %>
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
        New Food Item<br />
    </p>
        <asp:DetailsView ID="DVFItem" runat="server" AllowPaging="True" 
            CellPadding="4" DataSourceID="SqlDtFoodItem" ForeColor="#333333" 
            GridLines="None" Height="50px" HorizontalAlign="Center" Width="363px" 
            AutoGenerateRows="False">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
             <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ItemID" />
                <asp:TemplateField HeaderText="ItemName" SortExpression="ItemNamee">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ItemName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtItemName" runat="server" Text='<%# Bind("ItemName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtItemName" ErrorMessage="Item Name Required" 
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtItemName" 
                            ErrorMessage="ItemName must be characters less than 50" ForeColor="Red" 
                            ValidationExpression="^[0-9a-zA-Z'.\s-*]{1,100}$">*</asp:RegularExpressionValidator>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                            HeaderText="Please make this corrections to proceed" ShowMessageBox="True" 
                            ShowSummary="False" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Category" SortExpression="Category">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Category") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtCat" runat="server" Text='<%# Bind("Category") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtCat" ErrorMessage="category is Required" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="txtCat" 
                            ErrorMessage="Category must be characters less than 50" ForeColor="Red" 
                            ValidationExpression="^[a-zA-Z'.\s]{1,50}$">*</asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Units" SortExpression="Units">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Units") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtUnits" runat="server" Text='<%# Bind("Units") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtUnits" ErrorMessage="Units are Required" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            ControlToValidate="txtUnits" 
                            ErrorMessage="Units must be in charcters less than 50" ForeColor="Red" 
                            ValidationExpression="^[a-zA-Z'.\s]{1,50}$">*</asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Units") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="UnitPrice" SortExpression="UnitPrice">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtUPrice" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txtUPrice" ErrorMessage="Unit price is Required" 
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToValidate="txtUPrice" 
                            ErrorMessage="Units must be decimal value greater than 0" ForeColor="Red" 
                            Operator="GreaterThan" Type="Double" ValueToCompare="0">*</asp:CompareValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
    <table class="style1">
        <tr>
            <td align="center">
                <asp:Button ID="btnfooditems" runat="server" 
                    PostBackUrl="~/Admin/FoodItems/fooditem.aspx" Text="Back to Food Items" 
                    CausesValidation="False" />
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDtFoodItem" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
        InsertCommand="INSERT INTO [items] ([ItemName], [Category], [Units], [UnitPrice]) VALUES (@ItemName, @Category, @Units, @UnitPrice)" 
        
        SelectCommand="SELECT * FROM [items]" 
        DeleteCommand="DELETE FROM [items] WHERE [ItemID] = @ItemID" 
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
    <asp:SqlDataSource ID="SqlDcate" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
        SelectCommand="SELECT DISTINCT * FROM [Categories]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDaUnit" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
        SelectCommand="SELECT DISTINCT * FROM [Units]"></asp:SqlDataSource>
</asp:Content>
