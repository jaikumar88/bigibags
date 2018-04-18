using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


/// <summary>
/// Summary description for clsConnection
/// </summary>
public class clsConnection
{
	public clsConnection()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    string ConStr70 = "workstation id=dbbigibagsomee.mssql.somee.com;packet size=4096;user id=bigibagonlinesh;pwd=Kamal@123;data source=dbbigibagsomee.mssql.somee.com;persist security info=False;initial catalog=dbbigibagsomee";
    //string ConStr70 = "server=SHAHIDARYA-PC;database=VinayakJewells;trusted_connection=yes";
    SqlConnection con = new SqlConnection();
    SqlDataAdapter adpt = new SqlDataAdapter();
    SqlCommand cmd = new SqlCommand();

    public DataSet SelectDS(string SQL)
    {
        DataSet ds = new DataSet();
        if (con.State == ConnectionState.Closed)
        {
            con.ConnectionString = ConStr70;
            con.Open();
        }
        cmd.CommandText = SQL;
        cmd.Connection = con;
        adpt.SelectCommand = cmd;
        adpt.Fill(ds);
        
        return ds;
    }


    public SqlDataReader SelectRD(string SQL)
    {
        SqlDataReader rd;
        if (con.State == ConnectionState.Closed)
        {
            con.ConnectionString = ConStr70;
            con.Open();
        }
        cmd.CommandText = SQL;
        cmd.Connection = con;
        rd = cmd.ExecuteReader();
        return rd;
    }

    public string SelectScalar(string SQL)
    {
        string v;
        if (con.State == ConnectionState.Closed)
        {
            con.ConnectionString = ConStr70;
            con.Open();
        }
        cmd.CommandText = SQL;
        cmd.Connection = con;
        v = Convert.ToString(cmd.ExecuteScalar());
        con.Close();
        return v;
    }

    public void ExecuteQry(string SQL)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.ConnectionString = ConStr70;
            con.Open();
        }

        cmd.CommandText = SQL;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();
     }

    public void CallSP(string SQL)
    {
        con.ConnectionString = ConStr70;
        con.Open();
        
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SpTarani";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();

        cmd.CommandType = CommandType.Text;
        con.Close();            
    }

    public DataSet CallSP1()
    {
        DataSet ds = new DataSet();
        con.ConnectionString = ConStr70;
        con.Open();

        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SpTarani";
        cmd.Connection = con;

        adpt.SelectCommand = cmd;
        adpt.Fill(ds);

        cmd.CommandType = CommandType.Text;
        con.Close();
        return ds;
    }




    public string ExecuteSP(string FldStr, string ValueStr, string SpName)
    {
        string[] fldName = new string[15];
        string[] contValue = new string[15];
        string param, fn;
        if (con.State == ConnectionState.Closed)
        {
            con.ConnectionString = ConStr70;
            con.Open();
        }

        // define which character is seperating fields    
        char[] splitter = { ',' };
        fldName = FldStr.Split(splitter);
        contValue = ValueStr.Split(splitter);

        for (int i = 0; i < fldName.Length; i++)
        {
            param = "@" + fldName[i].ToString();
            cmd.Parameters.Add(new SqlParameter(param,SqlDbType.VarChar));
            cmd.Parameters[param].Value = contValue[i].ToString();
        }
        cmd.CommandText = SpName;
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        fn = Convert.ToString(cmd.ExecuteScalar());
        con.Close();
        cmd.CommandType = CommandType.Text;
        return fn;
    }

    public DataSet FillProductD(string gid, string pids )
    {
        //string strConn = ConfigurationSettings.AppSettings["ConnectionInfo"];
        //string strConn = "SERVER=66.7.148.181; DATABASE=Swapansakar; Uid=swapansakar; Pwd=swapansakar";
        string sql;
        if (con.State == ConnectionState.Closed)
        {
            con.ConnectionString = ConStr70;
            con.Open();
        }
            sql = "SELECT * FROM tbl_Products WHERE ProductGroupId =" + gid;
            sql = sql + " AND ProductId in (" + pids + ")";
            //SqlConnection MyConn = new SqlConnection(strConn);

            DataSet ds = new DataSet();
            SqlDataAdapter Cmd = new SqlDataAdapter(sql, con);
            Cmd.Fill(ds, "Products");

            sql = "select * from tbl_ProductDescription WHERE ProductId in (" + pids + ")";
            SqlDataAdapter Cmd2 = new SqlDataAdapter(sql, con);
            Cmd2.Fill(ds, "Description");

            ds.Relations.Add("myrelation", ds.Tables["Products"].Columns["ProductId"], ds.Tables["Description"].Columns["ProductId"]);
            con.Close();
            return ds;
    }
}
