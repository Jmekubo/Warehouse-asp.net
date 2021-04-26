<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addSupplier.aspx.cs" Inherits="Warehouse.addSupplier" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        New Supplier<br />
    </p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            CellPadding="4" DataSourceID="SqlDtSuppliers" ForeColor="#333333" 
            GridLines="None" Height="50px" HorizontalAlign="Center" Width="363px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:CommandField ShowInsertButton="True" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:CommandField>
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
    </p>
    <asp:SqlDataSource ID="SqlDtSuppliers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbConn %>" 
        InsertCommand="INSERT INTO suppliers (SupplierID, Suppliername, Address, City, Country, Postcode, PhoneNo, FaxNo, Email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        ProviderName="<%$ ConnectionStrings:warehousedbConn.ProviderName %>" 
        SelectCommand="SELECT * FROM suppliers" 
        
        
    
        UpdateCommand="UPDATE suppliers SETSuppliername] = ?, Address = ?, City = ?, Country = ?, Postcode = ?, PhoneNo = ?, FaxNo = ?, Email= ? WHERE SupplierID= ?">
        <InsertParameters>
            <asp:Parameter Name="SupplierID" Type="Int32" />
            <asp:Parameter Name="Suppliername" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="Postcode" Type="Int32" />
            <asp:Parameter Name="PhoneNo" Type="String" />
            <asp:Parameter Name="FaxNo" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="DetailsView1" Name="Suppliername" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DetailsView1" Name="Address" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DetailsView1" Name="City" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DetailsView1" Name="Country" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DetailsView1" Name="Postcode" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DetailsView1" Name="PhoneNo" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DetailsView1" Name="FaxNo" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DetailsView1" Name="Email" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DetailsView1" Name="SupplierID" 
                PropertyName="SelectedValue" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
