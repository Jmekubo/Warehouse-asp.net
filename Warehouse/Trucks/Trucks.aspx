<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Trucks.aspx.cs" Inherits="Warehouse.transporters" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        <br />
        Trucks</p>
    <asp:GridView ID="GVTrucks" runat="server" AllowPaging="True" 
        CellPadding="4" DataSourceID="SqlDtTrucks" ForeColor="#333333" 
        GridLines="None" HorizontalAlign="Center" Width="469px" 
        onselectedindexchanged="GVTransp_SelectedIndexChanged" 
        DataKeyNames="TruckID">
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
        <asp:SqlDataSource ID="SqlDtTrucks" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbConn %>" 
            DeleteCommand="DELETE FROM trucks WHERE TruckID = ? AND transporters_TransporterID = ?" 
            ProviderName="<%$ ConnectionStrings:warehousedbConn.ProviderName %>" 
            SelectCommand="SELECT TruckID, TruckRegNumber, TransporterID, Capacity, Drivername FROM trucks" 
        
        
        
        UpdateCommand="UPDATE trucks SET TruckRegNumber = ?, TransporterID = ?, Capacity = ?, Drivername= ? WHERE TruckID = ? ">
            <DeleteParameters>
                <asp:ControlParameter ControlID="GVTrucks" Name="TruckID" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="GVTrucks" Name="transporters_TransporterID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="GVTrucks" Name="TruckID" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="GVTrucks" Name="TruckRegNumber" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="GVTrucks" Name="TransporterID" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="GVTrucks" Name="Capacity" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="GVTrucks" Name="Drivername" 
                    PropertyName="SelectedValue" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <p>
    </p>
</asp:Content>
