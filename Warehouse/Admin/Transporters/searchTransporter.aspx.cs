using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Warehouse.Admin.Transporters
{
    public partial class searchTransporter : System.Web.UI.Page
    {
        public string constr;
        public SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            constr = ConfigurationManager.ConnectionStrings["warehousedbCon"].ConnectionString;
            con = new SqlConnection(constr);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from transporters", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GVtransp.DataSource = ds;
            GVtransp.DataBind();
        }

      

        protected void btnsearch_Click1(object sender, EventArgs e)
        {
            constr = ConfigurationManager.ConnectionStrings["warehousedbCon"].ConnectionString;
            con = new SqlConnection(constr);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from transporters where TransporterName like '%" + txttransp.Text + "%'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GVtransp.DataSource = ds;
            GVtransp.DataBind();
        }

    }
}