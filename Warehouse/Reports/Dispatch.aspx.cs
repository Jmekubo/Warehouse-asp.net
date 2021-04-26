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
    public partial class Dispatch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ReportDocument crystalReport = new ReportDocument();
            crystalReport.Load(Server.MapPath("~/Reports/rptDispatch.rpt"));
            dsDispatches dsDisp = GetData("select * from dispatches");
            crystalReport.SetDataSource(dsDisp);
            CrystalReportViewer1.ReportSource = crystalReport;
        }
        private dsDispatches GetData(string query)
        {

            string conString = ConfigurationManager.ConnectionStrings["warehousedbCon"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;

                    sda.SelectCommand = cmd;
                    using (dsDispatches dsDisp = new dsDispatches())
                    {
                        sda.Fill(dsDisp, "dispatches");
                        return dsDisp;
                    }
                }
            }
        }
    }
}