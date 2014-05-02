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

public partial class BootstrapTest : System.Web.UI.Page
{   

    protected void Page_Load(object sender, EventArgs e)
    {
        //lblForm.Text = "Please login to view our wide selection of videos.";
        string s = "";
        string d = "";
        int i = 0;
        //Test reading values from tables (SUCCESSFUL NOW IMPLEMENT)
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT TRAILER, TITLE, COMPANY, SUMMARY FROM (SELECT a.*, b.summary FROM allmovies as a JOIN summaries as b ON a.id = b.id) as tb", con);
        SqlDataReader reader1 = cmd.ExecuteReader();
        bool isFirst = true;
        while (reader1.Read())
        {
            /*                  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1" ></li>*/
            d += "<li data-target=\"#carousel-example-generic\" data-slide-to=\"";
            //d += "0";
            d += i.ToString();
            i++;
            d += "\"";
            s += "<div class=\"item";
            if (isFirst)
            {
                d += " class=\"active\"";
                s += " active";
                isFirst = false;
            }
            d += "/>";

            s += "\"><img class=\"slide-image\" width=\"50px\" height=\"50px\" src=\"//img.youtube.com/vi/";
            s += reader1.GetString(0);
            s += "/hqdefault.jpg";
            s += "\" alt=\"\" ID=\"pic1\" onclick=\"changeTrailer('";
            s += "//www.youtube.com/embed/";
            s += reader1.GetString(0);
            s += "', '";
            s += reader1.GetString(1);
            s += "', '";
            s += reader1.GetString(2);
            s += "', '";
            s += reader1.GetString(3);
            s += "')\"></div>";                                    
        }
        
        reader1.Close();
        con.Close();
        carouselImgs.InnerHtml = s;
        dots.InnerHtml = d;

        Label1.Text = "";
        Label2.Text = "";
        Label3.Text = "";
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {

    }
    protected void AjaxMovieList(object sender, System.EventArgs e)
    {

        if (searchBox.Text != "")
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

            con.Open();
            SqlCommand cmd;
            SqlDataReader reader1;

            int i = listSelect.SelectedIndex;
            string mode = listSelect.SelectedItem.Value;
            string search = searchBox.Text.ToString();
            if (i != 4)
            {
                cmd = new SqlCommand("SELECT title, company, summary FROM (select a.*, b.castname, b.castrole, c.summary from allmovies a join cast b on a.id = b.id join summaries c on a.id = c.id) as tb where " + mode + " like'%" + search + "%'", con);
                reader1 = cmd.ExecuteReader();
                while (reader1.Read())
                {
                    Label1.Text = reader1.GetString(0);
                    Label2.Text = reader1.GetString(1);
                    Label3.Text = reader1.GetString(2);
                }
            }
            else
            {
                cmd = new SqlCommand("SELECT title, company, summary FROM (select a.*, b.castname, b.castrole, c.summary from allmovies a join cast b on a.id = b.id join summaries c on a.id = c.id) as tb where title like '%" + search + "%' or director like '%" + search + "%' or company like '%" + search + "%'" +
                "or editor like '%" + search + "%' or castname like '%" + search + "%' or castrole like '%" + search + "%' or summary like '%" + search + "%'", con);
                reader1 = cmd.ExecuteReader();
                while (reader1.Read())
                {
                    Label1.Text = reader1.GetString(0);
                    Label2.Text = reader1.GetString(1);
                    Label3.Text = reader1.GetString(2);
                }
            }
        }
                
        
    }
}