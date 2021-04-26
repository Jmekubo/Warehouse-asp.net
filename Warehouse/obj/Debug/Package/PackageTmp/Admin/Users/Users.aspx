<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Warehouse.Admin.Users.Users" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        User List<br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataSourceID="sdausers" 
            ForeColor="#333333" GridLines="None" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                    Visible="False" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" 
                    SortExpression="UserName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="LastLoginDate" DataFormatString="{0:d}" 
                    HeaderText="LastLoginDate" SortExpression="LastLoginDate" />
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
    
    </div>
    <asp:SqlDataSource ID="sdausers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
        SelectCommand="SELECT aspnet_Users.UserId, aspnet_Users.UserName, aspnet_Membership.Email, aspnet_Membership.LastLoginDate FROM aspnet_Membership INNER JOIN aspnet_Users ON aspnet_Membership.UserId = aspnet_Users.UserId">
    </asp:SqlDataSource>
    </form>
</body>
</html>
