<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Receipts.aspx.cs" Inherits="Warehouse.Receipts.Receipts" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

<script type="text/Javascript" language ="javascript" >
    function alert_successful() {
        alert("Client Side MessageBox");
    }
</script>

    <style type="text/css">
        .style1
        {
            width: 98%;
        }
        .style2
        {
            width: 432px;
        }
        .style4
        {
            width: 148px;
        }
        .style5
        {
            height: 26px;
            width: 432px;
        }
        .style7
        {
            width: 148px;
            height: 26px;
        }
        .style8
        {
            width: 262px;
        }
        .style9
        {
            width: 262px;
            height: 26px;
        }
        .style10
        {
            width: 232px;
        }
        .style11
        {
            height: 26px;
            width: 232px;
        }
        .style12
        {
            width: 432px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table bgcolor="#669999" class="style1" 
        style="color: #000000; margin-right: 0px;">
        <tr>
            <td class="style10">
                Waybill No:</td>
            <td class="style8">
                <asp:TextBox ID="txtwaybill" runat="server" Width="179px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtwaybill" ErrorMessage="WaybillNo is Required" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                    ControlToValidate="txtwaybill" 
                    ErrorMessage="WayBillNo must be an integer between 1000 and 9999" 
                    ForeColor="Red" MaximumValue="9999" MinimumValue="1000" SetFocusOnError="True" 
                    Type="Integer">*</asp:RangeValidator>
            </td>
            <td class="style4">
                Receipt Date:</td>
            <td class="style12">
                <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVdate" runat="server" 
                    ControlToValidate="txtDate" ErrorMessage="Please select date" 
                    ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RVdate" runat="server" ControlToValidate="txtDate" 
                    ErrorMessage="Date must be today or within past one month" ForeColor="Red" 
                    Type="Date">*</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="style10">
                Origin Location:</td>
            <td class="style8">
                <asp:TextBox ID="txtOrigin" runat="server" Width="179px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtOrigin" ErrorMessage="Please enter Origin Location" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtOrigin" 
                    ErrorMessage="Origin location should be text only" ForeColor="Red" 
                    Operator="DataTypeCheck">*</asp:CompareValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtOrigin" 
                    ErrorMessage="Origin location must be characters less than 100" ForeColor="Red" 
                    ValidationExpression="^[a-zA-Z'.\s]{1,50}$">*</asp:RegularExpressionValidator>
            </td>
            <td class="style4">
                Item Name:</td>
            <td class="style12">
                <asp:DropDownList ID="DropDownListItem" runat="server"
                    onselectedindexchanged="DropDownListItem_SelectedIndexChanged"
                    Height="28px" Width="170px" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDditems" DataTextField="ItemName" 
                    DataValueField="ItemID" >
                     <asp:ListItem Text="Select Item" Value=""></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="DropDownListItem" ErrorMessage="Please select Item" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style11">
                Truck Number:</td>
            <td class="style9">
                <asp:TextBox ID="txtTruckno" runat="server" Width="179px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtTruckno" ErrorMessage="Enter Truck No" ForeColor="Red" 
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtTruckno" 
                    ErrorMessage="Truck number should be numbers and characters less than 50" 
                    ForeColor="Red" ValidationExpression="^[0-9a-zA-Z'.\s-]{1,50}$">*</asp:RegularExpressionValidator>
            </td>
            <td class="style7">
                Quantity:</td>
            <td class="style5">
                <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtQuantity" ErrorMessage="Enter Quantity in MT" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToValidate="txtQuantity" 
                    ErrorMessage="quantity must be an integer greater than 0" ForeColor="Red" 
                    SetFocusOnError="True" Type="Integer" ValueToCompare="0" 
                    Operator="GreaterThan">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style10">
                Driver&#39;s Name</td>
            <td class="style8">
                <asp:TextBox ID="txtDrivername" runat="server" Width="230px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtDrivername" ErrorMessage="Enter Driver's Name" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtDrivername" 
                    ErrorMessage="driver name should characters less than 50" ForeColor="Red" 
                    ValidationExpression="^[a-zA-Z'.\s]{1,50}$">*</asp:RegularExpressionValidator>
            </td>
            <td class="style4">
                Units: </td>
            <td class="style12">
                <asp:TextBox ID="txtUnits" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style10">
                Employee Name:</td>
            <td class="style8">
                <asp:DropDownList ID="DropDownListEmployee" runat="server" Height="28px" 
                    Width="255px" DataSourceID="SqlDdtemployee" DataTextField="EmployeeName" 
                    DataValueField="empID" AppendDataBoundItems="True" AutoPostBack="True" >
                   <asp:ListItem Text="Select Employee" Value=""></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="DropDownListEmployee" ErrorMessage="Please select employee" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
            <td class="style4">
                Unit Price:</td>
            <td class="style12">
                <asp:TextBox ID="txtUnitPrice" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td class="style4">
                Condition:</td>
            <td class="style12" rowspan="2">
                <asp:TextBox ID="txtCondition" runat="server" Height="81px" 
                    TextMode="MultiLine" Width="302px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="txtCondition" 
                    ErrorMessage="Condition should be only characters less than 250" 
                    ForeColor="Red" ValidationExpression="^[a-zA-Z'.\s]{1,50}$">*</asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtCondition" ErrorMessage="Please enter condition of Items" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style10">
                <asp:Button ID="btnNewWayBill" runat="server" Text="New Waybill" 
                    Width="128px" onclick="btnNewWayBill_Click" CausesValidation="False" />
            </td>
            <td class="style8">
                &nbsp;</td>
            <td class="style4">
                <br />
                <asp:Button ID="btnAddItem" runat="server" Text="Add Item" Width="133px" 
                    onclick="btnAddItem_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
                <asp:GridView ID="GridView1" AutoGenerateColumns="False" runat="server" 
                    Width="898px" >
                <Columns>  
                    <asp:BoundField DataField="WayBillNumber" HeaderText="WayBillNumber" />
                <asp:BoundField  HeaderStyle-Width="120px" HeaderText="ReceiptDate" 
                        DataField="ReceiptDate"> 
<HeaderStyle Width="120px"></HeaderStyle>
                    </asp:BoundField>
                  <asp:BoundField  HeaderStyle-Width="120px" HeaderText="SuppID" 
                        DataField="SuppID" Visible="False">  
<HeaderStyle Width="120px"></HeaderStyle>
                    </asp:BoundField>
                <asp:BoundField  HeaderStyle-Width="120px" HeaderText="OriginLocation" 
                        DataField="OriginLocation">  
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
                <asp:BoundField  HeaderStyle-Width="120px" HeaderText="Condition" 
                        DataField="Condition">  
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
                 
               
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
                <asp:Button ID="btnPostReceipt" runat="server" Text="Post Receipt" 
                    Width="128px" onclick="btnPostReceipt_Click" 
                    OnClientClick ="alert_succesful()" CausesValidation="False" />
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                &nbsp;</td>
            <td class="style2" colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                    HeaderText="Please correct the following errors to proceed:" 
                    ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
        <tr>
            
            
            <td class="style2" colspan="3">
                <asp:SqlDataSource ID="SqlDdtemployee" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
                    
                    
                    SelectCommand="SELECT [empID], [EmployeeName] FROM [employees] ORDER BY [EmployeeName]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                &nbsp;</td>
            <td class="style2" colspan="2">
                <asp:SqlDataSource ID="SqlDditems" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
                    
                    SelectCommand="SELECT [ItemID], [ItemName] FROM [items] ORDER BY [ItemName]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
                <asp:SqlDataSource ID="SqlDdtreceipts" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
                    
                    
                    SelectCommand="SELECT * FROM [receipts]" 
                    
                    
                    InsertCommand="INSERT INTO [receipts] ([WayBillNumber], [OriginLocation], [empID], [EmployeeName], [ItemID], [ItemName], [Quantity], [UnitPrice], [Condition], [TruckReg], [DriversName], [ReceiptDate]) VALUES (@WayBillNumber, @OriginLocation, @empID, @EmployeeName, @ItemID, @ItemName, @Quantity, @UnitPrice, @Condition, @TruckReg, @DriversName, @ReceiptDate)" 
                    DeleteCommand="DELETE FROM [receipts] WHERE [RecptID] = @RecptID" 
                    
                    UpdateCommand="UPDATE [receipts] SET [WayBillNumber] = @WayBillNumber,  [OriginLocation] = @OriginLocation, [empID] = @empID, [EmployeeName] = @EmployeeName, [ItemID] = @ItemID, [ItemName] = @ItemName, [Quantity] = @Quantity, [UnitPrice] = @UnitPrice, [Condition] = @Condition, [TruckReg] = @TruckReg, [DriversName] = @DriversName, [ReceiptDate] = @ReceiptDate WHERE [RecptID] = @RecptID">
                    <DeleteParameters>
                        <asp:Parameter Name="RecptID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="WayBillNumber" Type="String" />
                       
                        <asp:Parameter Name="OriginLocation" Type="String" />
                        <asp:Parameter Name="empID" Type="Int32" />
                        <asp:Parameter Name="EmployeeName" Type="String" />
                        <asp:Parameter Name="ItemID" Type="Int32" />
                        <asp:Parameter Name="ItemName" Type="String" />
                        <asp:Parameter Name="Quantity" Type="Int32" />
                        <asp:Parameter Name="UnitPrice" Type="Decimal" />
                        <asp:Parameter Name="Condition" Type="String" />
                        <asp:Parameter Name="TruckReg" Type="String" />
                        <asp:Parameter Name="DriversName" Type="String" />
                        <asp:Parameter Name="ReceiptDate" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="WayBillNumber" Type="String" />
               
                        <asp:Parameter Name="OriginLocation" Type="String" />
                        <asp:Parameter Name="empID" Type="Int32" />
                        <asp:Parameter Name="EmployeeName" Type="String" />
                        <asp:Parameter Name="ItemID" Type="Int32" />
                        <asp:Parameter Name="ItemName" Type="String" />
                        <asp:Parameter Name="Quantity" Type="Int32" />
                        <asp:Parameter Name="UnitPrice" Type="Decimal" />
                        <asp:Parameter Name="Condition" Type="String" />
                        <asp:Parameter Name="TruckReg" Type="String" />
                        <asp:Parameter Name="DriversName" Type="String" />
                        <asp:Parameter Name="ReceiptDate" Type="DateTime" />
                        <asp:Parameter Name="RecptID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
