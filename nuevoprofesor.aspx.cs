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
    public partial class nuevoprofesor : System.Web.UI.Page
    {
        private static string Cadena = ConfigurationManager.ConnectionStrings["Cadena"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegistrarProfesor_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string email = txtEmail.Text;
            string telefono = txtTelefono.Text;
            int idLocalidad = int.Parse(ddlLocalidad.SelectedValue); // Valor del combobox de localidad
            int idMateria = int.Parse(ddlMateria.SelectedValue); // Valor del combobox de materia
            float precio = float.Parse(txtPrecio.Text); // Precio ingresado

            // Cadena de conexión a la base de datos
          

            using (SqlConnection conexion = new SqlConnection(Cadena))
            {
                SqlTransaction transaccion = null;

                try
                {
                    conexion.Open();
                    transaccion = conexion.BeginTransaction();

                    // Insertar nuevo profesor
                    string consultaProfesor = @"INSERT INTO Profesor (nombre, apellido, email, telefono, id_localidad)
                                                OUTPUT INSERTED.id_profesor
                                                VALUES (@Nombre, @Apellido, @Email, @Telefono, @IdLocalidad)";

                    SqlCommand comandoProfesor = new SqlCommand(consultaProfesor, conexion, transaccion);

                    comandoProfesor.Parameters.AddWithValue("@Nombre", nombre);
                    comandoProfesor.Parameters.AddWithValue("@Apellido", apellido);
                    comandoProfesor.Parameters.AddWithValue("@Email", email);
                    comandoProfesor.Parameters.AddWithValue("@Telefono", telefono);
                    comandoProfesor.Parameters.AddWithValue("@IdLocalidad", idLocalidad);

                    int idProfesor = (int)comandoProfesor.ExecuteScalar(); // Obtener el id_profesor generado

                    // Insertar en la tabla Dicta_Materia
                    string consultaDictaMateria = @"INSERT INTO Dicta_Materia (id_profesor, id_materia, precio)
                                                    VALUES (@IdProfesor, @IdMateria, @Precio)";

                    SqlCommand comandoDictaMateria = new SqlCommand(consultaDictaMateria, conexion, transaccion);

                    comandoDictaMateria.Parameters.AddWithValue("@IdProfesor", idProfesor);
                    comandoDictaMateria.Parameters.AddWithValue("@IdMateria", idMateria);
                    comandoDictaMateria.Parameters.AddWithValue("@Precio", precio);

                    comandoDictaMateria.ExecuteNonQuery();

                    // Confirmar la transacción
                    transaccion.Commit();

                    lblMensaje.Text = "Profesor registrado con éxito.";
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
        }
    }