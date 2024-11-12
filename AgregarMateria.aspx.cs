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
    public partial class AgregarMateria : System.Web.UI.Page
    {
        private static string Cadena = ConfigurationManager.ConnectionStrings["PRACTICAPROFESIONALConnectionString1"].ConnectionString;

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

        protected void Btn_Volver_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("materias.aspx");
        }

        protected void btnAgregarMateria_Click(object sender, EventArgs e)
        {
            string materia = txtMateria.Text;

            using (SqlConnection conexion = new SqlConnection(Cadena))
            {
                SqlTransaction transaccion = null;

                try
                {
                    conexion.Open();

                    // Verificar si la materia ya está registrada
                    string consultaDescripcion = "SELECT COUNT(*) FROM MATERIA WHERE DESCRIPCION = @Descripcion";
                    SqlCommand comandoVerificarMateria = new SqlCommand(consultaDescripcion, conexion);
                    comandoVerificarMateria.Parameters.AddWithValue("@Descripcion", materia);

                    int MateriaExiste = (int)comandoVerificarMateria.ExecuteScalar();

                    if (MateriaExiste > 0)
                    {
                        lblMensaje.Text = "Ya existe una materia con ese nombre.";
                        return;
                    }

                    transaccion = conexion.BeginTransaction();

                    string consultaMateria = @"INSERT INTO MATERIA (DESCRIPCION)
                                        OUTPUT INSERTED.ID_MATERIA
                                        VALUES (@DESCRIPCION)";

                    SqlCommand comandoMateria = new SqlCommand(consultaMateria, conexion, transaccion);
                    comandoMateria.Parameters.AddWithValue("@DESCRIPCION", materia);
                    
                    // Ejecutar el comando y obtener el ID de la materia insertada
                    int idMateria = (int)comandoMateria.ExecuteScalar();


                     // Confirmar la transacción si todo fue bien
                    transaccion.Commit();

                    lblMensaje.Text = "Materia registrada con éxito. ID Materia: " + idMateria.ToString();

                    txtMateria.Text = "";

                }

                catch (Exception ex)
                {
                    // Si hay un error, revertir la transacción
                    if (transaccion != null)
                    {
                        transaccion.Rollback();
                    }

                    lblMensaje.Text = "Error al registrar la materia: " + ex.Message;
                }
            }
        }
    }
}