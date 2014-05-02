using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Welcome : System.Web.UI.Page
{
    Hashtable ht = new Hashtable();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO USERS(username, password) VALUES (@username, @password)", con);

        /*
         check existing users here
         */
        SqlCommand check = new SqlCommand("SELECT username FROM users WHERE username = @username", con);
        check.Parameters.Add("@username", SqlDbType.VarChar);
        check.Parameters["@username"].Value = txtUser.Text;
        SqlDataReader userCheck = check.ExecuteReader();

        if (userCheck.Read())
        {
            lblForm.Text = "That username exists, please try another.";
        }
        else
        {
            userCheck.Close();
            cmd.Parameters.Add("@username", SqlDbType.VarChar);
            cmd.Parameters.Add("@password", SqlDbType.VarChar);
            cmd.Parameters["@username"].Value = txtUser.Text;
            cmd.Parameters["@password"].Value = txtPassword.Text;
            cmd.ExecuteNonQuery();
            lblForm.Text = "Success, please log in.";
        }

        con.Close();
    }
    protected void btnSignin_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM users Where username = @username AND password = @password", con);
        cmd.Parameters.Add("@username", SqlDbType.VarChar);
        cmd.Parameters.Add("@password", SqlDbType.VarChar);
        cmd.Parameters["@username"].Value = txtUser.Text;
        cmd.Parameters["@password"].Value = txtPassword.Text;
        SqlDataReader reader = cmd.ExecuteReader();
        
        while (reader.Read())
        {
            ht.Add(reader.GetString(0), reader.GetString(1));            
        }

        reader.Close();
        con.Close();

        try
        {
            if (ht[txtUser.Text].ToString() == txtPassword.Text)
            {
                if (txtUser.Text == "admin")
                {
                    Session.Add("User", txtUser.Text);
                    Session.Add("isSignedIn", "true");
                    Response.Redirect("admin.aspx");
                }
                Session.Add("User", txtUser.Text);
                Session.Add("isSignedIn", "true");
                Response.Redirect("home.aspx");                
            }
        }
        catch (NullReferenceException noUser)
        {
            lblForm.Text = "That username or password is invalid, please register or try again.";
        }
        
    }
}