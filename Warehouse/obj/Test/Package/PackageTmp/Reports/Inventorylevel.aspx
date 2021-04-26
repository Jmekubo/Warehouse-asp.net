<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inventorylevel.aspx.cs" Inherits="Warehouse.Reports.Inventorylevel" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <CR:CrystalReportPartsViewer ID="CrystalReportPartsViewer1" runat="server" 
            AutoDataBind="True" ReportSourceID="CrystalReportSource1" />
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="C:\Users\John Mekubo\Documents\Visual Studio 2010\Projects\Warehouse\Warehouse\Reports\Inventorylevels.rpt">
            </Report>
        </CR:CrystalReportSource>
    
    </div>
    </form>
</body>
</html>
