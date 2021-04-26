<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Warehouse.Members.Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BackColor="#EFF3FB" 
            BorderColor="#B5C7DE" BorderStyle="Solid" BorderWidth="1px" 
            ContinueDestinationPageUrl="~/Default.aspx" Font-Names="Verdana" 
            Font-Size="0.8em">
            <ContinueButtonStyle BackColor="White" BorderColor="#507CD1" 
                BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
                ForeColor="#284E98" />
            <CreateUserButtonStyle BackColor="White" BorderColor="#507CD1" 
                BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
                ForeColor="#284E98" />
            <TitleTextStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <WizardSteps>
                <asp:CreateUserWizardStep runat="server" />
                <asp:CompleteWizardStep runat="server" />
            </WizardSteps>
            <HeaderStyle BackColor="#284E98" BorderColor="#EFF3FB" BorderStyle="Solid" 
                BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="White" 
                HorizontalAlign="Center" />
            <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" 
                BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
                ForeColor="#284E98" />
            <SideBarButtonStyle BackColor="#507CD1" Font-Names="Verdana" 
                ForeColor="White" />
            <SideBarStyle BackColor="#507CD1" Font-Size="0.9em" VerticalAlign="Top" />
            <StepStyle Font-Size="0.8em" />
        </asp:CreateUserWizard>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Home</asp:HyperLink>
    
    </div>
    </form>
</body>
</html>
