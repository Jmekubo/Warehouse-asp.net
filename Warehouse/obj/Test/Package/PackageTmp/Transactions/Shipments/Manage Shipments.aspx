<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage Shipments.aspx.cs" Inherits="Warehouse.Shipments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        Shipments<br />
    </p>
    <p align="center">
        <asp:GridView ID="GVShipments" runat="server" CellPadding="4" 
            DataSourceID="SqlDtShipments" AllowPaging="True" ForeColor="#333333" 
            GridLines="None" HorizontalAlign="Center" Width="626px" 
            
            SortedDescendingCellStyle-VerticalAlign="Bottom" 
            AutoGenerateColumns="False" DataKeyNames="ShipID">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ShipID" HeaderText="ShipID" 
                    SortExpression="ShipID" InsertVisible="False" ReadOnly="True" />
                <asp:TemplateField HeaderText="ShipmentStartDate" 
                    SortExpression="ShipmentStartDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" 
                            Text='<%# Bind("ShipmentStartDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" 
                            Text='<%# Bind("ShipmentStartDate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ShipmentEndDate" 
                    SortExpression="ShipmentEndDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ShipmentEndDate") %>' 
                            TextMode="Date"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" 
                            Text='<%# Bind("ShipmentEndDate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="TranspID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TranspID") %>' 
                            Visible="False"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("TranspID") %>' 
                            Visible="False"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="TransporterName" 
                    SortExpression="TransporterName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" ReadOnly="True" 
                            Text='<%# Bind("TransporterName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("TransporterName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="ItemID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ItemID") %>' 
                            Visible="False"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ItemID") %>' 
                            Visible="False"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ItemName" SortExpression="ItemName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" ReadOnly="True" 
                            Text='<%# Bind("ItemName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtqty" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtqty" ErrorMessage="Quantity is required" ForeColor="Red" 
                            SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" 
                            ControlToValidate="txtqty" 
                            ErrorMessage="Quantity should be integer between 7 and 1000" ForeColor="Red" 
                            MaximumValue="1000" MinimumValue="7" Type="Integer">*</asp:RangeValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LoadingPoint" SortExpression="LoadingPoint">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtloading" runat="server" Text='<%# Bind("LoadingPoint") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtloading" ErrorMessage="Loading point is required" 
                            ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtloading" 
                            ErrorMessage="Loading point must be in characters less than 50" ForeColor="Red" 
                            SetFocusOnError="True" ValidationExpression="^[a-zA-Z'.\s]{1,50}$">*</asp:RegularExpressionValidator>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                            HeaderText="Please correct this errors before proceeding:" 
                            ShowMessageBox="True" ShowSummary="False" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("LoadingPoint") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DestinationPoint" 
                    SortExpression="DestinationPoint">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtdestn" runat="server" 
                            Text='<%# Bind("DestinationPoint") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtdestn" ErrorMessage="Destination point is Required" 
                            ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="txtdestn" 
                            ErrorMessage="Destination should be characters less than 50" ForeColor="Red" 
                            ValidationExpression="^[a-zA-Z'.\s]{1,50}$">*</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("DestinationPoint") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
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
    <p align="center">
                <asp:Button ID="btnaddfooditem" runat="server" 
                    PostBackUrl="~/Transactions/Shipments/addShipment.aspx" 
            Text="New Shipment" />
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDtShipments" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            SelectCommand="SELECT * FROM [shipments]" 
            DeleteCommand="DELETE FROM [shipments] WHERE [ShipID] = @ShipID" 
            InsertCommand="INSERT INTO [shipments] ([ShipmentStartDate], [ShipmentEndDate], [TranspID], [TransporterName], [ItemID], [ItemName], [Quantity], [LoadingPoint], [DestinationPoint]) VALUES (@ShipmentStartDate, @ShipmentEndDate, @TranspID, @TransporterName, @ItemID, @ItemName, @Quantity, @LoadingPoint, @DestinationPoint)" 
            UpdateCommand="UPDATE [shipments] SET [ShipmentStartDate] = @ShipmentStartDate, [ShipmentEndDate] = @ShipmentEndDate, [TranspID] = @TranspID, [TransporterName] = @TransporterName, [ItemID] = @ItemID, [ItemName] = @ItemName, [Quantity] = @Quantity, [LoadingPoint] = @LoadingPoint, [DestinationPoint] = @DestinationPoint WHERE [ShipID] = @ShipID">
            <DeleteParameters>
                <asp:Parameter Name="ShipID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ShipmentStartDate" Type="DateTime" />
                <asp:Parameter Name="ShipmentEndDate" Type="DateTime" />
                <asp:Parameter Name="TranspID" Type="Int32" />
                <asp:Parameter Name="TransporterName" Type="String" />
                <asp:Parameter Name="ItemID" Type="Int32" />
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="LoadingPoint" Type="String" />
                <asp:Parameter Name="DestinationPoint" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ShipmentStartDate" Type="DateTime" />
                <asp:Parameter Name="ShipmentEndDate" Type="DateTime" />
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
        <asp:SqlDataSource ID="SqlDataSourceTransp" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            SelectCommand="SELECT [TranspID], [TransporterName] FROM [transporters] ORDER BY [TransporterName]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceItems" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            SelectCommand="SELECT [ItemID], [ItemName] FROM [items] ORDER BY [ItemName]">
        </asp:SqlDataSource>
    </p>
</asp:Content>
