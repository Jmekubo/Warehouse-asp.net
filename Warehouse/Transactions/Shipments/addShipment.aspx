<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addShipment.aspx.cs" Inherits="Warehouse.addShipment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 152px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="left">
        New Shipment</p>
    <p align="left">
        <asp:Button ID="btnnew" runat="server" CausesValidation="False" 
            onclick="btnnew_Click" Text="New Shipment" />
        <br />
    </p>
    <table class="style1">
        <tr>
            <td class="style2">
                Shipment 
                Start Date:</td>
            <td>
                <asp:TextBox ID="txtShipSDate" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtShipSDate" ErrorMessage="Please select Shipment start date" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RVstart" runat="server" 
                    ControlToValidate="txtShipSDate" 
                    ErrorMessage="Start ship date should be to day" ForeColor="Red" 
                    SetFocusOnError="True" Type="Date">*</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Shipment End Date:</td>
            <td>
                <asp:TextBox ID="txtShipEDate" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtShipEDate" ErrorMessage="Please select shipment end date" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RVend" runat="server" ControlToValidate="txtShipEDate" 
                    ErrorMessage="End shipment date should be within the next 10 days" 
                    ForeColor="Red" SetFocusOnError="True" Type="Date">*</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Transporter Name:</td>
            <td>
                <asp:DropDownList ID="DPLTransp" runat="server" DataSourceID="SqlDataSTransp" 
                    DataTextField="TransporterName" DataValueField="TranspID" 
                    AppendDataBoundItems="True" AutoPostBack="True" >
                    <asp:ListItem Text="Select Transporter" Value=""></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="DPLTransp" ErrorMessage="You must select Transporter" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Item Name:</td>
            <td>
                <asp:DropDownList ID="DPLItemName" runat="server" DataSourceID="SqlDataItems" 
                    DataTextField="ItemName" DataValueField="ItemID" 
                    AppendDataBoundItems="True" AutoPostBack="True">
                    <asp:ListItem Text="Select Item" Value=""></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="DPLItemName" ErrorMessage="You must select Item" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Quantity:</td>
            <td>
                <asp:TextBox ID="txtQty" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtQty" ErrorMessage="Please enter quantity to ship" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Loading Point</td>
            <td>
                <asp:TextBox ID="txtloadin" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtloadin" ErrorMessage="You must enter loading point" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Destination point</td>
            <td>
                <asp:TextBox ID="txtdestin" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtdestin" ErrorMessage="please enter destination point" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    Text="Add Shipment" />
                <br />
                <br />
                <asp:Button ID="btnaddfooditem" runat="server" 
                    PostBackUrl="~/Transactions/Shipments/Manage Shipments.aspx" 
            Text="Back to Shipments" CausesValidation="False" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                    HeaderText="Please correct the following errors to proceed:" 
                    ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDtShipment" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
        InsertCommand="INSERT INTO [shipments] ([ShipmentDate], [TranspID], [TransporterName], [ItemID], [ItemName], [Quantity], [LoadingPoint], [DestinationPoint]) VALUES (@ShipmentDate, @TranspID, @TransporterName, @ItemID, @ItemName, @Quantity, @LoadingPoint, @DestinationPoint)" 
        SelectCommand="SELECT * FROM [shipments]" 
        
        
    
        
        
        UpdateCommand="UPDATE [shipments] SET [ShipmentDate] = @ShipmentDate, [TranspID] = @TranspID, [TransporterName] = @TransporterName, [ItemID] = @ItemID, [ItemName] = @ItemName, [Quantity] = @Quantity, [LoadingPoint] = @LoadingPoint, [DestinationPoint] = @DestinationPoint WHERE [ShipID] = @ShipID" 
        DeleteCommand="DELETE FROM [shipments] WHERE [ShipID] = @ShipID">
        <DeleteParameters>
            <asp:Parameter Name="ShipID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ShipmentDate" Type="DateTime" />
            <asp:ControlParameter ControlID="DPLTransp" Name="TranspID" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DPLTransp" Name="TransporterName" 
                PropertyName="SelectedItem" Type="String" />
            <asp:ControlParameter ControlID="DPLItemName" Name="ItemID" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DPLItemName" Name="ItemName" 
                PropertyName="SelectedItem" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="LoadingPoint" Type="String" />
            <asp:Parameter Name="DestinationPoint" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ShipmentDate" Type="DateTime" />
            <asp:Parameter Name="TranspID" Type="Int32" />
            <asp:Parameter Name="TransporterName" Type="String" />
            <asp:Parameter Name="ItemID" Type="Int32" />
            <asp:Parameter Name="ItemName" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="LoadingPoint" Type="String" />
            <asp:Parameter Name="DestinationPoint" Type="String" />
            <asp:Parameter Name="ShipID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataItems" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
        SelectCommand="SELECT [ItemID], [ItemName] FROM [items] ORDER BY [ItemName]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSTransp" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
        SelectCommand="SELECT [TranspID], [TransporterName] FROM [transporters] ORDER BY [TransporterName]">
    </asp:SqlDataSource>
</asp:Content>
