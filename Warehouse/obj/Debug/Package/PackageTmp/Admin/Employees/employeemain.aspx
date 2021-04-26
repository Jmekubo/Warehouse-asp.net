<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="employeemain.aspx.cs" Inherits="Warehouse.Admin.Employees.employeemain" %>
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
    Employees</p>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="empID" 
    DataSourceID="sdemployees" ForeColor="#333333" GridLines="None" 
    HorizontalAlign="Center">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="empID" HeaderText="empID" InsertVisible="False" 
            ReadOnly="True" SortExpression="empID" />
        <asp:TemplateField HeaderText="EmployeeName" SortExpression="EmployeeName">
            <EditItemTemplate>
                <asp:TextBox ID="txtemployee" runat="server" Text='<%# Bind("EmployeeName") %>' 
                    ReadOnly="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtemployee" ErrorMessage="employee is required" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtemployee" 
                    ErrorMessage="RegularExemployee name must be characters less than 100" 
                    ForeColor="Red" SetFocusOnError="True" 
                    ValidationExpression="^[a-zA-Z'.\s]{1,50}$">*</asp:RegularExpressionValidator>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                    ShowMessageBox="True" ShowSummary="False" />
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Department" SortExpression="Department">
            <EditItemTemplate>
                <asp:TextBox ID="txtdept" runat="server" Text='<%# Bind("Department") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtdept" ErrorMessage="Department is Required" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtdept" 
                    ErrorMessage="department must be characters less than 50" ForeColor="Red" 
                    SetFocusOnError="True" ValidationExpression="^[a-zA-Z'.\s]{1,50}$">*</asp:RegularExpressionValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Department") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Designation" SortExpression="Designation">
            <EditItemTemplate>
                <asp:TextBox ID="txtdesgn" runat="server" Text='<%# Bind("Designation") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtdesgn" ErrorMessage=" Designation is required" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtdesgn" 
                    ErrorMessage="Designation must be characters less than 50" ForeColor="Red" 
                    SetFocusOnError="True" ValidationExpression="^[a-zA-Z'.\s]{1,50}$">*</asp:RegularExpressionValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Designation") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="True" />
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
                <asp:Button ID="btnaddnew" runat="server" 
                    PostBackUrl="~/Admin/Employees/addEmployee.aspx" Text="Add employee" 
                    CausesValidation="False" />
                </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="center">
                <asp:Button ID="btnsearchemployee" runat="server" 
                    PostBackUrl="~/Admin/Employees/employees.aspx" Text="Search for employee" 
                    CausesValidation="False" />
                </td>
    </tr>
</table>
<br />
<br />
<br />
<br />
<br />
<asp:SqlDataSource ID="sdemployees" runat="server" 
    ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
    DeleteCommand="DELETE FROM [employees] WHERE [empID] = @empID" 
    InsertCommand="INSERT INTO [employees] ([EmployeeName], [Department], [Designation]) VALUES (@EmployeeName, @Department, @Designation)" 
    SelectCommand="SELECT * FROM [employees] ORDER BY [EmployeeName]" 
    UpdateCommand="UPDATE [employees] SET [EmployeeName] = @EmployeeName, [Department] = @Department, [Designation] = @Designation WHERE [empID] = @empID">
    <DeleteParameters>
        <asp:Parameter Name="empID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="EmployeeName" Type="String" />
        <asp:Parameter Name="Department" Type="String" />
        <asp:Parameter Name="Designation" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="EmployeeName" Type="String" />
        <asp:Parameter Name="Department" Type="String" />
        <asp:Parameter Name="Designation" Type="String" />
        <asp:Parameter Name="empID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
<br />
</asp:Content>
