<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewReceipts.aspx.cs" Inherits="Warehouse.Transactions.Receipts.viewReceipts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    View Receipts by Transporter<br />
    <br />
    <asp:DropDownList ID="ddlTransp" runat="server" AppendDataBoundItems="True" 
        AutoPostBack="True" DataSourceID="sdDDL" DataTextField="ItemName" 
        DataValueField="ItemName">
        <asp:ListItem Text="All" Value=""/>
    </asp:DropDownList>
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="RecptID" DataSourceID="sdGV" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="RecptID" HeaderText="RecptID" InsertVisible="False" 
                ReadOnly="True" SortExpression="RecptID" />
            <asp:BoundField DataField="WayBillNumber" HeaderText="WayBillNumber" 
                SortExpression="WayBillNumber" />
            <asp:BoundField DataField="OriginLocation" HeaderText="OriginLocation" 
                SortExpression="OriginLocation" />
            <asp:BoundField DataField="empID" HeaderText="empID" 
                SortExpression="empID" Visible="False" />
            <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" 
                SortExpression="EmployeeName" />
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" 
                SortExpression="ItemID" Visible="False" />
            <asp:BoundField DataField="ItemName" HeaderText="ItemName" 
                SortExpression="ItemName" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                SortExpression="Quantity" />
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" 
                SortExpression="UnitPrice" />
            <asp:BoundField DataField="Condition" HeaderText="Condition" 
                SortExpression="Condition" />
            <asp:BoundField DataField="TruckReg" HeaderText="TruckReg" 
                SortExpression="TruckReg" />
            <asp:BoundField DataField="Driversname" HeaderText="Driversname" 
                SortExpression="Driversname" />
            <asp:BoundField DataField="ReceiptDate" HeaderText="ReceiptDate" 
                SortExpression="ReceiptDate" DataFormatString="{0:d}" />
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
    <br />
    <br />
    <asp:SqlDataSource ID="sdDDL" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
        
        SelectCommand="SELECT [ItemID], [ItemName] FROM [items] ORDER BY [ItemName]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdGV" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
        SelectCommand="SELECT * FROM [receipts] WHERE ([ItemName] = @ItemName)"
        FilterExpression="TransporterName = '{0}'">
        <FilterParameters>
            <asp:ControlParameter  Name="TransporterName" ControlID="ddlTransp" PropertyName="SelectedValue" />
        </FilterParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlTransp" Name="ItemName" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
