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
using MySql.Data.MySqlClient;



namespace Warehouse.Receipts
{

    public partial class Receipts : System.Web.UI.Page
    {
        public string constr;
        public SqlConnection con;
       
        public SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            RVdate.MaximumValue = DateTime.Now.ToShortDateString();
            RVdate.MinimumValue = DateTime.Now.AddDays(-30).ToShortDateString();

            
            if (!IsPostBack)
            {
                AddDefaultFirstRecord();
            }
        }

        private void AddDefaultFirstRecord()
        {
            //creating DataTable  
            DataTable dt = new DataTable();
            DataRow dr;
            dt.TableName = "Receipts";
            //creating columns for DataTable  
            dt.Columns.Add(new DataColumn("WayBillNumber", typeof(string)));

            dt.Columns.Add(new DataColumn("OriginLocation", typeof(string)));
            dt.Columns.Add(new DataColumn("ItemID", typeof(int)));
            dt.Columns.Add(new DataColumn("ItemName", typeof(string)));
            dt.Columns.Add(new DataColumn("empID", typeof(int)));
            dt.Columns.Add(new DataColumn("EmployeeName", typeof(string)));
            dt.Columns.Add(new DataColumn("Quantity", typeof(int)));
            dt.Columns.Add(new DataColumn("UnitPrice", typeof(decimal)));
            dt.Columns.Add(new DataColumn("Condition", typeof(string)));
            dt.Columns.Add(new DataColumn("TruckReg", typeof(string)));
            dt.Columns.Add(new DataColumn("Driversname", typeof(string)));
            dt.Columns.Add(new DataColumn("ReceiptDate", typeof(DateTime)));
            dr = dt.NewRow();
            dt.Rows.Add(dr);

            ViewState["Receipts"] = dt;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private void AddNewRecordRowToGrid()
        {
            if (ViewState["Receipts"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["Receipts"];
                DataRow drCurrentRow = null;

                if (dtCurrentTable.Rows.Count > 0)
                {

                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {

                        //Creating new row and assigning values  
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["WayBillNumber"] = txtwaybill.Text;

                        drCurrentRow["OriginLocation"] = txtOrigin.Text;
                        drCurrentRow["ItemID"] = DropDownListItem.SelectedValue;
                        drCurrentRow["ItemName"] = DropDownListItem.SelectedItem;
                        drCurrentRow["empID"] = DropDownListEmployee.SelectedValue;
                        drCurrentRow["EmployeeName"] = DropDownListEmployee.SelectedItem;
                        drCurrentRow["Quantity"] = txtQuantity.Text;
                        drCurrentRow["UnitPrice"] = Convert.ToDecimal(txtUnitPrice.Text);
                        drCurrentRow["Condition"] = txtCondition.Text;
                        drCurrentRow["TruckReg"] = txtTruckno.Text;
                        drCurrentRow["Driversname"] = txtDrivername.Text;
                        //drCurrentRow["Warrenty"] = Convert.ToInt32(TextBox3.Text);
                        drCurrentRow["ReceiptDate"] = Convert.ToDateTime(txtDate.Text);
                    }
                    //Removing initial blank row  
                    if (dtCurrentTable.Rows[0][0].ToString() == "")
                    {
                        dtCurrentTable.Rows[0].Delete();
                        dtCurrentTable.AcceptChanges();

                    }

                    //Added New Record to the DataTable  
                    dtCurrentTable.Rows.Add(drCurrentRow);
                    //storing DataTable to ViewState  
                    ViewState["Receipts"] = dtCurrentTable;
                    //binding Gridview with New Row  
                    GridView1.DataSource = dtCurrentTable;
                    GridView1.DataBind();
                }
            }
        }
        protected void btnAddItem_Click(object sender, EventArgs e)
        {


            //check if waybill Record already present in db
            constr = ConfigurationManager.ConnectionStrings["warehousedbCon"].ConnectionString;
            con = new SqlConnection(constr);

            SqlCommand com = new SqlCommand("select RecptID,WayBillNumber from receipts where WayBillNumber='" + txtwaybill.Text + "' ", con);

            con.Open();

            int i = Convert.ToInt32(com.ExecuteScalar());
            if ((i > 0))
            {

                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('sorry , this WayBillNumber already exists, Enter a different one');", true);
                    txtwaybill.Text = "";
                }

            }

            else
            {


                AddNewRecordRowToGrid();
                txtCondition.Text = "";
                txtQuantity.Text = "";
                txtwaybill.Enabled = false;
                txtOrigin.Enabled = false;
                txtTruckno.Enabled = false;
                txtDrivername.Enabled = false;
                DropDownListEmployee.Enabled = false;
                btnNewWayBill.Enabled = false;
                btnPostReceipt.Enabled = true;
                btnNewWayBill.Enabled = false;

            }

            con.Close();

        }
        protected void btnPostReceipt_Click(object sender, EventArgs e)
        {


            BulkInsertToDataBase();

            string message = "Receipt Posted Successfully.";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

            txtDate.Enabled = false;
            DropDownListItem.Enabled = false;
            txtQuantity.Enabled = false;
            txtUnits.Enabled = false;
            txtUnitPrice.Enabled = false;
            txtCondition.Enabled = false;
            btnAddItem.Enabled = false;
            txtwaybill.Enabled = false;
            txtOrigin.Enabled = false;
            txtTruckno.Enabled = false;
            txtDrivername.Enabled = false;
            txtwaybill.Text = "";
            txtOrigin.Text = "";
            txtTruckno.Text = "";
            txtDrivername.Text = "";
            btnPostReceipt.Enabled = false;
            btnNewWayBill.Enabled = true;

            //ClientScript.RegisterStartupScript(this.GetType(), "key", "<script>alert('Receipt Posted Successfully')</script>");

            AddDefaultFirstRecord();
        }

        public void connection()
        {
            //Stoting connection string   
            constr = ConfigurationManager.ConnectionStrings["warehousedbCon"].ConnectionString;
            con = new SqlConnection(constr);
            con.Open();

        }

        private void BulkInsertToDataBase()
        {



            //Storing connection string   
            constr = ConfigurationManager.ConnectionStrings["warehousedbCon"].ConnectionString;
            con = new SqlConnection(constr);
            con.Open();


            DataTable dtReceipts = (DataTable)ViewState["Receipts"];
            connection();
            //creating object of SqlBulkCopy  
            SqlBulkCopy objbulk = new SqlBulkCopy(con.ConnectionString, SqlBulkCopyOptions.FireTriggers);
            {
                //assigning Destination table name  
                objbulk.DestinationTableName = "receipts";
                //Mapping Table column  
                objbulk.ColumnMappings.Add("WayBillNumber", "WayBillNumber");
                objbulk.ColumnMappings.Add("OriginLocation", "OriginLocation");
                objbulk.ColumnMappings.Add("empID", "empID");
                objbulk.ColumnMappings.Add("EmployeeName", "EmployeeName");
                objbulk.ColumnMappings.Add("ItemID", "ItemID");
                objbulk.ColumnMappings.Add("ItemName", "ItemName");
                objbulk.ColumnMappings.Add("Quantity", "Quantity");
                objbulk.ColumnMappings.Add("UnitPrice", "UnitPrice");
                objbulk.ColumnMappings.Add("Condition", "Condition");
                objbulk.ColumnMappings.Add("TruckReg", "TruckReg");
                objbulk.ColumnMappings.Add("Driversname", "Driversname");
                objbulk.ColumnMappings.Add("ReceiptDate", "ReceiptDate");


                //inserting bulk Records into DataBase   
                objbulk.WriteToServer(dtReceipts);
                //show confirmation

            }


        }
       

        protected void DropDownListItem_SelectedIndexChanged(object sender, EventArgs e)
         {
            constr = ConfigurationManager.ConnectionStrings["warehousedbCon"].ConnectionString;
            con = new SqlConnection(constr);
            con.Open();

            string selectedID = DropDownListItem.SelectedItem.Value;

            SqlCommand theCommand = new SqlCommand("SELECT UnitPrice, Units FROM items WHERE ItemID = @ItemID", con);
            theCommand.Parameters.AddWithValue("@ItemID", selectedID);
            theCommand.CommandType = CommandType.Text;

            using (SqlDataReader Reader = theCommand.ExecuteReader())
            {
                if (Reader.HasRows)
                {
                    // Get the first row
                    Reader.Read();

                    // Set the text box values
                    txtUnitPrice.Text = Reader.GetValue(0).ToString();
                    txtUnits.Text = Reader.GetValue(1).ToString();
                }


            }

        }

        protected void btnNewWayBill_Click(object sender, EventArgs e)
        {
            txtDate.Enabled = true;
            DropDownListItem.Enabled = true;
            txtQuantity.Enabled = true;
            txtUnits.Enabled = true;
            txtUnitPrice.Enabled = true;
            txtCondition.Enabled = true;
            btnAddItem.Enabled = true;
            txtwaybill.Enabled = true;
            txtOrigin.Enabled = true;
            txtTruckno.Enabled = true;
            txtDrivername.Enabled = true;
            DropDownListEmployee.Enabled = true;
            btnNewWayBill.Enabled = true;
        }

        
    }
}






