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
    public partial class AgregarProfesor : System.Web.UI.Page
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

        protected void btnRegistrarProfesor_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string email = txtEmail.Text;
            string telefono = txtTelefono.Text;
            int idLocalidad = int.Parse(ddlLocalidad.SelectedValue);

            using (SqlConnection conexion = new SqlConnection(Cadena))
            {
                SqlTransaction transaccion = null;

                try
                {
                    conexion.Open();

                    // Verificar si el email ya está registrado
                    string consultaEmail = "SELECT COUNT(*) FROM Profesor WHERE EMAIL = @Email";
                    SqlCommand comandoVerificarEmail = new SqlCommand(consultaEmail, conexion);
                    comandoVerificarEmail.Parameters.AddWithValue("@Email", email);

                    int emailExistente = (int)comandoVerificarEmail.ExecuteScalar();

                    if (emailExistente > 0)
                    {
                        lblMensaje.Text = "Ya existe un profesor registrado con este email.";
                        return; // Salir del método si el email ya está registrado
                    }

                    string consultaTelefono = "SELECT COUNT(*) FROM Profesor WHERE TELEFONO = @Telefono";
                    SqlCommand comandoVerificarTelefono = new SqlCommand(consultaTelefono, conexion);
                    comandoVerificarTelefono.Parameters.AddWithValue("@Telefono", telefono);

                    int telefonoExistente = (int)comandoVerificarTelefono.ExecuteScalar();

                    if (telefonoExistente > 0)
                    {
                        lblMensaje.Text = "Ya existe un profesor registrado con este teléfono.";
                        return;
                    }

                    // Si el email no existe, proceder con la transacción para agregar el profesor
                    transaccion = conexion.BeginTransaction();

                    // Insertar nuevo profesor y obtener el ID insertado
                    string consultaProfesor = @"INSERT INTO Profesor (NOMBRE, APELLIDO, EMAIL, TELEFONO, ID_LOCALIDAD)
                                        OUTPUT INSERTED.ID_PROFESOR
                                        VALUES (@Nombre, @Apellido, @Email, @Telefono, @IdLocalidad)";

                    SqlCommand comandoProfesor = new SqlCommand(consultaProfesor, conexion, transaccion);
                    comandoProfesor.Parameters.AddWithValue("@Nombre", nombre);
                    comandoProfesor.Parameters.AddWithValue("@Apellido", apellido);
                    comandoProfesor.Parameters.AddWithValue("@Email", email);
                    comandoProfesor.Parameters.AddWithValue("@Telefono", telefono);
                    comandoProfesor.Parameters.AddWithValue("@IdLocalidad", idLocalidad);

                    // Ejecutar el comando y obtener el ID del profesor insertado
                    int idProfesor = (int)comandoProfesor.ExecuteScalar();

                    // Confirmar la transacción si todo fue bien
                    transaccion.Commit();

                    lblMensaje.Text = "Profesor registrado con éxito. ID Profesor: " + idProfesor.ToString();

                    LimpiarCampos();


                }
                catch (Exception ex)
                {
                    // Si hay un error, revertir la transacción
                    if (transaccion != null)
                    {
                        transaccion.Rollback();
                    }

                    lblMensaje.Text = "Error al registrar el profesor: " + ex.Message;
                }
            }
        }


        protected void Btn_Volver_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("profesores.aspx");
        }

        private void LimpiarCampos()
        {
            txtNombre.Text = string.Empty;
            txtApellido.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            ddlLocalidad.SelectedIndex = 0;
        }
    }
}