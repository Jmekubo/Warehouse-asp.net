using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using System.Text;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;


namespace Warehouse.Receipts
{

    public partial class Receipts : System.Web.UI.Page
    {
        public string constr;
        public MySqlConnection con;
        public MySqlCommand comm;
        public MySqlTransaction tran;
        public MySqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
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
            dt.Columns.Add(new DataColumn("SupplierID", typeof(int)));
            dt.Columns.Add(new DataColumn("SupplierName", typeof(string)));
            dt.Columns.Add(new DataColumn("ItemID", typeof(int)));
            dt.Columns.Add(new DataColumn("ItemName", typeof(string)));
            dt.Columns.Add(new DataColumn("employeeID", typeof(int)));
            dt.Columns.Add(new DataColumn("EmployeeName", typeof(string)));
            dt.Columns.Add(new DataColumn("Quantity", typeof(int)));
            dt.Columns.Add(new DataColumn("UnitPrice", typeof(decimal)));
            dt.Columns.Add(new DataColumn("TruckNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("Driversname", typeof(string)));
            dt.Columns.Add(new DataColumn("Condition", typeof(string)));
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
                        drCurrentRow["SupplierID"] = DropDownListSupplier.SelectedValue;
                        drCurrentRow["SupplierName"] = DropDownListSupplier.SelectedItem;
                        drCurrentRow["ItemID"] = DropDownListItem.SelectedValue;
                        drCurrentRow["ItemName"] = DropDownListItem.SelectedItem;
                        drCurrentRow["EmployeeID"] = DropDownListEmployee.SelectedValue;
                        drCurrentRow["EmployeeName"] = DropDownListEmployee.SelectedItem;
                        drCurrentRow["Quantity"] = txtQuantity.Text;
                        drCurrentRow["UnitPrice"] = Convert.ToDecimal(txtUnitPrice.Text);
                        drCurrentRow["TruckNumber"] = txtTruckno.Text;
                        drCurrentRow["Driversname"] = txtDrivername.Text;
                        drCurrentRow["Condition"] = txtCondition.Text;
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
            AddNewRecordRowToGrid();
        }


        protected void btnPostReceipt_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)ViewState["CurrentTable"];
            string WayBillNumber, SupplierName, ItemName, EmployeeName, Quantity, TruckNumber, DriversName, FoodCondition;
            int SupplierID, ItemID, employeeID;
            decimal UnitPrice;
            DateTime ReceiptDate;

            foreach (DataRow Row in dt.Rows)
            {
                WayBillNumber = Row["WayBillNumber"].ToString();
                SupplierID = int.Parse(Row["SupplierID"].ToString());
                SupplierName = Row["SupplierName"].ToString();
                employeeID = int.Parse(Row["employeeID"].ToString());
                EmployeeName = Row["EmployeeName"].ToString();
                ItemID = int.Parse(Row["ItemID"].ToString());
                ItemName = Row["ItemName"].ToString();
                Quantity = Row["Quantity"].ToString();
                UnitPrice = Decimal.Parse(Row["UnitPrice"].ToString());
                TruckNumber = Row["TruckNumber"].ToString();
                DriversName = Row["DriversName"].ToString();
                FoodCondition = Row["FoodCondition"].ToString();
                ReceiptDate = DateTime.Parse(Row["DateTime"].ToString());
            }
        }
        private void InsertRows(String WayBillNumber, string SupplierName, String ItemName, String EmployeeName, String Quantity, String TruckNumber, String DriversName, String FoodCondition, int SupplierID, int ItemID, int employeeID, decimal UnitPrice, DateTime ReceiptDate)
            {
            string constr = ConfigurationManager.ConnectionStrings["warehousedbConn"].ConnectionString;
            using (MySqlConnection Con = new MySqlConnection(constr))
            {

               using (MySqlCommand cmd = new MySqlCommand("Insert_Receipt", Con))
            {
                Con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@WayBillNumber", WayBillNumber);
                    cmd.Parameters.AddWithValue("@SupplierID", SupplierID);
                    cmd.Parameters.AddWithValue("@SupplierName", SupplierName);
                    cmd.Parameters.AddWithValue("@EmployeeID", employeeID);
                    cmd.Parameters.AddWithValue("@EmployeeName", EmployeeName);
                    cmd.Parameters.AddWithValue("@ItemID", ItemID);
                    cmd.Parameters.AddWithValue("@ItemName", ItemName);
                    cmd.Parameters.AddWithValue("@Quantity", Quantity);
                    cmd.Parameters.AddWithValue("@UnitPrice", UnitPrice);
                    cmd.Parameters.AddWithValue("@TruckNumber", TruckNumber);
                    cmd.Parameters.AddWithValue("@DriversName", DriversName);
                    cmd.Parameters.AddWithValue("@FoodCondition", FoodCondition);
                    cmd.Parameters.AddWithValue("@ReceiptDate", ReceiptDate);
                    cmd.ExecuteNonQuery();

                    con.Close();

    }
}
}
}
}





