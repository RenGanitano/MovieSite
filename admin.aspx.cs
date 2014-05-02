using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.Page
{
    Button submit = new Button();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (list.Items.Capacity == 0 || listDelete.Items.Capacity == 0)
        {
            fillMovieList();
        }

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        con.Close();
        con.Open();
        SqlCommand sql = new SqlCommand("INSERT INTO allmovies VALUES(@title, @company, @director, @editor, @trailer)", con);

        if (txtTitle.Text != null)
        {
            sql.Parameters.Add("@title", SqlDbType.VarChar);
            sql.Parameters["@title"].Value = txtTitle.Text;
        }
        if (txtCompany.Text != null)
        {
            sql.Parameters.Add("@company", SqlDbType.VarChar);
            sql.Parameters["@company"].Value = txtCompany.Text;
        }
        if (txtDirector.Text != null)
        {
            sql.Parameters.Add("@director", SqlDbType.VarChar);
            sql.Parameters["@director"].Value = txtDirector.Text;
        }
        if (txtEditor.Text != null)
        {
            sql.Parameters.Add("@editor", SqlDbType.VarChar);
            sql.Parameters["@editor"].Value = txtEditor.Text;
        }
        if (txtTrailer.Text != null)
        {
            sql.Parameters.Add("@trailer", SqlDbType.VarChar);
            sql.Parameters["@trailer"].Value = txtTrailer.Text;
        }

        sql.ExecuteNonQuery();
        fillMovieList();
        con.Close();
        Response.Redirect("admin.aspx");

    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        con.Close();
        SqlCommand sql = new SqlCommand("UPDATE allmovies SET title = @title, company = @company, director = @director, editor = @editor, trailer = @trailer WHERE title = @changed", con);

        if (newTitle.Text != null)
        {
            sql.Parameters.Add("@title", SqlDbType.VarChar);
            sql.Parameters["@title"].Value =  newTitle.Text;
        }
        if (newCompany.Text != null)
        {
            sql.Parameters.Add("@company", SqlDbType.VarChar);
            sql.Parameters["@company"].Value = newCompany.Text;
        }
        if (newDirector.Text != null)
        {
            sql.Parameters.Add("@director", SqlDbType.VarChar);
            sql.Parameters["@director"].Value = newDirector.Text;
        }
        if (newEditor.Text != null)
        {
            sql.Parameters.Add("@editor", SqlDbType.VarChar);
            sql.Parameters["@editor"].Value = newEditor.Text;
        }
        if (newTrailer.Text != null)
        {
            sql.Parameters.Add("@trailer", SqlDbType.VarChar);
            sql.Parameters["@trailer"].Value = newTrailer.Text;
        }
        sql.Parameters.Add("@changed", SqlDbType.VarChar);
        sql.Parameters["@changed"].Value = list.SelectedValue;

        con.Open();
        sql.ExecuteNonQuery();
        fillMovieList();
        con.Close();
        Response.Redirect("admin.aspx");
        
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        con.Close();
        con.Open();
        SqlCommand sql = new SqlCommand("DELETE FROM allmovies WHERE title = '" + listDelete.SelectedValue + "'", con);
        sql.ExecuteNonQuery();
        con.Close();
        fillMovieList();
    }

    private void fillMovieList()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM allmovies", con);
        SqlDataReader reader = cmd.ExecuteReader();
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet links = new DataSet();
        reader.Close();
        list.DataTextField = "title";
        listDelete.DataTextField = "title";
        adapter.Fill(links);
        list.DataSource = links;
        listDelete.DataSource = links;
        list.DataBind();
        listDelete.DataBind();
        con.Close();
    }
}