using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static void MyMethod(string test1, string Param2)
    {
        try
        {
            //Do here server event  
            string item_name = test1;
        }
        catch (Exception)
        {
            throw;
        }
    }
}