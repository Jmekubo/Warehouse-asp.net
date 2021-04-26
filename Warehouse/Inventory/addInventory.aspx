<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addInventory.aspx.cs" Inherits="Warehouse.addEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        New Supplier<br />
    </p>
    <p>
        <asp:DetailsView ID="DVemployee1" runat="server" AllowPaging="True" 
            CellPadding="4" DataSourceID="SqlDtemployee" ForeColor="#333333" 
            GridLines="None" Height="50px" HorizontalAlign="Center" Width="363px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
    </p>
    <asp:SqlDataSource ID="SqlDtemployee1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbConn %>" 
        InsertCommand="INSERT INTO employees (employeeID, Firstname, Lastname, Department, Designation) VALUES (?, ?, ?, ?, ?)" 
        ProviderName="<%$ ConnectionStrings:warehousedbConn.ProviderName %>" 
        SelectCommand="SELECT * FROM employees" 
        
        
    
        
        UpdateCommand="UPDATE employees SET Firstname= ?, Lastname = ?, Department = ?, Designation = ? WHERE employeeID = ?" 
        DeleteCommand="DELETE FROM [employees] WHERE [employeeID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="employeeID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="DVemployee" Name="employeeID" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DVemployee" Name="Firstname" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVemployee" Name="Lastname" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVemployee" Name="Department" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVemployee" Name="Designation" 
                PropertyName="SelectedValue" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="DVemployee" Name="Firstname" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVemployee" Name="Lastname" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVemployee" Name="Department" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVemployee" Name="Designation" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVemployee" Name="employeeID" 
                PropertyName="SelectedValue" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
