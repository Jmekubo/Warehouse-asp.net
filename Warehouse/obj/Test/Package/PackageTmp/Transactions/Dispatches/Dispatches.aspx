<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dispatches.aspx.cs" Inherits="Warehouse.Dispatches.Dispatches" %>
<%@ Register src="~/MessageBoxUserControl.ascx" tagname="MessageBoxUserControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">


    <style type="text/css">
        .style2
        {
            width: 432px;
            height: 50px;
        }
        .style14
        {
            width: 400px;
            height: 22px;
        }
        .style15
        {
            width: 273px;
            height: 22px;
        }
        .style16
        {
            width: 90px;
            height: 527px;
        }
        .style17
        {
            width: 432px;
            height: 22px;
        }
        .style19
        {
            width: 400px;
            height: 29px;
        }
        .style20
        {
            width: 273px;
            height: 29px;
        }
        .style21
        {
            width: 432px;
            height: 29px;
        }
        .style25
        {
            width: 432px;
            height: 121px;
        }
        .style26
        {
            width: 432px;
            height: 26px;
        }
        .style27
        {
            width: 432px;
            height: 33px;
        }
        .style29
        {
            width: 400px;
            height: 30px;
        }
        .style30
        {
            width: 148px;
            height: 30px;
        }
        .style31
        {
            width: 123px;
            height: 22px;
        }
        .style32
        {
            width: 123px;
            height: 29px;
        }
        .style33
        {
            width: 123px;
            height: 30px;
        }
        .style34
        {
            width: 273px;
        }
        .style35
        {
            width: 273px;
            height: 30px;
        }
    </style>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table bgcolor="#669999" class="style16" 
        style="color: #000000; margin-right: 0px;">
        <tr>
            <td class="style31">
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style31">
                WayBillNo:</td>
            <td class="style14">
                <asp:TextBox ID="txtwaybill_D" runat="server" Width="179px" 
                    AutoPostBack="True" ontextchanged="txtwaybill_D_TextChanged1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVwaybill" runat="server" 
                    ControlToValidate="txtwaybill_D" ErrorMessage="WayBillNo Required" 
                    ForeColor="Red" ToolTip="WayBillNo Required">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RVwaybill" runat="server" 
                    ControlToValidate="txtwaybill_D" 
                    ErrorMessage="Waybill No must be an integer from 10000 to 99999" 
                    ForeColor="Red" MaximumValue="99999" MinimumValue="10000" 
                    SetFocusOnError="True" Type="Integer">*</asp:RangeValidator>
            </td>
            <td class="style15">
                Dispatch Date:</td>
            <td class="style17">
                <asp:TextBox ID="txtDispatchDate" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVDdate" runat="server" 
                    ControlToValidate="txtDispatchDate" ErrorMessage="Select Dispatch Date" 
                    ForeColor="Red" ToolTip="Select Dispatch Date">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RVDdate" runat="server" 
                    ControlToValidate="txtDispatchDate" 
                    ErrorMessage="Dispatch Date should be today or within the last one month" 
                    ForeColor="Red" SetFocusOnError="True" Type="Date">*</asp:RangeValidator>
            </td>
        </tr>

       

        <tr>
            <td class="style32">
                Transporter Name:</td>
            <td class="style19">
                <asp:DropDownList ID="DropDownListTransp" runat="server" 
                    DataSourceID="SqlDdtTransp" DataTextField="TransporterName" 
                    DataValueField="TranspID" style="margin-bottom: 7px" Width="234px" 
                    Height="27px" AppendDataBoundItems="True" AutoPostBack="True">
                    <asp:ListItem Text="Select Transporter" Value=""></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RFVTransp" runat="server" 
                    ControlToValidate="DropDownListTransp" ErrorMessage="Please Select Transporter" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
            <td class="style20">
                Item Name:</td>
            <td class="style21">
                <asp:DropDownList ID="DropDownListItem_D" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDditems" DataTextField="ItemName" DataValueField="ItemID" 
                    onselectedindexchanged="DropDownListItem_D_SelectedIndexChanged" 
                    Height="28px" Width="170px" AppendDataBoundItems="True">
                    <asp:ListItem Text="Select Item" Value=""></asp:ListItem>
                    
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RFVItem" runat="server" 
                    ControlToValidate="DropDownListItem_D" ErrorMessage="Please Select Item" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style32">
                Truck Number:</td>
            <td class="style19">
                <asp:TextBox ID="txtTruckNo_D" runat="server" Height="20px" Width="179px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVTruckno" runat="server" 
                    ControlToValidate="txtTruckNo_D" ErrorMessage="Truck No Required" 
                    ForeColor="Red" ToolTip="Truck No Required">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtTruckNo_D" 
                    ErrorMessage="truck number should be numbers and characters less than 50" 
                    ForeColor="Red" ValidationExpression="^[0-9a-zA-Z'.\s]{1,50}$">*</asp:RegularExpressionValidator>
            </td>
            <td class="style20">
                Quantity in MT:</td>
            <td class="style21">
                <asp:TextBox ID="txtQuantity_D" runat="server" 
                     >
                    </asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVquantity" runat="server" 
                    ControlToValidate="txtQuantity_D" ErrorMessage="Enter quantity in MT" 
                    ForeColor="Red" ToolTip="Enter quantity in MT">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CVitems" runat="server" 
                    ControlToValidate="txtQuantity_D" 
                    ErrorMessage="Quantity must be decimal greater than 0" ForeColor="Red" 
                    Operator="GreaterThan" SetFocusOnError="True" Type="Integer" ValueToCompare="0">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style32">
                Driver&#39;s Name</td>
            <td class="style19">
                <asp:TextBox ID="txtDrivername_D" runat="server" Height="20px" Width="230px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVdrivername" runat="server" 
                    ControlToValidate="txtDrivername_D" ErrorMessage="Driver's Name Required" 
                    ForeColor="Red" ToolTip="Driver's Name Required">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CVDname" runat="server" 
                    ControlToValidate="txtDrivername_D" 
                    ErrorMessage="Driver name must contain alphabets only" ForeColor="Red" 
                    Operator="DataTypeCheck" SetFocusOnError="True">*</asp:CompareValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtDrivername_D" 
                    ErrorMessage="drivers name should be characters less than 50" ForeColor="Red" 
                    ValidationExpression="^[a-zA-Z'.\s]{1,50}$">*</asp:RegularExpressionValidator>
            </td>
            <td class="style20">
                Units:</td>
            <td class="style21">
                <asp:TextBox ID="txtUnits" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Employee Name:</td>
            <td class="style29">
                <asp:DropDownList ID="DropDownListEmployee_D" runat="server" 
                    DataSourceID="SqlDdtemployee" DataTextField="EmployeeName" 
                    DataValueField="empID" Height="28px" Width="232px" 
                    AppendDataBoundItems="True" AutoPostBack="True">
                    <asp:ListItem Text="Select Employee" Value=""></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RFVemployee" runat="server" 
                    ControlToValidate="DropDownListEmployee_D" ErrorMessage="Please Select Employee" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
            <td class="style35">
                Unit Price:</td>
            <td>
                <asp:TextBox ID="txtUnitPrice_D" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                &nbsp;</td>
            <td class="style29">
                &nbsp;</td>
            <td class="style35">
                Destination:</td>
            <td>
                <asp:TextBox ID="txtDestn" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVdestn" runat="server" 
                    ControlToValidate="txtDestn" ErrorMessage="Enter Destination" ForeColor="Red" 
                    ToolTip="Enter Destination">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CVdestin" runat="server" ControlToValidate="txtDestn" 
                    ErrorMessage="Destination must contain aphabets only" ForeColor="Red" 
                    Operator="DataTypeCheck" SetFocusOnError="True">*</asp:CompareValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtDestn" 
                    ErrorMessage="Destination should be characters less than 50" ForeColor="Red" 
                    ValidationExpression="^[a-zA-Z'.\s]{1,50}$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style33">
                <asp:Button ID="btnNew" runat="server" Text="New Waybill" 
                    Width="128px" onclick="btnNew_Click" CausesValidation="False" />
            </td>
            <td class="style29">
                &nbsp;</td>
            <td class="style34">
                &nbsp;</td>
            <td class="style30">
                <br />
                <asp:Button ID="btnAddDItem" runat="server" Text="Add Item" Width="133px" 
                    onclick="btnAddItem_Click" />
            </td>
        </tr>
        <tr>
            <td class="style25" colspan="4">
                <asp:GridView ID="GVDispatch" AutoGenerateColumns="False" runat="server" 
                    Width="898px" >
                <Columns>  
                    <asp:BoundField DataField="WayBillNumber" HeaderText="WayBillNumber" />
                  <asp:BoundField  HeaderStyle-Width="120px" HeaderText="TranspID" 
                        DataField="TranspID" Visible="False">  
<HeaderStyle Width="120px"></HeaderStyle>
                    </asp:BoundField>
                <asp:BoundField  HeaderStyle-Width="120px" HeaderText="TransporterName" 
                        DataField="TransporterName">  
<HeaderStyle Width="120px"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Width="120px" HeaderText="ItemID" 
                        DataField="ItemID" Visible="False">  
<HeaderStyle Width="120px"></HeaderStyle>
                    </asp:BoundField>
                <asp:BoundField HeaderStyle-Width="120px" HeaderText="ItemName" 
                        DataField="ItemName">  
<HeaderStyle Width="120px"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Width="120px" HeaderText="empID" 
                        DataField="empID" Visible="False"> 
<HeaderStyle Width="120px"></HeaderStyle>
                    </asp:BoundField>
                <asp:BoundField  HeaderStyle-Width="120px" HeaderText="Quantity" 
                        DataField="Quantity"> 
<HeaderStyle Width="120px"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                <asp:BoundField  HeaderStyle-Width="120px" HeaderText="UnitPrice" 
                        DataField="UnitPrice"> 
<HeaderStyle Width="120px"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                <asp:BoundField  HeaderStyle-Width="120px" HeaderText="TruckReg" 
                        DataField="TruckReg">    
<HeaderStyle Width="120px"></HeaderStyle>
                    </asp:BoundField>
                <asp:BoundField  HeaderStyle-Width="120px" HeaderText="DriversName" 
                        DataField="Driversname">  
<HeaderStyle Width="120px"></HeaderStyle>
                    </asp:BoundField>
                <asp:BoundField  HeaderStyle-Width="120px" HeaderText="Destination" 
                        DataField="Destination">  
<HeaderStyle Width="120px"></HeaderStyle>
                    </asp:BoundField>
                <asp:BoundField  HeaderStyle-Width="120px" HeaderText="DispatchDate" 
                        DataField="DispatchDate" Visible="False"> 
<HeaderStyle Width="120px"></HeaderStyle>
                    </asp:BoundField>
                <asp:BoundField HeaderStyle-Width="120px" HeaderText="EmployeeName" 
                        DataField="EmployeeName"> 
<HeaderStyle Width="120px"></HeaderStyle>
                    </asp:BoundField>
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


                <uc1:MessageBoxUserControl ID="MessageBoxUserControl1" runat="server" />
                <asp:Literal ID="PopupBox" runat="server"></asp:Literal>   
               
            </td>
        </tr>
        <tr>
            <td class="style26" colspan="4">
                <asp:Button ID="btnPostDispatch" runat="server" onclick="btnPostDispatch_Click" 
                    Text="Post Dispatch" CausesValidation="False" />
                <br />
                <asp:ValidationSummary ID="VSdispatch" runat="server" ForeColor="Red" 
                    ShowMessageBox="True" ShowSummary="False" DisplayMode="List" 
                    HeaderText="Please correct the following errors to proceed:" />
            </td>
        </tr>
        <tr>
            <td class="style27" colspan="2">
                <asp:SqlDataSource ID="SqlDdtDispatch" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
                    
                    
                    
                    
                    SelectCommand="SELECT * FROM [dispatches]" 
                    DeleteCommand="DELETE FROM [dispatches] WHERE [DispID] = @DispID" 
                    InsertCommand="INSERT INTO [dispatches] ([WayBillNumber], [TranspID], [TransporterName], [empID], [LastName], [ItemID], [ItemName], [Quantity], [TruckReg], [Driversname], [Destination], [DispatchDate]) VALUES (@WayBillNumber, @TranspID, @TransporterName, @empID, @LastName, @ItemID, @ItemName, @Quantity, @TruckReg, @Driversname, @Destination, @DispatchDate)" 
                    UpdateCommand="UPDATE [dispatches] SET [WayBillNumber] = @WayBillNumber, [TranspID] = @TranspID, [TransporterName] = @TransporterName, [empID] = @empID, [LastName] = @LastName, [ItemID] = @ItemID, [ItemName] = @ItemName, [Quantity] = @Quantity, [TruckReg] = @TruckReg, [Driversname] = @Driversname, [Destination] = @Destination, [DispatchDate] = @DispatchDate WHERE [DispID] = @DispID">
                    <DeleteParameters>
                        <asp:Parameter Name="DispID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="WayBillNumber" Type="String" />
                        <asp:Parameter Name="TranspID" Type="Int32" />
                        <asp:Parameter Name="TransporterName" Type="String" />
                        <asp:Parameter Name="empID" Type="Int32" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="ItemID" Type="Int32" />
                        <asp:Parameter Name="ItemName" Type="String" />
                        <asp:Parameter Name="Quantity" Type="Int32" />
                        <asp:Parameter Name="TruckReg" Type="String" />
                        <asp:Parameter Name="Driversname" Type="String" />
                        <asp:Parameter Name="Destination" Type="String" />
                        <asp:Parameter Name="DispatchDate" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="WayBillNumber" Type="String" />
                        <asp:Parameter Name="TranspID" Type="Int32" />
                        <asp:Parameter Name="TransporterName" Type="String" />
                        <asp:Parameter Name="empID" Type="Int32" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="ItemID" Type="Int32" />
                        <asp:Parameter Name="ItemName" Type="String" />
                        <asp:Parameter Name="Quantity" Type="Int32" />
                        <asp:Parameter Name="TruckReg" Type="String" />
                        <asp:Parameter Name="Driversname" Type="String" />
                        <asp:Parameter Name="Destination" Type="String" />
                        <asp:Parameter Name="DispatchDate" Type="DateTime" />
                        <asp:Parameter Name="DispID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td class="style27" colspan="2">
                <asp:SqlDataSource ID="SqlDdtTransp" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
                    
                    
                    SelectCommand="SELECT [TranspID], [TransporterName] FROM [transporters] ORDER BY [TransporterName]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            
            
            <td class="style27" colspan="3">
                <asp:SqlDataSource ID="SqlDdtemployee" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
                    
                    
                    
                    
                    SelectCommand="SELECT [empID], [EmployeeName] FROM [employees] ORDER BY [EmployeeName]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style27" colspan="2">
                <asp:SqlDataSource ID="INVadapter" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
                    SelectCommand="SELECT [ItemID], [ItemName], [Quantity], [InvID] FROM [inventory]">
                </asp:SqlDataSource>
            </td>
            <td class="style27" colspan="2">
                <asp:SqlDataSource ID="SqlDditems" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
                    
                    
                    
                    
                    SelectCommand="SELECT [ItemID], [ItemName], [Units], [UnitPrice] FROM [items] ORDER BY [ItemName]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
                &nbsp;</td>
        </tr>
    </table>
    <br />
   
</asp:Content>
