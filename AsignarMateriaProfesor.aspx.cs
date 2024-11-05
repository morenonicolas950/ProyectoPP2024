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
    public partial class AsignarMateriaProfesor : System.Web.UI.Page
    {
        private static string Cadena = ConfigurationManager.ConnectionStrings["PRACTICAPROFESIONALConnectionString1"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAsignar_Click(object sender, EventArgs e)
        {
            int idProfesor = int.Parse(DdlProfesores.SelectedValue);
            int idMateria = int.Parse(ddlMateria.SelectedValue);
            float precio = float.Parse(txtPrecio.Text);

            using (SqlConnection conexion = new SqlConnection(Cadena))
            {
                

                SqlTransaction transaccion = null;

                try
                {
                    conexion.Open();

                    transaccion = conexion.BeginTransaction();

                    string query = "INSERT INTO DICTA_MATERIA (ID_PROFESOR, ID_MATERIA, PRECIO) VALUES (@ID_PROFESOR, @ID_MATERIA, @PRECIO)";

                    SqlCommand comando = new SqlCommand(query, conexion, transaccion);
                    comando.Parameters.AddWithValue("@ID_PROFESOR", idProfesor);
                    comando.Parameters.AddWithValue("@ID_MATERIA", idMateria);
                    comando.Parameters.AddWithValue("@PRECIO", precio);

                    comando.ExecuteNonQuery();
                    
                    // Confirmar la transacción si todo fue bien
                    transaccion.Commit();

                    lblMensaje.Text = "la materia fue asignada correctamente";
                    lblMensaje.ForeColor = System.Drawing.Color.Green;

                }
                catch (Exception ex)
                {
                    // Si hay un error, revertir la transacción
                    if (transaccion != null)
                    {
                        transaccion.Rollback();
                    }

                    lblMensaje.Text = "Error al realizar la asignación de la materia" + ex.Message;
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }
            }
            
        }
    }
}