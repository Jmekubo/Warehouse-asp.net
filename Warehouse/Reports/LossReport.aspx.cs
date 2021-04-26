using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Data;
using System.Collections.Specialized;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

namespace Warehouse
{
    public partial class LossReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ReportDocument crystalReport = new ReportDocument();
            crystalReport.Load(Server.MapPath("~/Reports/rptLoss.rpt"));
            dsLoss dsLosss = GetData("select * from losses");
            crystalReport.SetDataSource(dsLosss);
            CrystalReportViewer1.ReportSource = crystalReport;
        }
        private dsLoss GetData(string query)
        {

            string conString = ConfigurationManager.ConnectionStrings["warehousedbCon"].ConnectionString;
            SqlCommand ccmd = new SqlCommand(query);
            using (SqlConnection conn = new SqlConnection(conString))
            {
                using (SqlDataAdapter ssda = new SqlDataAdapter())
                {
                    ccmd.Connection = conn;

                    ssda.SelectCommand = ccmd;
                    using (dsLoss dsLosss = new dsLoss())
                    {
                        ssda.Fill(dsLosss, "items");
                        return dsLosss;
                    }
                }
            }
        }
    }
}