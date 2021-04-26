<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShipmentByTransporter.aspx.cs" Inherits="Warehouse.Shipments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        View
        Shipments By Transporter</p>
    <p align="center">
        Please select Transporter Name&nbsp;&nbsp;
        <asp:DropDownList ID="ddltransp" runat="server" DataSourceID="SqlDataSource1" 
            DataTextField="TransporterName" DataValueField="TranspID">
        </asp:DropDownList>
    </p>
    <p align="center">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            SelectCommand="SELECT [TranspID], [TransporterName] FROM [transporters] ORDER BY [TransporterName]">
        </asp:SqlDataSource>
        <br />
    </p>
    <p align="center">
        <asp:GridView ID="GVShip" runat="server" CellPadding="4" 
            DataSourceID="dsshipment" AllowPaging="True" ForeColor="#333333" 
            GridLines="None" HorizontalAlign="Center" Width="626px" 
            
            SortedDescendingCellStyle-VerticalAlign="Bottom" 
            AutoGenerateColumns="False" DataKeyNames="ShipID,TranspID,ItemID">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ShipID" HeaderText="ShipID" 
                    SortExpression="ShipID" InsertVisible="False" ReadOnly="True" />
                <asp:TemplateField HeaderText="ShipmentDate" SortExpression="ShipmentDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ShipmentDate") %>' 
                            ReadOnly="True"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" 
                            Text='<%# Bind("ShipmentDate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="TranspID" HeaderText="TranspID" 
                    SortExpression="TranspID" Visible="False" />
                <asp:TemplateField HeaderText="TransporterName" 
                    SortExpression="TransporterName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True" 
                            Text='<%# Bind("TransporterName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("TransporterName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" 
                    Visible="False" />
                <asp:TemplateField HeaderText="ItemName" SortExpression="ItemName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" 
                            Text='<%# Bind("ItemName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVQty" runat="server" 
                            ControlToValidate="txtQty" ErrorMessage="You must enter qty in MT" 
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToValidate="txtQty" ErrorMessage="Qty must be integer greater than 10" 
                            ForeColor="Red" Operator="GreaterThan" SetFocusOnError="True" Type="Integer" 
                            ValueToCompare="10">*</asp:CompareValidator>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                            HeaderText="Correct this errors before proceeding:" ShowMessageBox="True" 
                            ShowSummary="False" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LoadingPoint" SortExpression="LoadingPoint">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtloadin" runat="server" Text='<%# Bind("LoadingPoint") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtloadin" ErrorMessage="Loading point is required" 
                            ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" 
                            ControlToValidate="txtloadin" 
                            ErrorMessage="Loading point must be in aphabetical characters only." 
                            ForeColor="Red" Operator="DataTypeCheck" SetFocusOnError="True">*</asp:CompareValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtloadin" 
                            ErrorMessage="Loading point should be valid characters less than 50" 
                            ForeColor="#FF3300" ValidationExpression="^[a-zA-Z'.\s]{1,50}$">*</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("LoadingPoint") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DestinationPoint" 
                    SortExpression="DestinationPoint">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtdestin" runat="server" 
                            Text='<%# Bind("DestinationPoint") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtdestin" ErrorMessage="Destination point is required" 
                            ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator3" runat="server" 
                            ControlToValidate="txtdestin" 
                            ErrorMessage="Destination should contain aphabetical characters only" 
                            ForeColor="Red" Operator="DataTypeCheck" SetFocusOnError="True">*</asp:CompareValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="txtdestin" 
                            ErrorMessage="Destination should be valid characters less than 50" 
                            ForeColor="Red" ValidationExpression="^[a-zA-Z'.\s]{1,50}$">*</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("DestinationPoint") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
                &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="dsshipment" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            SelectCommand="SELECT * FROM [shipments] WHERE ([TransporterName] = @TransporterName)" 
            DeleteCommand="DELETE FROM [shipments] WHERE [ShipID] = @ShipID" 
            InsertCommand="INSERT INTO [shipments] ([ShipmentDate], [TranspID], [TransporterName], [ItemID], [ItemName], [Quantity], [LoadingPoint], [DestinationPoint]) VALUES (@ShipmentDate, @TranspID, @TransporterName, @ItemID, @ItemName, @Quantity, @LoadingPoint, @DestinationPoint)" 
            
            UpdateCommand="UPDATE [shipments] SET [ShipmentDate] = @ShipmentDate, [TranspID] = @TranspID, [TransporterName] = @TransporterName, [ItemID] = @ItemID, [ItemName] = @ItemName, [Quantity] = @Quantity, [LoadingPoint] = @LoadingPoint, [DestinationPoint] = @DestinationPoint WHERE [ShipID] = @ShipID">
            <DeleteParameters>
                <asp:Parameter Name="ShipID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ShipmentDate" Type="DateTime" />
                <asp:Parameter Name="TranspID" Type="Int32" />
                <asp:Parameter Name="TransporterName" Type="String" />
                <asp:Parameter Name="ItemID" Type="Int32" />
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="LoadingPoint" Type="String" />
                <asp:Parameter Name="DestinationPoint" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddltransp" Name="TransporterName" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
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
    </p>
</asp:Content>
