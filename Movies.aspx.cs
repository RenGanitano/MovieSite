using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Movies : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        pnlMovie.Visible = false;
        pnlPlan.Visible = false;
        pnlPurchase.Visible = false;
        pnlCredit.Visible = false;
        pnlPayPal.Visible = false;

        int months = 0;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        try
        {
            if (Session["User"].ToString() != null)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM users WHERE username ='" + Session["username"] + "'", con);
                SqlDataReader reader1 = cmd.ExecuteReader();
                while (reader1.Read())
                {
                    months = reader1.GetInt32(2);
                }
                reader1.Close();
                con.Close();

                if (months > 0)
                {
                    pnlMovie.Visible = true;
                }
                else
                {
                    pnlPlan.Visible = true;
                }
            }
            else
            {
                pnlPlan.Visible = true;
            }
        }
        catch (NullReferenceException nre)
        {
            Session.Add("User", "Guest");
            Response.Redirect("movies.aspx");
            
        }
        
    }
    protected void btnSubscribe_Click(object sender, EventArgs e)
    {
        pnlPlan.Visible = false;
        pnlPurchase.Visible = true;
    }
    protected void RadioSubscribe_CheckedChanged(object sender, EventArgs e)
    {
        RadioButton rb = (RadioButton)sender;
        int val = int.Parse(rb.Text);
        string groupName = rb.GroupName;
        Session["plan"] = val;
    }
    protected void RadioPayment_CheckedChanged(object sender, EventArgs e)
    {
        pnlPurchase.Visible = true;
        RadioButton rb = (RadioButton)sender;
        string txtVal = rb.Text;
        string groupName = rb.GroupName;

        if (txtVal == "Pay Pal")
        {
            pnlPayPal.Visible = true;
        }
        else
        {
            pnlCredit.Visible = true;
        }
    }

    protected void btnSubmit2_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO users (accntType) VALUES (@accntType) where username = '"+ Session["User"].ToString() + "'", con);

        cmd.Parameters.Add("@accntType", SqlDbType.Int);
        cmd.Parameters["@accntType"].Value = Session["plan"];
        
        cmd.ExecuteNonQuery();
        con.Close();        
    }
    protected void btnSubmit1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("UPDATE users SET accntType = (@accntType) where username = '" + Session["User"].ToString() + "'", con);

        cmd.Parameters.Add("@accntType", SqlDbType.Int);
        cmd.Parameters["@accntType"].Value = Session["plan"];

        cmd.ExecuteNonQuery();
        con.Close();
    }
}