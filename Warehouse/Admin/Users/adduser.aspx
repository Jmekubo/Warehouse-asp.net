<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adduser.aspx.cs" Inherits="WarehouseMGTsys.adduser" %>
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
    NEW USER</p>
<p align="center">
    <asp:DetailsView ID="DVadduser" runat="server" 
        CellPadding="4" DataSourceID="SqlDtadduser" GridLines="None" Height="50px" 
        Width="437px" ForeColor="#333333" HorizontalAlign="Center" 
        AllowPaging="True" AutoGenerateRows="False" DataKeyNames="UserID">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" 
                ReadOnly="True" SortExpression="UserID" />
            <asp:BoundField DataField="Username" HeaderText="Username" 
                SortExpression="Username" />
            <asp:BoundField DataField="Category" HeaderText="Category" 
                SortExpression="Category" />
            <asp:BoundField DataField="Password" HeaderText="Password" 
                SortExpression="Password" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
</p>
<table class="style1">
    <tr>
        <td align="center">
            <asp:Button ID="btnusers" runat="server" PostBackUrl="~/Admin/Users/Users.aspx" 
                Text="Back to Users" />
        </td>
    </tr>
</table>
        <asp:SqlDataSource ID="SqlDtadduser" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            InsertCommand="INSERT INTO [users] ([Username], [Category], [Password]) VALUES (@Username, @Category, @Password)" 
            SelectCommand="SELECT * FROM [users]" 
            
            
            
        
    
        
        UpdateCommand="UPDATE [users] SET [Username] = @Username, [Category] = @Category, [Password] = @Password WHERE [UserID] = @original_UserID AND [Username] = @original_Username AND [Category] = @original_Category AND [Password] = @original_Password" 
        ConflictDetection="CompareAllValues" 
        DeleteCommand="DELETE FROM [users] WHERE [UserID] = @original_UserID AND [Username] = @original_Username AND [Category] = @original_Category AND [Password] = @original_Password" 
        OldValuesParameterFormatString="original_{0}">
            <DeleteParameters>
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_Category" Type="String" />
                <asp:Parameter Name="original_Password" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_Category" Type="String" />
                <asp:Parameter Name="original_Password" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Content>
