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



namespace Warehouse.Dispatches
{

    public partial class Dispatches : System.Web.UI.Page
    {
        public string constr;
        public SqlConnection con;
        

        protected void Page_Load(object sender, EventArgs e)
        {

            RVDdate.MaximumValue = DateTime.Now.ToShortDateString();
            RVDdate.MinimumValue = DateTime.Now.AddDays(-30).ToShortDateString();


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
            dt.TableName = "Dispatches";
            //creating columns for DataTable  
            dt.Columns.Add(new DataColumn("WayBillNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("TranspID", typeof(int)));
            dt.Columns.Add(new DataColumn("TransporterName", typeof(string)));
            dt.Columns.Add(new DataColumn("ItemID", typeof(int)));
            dt.Columns.Add(new DataColumn("ItemName", typeof(string)));
            dt.Columns.Add(new DataColumn("empID", typeof(int)));
            dt.Columns.Add(new DataColumn("EmployeeName", typeof(string)));
            dt.Columns.Add(new DataColumn("Quantity", typeof(int)));
            dt.Columns.Add(new DataColumn("UnitPrice", typeof(decimal)));
            dt.Columns.Add(new DataColumn("Destination", typeof(string)));
            dt.Columns.Add(new DataColumn("TruckReg", typeof(string)));
            dt.Columns.Add(new DataColumn("Driversname", typeof(string)));
            dt.Columns.Add(new DataColumn("DispatchDate", typeof(DateTime)));
            dr = dt.NewRow();
            dt.Rows.Add(dr);

            ViewState["Dispatches"] = dt;
            GVDispatch.DataSource = dt;
            GVDispatch.DataBind();
        }

        private void AddNewRecordRowToGrid()
        {
           
            {

                if (ViewState["Dispatches"] != null)
                {
                    DataTable dtCurrentTable = (DataTable)ViewState["Dispatches"];
                    DataRow drCurrentRow = null;

                    if (dtCurrentTable.Rows.Count > 0)
                    {

                        for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                        {

                            //Creating new row and assigning values  
                            drCurrentRow = dtCurrentTable.NewRow();
                            drCurrentRow["WayBillNumber"] = txtwaybill_D.Text;
                            drCurrentRow["TranspID"] = DropDownListTransp.SelectedValue;
                            drCurrentRow["TransporterName"] = DropDownListTransp.SelectedItem;
                            drCurrentRow["ItemID"] = DropDownListItem_D.SelectedValue;
                            drCurrentRow["ItemName"] = DropDownListItem_D.SelectedItem;
                            drCurrentRow["empID"] = DropDownListEmployee_D.SelectedValue;
                            drCurrentRow["EmployeeName"] = DropDownListEmployee_D.SelectedItem;
                            drCurrentRow["Quantity"] = txtQuantity_D.Text;
                            drCurrentRow["UnitPrice"] = Convert.ToDecimal(txtUnitPrice_D.Text);
                            drCurrentRow["Destination"] = txtDestn.Text;
                            drCurrentRow["TruckReg"] = txtTruckNo_D.Text;
                            drCurrentRow["Driversname"] = txtDrivername_D.Text;
                            //drCurrentRow["Warrenty"] = Convert.ToInt32(TextBox3.Text);
                            drCurrentRow["DispatchDate"] = Convert.ToDateTime(txtDispatchDate.Text);
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
                        ViewState["Dispatches"] = dtCurrentTable;
                        //binding Gridview with New Row  
                        GVDispatch.DataSource = dtCurrentTable;
                        GVDispatch.DataBind();
                    }
                }
            }
        }
        protected void btnAddItem_Click(object sender, EventArgs e)
        {
           

                int SelectedDPItem;
                int InventoryQTY;
                int DinventoryQTY;


                SqlConnection Connection = new SqlConnection("Data Source=localhost;Initial Catalog=warehousedb;Integrated Security=True ");
                SqlDataAdapter INVadapter = new SqlDataAdapter("Select ItemID, ItemName,  Quantity FROM inventory ", Connection);


                SelectedDPItem = int.Parse(DropDownListItem_D.SelectedValue.ToString());
             
                //  Open Connection
                Connection.Open();
                SqlCommand Inventorychkcommand = new SqlCommand(("Select  Quantity FROM inventory " + ("WHERE (ItemID LIKE \'"
                    + (DropDownListItem_D.SelectedValue + "\')"))), Connection);
                InventoryQTY = Convert.ToInt32(Inventorychkcommand.ExecuteScalar());

                DinventoryQTY = Convert.ToInt32(txtQuantity_D.Text);



                if (InventoryQTY < DinventoryQTY)
                {

                    ClientScript.RegisterStartupScript(this.GetType(), "key", "<script>alert('sorry , Stock Balance is less than requested quantity.')</script>");
                    txtQuantity_D.Text = "";
                }


                
                
            

                else 
                

                    {
                    // procedure of inserting the record
                    AddNewRecordRowToGrid();

                    txtwaybill_D.Enabled = false;
                    DropDownListTransp.Enabled = false;
                    txtTruckNo_D.Enabled = false;
                    txtDrivername_D.Enabled = false;
                    DropDownListEmployee_D.Enabled = false;
                    btnNew.Enabled = false;
                    btnPostDispatch.Enabled = true;

                    DropDownListItem_D.Enabled = false;
                    txtDispatchDate.Enabled = false;
                    txtDestn.Enabled = false;
                    txtQuantity_D.Enabled = false;
                    txtDestn.Enabled = false;
                    }



                Connection.Close(); 
           
                

                }




            



  
        public void connection()
        {
            //Storing connection string   
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

            DataTable dtDispac = (DataTable)ViewState["Dispatches"];
            connection();

            //creating object of SqlBulkCopy 
            SqlBulkCopy objbulk = new SqlBulkCopy(con.ConnectionString, SqlBulkCopyOptions.FireTriggers);

            {

                //assigning Destination table name  
                objbulk.DestinationTableName = "dispatches";
                //Mapping Table column  
                objbulk.ColumnMappings.Add("WayBillNumber", "WayBillNumber");
                objbulk.ColumnMappings.Add("TranspID", "TranspID");
                objbulk.ColumnMappings.Add("TransporterName", "TransporterName");
                objbulk.ColumnMappings.Add("empID", "empID");
                objbulk.ColumnMappings.Add("EmployeeName", "EmployeeName");
                objbulk.ColumnMappings.Add("ItemID", "ItemID");
                objbulk.ColumnMappings.Add("ItemName", "ItemName");
                objbulk.ColumnMappings.Add("Quantity", "Quantity");
                objbulk.ColumnMappings.Add("UnitPrice", "UnitPrice");
                objbulk.ColumnMappings.Add("Destination", "Destination");
                objbulk.ColumnMappings.Add("TruckReg", "TruckReg");
                objbulk.ColumnMappings.Add("Driversname", "Driversname");
                objbulk.ColumnMappings.Add("DispatchDate", "DispatchDate");


                //inserting bulk Records into DataBase   
                objbulk.WriteToServer(dtDispac);
                //show confirmation
                con.Close();
            }

        }

        protected void btnPostDispatch_Click(object sender, EventArgs e)
        {

          
                    BulkInsertToDataBase();
            string message = "Dispatch posted Successfully.";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

            txtDispatchDate.Enabled = false;
            DropDownListItem_D.Enabled = false;
            txtQuantity_D.Enabled = false;
            txtUnits.Enabled = false;
            txtUnitPrice_D.Enabled = false;
            txtDestn.Enabled = false;
            btnAddDItem.Enabled = false;

            btnNew.Enabled = true;
            btnPostDispatch.Enabled = false;

            AddDefaultFirstRecord();

        }

        protected void DropDownListItem_D_SelectedIndexChanged(object sender, EventArgs e)
        {


            constr = ConfigurationManager.ConnectionStrings["warehousedbCon"].ConnectionString;
            con = new SqlConnection(constr);
            con.Open();

            string selectedID = DropDownListItem_D.SelectedItem.Value;

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
                    txtUnitPrice_D.Text = Reader.GetValue(0).ToString();
                    txtUnits.Text = Reader.GetValue(1).ToString();

                }

            }
             

        }


        

        protected void btnNew_Click(object sender, EventArgs e)
        {
            txtwaybill_D.Enabled = true;
            DropDownListTransp.Enabled = true;
            txtTruckNo_D.Enabled = true;
            txtDrivername_D.Enabled = true;
            DropDownListEmployee_D.Enabled = true;
            txtwaybill_D.Text = "";
            txtTruckNo_D.Text = "";
            txtDrivername_D.Text = "";
            txtDestn.Text = "";
            txtQuantity_D.Text = "";
            btnAddDItem.Enabled = false;

            txtDispatchDate.Enabled = true;
            DropDownListItem_D.Enabled = true;
            txtQuantity_D.Enabled = true;
            txtUnits.Enabled = true;
            txtUnitPrice_D.Enabled = true;
            txtDestn.Enabled = true;
            btnAddDItem.Enabled = true;
        }

     

        protected void txtwaybill_D_TextChanged(object sender, EventArgs e)
        {
          
           
        }

        protected void txtwaybill_D_TextChanged1(object sender, EventArgs e)
        {
            //check if waybill Record already present in db
            constr = ConfigurationManager.ConnectionStrings["warehousedbCon"].ConnectionString;
            con = new SqlConnection(constr);

            SqlCommand comm = new SqlCommand("select DispID,WayBillNumber from dispatches where WayBillNumber='" + txtwaybill_D.Text + "' ", con);

            con.Open();

            int i = Convert.ToInt32(comm.ExecuteScalar());
            if ((i > 0))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('sorry , this WayBillNumber already exists, Enter a different one');", true);
                txtwaybill_D.Text = "";
            }
        }

             
        }

    }

        
                

        

        
    

    








