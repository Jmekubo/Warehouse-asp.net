<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addTruck.aspx.cs" Inherits="Warehouse.addTransporter" %>
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
            width: 163px;
            height: 24px;
        }
        .style4
        {
            height: 24px;
        }
        .style5
        {
            width: 163px;
            height: 26px;
        }
        .style6
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p align="left">
        New Truck</p>
    <p align="center">
        <table align="center" class="style1">
            <tr>
                <td align="right" class="style2">
                    Truck Registration:</td>
                <td align="left">
                    <asp:TextBox ID="txttruckreg" runat="server" Width="183px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txttruckreg" ErrorMessage="Registration number is Required" 
                        ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Transporter Name:</td>
                <td align="left">
                    <asp:DropDownList ID="ddltransp" runat="server" DataSourceID="SqlDtransp" 
                        DataTextField="TransporterName" DataValueField="TranspID" 
                        AppendDataBoundItems="True" AutoPostBack="True">
                         <asp:ListItem Text="Select Transporter" Value=""></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="You must select Transporter" ControlToValidate="ddltransp" 
                        ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToValidate="ddltransp" ErrorMessage="Please select transporter" 
                        ForeColor="Red" Operator="NotEqual" SetFocusOnError="True" 
                        ValueToCompare="Select Transporter">*</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="style3">
                    Capacity:</td>
                <td align="left" class="style4">
                    <asp:TextBox ID="txtcap" runat="server" Height="22px" Width="183px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtcap" ErrorMessage="Enter truck capacity in tonnes" 
                        ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" 
                        ControlToValidate="txtcap" 
                        ErrorMessage="Capacity must be in tonnes and greater than 7 Tonnes" 
                        ForeColor="Red" Operator="GreaterThanEqual" SetFocusOnError="True" 
                        Type="Integer" ValueToCompare="7">*</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="style5">
                    Driver&#39;s Name:</td>
                <td align="left" class="style6">
                    <asp:TextBox ID="txtdriver" runat="server" Width="183px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtdriver" ErrorMessage="enter truck driver's name" 
                        ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator3" runat="server" 
                        ControlToValidate="txtdriver" ErrorMessage="driver name must be characters" 
                        ForeColor="Red" Operator="DataTypeCheck">*</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td align="left" class="style2">
                    &nbsp;</td>
                <td align="left" class="style2">
                    <asp:Button ID="btsave" runat="server" onclick="btsave_Click" 
                        Text="Save Truck Details" />
                    <br />
                    <br />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                        HeaderText="Please correct the following errors before proceeding" 
                        ShowMessageBox="True" ShowSummary="False" />
                    <br />
                    <br />
        <asp:Button ID="btnadd" runat="server" CausesValidation="False" 
            PostBackUrl="~/Transporters/Trucks/Trucks.aspx" Text="back to trucks" />
                </td>
            </tr>
        </table>
        <br />
    </p>
    <p align="left">
        &nbsp;</p>
    <asp:SqlDataSource ID="SqlDtTrucks" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
        InsertCommand="INSERT INTO [trucks] ([Registration], [TranspID], [Capacity], [DriversName]) VALUES (@Registration, @TranspID, @Capacity, @DriversName)" 
        
        
    
        
        
        
        
        UpdateCommand="UPDATE [trucks] SET [Registration] = @Registration, [TranspID] = @TranspID,  =  [Capacity] = @Capacity, [DriversName] = @DriversName WHERE [TruckID] = @TruckID">
        <InsertParameters>
            <asp:ControlParameter ControlID="txttruckreg" Name="Registration" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddltransp" Name="TranspID" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="txtcap" Name="Capacity" PropertyName="Text" 
                Type="Int32" />
            <asp:ControlParameter ControlID="txtdriver" Name="DriversName" 
                PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Registration" Type="String" />
            <asp:Parameter Name="TranspID" Type="Int32" />
           
            <asp:Parameter Name="Capacity" Type="Int32" />
            <asp:Parameter Name="DriversName" Type="String" />
            <asp:Parameter Name="TruckID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDtransp" runat="server" 
        ConnectionString="<%$ ConnectionStrings:warehousedbCon %>" 
        
        SelectCommand="SELECT [TranspID], [TransporterName] FROM [transporters] ORDER BY [TransporterName]">
    </asp:SqlDataSource>
    </asp:Content>
