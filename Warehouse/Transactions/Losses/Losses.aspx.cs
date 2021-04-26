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

namespace Warehouse
{
    public partial class Losses : System.Web.UI.Page
    {
        public string constr;
        public SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {

            RangeValidator1.MaximumValue = DateTime.Now.ToShortDateString();
            RangeValidator1.MinimumValue = DateTime.Now.AddDays(-30).ToShortDateString();

        }
            
            

        protected void btnsave_Click(object sender, EventArgs e)
        {
           
            SqlDataSLoss.Insert();

            txtQty.Text = "";
            txtReason.Text = "";
            ClientScript.RegisterStartupScript(this.GetType(), "key", "<script>alert('Loss Posted Successfully')</script>");
        }

        
       

        
      

       

       
    }
}