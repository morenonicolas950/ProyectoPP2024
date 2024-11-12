using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace ProyectoPP2024
{
    public partial class inicio : System.Web.UI.Page
    {
        private static string Cadena = ConfigurationManager.ConnectionStrings["PRACTICAPROFESIONALConnectionString1"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

            lblUsuarios.InnerText = GetTotalRegistros("USUARIOS");
            lblProfesores.InnerText = GetTotalRegistros("PROFESOR");
            lblMaterias.InnerText = GetTotalRegistros("MATERIA");
            GridView1.DataBind();

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

        private string GetTotalRegistros(string Tabla)
        {
            string totalRegistros = "0";
            string query = "SELECT DISTINCT COUNT(*) FROM " + Tabla;

            using (SqlConnection conexion = new SqlConnection(Cadena))
            {
                SqlCommand cmd = new SqlCommand(query, conexion);
                conexion.Open();
                totalRegistros = cmd.ExecuteScalar().ToString();
            }

            return totalRegistros;
        }
    }
}