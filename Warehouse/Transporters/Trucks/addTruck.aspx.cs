using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Warehouse
{
    public partial class addTransporter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btsave_Click(object sender, EventArgs e)
        {
            SqlDtTrucks.Insert();
        }
    }
}