<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Trucks.aspx.cs" Inherits="Warehouse.transporters" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        <br />
        Trucks</p>
    <asp:GridView ID="GVTrucks" runat="server" AllowPaging="True" 
        CellPadding="4" DataSourceID="SqlDtTrucks" ForeColor="#333333" 
        GridLines="None" HorizontalAlign="Center" Width="469px" 
        onselectedindexchanged="GVTransp_SelectedIndexChanged" 
        DataKeyNames="TruckID" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="TruckID" HeaderText="TruckID" InsertVisible="False" 
                ReadOnly="True" SortExpression="TruckID" />
                
            <asp:TemplateField HeaderText="Registration" SortExpression="Registration">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Registration") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True" 
                        Text='<%# Bind("Registration") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TranspID" SortExpression="TranspID">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("TranspID") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" 
                        Text='<%# Bind("TranspID") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Capacity" SortExpression="Capacity">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Capacity") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtCapacity" runat="server" Text='<%# Bind("Capacity") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtCapacity" 
                        ErrorMessage="You must enter truck capacity in tonnes" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ControlToValidate="txtCapacity" 
                        ErrorMessage="capacity should be between 7 and 50 tonnes" ForeColor="Red" 
                        MaximumValue="50" MinimumValue="7" Type="Integer">*</asp:RangeValidator>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                        ShowMessageBox="True" ShowSummary="False" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DriversName" SortExpression="DriversName">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("DriversName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtdriver" runat="server" Text='<%# Bind("DriversName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtdriver" ErrorMessage="You must enter driver name" 
                        ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" 
                        ControlToValidate="txtdriver" ErrorMessage="name must be in characters" 
                        ForeColor="Red" Operator="DataTypeCheck">*</asp:CompareValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    &nbsp;<%--ADD THE DELETE LINK BUTTON--%><asp:LinkButton ID="LinkButton1" 
                        runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" 
                        OnClientClick="return confirm('Are you sure you want to delete this Truck?');">Delete</asp:LinkButton>
                </ItemTemplate>
               
               
                
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>
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
    <table class="style1">
        <tr>
            <td align="center">
                <asp:Button ID="btnadd" runat="server" CausesValidation="False" 
                    PostBackUrl="~/Transporters/Trucks/addTruck.aspx" Text="Add new truck" />
            </td>
        </tr>
    </table>
    <br />
    <br />
        <asp:SqlDataSource ID="SqlDtTrucks" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            DeleteCommand="DELETE FROM [trucks] WHERE [TruckID] = @TruckID" 
            SelectCommand="SELECT trucks.TruckID, trucks.Registration, trucks.TranspID, trucks.Capacity, trucks.DriversName, transporters.TransporterName FROM trucks INNER JOIN transporters ON trucks.TranspID = transporters.TranspID" 
        
        
        
        
        UpdateCommand="UPDATE [trucks] SET [Registration] = @Registration, [TranspID] = @TranspID, [Capacity] = @Capacity, [DriversName] = @DriversName WHERE [TruckID] = @TruckID" 
        
        InsertCommand="INSERT INTO [trucks] ([Registration], [TranspID], [Capacity], [DriversName]) VALUES (@Registration, @TranspID, @Capacity, @DriversName)">
            <DeleteParameters>
                <asp:Parameter Name="TruckID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Registration" Type="String" />
                <asp:Parameter Name="TranspID" Type="Int32" />
                <asp:Parameter Name="Capacity" Type="Int32" />
                <asp:Parameter Name="DriversName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Registration" Type="String" />
                <asp:Parameter Name="TranspID" Type="Int32" />
                <asp:Parameter Name="Capacity" Type="Int32" />
                <asp:Parameter Name="DriversName" Type="String" />
                <asp:Parameter Name="TruckID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <p>
    </p>
</asp:Content>
