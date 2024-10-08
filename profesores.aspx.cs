using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace ProyectoPP2024
{
    public partial class profesores : System.Web.UI.Page
    {



        protected void Page_Load(object sender, EventArgs e)
        {
            {
                if (!Page.IsPostBack)
                {
                    if (Session["NombreUsuario"] == null)
                    {
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        if (Session["NombreUsuario"].ToString() == String.Empty)
                            Response.Redirect("Login.aspx");
                    }
                }
            }

        }

        protected void Btn_NuevoProfesor_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("AgregarProfesor.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                //e.CommandArgument.ToString();
                int index = int.Parse(e.CommandArgument.ToString());
                string id = GridView1.DataKeys[index].Value.ToString();
                Response.Redirect("ModificarProfesor.aspx?ID=" + id);
                //GridView1.data
            }
        }
    }
}