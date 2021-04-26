<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addTruck.aspx.cs" Inherits="Warehouse.addTransporter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        New Truck<br />
    </p>
    <p>
        <asp:DetailsView ID="DVTransp" runat="server" AllowPaging="True" 
            CellPadding="4" DataSourceID="SqlDtTrucks" ForeColor="#333333" 
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
    <asp:SqlDataSource ID="SqlDtTrucks" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbConn %>" 
        InsertCommand="INSERT INTO trucks (TruckID, TruckRegNumber, TransporterID, Capacity, Drivername) VALUES (?, ?, ?, ?, ?)" 
        ProviderName="<%$ ConnectionStrings:warehousedbConn.ProviderName %>" 
        SelectCommand="SELECT TruckID, TruckRegNumber, TransporterID, Capacity, Drivername FROM trucks" 
        
        
    
        
        
        
        UpdateCommand="UPDATE trucks SET TruckRegNumber = ?, TransporterID = ?, Capacity = ?, Drivername = ? WHERE TruckID = ? AND transporters_TransporterID = ?" 
        DeleteCommand=" ?">
        <InsertParameters>
            <asp:Parameter Name="TruckID" Type="Int32" />
            <asp:Parameter Name="TruckRegNumber" Type="String" />
            <asp:Parameter Name="TransporterID" Type="Int32" />
            <asp:Parameter Name="Capacity" Type="Int32" />
            <asp:Parameter Name="Drivername" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TruckRegNumber" Type="String" />
            <asp:Parameter Name="TransporterID" Type="Int32" />
            <asp:Parameter Name="Capacity" Type="Int32" />
            <asp:Parameter Name="Drivername" Type="String" />
            <asp:Parameter Name="TruckID" Type="Int32" />
            <asp:Parameter Name="transporters_TransporterID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDtTransps" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbConn %>" 
        ProviderName="<%$ ConnectionStrings:warehousedbConn.ProviderName %>" 
        SelectCommand="SELECT TransporterID, Transportername FROM transporters">
    </asp:SqlDataSource>
</asp:Content>
