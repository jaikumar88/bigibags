using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    clsConnection c1 = new clsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string query = "select count(*) from tblRegisteration where EmailId = '" + txtEmail.Text + "' and Password = '" + txtPassword.Text + "'";
        string res = c1.SelectScalar(query);
        if (int.Parse(res) == 1)
        {
            Session.Add("userId", txtEmail.Text);
            Response.Redirect("Index.aspx");
        }
        else
        {
            lblMsg.Text = "Either EmailId or Password is wrong";
        }
    }
}