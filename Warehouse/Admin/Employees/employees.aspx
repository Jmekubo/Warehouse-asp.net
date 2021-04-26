<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="employees.aspx.cs" Inherits="Warehouse.employees" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style3
        {
            width: 273px;
        }
        .style4
        {
            height: 21px;
        }
        .style5
        {
            width: 273px;
            height: 21px;
        }
        .style6
        {
            height: 21px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="center">
        <br />
        Employees</p>
    <asp:GridView ID="GVemployees" runat="server" AllowPaging="True" 
        CellPadding="4" DataSourceID="sdemployee" ForeColor="#333333" 
        GridLines="None" HorizontalAlign="Center" Width="469px" 
       
        DataKeyNames="empID" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
             
                
            <asp:BoundField DataField="empID" HeaderText="empID" InsertVisible="False" 
                ReadOnly="True" SortExpression="empID" />
            <asp:TemplateField HeaderText="EmployeeName" SortExpression="EmployeeName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="100" ReadOnly="True" 
                        Text='<%# Bind("EmployeeName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
         
            <asp:BoundField DataField="Department" HeaderText="Department" 
                SortExpression="Department" />
            <asp:BoundField DataField="Designation" HeaderText="Designation" 
                SortExpression="Designation" />
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
    <table align="center" class="style1" width="480">
        <tr>
            <td class="style4" align="center">
                Select employee name to search</td>
        </tr>
        <tr>
            <td class="style2" align="center">
                <asp:TextBox ID="txtemployee" runat="server" Height="18px" Width="261px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtemployee" 
                    ErrorMessage="You must enter employee name to search" ForeColor="Red" 
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtemployee" 
                    ErrorMessage="Employee name must be characters less than 100" ForeColor="Red" 
                    SetFocusOnError="True" ValidationExpression="^[a-zA-Z'.\s]{1,100}$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style2" align="center">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" align="center">
                <asp:Button ID="btnsearch" runat="server" Text="Search" 
                    onclick="btnsearch_Click" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
        ShowMessageBox="True" ShowSummary="False" />
    <br />
    <table class="style1">
        <tr>
            <td align="center">
                <asp:Button ID="btnaddnewemployee" runat="server" 
                    PostBackUrl="~/Admin/Employees/employeemain.aspx" Text="back to employees" 
                    CausesValidation="False" />
                <br />
                <br />
                </td>
        </tr>
    </table>
    <br />
    <br />
        <asp:SqlDataSource ID="sdemployee" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            DeleteCommand="DELETE FROM [employees] WHERE [empID] = @empID" 
            SelectCommand="SELECT * FROM [employees] WHERE ([EmployeeName] = @EmployeeName)" 
        
        
        UpdateCommand="UPDATE [employees] SET [EmployeeName] = @EmployeeName, [Department] = @Department, [Designation] = @Designation WHERE [empID] = @empID" 
        
        
        InsertCommand="INSERT INTO [employees] ([EmployeeName], [Department], [Designation]) VALUES (@EmployeeName, @Department, @Designation)">
            <DeleteParameters>
                <asp:Parameter Name="empID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EmployeeName" Type="String" />
                <asp:Parameter Name="Department" Type="String" />
                <asp:Parameter Name="Designation" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtemployee" Name="EmployeeName" 
                    PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="EmployeeName" Type="String" />
             
                <asp:Parameter Name="Department" Type="String" />
                <asp:Parameter Name="Designation" Type="String" />
                <asp:Parameter Name="empID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <p>
    </p>
</asp:Content>
