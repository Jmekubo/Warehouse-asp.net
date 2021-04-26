<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="employees.aspx.cs" Inherits="Warehouse.employees" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        <br />
        Employees</p>
    <asp:GridView ID="GVemployees" runat="server" AllowPaging="True" 
        CellPadding="4" DataSourceID="SqlDtemployees" ForeColor="#333333" 
        GridLines="None" HorizontalAlign="Center" Width="469px" 
        onselectedindexchanged="GVemployees_SelectedIndexChanged" 
        DataKeyNames="employeeID">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
        <asp:SqlDataSource ID="SqlDtemployees" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbConn %>" 
            DeleteCommand="DELETE FROM employees WHERE employeeID = ?" 
            ProviderName="<%$ ConnectionStrings:warehousedbConn.ProviderName %>" 
            SelectCommand="SELECT * FROM employees" 
        UpdateCommand="UPDATE employees SET Firstname = ?, Lastname = ?, Department = ?, Designation= ? WHERE employeeID = ?">
            <DeleteParameters>
                <asp:ControlParameter ControlID="GVemployees" Name="employeeID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="GVemployees" Name="Firstname" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="GVemployees" Name="Lastname" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="GVemployees" Name="Department" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="GVemployees" Name="Designation" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="GVemployees" Name="employeeID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <p>
    </p>
</asp:Content>
