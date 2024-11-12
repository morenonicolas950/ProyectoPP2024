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
    public partial class ModificarMateria : System.Web.UI.Page
    {

        private static string Cadena = ConfigurationManager.ConnectionStrings["PRACTICAPROFESIONALConnectionString1"].ConnectionString;

        private static string id = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                id = Request.QueryString["ID"];

                TraerMateria(id);
            }

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

        public void TraerMateria(string id)
        {
            using (SqlConnection connection = new SqlConnection(Cadena))
            {
                try
                {

                    string script = "SELECT * FROM MATERIA WHERE ID_MATERIA = " + id;

                    connection.Open();

                    SqlCommand command = new SqlCommand(script, connection);

                    SqlDataReader reader = command.ExecuteReader();


                    while (reader.Read())
                    {
                        txtMateria.Text = reader.GetString(1);
                        
                    }

                    connection.Close();

                }
                catch (Exception)
                {


                }
            }

        }

        protected void btnModificarMateria_Click(object sender, EventArgs e)
        {

            {
                using (SqlConnection connection = new SqlConnection(Cadena))
                {
                    try
                    {
                        string script = String.Format("UPDATE MATERIA SET DESCRIPCION = '{0}' WHERE ID_MATERIA = {1}",
                            txtMateria.Text, id);

                        connection.Open();

                        SqlCommand command = new SqlCommand(script, connection);

                        int resp = command.ExecuteNonQuery();

                        if (resp > 0)
                        {
                            lblMensaje.Visible = true;
                            lblMensaje.Text = "Se han realizado los cambios correctamente";
                        }
                        else
                        {
                            lblMensaje.Visible = true;
                            lblMensaje.Text = "Error al realizar los cambios";

                        }
                    }
                    catch (Exception exception)
                    {
                        Console.WriteLine(exception.Message);
                    }
                }
            }
        }

        protected void Btn_Volver_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("materias.aspx");
        }

    }
}
