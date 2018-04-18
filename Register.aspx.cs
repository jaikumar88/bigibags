using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    clsConnection c1 = new clsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
        string query = "select count(*) from tblRegisteration where EmailId = '" + txtEmail.Text + "'";
        string res = c1.SelectScalar(query);
        if (int.Parse(res) == 0)
        {
            query = "insert into tblRegisteration(FirstName,LastName,EmailId,Password,MobileNo)values('" + txtFirst.Text + "','" + txtSecond.Text + "','" + txtEmail.Text + "','" + txtCPassword.Text + "','" + txtMobile.Text + "')";
            c1.ExecuteQry(query);
            Response.Redirect("ConfirmRegistration.aspx");
        }
        else
        {
            lblMessage.Visible = true;
        }
    }
}