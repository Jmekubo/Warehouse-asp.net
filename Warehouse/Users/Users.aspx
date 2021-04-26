<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Warehouse.Users" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        <br />
        USERS</p>
    <asp:GridView ID="GDVUsers" runat="server" AllowPaging="True" CellPadding="4" 
        DataKeyNames="UserID" DataSourceID="SqlDtUsers" ForeColor="#333333" 
        GridLines="None" HorizontalAlign="Center" Width="469px" 
        onselectedindexchanged="GDVUsers_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
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
        <asp:SqlDataSource ID="SqlDtUsers" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbConn %>" 
            DeleteCommand="DELETE FROM users WHERE (UserID = @UserID)" 
            ProviderName="<%$ ConnectionStrings:warehousedbConn.ProviderName %>" 
            SelectCommand="SELECT * FROM users">
            <DeleteParameters>
                <asp:ControlParameter ControlID="GDVUsers" Name="UserID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
    <p>
    </p>
</asp:Content>
