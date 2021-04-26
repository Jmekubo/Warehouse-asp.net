<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
#left_column .intro{font-family:Georgia,"Times New Roman",Times,serif;font-style:oblique;font-size:1.3em;line-height:1.7em;color:#1d6183;margin-bottom:20px;}*{margin:0;padding:0;}
        .style2
        {
            margin: 0px;
            padding: 0px;
        }
    .photo_wrapper.float-right{padding-left:10px;}.clearfix{display:block;}.clearfix{display:inline-block;}.clearfix{display:block;}.float-right{float:right;}.wide300{width:300px;margin:0  0 20px 20px;}.photo_wrapper .caption{background:#f0fbfb;padding:10px;color:#332d2d;font-size:.9em;font-weight:bold;line-height:1.7em;}strong{font-weight:600;}
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <h2>
                    Fighting hunger worldwide</h2>
                <div id="left_column" class="clearfix clear">
                    <div class="intro">
                        <div class="style2">
                        </div>
                    </div>
                    <div class="photo_wrapper wide300 float-right clearfix">
                        <div class="style2">
                            <img alt="About LP" height="210" 
                                src="http://www.wfp.org/sites/default/files/whoweare_0.jpg" title="About LP" 
                                width="300" />
                        </div>
                        <div class="caption">
                            <div class="style2">
                                Photo: WFP/David Gross
                            </div>
                        </div>
                    </div>
                    <div class="style2">
                        <div class="callout_text">
                            <div class="intro callout">
                                <p>
                                    The World Food Programme is the world&#39;s largest humanitarian agency fighting 
                                    hunger worldwide.</p>
                            </div>
                            <!--/ .intro -->     
                            <div class="callout_content callout">
                                <div>
                                    <p>
                                        In <a href="http://www.wfp.org/emergencies"><strong>emergencies</strong></a>, we 
                                        get food to where it is needed, saving the lives of victims of war, civil 
                                        conflict and natural disasters. After the cause of an
                                        <a href="http://www.wfp.org/preventing-hunger"><strong>emergency has passed</strong></a>, 
                                        we use food to help communities rebuild their shattered lives.</p>
                                    <p>
                                        WFP is part of the United Nations system and is voluntarily funded.</p>
                                    <p>
                                        Born in 1961, WFP pursues a vision of the world in which every man, woman and 
                                        child has access at all times to the food needed for an active and healthy life. 
                                        We work towards that vision with our sister UN agencies in Rome -- the Food and 
                                        Agriculture Organization (<a href="http://www.fao.org/"><strong>FAO</strong></a>) 
                                        and the International Fund for Agricultural Development (<a 
                                            href="http://www.ifad.org/"><strong>IFAD</strong></a>) -- as well as other 
                                        government, UN and NGO partners.</p>
                                    <p>
                                        On average, WFP reaches more than 80 million people with food assistance in 
                                        82&nbsp;countries each year. &nbsp;11,367&nbsp;people work for the organization, most of them 
                                        in remote areas, directly serving the hungry poor.&nbsp;</p>
                                    <p>
                                        To learn more, watch&nbsp;the
                                        <a href="http://www.wfp.org/videos/fighting-hunger-worldwide"><strong>video</strong></a> 
                                        outlining our mission, read our <strong>
                                        <a href="http://www.wfp.org/about/mission-statement">Mission Statement</a>&nbsp;</strong>and&nbsp;our<strong>
                                        </strong><a href="http://publications.wfp.org/en/apr/2013/"><strong>2013 Annual 
                                        Performance Report</strong>&nbsp;</a>or download the
                                        <a href="http://documents.wfp.org/stellent/groups/public/documents/newsroom/wfp261411.jpg">
                                        <strong>Infographic</strong></a>.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
   
</asp:Content>
