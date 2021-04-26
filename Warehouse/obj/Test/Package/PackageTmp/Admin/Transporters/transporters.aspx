<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="transporters.aspx.cs" Inherits="Warehouse.transporters" %>



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
        Transporters</p>
    <asp:GridView ID="GVTransp" runat="server" AllowPaging="True" 
        CellPadding="4" DataSourceID="SqlDtTransp" ForeColor="#333333" 
        GridLines="None" HorizontalAlign="Center" Width="469px" 
        onselectedindexchanged="GVTransp_SelectedIndexChanged" 
        DataKeyNames="TranspID" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="TranspID" HeaderText="TranspID" ReadOnly="True" 
                SortExpression="TranspID" />
            <asp:TemplateField HeaderText="TransporterName" 
                SortExpression="TransporterName">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("TransporterName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" 
                        Text='<%# Bind("TransporterName") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" SortExpression="Address">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtaddress" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtaddress" ErrorMessage="you must enter address" 
                        ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToValidate="txtaddress" 
                        ErrorMessage="address must integer greater than 0" ForeColor="Red" 
                        Operator="GreaterThan" Type="Integer" ValueToCompare="0">*</asp:CompareValidator>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                        HeaderText="Please make this corrections before proceeding" 
                        ShowMessageBox="True" ShowSummary="False" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="City">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" 
                        Text='<%# Bind("City") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Country" SortExpression="Country">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True" 
                        Text='<%# Bind("Country") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PostCode" SortExpression="PostCode">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("PostCode") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtPCode" runat="server" Text='<%# Bind("PostCode") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtPCode" 
                        ErrorMessage="Postcode must be inter greater that 0" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" 
                        ControlToValidate="txtPCode" ErrorMessage="postcode must be numbers" ForeColor="Red" 
                        Operator="GreaterThan" Type="Integer" ValueToCompare="0">*</asp:CompareValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtPhone" ErrorMessage="Phone no is Required" 
                        ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator3" runat="server" 
                        ControlToValidate="txtPhone" 
                        ErrorMessage="phone number should be  greater than 0" ForeColor="Red" 
                        Operator="GreaterThan" Type="Integer" ValueToCompare="0">*</asp:CompareValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtemail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtemail" ErrorMessage="Email is Required" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtemail" ErrorMessage="Please enter valid email" 
                        ForeColor="Red" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
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
    <br />
    <table class="style1">
        <tr>
            <td align="center">
                <asp:Button ID="btnaddnewtransp" runat="server" 
                    PostBackUrl="~/Admin/Transporters/addTransporter.aspx" 
                    Text="Add New Transporter" />
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                    PostBackUrl="~/Admin/Transporters/searchTransporter.aspx" 
                    Text="Search for transporter" />
                <br />
                <br />
                </td>
        </tr>
    </table>
    <br />
        <asp:SqlDataSource ID="SqlDtTransp" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            DeleteCommand="DELETE FROM [transporters] WHERE [TranspID] = @TranspID" 
            SelectCommand="SELECT * FROM [transporters]" 
        
        
        UpdateCommand="UPDATE [transporters] SET [TransporterName] = @TransporterName, [Address] = @Address, [City] = @City, [Country] = @Country, [PostCode] = @PostCode, [Phone] = @Phone, [Email] = @Email WHERE [TranspID] = @TranspID" 
        InsertCommand="INSERT INTO [transporters] ([TranspID], [TransporterName], [Address], [City], [Country], [PostCode], [Phone], [Email]) VALUES (@TranspID, @TransporterName, @Address, @City, @Country, @PostCode, @Phone, @Email)">
            <DeleteParameters>
                <asp:Parameter Name="TranspID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TranspID" Type="Int32" />
                <asp:Parameter Name="TransporterName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="PostCode" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TransporterName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="PostCode" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="TranspID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <p>
    </p>
</asp:Content>
