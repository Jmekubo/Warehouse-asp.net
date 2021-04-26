<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Receipts.aspx.cs" Inherits="Warehouse.Reports.Receipts1" %>

<%@ Register assembly="DevExpress.XtraReports.v15.2.Web, Version=15.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" 
        ReportTypeName="Warehouse.Reports.Receipts">
    </dx:ASPxDocumentViewer>
    <div>
    
    </div>
    </form>
</body>
</html>
