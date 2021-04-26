<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addTransporter.aspx.cs" Inherits="Warehouse.addTransporter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        New Transporter<br />
    </p>
    <p>
        <asp:DetailsView ID="DVTranspt" runat="server" AllowPaging="True" 
            CellPadding="4" DataSourceID="SqlDtTransp" ForeColor="#333333" 
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
    <asp:SqlDataSource ID="SqlDtTransp" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbConn %>" 
        InsertCommand="INSERT INTO transporters (TransporterID, Transportername, Address, City, Country, PostCode, PhoneNo, FaxNo, Email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        ProviderName="<%$ ConnectionStrings:warehousedbConn.ProviderName %>" 
        SelectCommand="SELECT * FROM transporters" 
        
        
    
        
        
        UpdateCommand="UPDATE transporters SET Transportername = ?, Address = ?, City = ?, Country= ?, PostCode = ?, PhoneNo = ?, FaxNo = ?, Email = ? WHERE TransporterID = ?">
        <InsertParameters>
            <asp:ControlParameter ControlID="DVTransp" Name="TransporterID" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DVTransp" Name="Transportername" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVTransp" Name="Address" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVTransp" Name="City" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVTransp" Name="Country" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVTransp" Name="PostCode" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVTransp" Name="PhoneNo" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVTransp" Name="FaxNo" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVTransp" Name="Email" 
                PropertyName="SelectedValue" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="DVTransp" Name="Transportername" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVTransp" Name="Address" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVTransp" Name="City" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVTransp" Name="Country" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVTransp" Name="PostCode" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVTransp" Name="PhoneNo" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVTransp" Name="FaxNo" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVTransp" Name="Email" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DVTransp" Name="TransporterID" 
                PropertyName="SelectedValue" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
