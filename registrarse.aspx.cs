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
    public partial class registrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            string nuevoUsuario = txtUsuario.Text;
            string nuevoEmail = txtEmail.Text;
            string nuevaContrasena = txtPass.Text;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProfesorDB"].ConnectionString))
            {
                string query = "INSERT INTO USUARIOS (NombreUsuario, Email, Contrasena) VALUES (@NombreUsuario, @Email, @Contrasena)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@NombreUsuario", nuevoUsuario);
                cmd.Parameters.AddWithValue("@Email", nuevoEmail);
                cmd.Parameters.AddWithValue("@contrasena", nuevaContrasena);

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblTexto.ForeColor = System.Drawing.Color.Green;
                    lblTexto.Text = "Usuario registrado exitosamente";
                    con.Close();
                    limpiar();
                }

                catch (SqlException ex)
                {
                    lblTexto.Text = "Error al registrar el usuario: " + ex.Message;
                }
            }
        }

            private void limpiar()
            {
                txtUsuario.Text = "";
                txtEmail.Text = "";
                txtPass.Text = "";
                txtRepPass.Text = "";
            }
        }
    }
