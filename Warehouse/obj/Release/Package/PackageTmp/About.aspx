<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="Warehouse.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
#about_us_page #left_column .intro{margin-top:-24px;}#left_column .intro{font-family:Georgia,"Times New Roman",Times,serif;font-style:oblique;font-size:1.3em;line-height:1.7em;color:#1d6183;margin-bottom:20px;}*{margin:0;padding:0;}.photo_wrapper.float-right{padding-left:10px;}.wide300{width:300px;margin:0  0 20px 20px;}.float-right{float:right;}.clearfix{display:block;}.clearfix{display:inline-block;}.clearfix{display:block;}.photo_wrapper .caption{background:#f0fbfb;padding:10px;color:#332d2d;font-size:.9em;font-weight:bold;line-height:1.7em;}b,strong{font-weight:600;}
        .style1
        {
            margin: 0px;
            padding: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        AboUT</h2>
    <h2>
        &nbsp;</h2>
    <div id="left_column" class="clearfix clear">
        <div class="intro">
            <div class="style1">
            </div>
        </div>
        <div class="photo_wrapper wide300 float-right clearfix">
            <div class="style1">
                <img alt="About LP" height="210" 
                    src="http://www.wfp.org/sites/default/files/whoweare_0.jpg" title="About LP" 
                    width="300" />
            </div>
            <div class="caption">
                <div class="style1">
                    Photo: WFP/David Gross
                </div>
            </div>
        </div>
        <div class="style1">
            <div class="callout_text">
                <div class="intro callout">
                    <p>
                        The World Food Programme is streamlining warehousing operations using WFP 
                        Warehouse Management System</p>
                </div>
                <!--/ .intro -->     
                <div class="callout_content callout">
                    <div>
                        <p>
                            WFP Warehouse Management System enables the receipt , dispatch&nbsp; among other WFP 
                            warehouse operations to be fully automated. Automation increases warehousing 
                            efficiency and reduces the hidden costs associated with traditional handling and 
                            stock control. These efficiencies, combined with substantial accuracy gains, 
                            result in significant bottom line savings. all typical warehousing operations 
                            are supported in a comprehensive, yet easy to install, easy to use Warehouse 
                            Management System.
                        </p>
                        <p>
                            &nbsp;</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <p>
        &nbsp;</p>
    <p class="MsoNormal">
        &nbsp;</p>
    <p class="MsoNormal">
        &nbsp;</p>
    <p class="MsoNormal">
        &nbsp;</p>
</asp:Content>
