<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Losses.aspx.cs" Inherits="Warehouse.Losses" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 78px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="left">
        Capture Loss</p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
        ShowMessageBox="True" ShowSummary="False" />
    <p>
    </p>
    <table align="center" class="style1">
        <tr>
            <td class="style2">
                LossType</td>
            <td>
                <asp:DropDownList ID="DropDownListLossType" runat="server">
                 <asp:ListItem Selected="True" Text="--Select--" Value="--Select--"></asp:ListItem>
                <asp:ListItem Text="Spillage" Value="Spillage"></asp:ListItem>
                <asp:ListItem Text="Expired" Value="Expired"></asp:ListItem>
                <asp:ListItem Text="Wet" Value="Wet"></asp:ListItem>
                <asp:ListItem Text="Pilferage" Value="Pilferage"></asp:ListItem>
                <asp:ListItem Text="Poor Handling" Value="Poor Handling"></asp:ListItem>
                <asp:ListItem Text="Infested" Value="Infested"></asp:ListItem>
                </asp:DropDownList>
                <asp:CompareValidator ID="CVLossType" runat="server" 
                    ControlToValidate="DropDownListLossType" ErrorMessage="Please Select Loss Type" 
                    ForeColor="Red" Operator="NotEqual" SetFocusOnError="True" 
                    ValueToCompare="--Select--">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Loss Date</td>
            <td>
                <asp:TextBox ID="txtLDate" runat="server" TextMode="Date" Height="22px" 
                    Width="128px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVLoss" runat="server" 
                    ControlToValidate="txtLDate" ErrorMessage="You must select Loss Date" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                    ControlToValidate="txtLDate" 
                    ErrorMessage="Loss date should be today or within the last one month" 
                    ForeColor="Red" SetFocusOnError="True" Type="Date">*</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Item Name</td>
            <td>
                <asp:DropDownList ID="DropDownListItems" runat="server" 
                    AppendDataBoundItems="True" AutoPostBack="True" 
                    DataSourceID="SqlDataSItems" DataTextField="ItemName" DataValueField="ItemID"> 
                    <asp:ListItem Text="Select Item" Value=""></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="DropDownListItems" ErrorMessage="Please select item" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Quantity in MT</td>
            <td>
                <asp:TextBox ID="txtQty" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVQty" runat="server" 
                    ControlToValidate="txtQty" ErrorMessage="Please enter quantity in MT" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtQty" 
                    ErrorMessage="quantity should be numbers greater than 0" ForeColor="Red" 
                    Operator="GreaterThan" Type="Double" ValueToCompare="0.0001">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Reason</td>
            <td>
                <asp:TextBox ID="txtReason" runat="server" Height="81px" TextMode="MultiLine" 
                    Width="332px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVreason" runat="server" 
                    ControlToValidate="txtReason" ErrorMessage="Reason is Required" 
                    ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtReason" 
                    ErrorMessage="Reason should be characters less than 100" ForeColor="Red" 
                    ValidationExpression="^[a-zA-Z'.\s]{1,100}$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnsave" runat="server" BackColor="#666699" 
                    CssClass="submitButton" Text="Save Loss" onclick="btnsave_Click" />
            </td>
        </tr>
    </table>
    <p align="center">
        <asp:SqlDataSource ID="SqlDataSLoss" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            DeleteCommand="DELETE FROM [losses] WHERE [LossID] = @original_LossID" 
            InsertCommand="INSERT INTO [losses] ([ItemID], [LossType], [Quantity], [Reason], [LossDate]) VALUES (@ItemID, @LossType, @Quantity, @Reason, @LossDate)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [losses]" 
            
            
            
            UpdateCommand="UPDATE [losses] SET [ItemID] = @ItemID, [LossType] = @LossType, [Quantity] = @Quantity, [Reason] = @Reason, [LossDate] = @LossDate WHERE [LossID] = @original_LossID">
            <DeleteParameters>
                <asp:Parameter Name="original_LossID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="DropDownListItems" Name="ItemID" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownListLossType" Name="LossType" 
                    PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtQty" Name="Quantity" PropertyName="Text" 
                    Type="Decimal" />
                <asp:ControlParameter ControlID="txtReason" Name="Reason" PropertyName="Text" 
                    Type="String" />
                <asp:ControlParameter ControlID="txtLDate" Name="LossDate" PropertyName="Text" 
                    Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ItemID" Type="Int32" />
                <asp:Parameter Name="LossType" Type="String" />
                <asp:Parameter Name="Quantity" Type="Decimal" />
                <asp:Parameter Name="Reason" Type="String" />
                <asp:Parameter Name="LossDate" Type="DateTime" />
                <asp:Parameter Name="original_LossID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSItems" runat="server" 
            ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
            SelectCommand="SELECT [ItemID], [ItemName] FROM [items] ORDER BY [ItemName]">
        </asp:SqlDataSource>
    </p>
</asp:Content>
