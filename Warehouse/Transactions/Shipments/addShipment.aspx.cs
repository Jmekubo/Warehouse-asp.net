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
    public partial class addShipment : System.Web.UI.Page
    {
       
       
    
        protected void Page_Load(object sender, EventArgs e)
        {
            
            RVstart.MinimumValue = DateTime.Today.ToShortDateString();
            RVstart.MaximumValue = DateTime.Today.ToShortDateString();
            RVend.MinimumValue = DateTime.Today.ToShortDateString();
            RVend.MaximumValue = DateTime.Today.AddDays(5).ToShortDateString();
        }

       protected void Button1_Click(object sender, EventArgs e)
        {
            //SqlDtShipment.Insert();
            String strConnString = ConfigurationManager.ConnectionStrings["warehousedbCon"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertShipmentDetails";
            cmd.Parameters.Add("@ShipmentStartDate", SqlDbType.SmallDateTime).Value = txtShipSDate.Text.Trim();
            cmd.Parameters.Add("@ShipmentEndDate", SqlDbType.SmallDateTime).Value = txtShipEDate.Text.Trim();
            cmd.Parameters.Add("@TranspID", SqlDbType.Int).Value = DPLTransp.SelectedValue.Trim();
            cmd.Parameters.Add("@TransporterName", SqlDbType.VarChar).Value = DPLTransp.SelectedItem.Text.Trim();
            cmd.Parameters.Add("@ItemID", SqlDbType.Int).Value = DPLItemName.SelectedValue.Trim();
            cmd.Parameters.Add("@ItemName", SqlDbType.VarChar).Value = DPLItemName.SelectedItem.Text.Trim();
            cmd.Parameters.Add("@Quantity", SqlDbType.Int).Value = txtQty.Text.Trim();
            cmd.Parameters.Add("@LoadingPoint", SqlDbType.VarChar).Value = txtloadin.Text.Trim();
            cmd.Parameters.Add("@DestinationPoint", SqlDbType.VarChar).Value = txtdestin.Text.Trim();
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Shipment posted successfully');", true);
                txtdestin.Enabled = false;
                txtloadin.Enabled = false;
                txtQty.Enabled = false;
                txtShipEDate.Enabled = false;
                txtShipSDate.Enabled = false;
                con.Close();
                con.Dispose();
            }

            //{
             //   Response.Redirect("addShipment.aspx");
           // }
        }

       protected void btnnew_Click(object sender, EventArgs e)
       {
           txtdestin.Enabled = true;
           txtloadin.Enabled = true;
           txtQty.Enabled = true;
           txtShipEDate.Enabled = true;
           txtShipSDate.Enabled = true;
       }


        
     
    }
        
}

        
         