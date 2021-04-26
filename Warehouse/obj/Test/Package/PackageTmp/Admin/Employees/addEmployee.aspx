<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addEmployee.aspx.cs" Inherits="Warehouse.addEmployee" %>
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
        New Employee<br />
    </p>
    <p>
        <asp:DetailsView ID="DVemployee" runat="server" AllowPaging="True" 
            CellPadding="4" DataSourceID="SqlDtemployee" ForeColor="#333333" 
            GridLines="None" Height="50px" HorizontalAlign="Center" Width="363px" 
            AutoGenerateRows="False" DataKeyNames="empID">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="empID" HeaderText="empID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="empID" />
                <asp:TemplateField HeaderText="EmployeeName" SortExpression="EmployeeName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtemployee" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFEmployee" runat="server" 
                            ControlToValidate="txtemployee" ErrorMessage="Employee name is required" 
                            ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtemployee" 
                            ErrorMessage="Employee Name should be characters less than 100" ForeColor="Red" 
                            SetFocusOnError="True" ValidationExpression="^[a-zA-Z'.\s]{1,100}$">*</asp:RegularExpressionValidator>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                            HeaderText="Please correct the following errors before proceeding:" 
                            ShowMessageBox="True" ShowSummary="False" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Department" SortExpression="Department">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Department") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtdpt" runat="server" Text='<%# Bind("Department") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFdpt" runat="server" 
                            ControlToValidate="txtdpt" ErrorMessage="department is required" 
                            ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="REVdpt" runat="server" 
                            ControlToValidate="txtdpt" 
                            ErrorMessage="department should be characters less than 50" ForeColor="Red" 
                            SetFocusOnError="True" ValidationExpression="^[a-zA-Z'.\s]{1,50}$">*</asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Department") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Designation" SortExpression="Designation">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Designation") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="desgn" runat="server" Text='<%# Bind("Designation") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="desgn" ErrorMessage="Designation is required" 
                            ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="desgn" 
                            ErrorMessage="designation should be characters less than 50" ForeColor="Red" 
                            SetFocusOnError="True" ValidationExpression="^[a-zA-Z'.\s]{1,50}$">*</asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Designation") %>'></asp:Label>
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
                <asp:Button ID="btnemployee" runat="server" 
                    PostBackUrl="~/Admin/Employees/employeemain.aspx" Text="Back to Employees" 
                    CausesValidation="False" />
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDtemployee" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
        InsertCommand="INSERT INTO [employees] ([EmployeeName], [Department], [Designation]) VALUES (@EmployeeName, @Department, @Designation)" 
        SelectCommand="SELECT * FROM [employees]" 
        
        
    
        
        
        UpdateCommand="UPDATE [employees] SET [EmployeeName] = @EmployeeName, [Department] = @Department, [Designation] = @Designation WHERE [empID] = @empID">
        <InsertParameters>
            <asp:Parameter Name="EmployeeName" Type="String" />
         
            <asp:Parameter Name="Department" Type="String" />
            <asp:Parameter Name="Designation" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmployeeNam" Type="String" />
      
            <asp:Parameter Name="Department" Type="String" />
            <asp:Parameter Name="Designation" Type="String" />
            <asp:Parameter Name="empID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
