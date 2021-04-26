<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shipments.aspx.cs" Inherits="Warehouse.Shipments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        Shipments<br />
    </p>
    <p align="center">
        <asp:GridView ID="GVShipmentss" runat="server" CellPadding="4" 
            DataSourceID="SqlDtShipmentss" AllowPaging="True" ForeColor="#333333" 
            GridLines="None" HorizontalAlign="Center" Width="626px" 
            
            SortedDescendingCellStyle-VerticalAlign="Bottom" 
            AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ShipmentStartDate" HeaderText="ShipmentStartDate" 
                    SortExpression="ShipmentStartDate" DataFormatString="{0:d}" />
                <asp:BoundField DataField="ShipmentEndDate" HeaderText="ShipmentEndDate" 
                    SortExpression="ShipmentEndDate" DataFormatString="{0:d}" />
                <asp:BoundField DataField="TranspID" HeaderText="TranspID" 
                    SortExpression="TranspID" Visible="False" />
                <asp:BoundField DataField="TransporterName" HeaderText="TransporterName" 
                    SortExpression="TransporterName" />
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" 
                    SortExpression="ItemID" Visible="False" />
                <asp:BoundField DataField="ItemName" HeaderText="ItemName" 
                    SortExpression="ItemName" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                    SortExpression="Quantity" />
                <asp:BoundField DataField="LoadingPoint" HeaderText="LoadingPoint" 
                    SortExpression="LoadingPoint" />
                <asp:BoundField DataField="DestinationPoint" HeaderText="DestinationPoint" 
                    SortExpression="DestinationPoint" />
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
        <asp:SqlDataSource ID="SqlDtShipmentss" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            SelectCommand="SELECT * FROM [View_Shipments] ORDER BY [TransporterName]">
        </asp:SqlDataSource>
    </p>
</asp:Content>
