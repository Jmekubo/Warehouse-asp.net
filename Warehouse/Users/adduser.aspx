<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adduser.aspx.cs" Inherits="WarehouseMGTsys.adduser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
    NEW USER</p>
<p align="center">
    <asp:DetailsView ID="DVadduser" runat="server" 
        CellPadding="4" DataSourceID="SqlDtadduser" GridLines="None" Height="50px" 
        Width="437px" ForeColor="#333333" HorizontalAlign="Center" 
        AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:CommandField ShowInsertButton="True">
            <ItemStyle HorizontalAlign="Right" />
            </asp:CommandField>
        </Fields>
        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
</p>
        <asp:SqlDataSource ID="SqlDtadduser" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbConn %>" 
            InsertCommand="INSERT INTO users (UserID, Category, Username, Password,Email) VALUES (?, ?, ?, ?,?)" 
            ProviderName="<%$ ConnectionStrings:warehousedbConn.ProviderName %>" 
            SelectCommand="SELECT * FROM users" 
            
            
            
        
    
        UpdateCommand="UPDATE users SET Category= ?, Username= ?, Password= ? WHERE UserID = ?">
            <InsertParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="Category" />
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Email" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="DVadduser" Name="Category" 
                    PropertyName="SelectedValue" />
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="UserID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Content>
