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

namespace Warehouse.Admin.FoodItems
{
    public partial class searchItems : System.Web.UI.Page
    {

        public string constr;
        public SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            constr = ConfigurationManager.ConnectionStrings["warehousedbCon"].ConnectionString;
            con = new SqlConnection(constr);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from items", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GVsearch.DataSource = ds;
            GVsearch.DataBind();
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            constr = ConfigurationManager.ConnectionStrings["warehousedbCon"].ConnectionString;
            con = new SqlConnection(constr);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from items where ItemName like '%" + txtitem.Text + "%'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GVsearch.DataSource = ds;
            GVsearch.DataBind();
        }

      
    }
}