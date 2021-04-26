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
    public partial class InventoryReport : System.Web.UI.Page
    {

        


        protected void Page_Load(object sender, EventArgs e)
        {
            ReportDocument crystalReport = new ReportDocument();
            crystalReport.Load(Server.MapPath("~/Reports/rptInventoryLevels.rpt"));
            dsInventory dsInvent = GetData("select * from inventory");
            crystalReport.SetDataSource(dsInvent);
            CrystalReportViewer1.ReportSource = crystalReport;
        }

        private dsInventory GetData(string query)
        {

            string conString = ConfigurationManager.ConnectionStrings["warehousedbCon"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;

                    sda.SelectCommand = cmd;
                    using (dsInventory dsInvent = new dsInventory())
                    {
                        sda.Fill(dsInvent, "inventory");
                        return dsInvent;
                    }
                }
            }
        }
    }
}