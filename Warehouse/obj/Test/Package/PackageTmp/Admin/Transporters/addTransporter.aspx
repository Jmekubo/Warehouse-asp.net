<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addTransporter.aspx.cs" Inherits="Warehouse.addTransporter" %>
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
        New Transporter<br />
    </p>
    <p>
        <asp:DetailsView ID="DVTranspt" runat="server" AllowPaging="True" 
            CellPadding="4" DataSourceID="SqlDtTransp" ForeColor="#333333" 
            GridLines="None" Height="50px" HorizontalAlign="Center" Width="363px" 
            AutoGenerateRows="False" DataKeyNames="TranspID">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:TemplateField HeaderText="TranspID" SortExpression="TranspID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("TranspID") %>'></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TranspID") %>' 
                            Visible="False" ReadOnly="True"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("TranspID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="TransporterName" 
                    SortExpression="TransporterName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TransporterName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtTransp" runat="server" 
                            Text='<%# Bind("TransporterName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtTransp" ErrorMessage="Transporter name is Required" 
                            ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtTransp" 
                            ErrorMessage=" Transporter name must be characters less than100" 
                            ForeColor="Red" ValidationExpression="^[a-zA-Z'.\s]{1,100}$">*</asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("TransporterName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address" SortExpression="Address">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtxaddress" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtxaddress" ErrorMessage="Address is Required" 
                            ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToValidate="txtxaddress" ErrorMessage="Address should be an integer " 
                            ForeColor="Red" Operator="GreaterThan" Type="Integer" ValueToCompare="0">*</asp:CompareValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City" SortExpression="City">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtCity" ErrorMessage="City is Required" ForeColor="Red" 
                            SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="txtCity" 
                            ErrorMessage="City should be characters less than 50" ForeColor="Red" 
                            SetFocusOnError="True" ValidationExpression="^[a-zA-Z'.\s]{1,50}$">*</asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Country" SortExpression="Country">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtcountry" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txtcountry" ErrorMessage="Country is required" 
                            ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            ControlToValidate="txtcountry" 
                            ErrorMessage="Country should be in characters less than 50" ForeColor="Red" 
                            SetFocusOnError="True" ValidationExpression="^[a-zA-Z'.\s]{1,100}$">*</asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PostCode" SortExpression="PostCode">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("PostCode") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtPcode" runat="server" Text='<%# Bind("PostCode") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtPcode" ErrorMessage="Post code is Required" 
                            ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" 
                            ControlToValidate="txtPcode" 
                            ErrorMessage="Post code should be an integer greater than 0" ForeColor="Red" 
                            Operator="GreaterThan" Type="Integer" ValueToCompare="0">*</asp:CompareValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("PostCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtphone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="txtphone" ErrorMessage="Phone no is required" 
                            ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator3" runat="server" 
                            ControlToValidate="txtphone" ErrorMessage="Phone number should be an integer" 
                            ForeColor="Red" Operator="GreaterThan" Type="Integer" ValueToCompare="0">*</asp:CompareValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtemail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="txtemail" ErrorMessage="email is Required" ForeColor="Red" 
                            SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                            ControlToValidate="txtemail" ErrorMessage="Please enter valid email" 
                            ForeColor="Red" SetFocusOnError="True" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                            HeaderText="Please correct the following errors before proceeding:" 
                            ShowMessageBox="True" ShowSummary="False" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
    </p>
    <table class="style1">
        <tr>
            <td align="center">
                <asp:Button ID="addtrans" runat="server" 
                    PostBackUrl="~/Admin/Transporters/transporters.aspx" 
                    Text="Back to Transporters" />
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDtTransp" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
        InsertCommand="INSERT INTO [transporters] ([TransporterName], [Address], [City], [Country], [PostCode], [Phone], [Email]) VALUES (@TransporterName, @Address, @City, @Country, @PostCode, @Phone, @Email)" 
        SelectCommand="SELECT * FROM [transporters]" 
        
        
    
        
        
        
        UpdateCommand="UPDATE [transporters] SET [TransporterName] = @TransporterName, [Address] = @Address, [City] = @City, [Country] = @Country, [PostCode] = @PostCode, [Phone] = @Phone, [Email] = @Email WHERE [TranspID] = @TranspID" 
        DeleteCommand="DELETE FROM [transporters] WHERE [TranspID] = @TranspID">
        <DeleteParameters>
            <asp:Parameter Name="TranspID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
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
</asp:Content>
