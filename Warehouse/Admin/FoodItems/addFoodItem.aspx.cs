using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace Warehouse
{
    public partial class addFoodItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /**protected void Ddlcat_DataBound(object sender, EventArgs e)
        {

            DropDownList Ddlcat = (DropDownList)sender;

            DetailsView DVFItem = (DetailsView)Ddlcat.NamingContainer;

            if (DVFItem.DataItem != null)
            {

                string strModel = ((DataRowView)DVFItem.DataItem)["Model"] as string;

                ListItem lm = Ddlcat.Items.FindByValue(strModel);

                if (lm != null) lm.Selected = true;

            }

        }
        protected void Ddlunit_DataBound(object sender, EventArgs e)
        {

            DropDownList Ddlunit = (DropDownList)sender;

            DetailsView DVFItem = (DetailsView)Ddlunit.NamingContainer;

            if (DVFItem.DataItem != null)
            {

                string strModel = ((DataRowView)DVFItem.DataItem)["Model"] as string;

                ListItem lm = Ddlunit.Items.FindByValue(strModel);

                if (lm != null) lm.Selected = true;

            }

        }**/
        
    }
}