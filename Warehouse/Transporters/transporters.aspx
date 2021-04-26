<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="transporters.aspx.cs" Inherits="Warehouse.transporters" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        <br />
        Transporters</p>
    <asp:GridView ID="GVTransp" runat="server" AllowPaging="True" 
        CellPadding="4" DataSourceID="SqlDtTransp" ForeColor="#333333" 
        GridLines="None" HorizontalAlign="Center" Width="469px" 
        onselectedindexchanged="GVTransp_SelectedIndexChanged" 
        DataKeyNames="TransporterID">
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
        <asp:SqlDataSource ID="SqlDtTransp" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbConn %>" 
            DeleteCommand="DELETE FROM transporters WHERE TransporterID= ?" 
            ProviderName="<%$ ConnectionStrings:warehousedbConn.ProviderName %>" 
            SelectCommand="SELECT * FROM transporters" 
        
        UpdateCommand="UPDATE transporters SET Transportername = ?, Address= ?, City = ?, Country = ?, PostCode = ?, PhoneNo = ?, FaxNo = ?, Email = ? WHERE TransporterID = ?">
            <DeleteParameters>
                <asp:ControlParameter ControlID="GVTransp" Name="TransporterID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="GVTransp" Name="Transportername" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="GVTransp" Name="Address" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="GVTransp" Name="City" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="GVTransp" Name="Country" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="GVTransp" Name="PostCode" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="GVTransp" Name="PhoneNo" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="GVTransp" Name="FaxNo" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="GVTransp" Name="Email" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="GVTransp" Name="TransporterID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <p>
    </p>
</asp:Content>
