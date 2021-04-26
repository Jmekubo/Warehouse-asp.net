<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="searchloss.aspx.cs" Inherits="Warehouse.Transactions.Losses.searchloss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;</p>
    <p>
        Select Item to search</p>
    <p>
        <asp:DropDownList ID="ddlitems" runat="server" AppendDataBoundItems="True" 
            AutoPostBack="True" DataSourceID="sditems" DataTextField="ItemName" 
            DataValueField="ItemID">
            <asp:ListItem Text="All" Value="" />
        </asp:DropDownList>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="LossID" DataSourceID="sdLoss" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="LossID" HeaderText="LossID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="LossID" />
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" 
                    SortExpression="ItemID" />
                <asp:BoundField DataField="LossType" HeaderText="LossType" 
                    SortExpression="LossType" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                    SortExpression="Quantity" />
                <asp:BoundField DataField="Reason" HeaderText="Reason" 
                    SortExpression="Reason" />
                <asp:BoundField DataField="LossDate" DataFormatString="{0:d}" 
                    HeaderText="LossDate" SortExpression="LossDate" />
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
    </p>
    <p>
        <asp:SqlDataSource ID="sdLoss" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            SelectCommand="SELECT  FROM [losses]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="sditems" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            SelectCommand="SELECT [ItemID], [ItemName] FROM [items] ORDER BY [ItemName]">
        </asp:SqlDataSource>
    </p>
    <p>
    </p>
</asp:Content>
