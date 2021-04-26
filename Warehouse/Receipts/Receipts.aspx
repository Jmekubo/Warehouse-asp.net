<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Receipts.aspx.cs" Inherits="Warehouse.Receipts.Receipts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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
            </td>
            <td class="style4">
                Receipt Date:</td>
            <td class="style12" colspan="2">
                <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style10">
                Supplier Name:</td>
            <td class="style8">
                <asp:DropDownList ID="DropDownListSupplier" runat="server" 
                    DataSourceID="SqlDdtSupp" DataTextField="Suppliername" 
                    DataValueField="SupplierID" style="margin-bottom: 7px" Width="256px">
                </asp:DropDownList>
            </td>
            <td class="style4">
                Item Name:</td>
            <td class="style12">
                <asp:DropDownList ID="DropDownListItem" runat="server" 
                    DataSourceID="SqlDditems" DataTextField="FoodItemName" DataValueField="ItemID">
                </asp:DropDownList>
            </td>
            <td class="style12">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style11">
                Truck Number:</td>
            <td class="style9">
                <asp:TextBox ID="txtTruckno" runat="server" Height="23px" Width="179px"></asp:TextBox>
            </td>
            <td class="style7">
                Quantity:</td>
            <td class="style5" colspan="2">
                <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style10">
                Driver&#39;s Name</td>
            <td class="style8">
                <asp:TextBox ID="txtDrivername" runat="server" Height="21px" Width="230px"></asp:TextBox>
            </td>
            <td class="style4">
                Unit Price:</td>
            <td class="style12" colspan="2">
                <asp:TextBox ID="txtUnitPrice" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style10">
                Employee Name:</td>
            <td class="style8">
                <asp:DropDownList ID="DropDownListEmployee" runat="server" 
                    DataSourceID="SqlDdtemployee" DataTextField="Lastname" 
                    DataValueField="employeeID" Height="16px" Width="255px">
                </asp:DropDownList>
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style12" rowspan="3" colspan="2">
                <asp:TextBox ID="txtCondition" runat="server" Height="81px" 
                    TextMode="MultiLine" Width="302px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td class="style4">
                Condition:</td>
        </tr>
        <tr>
            <td class="style10">
                <asp:Button ID="btnNewWayBill" runat="server" Text="New Waybill" 
                    Width="128px" />
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
            <td class="style2" colspan="5">
                <asp:GridView ID="GridView1" AutoGenerateColumns="False" runat="server" 
                    Width="898px">
                <Columns>  
                    <asp:BoundField DataField="WayBillNumber" HeaderText="WayBillNumber" />
                  <asp:BoundField  HeaderStyle-Width="120px" HeaderText="SupplierID" 
                        DataField="SupplierID" Visible="False">  
<HeaderStyle Width="120px"></HeaderStyle>
                    </asp:BoundField>
                <asp:BoundField  HeaderStyle-Width="120px" HeaderText="SupplierName" 
                        DataField="SupplierName">  
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
                <asp:BoundField HeaderStyle-Width="120px" HeaderText="EmployeeID" 
                        DataField="employeeID" Visible="False"> 
<HeaderStyle Width="120px"></HeaderStyle>
                    </asp:BoundField>
                <asp:BoundField HeaderStyle-Width="120px" HeaderText="EmployeeName" 
                        DataField="EmployeeName"> 
<HeaderStyle Width="120px"></HeaderStyle>
                    </asp:BoundField>
                <asp:BoundField  HeaderStyle-Width="120px" HeaderText="Quantity" 
                        DataField="Quantity"> 
<HeaderStyle Width="120px"></HeaderStyle>
                    </asp:BoundField>
                <asp:BoundField  HeaderStyle-Width="120px" HeaderText="UnitPrice" 
                        DataField="UnitPrice"> 
<HeaderStyle Width="120px"></HeaderStyle>
                    </asp:BoundField>
                <asp:BoundField  HeaderStyle-Width="120px" HeaderText="Condition" 
                        DataField="Condition">  
<HeaderStyle Width="120px"></HeaderStyle>
                    </asp:BoundField>
                <asp:BoundField  HeaderStyle-Width="120px" HeaderText="TruckNumber" 
                        DataField="TruckNumber">    
<HeaderStyle Width="120px"></HeaderStyle>
                    </asp:BoundField>
                <asp:BoundField  HeaderStyle-Width="120px" HeaderText="DriversName" 
                        DataField="Driversname">  
<HeaderStyle Width="120px"></HeaderStyle>
                    </asp:BoundField>
                <asp:BoundField  HeaderStyle-Width="120px" HeaderText="ReceiptDate" 
                        DataField="ReceiptDate"> 
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
            <td class="style2" colspan="5">
                <asp:Button ID="btnPostReceipt" runat="server" Text="Post Receipt" 
                    Width="128px" onclick="btnPostReceipt_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                &nbsp;</td>
            <td class="style2" colspan="3">
                <asp:SqlDataSource ID="SqlDdtSupp" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:warehousedbConn %>" 
                    ProviderName="<%$ ConnectionStrings:warehousedbConn.ProviderName %>" 
                    SelectCommand="SELECT SupplierID, Suppliername FROM suppliers">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            
            
            <td class="style2" colspan="3">
                <asp:SqlDataSource ID="SqlDdtemployee" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:warehousedbConn %>" 
                    ProviderName="<%$ ConnectionStrings:warehousedbConn.ProviderName %>" 
                    SelectCommand="SELECT  employeeID, Lastname FROM employees">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                &nbsp;</td>
            <td class="style2" colspan="3">
                <asp:SqlDataSource ID="SqlDditems" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:warehousedbConn %>" 
                    ProviderName="<%$ ConnectionStrings:warehousedbConn.ProviderName %>" 
                    SelectCommand="SELECT ItemID, FoodItemName FROM fooditem">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="5">
                <asp:SqlDataSource ID="SqlDdtreceipts" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:warehousedbConn %>" 
                    ProviderName="<%$ ConnectionStrings:warehousedbConn.ProviderName %>" 
                    
                    
                    SelectCommand="SELECT RecptID, WayBillNumber, ItemID, SupplierID, employeeID, Quantity, Condtition, TruckNumber, DriversName, ReceiptDate, SupplierName, ItemName, EmployeeName, UnitPrice FROM receipts" 
                    
                    InsertCommand="INSERT INTO receipts(WayBillNumber, SupplierID, SupplierName, ItemID, ItemName, employeeID, EmployeeName, Quantity, UnitPrice, TruckNumber, DriversName, ReceiptDate, Condition, RecptID) VALUES (,,,,,,,,,,,)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="WayBillNumber" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridView1" Name="SupplierID" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridView1" Name="SupplierName" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridView1" Name="EmployeeID" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridView1" Name="EmployeeName" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridView1" Name="ItemID" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridView1" Name="ItemName" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridView1" Name="Quantity" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridView1" Name="UnitPrice" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridView1" Name="TruckNumber" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridView1" Name="DriversName" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridView1" Name="Condition" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridView1" Name="ReceiptDate" 
                            PropertyName="SelectedValue" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
