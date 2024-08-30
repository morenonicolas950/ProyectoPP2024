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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            {
                string nombreUsuario = txtUsuario.Text;
                string contrasena = txtPassword.Text;

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProfesorDB"].ConnectionString))
                {
                    string query = "SELECT COUNT(1) FROM Usuarios WHERE NombreUsuario=@NombreUsuario AND Contrasena=@Contrasena";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@NombreUsuario", nombreUsuario);
                    cmd.Parameters.AddWithValue("@Contrasena", contrasena);

                    con.Open();
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();

                    if (count == 1)
                    {
                        // Autenticación exitosa
                        Session["NombreUsuario"] = nombreUsuario;
                        Response.Redirect("inicio.aspx");
                    }
                    else
                    {
                        // Autenticación fallida
                        lblMensaje.Text = "Usuario o contraseña incorrectos.";
                    }
                }
            }
        }
    }
}