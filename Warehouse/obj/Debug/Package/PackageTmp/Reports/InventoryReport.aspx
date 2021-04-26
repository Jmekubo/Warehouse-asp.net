<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InventoryReport.aspx.cs" Inherits="Warehouse.InventoryReport" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script src="../aspnet_client/system_web/4_0_30319/crystalreportviewers13/js/crviewer/crv.js" type="test/javascript" ></script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        
    
        
    
        
    
    </div>
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
        AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1202px" 
        ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" 
        ToolPanelWidth="200px" Width="1104px" ToolPanelView="None" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="rptInventoryLevels.rpt">
        </Report>
    </CR:CrystalReportSource>
    </form>
</body>
</html>
