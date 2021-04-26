<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Suppliers.aspx.cs" Inherits="Warehouse.Suppliers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        Suppliers<br />
    </p>
    <p align="center">
        <asp:GridView ID="GVSuppliers" runat="server" CellPadding="4" 
            DataSourceID="SqlDtSuppliers" AllowPaging="True" ForeColor="#333333" 
            GridLines="None" HorizontalAlign="Center" Width="626px" 
            DataKeyNames="SupplierID" 
            onselectedindexchanged="GVSuppliers_SelectedIndexChanged" SortedDescendingCellStyle-VerticalAlign="Bottom">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
           
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDtSuppliers" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbConn %>" 
            DeleteCommand="DELETE FROM suppliers WHERE (SupplierID = @SupplierID)" 
            ProviderName="<%$ ConnectionStrings:warehousedbConn.ProviderName %>" 
            SelectCommand="SELECT * FROM suppliers" 
            
            
            UpdateCommand="UPDATE suppliers SET Suppliername = @Suppliername, Address = @Address, City= @City, Country = @Country, Postcode = @Postcode, PhoneNo = @PhoneNo, FaxNo = @FaxNo, Email =@Email WHERE SupplierID = @SupplierID">
            <DeleteParameters>
                <asp:ControlParameter ControlID="GVSuppliers" Name="SupplierID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Suppliername" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Postcode" Type="Int32" />
                <asp:Parameter Name="PhoneNo" Type="String" />
                <asp:Parameter Name="FaxNo" Type="String" />
                <asp:Parameter Name="SupplierID" Type="Int32" />
                <asp:Parameter Name="Email" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
