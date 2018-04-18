using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Checkout : System.Web.UI.Page
{
    static clsConnection con = new clsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //string item_name = Request.Form["w3ls_item"].ToString();
            //string[] _itemname = item_name.Split(',');



            //string item_id = Request.Form["item_id1"].ToString();
            //string[] _productId = item_id.Split(',');

            //Session.Add("item_id", _productId);

            //string quantity = Request.Form["quantity"].ToString();
            //string[] _quantity = quantity.Split(',');

            //Session.Add("quantity", quantity);

            //string amount = Request.Form["amount"].ToString();
            //string[] _amount = amount.Split(',');



            //string query = "";
            //for (int i = 0; i < _itemname.Length; i++)
            //{
            //    query = "insert into tblCart values('" + _productId[i] + "','" + _quantity[i] + "','" + Session["userId"] + "')";
            //    con.ExecuteQry(query);
            //}
        }
    }

    [WebMethod]
    public static void MyMethod(string pname, string itemid, string q, string a)
    {
        try
        {
            //Do here server event  
            //string item_name = pname;
            string item_name = pname;
            item_name = item_name.TrimEnd(',');
            string[] _itemname = item_name.Split(',');



            string item_id = itemid;
            item_id = item_id.TrimEnd(',');
            string[] _productId = item_id.Split(',');

           System.Web.HttpContext.Current.Session.Add("item_id", _productId);

            string quantity = q;
            quantity = quantity.TrimEnd(',');
            string[] _quantity = quantity.Split(',');

            System.Web.HttpContext.Current.Session.Add("quantity", quantity);

            string amount = a;
            amount = amount.TrimEnd(',');
            string[] _amount = amount.Split(',');



            string query = "";
            for (int i = 0; i < _itemname.Length; i++)
            {
                query = "insert into tblCart values('" + _productId[i] + "','" + _quantity[i] + "','" + System.Web.HttpContext.Current.Session["userId"] + "')";
                con.ExecuteQry(query);
            }
        }
        catch (Exception)
        {
            throw;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Session["userId"] != null)
        {
            panelcheckpout.Visible = false;
            panel1.Visible = true;
        }
        else
        {

            Response.Redirect("Login.aspx");
        }
    }
    protected void btnConfirmOrder_Click(object sender, EventArgs e)
    {
        string query = "";
        string orderno = "select max(OrderNo) from tblOrderDetail";
        int orderNo = int.Parse(con.SelectScalar(orderno));
        orderNo = orderNo + 1;

        if (Session["userId"] != null)
        {

            query = "insert into tblOrderDetail values('"+orderNo+"','" + Session["userId"].ToString() + "','" + Session["item_id"].ToString() + "','" + Session["quantity"].ToString() + "','" + txtAddress1.Text + "','" + txtAddress2.Text + "','" + txtAddress3.Text + "','" + txtCity.Text + "','" + txtPincode.Text + "','Pending')";
        }
        else
        {
            query = "insert into tblOrderDetail values('"+orderNo+"','" + Session["userId"].ToString() + "','" + Session["item_id"].ToString() + "','" + Session["quantity"].ToString() + "','" + txtAddress1.Text + "','" + txtAddress2.Text + "','" + txtAddress3.Text + "','" + txtCity.Text + "','" + txtPincode.Text + "','Pending')";
        }
        con.ExecuteQry(query);
        query = "delete from tblCart where userid = '" + Session["userId"] + "'";
        con.ExecuteQry(query);
        Response.Redirect("ConfirmOrder.aspx");
    }
}