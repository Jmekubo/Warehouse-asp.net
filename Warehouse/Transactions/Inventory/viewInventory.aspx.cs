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

namespace Warehouse.Transactions.Inventory
{
    public partial class viewInventory : System.Web.UI.Page
    {
        public string constr;
        public SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            constr = ConfigurationManager.ConnectionStrings["warehousedbCon"].ConnectionString;
            con = new SqlConnection(constr);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from inventory", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GVinventory.DataSource = ds;
            GVinventory.DataBind();
        }



       

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            constr = ConfigurationManager.ConnectionStrings["warehousedbCon"].ConnectionString;
            con = new SqlConnection(constr);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from inventory where ItemName like '%" + txtitem.Text + "%'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GVinventory.DataSource = ds;
            GVinventory.DataBind();
        }
    }
}