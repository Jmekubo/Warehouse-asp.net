<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersAndRoles.aspx.cs" Inherits="Warehouse.Admin.UsersAndRoles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
   
    </title>
    <style type="text/css">
        .style1
        {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <h3>Manage Roles By User</h3>
        <asp:Label ID="ActionStatus" runat="server"></asp:Label>
        <br />
        <br />
         <b>Select a User:</b> 
        <asp:DropDownList ID="UserList" runat="server" AutoPostBack="True" 
            DataTextField="UserName" DataValueField="UserName">
             
        </asp:DropDownList>
        <br />
        <br />
        <asp:Repeater ID="UsersRoleList" runat="server"> 
     <ItemTemplate> 
          <asp:CheckBox runat="server" ID="RoleCheckBox" AutoPostBack="true" 

               Text='<%# Container.DataItem %>'
                OnCheckedChanged="RoleCheckBox_CheckChanged" />
                 
          <br /> 
     </ItemTemplate> 
</asp:Repeater>
    
        <br />
        <hr />
        <strong><span class="style1">Manage Users By Role</span></strong><br />
        <br />
    
        <br />
        <asp:DropDownList ID="RoleList" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <br />
        <br />
        <asp:GridView ID="RolesUserList" runat="server" CellPadding="4" 
            ForeColor="#333333" GridLines="None"
            
            EmptyDataText="No users belong to this role.">
             
            <AlternatingRowStyle BackColor="White" />
             
            <Columns>
                
                 <asp:TemplateField HeaderText="Users"> 
                    <ItemTemplate> 
                         <asp:Label runat="server" id="UserNameLabel" 
                              Text='<%# Container.DataItem %>'></asp:Label> 

                    </ItemTemplate>
                </asp:TemplateField>
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
        <asp:TextBox ID="UserNameToAddToRole" runat="server"></asp:TextBox>
        <asp:Button ID="AddUserToRoleButton" runat="server" 
            onclick="AddUserToRoleButton_Click" Text="Add User to Role" />
    
    </div>
    </form>
</body>
</html>
