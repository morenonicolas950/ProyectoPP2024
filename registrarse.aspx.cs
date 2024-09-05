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

        private static string Cadena = ConfigurationManager.ConnectionStrings["Cadena"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            string nuevoUsuario = txtUsuario.Text;
            string nuevoEmail = txtEmail.Text;
            string nuevaContrasena = txtPass.Text;

            if (VerificarUsuarioExistente(nuevoUsuario))
            {
                lblTexto.Text = "El usuario ya está registrado, intente con otro nombre de usuario";
            }
            else
            {
                RegistrarNuevoUsuario(nuevoUsuario, nuevoEmail, nuevaContrasena);
                lblTexto.ForeColor = System.Drawing.Color.Green;
                lblTexto.Text = "Usuario registrado exitosamente";
                limpiar();
                Response.AddHeader("Refresh", "2;URL=Login.aspx");
                
            }
        }

        private bool VerificarUsuarioExistente(string nuevoUsuario)
        {
            bool usuarioExiste = false;
            using (SqlConnection con = new SqlConnection(Cadena))
            {
                string consulta = "SELECT COUNT(*) FROM USUARIOS WHERE NombreUsuario = @nuevoUsuario" ;
                SqlCommand comando = new SqlCommand(consulta,con);
                comando.Parameters.AddWithValue("@nuevoUsuario",nuevoUsuario);

                try
                {
                    con.Open();
                    int count = (int)comando.ExecuteScalar(); //devuelve la primera fila
                    if (count > 0)
                    {
                        usuarioExiste = true;
                    }
                }
                
                catch (Exception ex)
                {
                    lblTexto.Text = "Error:" + ex.Message;
                }
            }

            return usuarioExiste; 
        }

        private void RegistrarNuevoUsuario(string nuevoUsuario, string nuevoEmail, string nuevaContrasena)
            {

                using (SqlConnection con = new SqlConnection(Cadena))
                {
                    string script = "INSERT INTO USUARIOS (NombreUsuario, Email, Contrasena) VALUES (@NombreUsuario, @Email, @Contrasena)";

                    SqlCommand cmd = new SqlCommand(script, con);
                    cmd.Parameters.AddWithValue("@NombreUsuario", nuevoUsuario);
                    cmd.Parameters.AddWithValue("@Email", nuevoEmail);
                    cmd.Parameters.AddWithValue("@contrasena", nuevaContrasena);

                     try
                     {
                       con.Open();
                       cmd.ExecuteNonQuery();
                       con.Close();
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
