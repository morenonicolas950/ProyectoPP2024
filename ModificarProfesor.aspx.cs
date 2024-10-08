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
    public partial class ModificarProfesor : System.Web.UI.Page
    {
        private static string Cadena = ConfigurationManager.ConnectionStrings["PRACTICAPROFESIONALConnectionString1"].ConnectionString;

        private static string id = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                id = Request.QueryString["ID"];

                TraerProfesor(id);
            }
        }

        public void TraerProfesor(string id)
        {
            using (SqlConnection connection = new SqlConnection(Cadena))
            {
                try
                {

                    string script = "SELECT * FROM PROFESOR WHERE ID_PROFESOR= " + id;

                    connection.Open();

                    SqlCommand command = new SqlCommand(script, connection);

                    SqlDataReader reader = command.ExecuteReader();


                    while (reader.Read())
                    {
                        txtNombre.Text = reader.GetString(1);
                        txtApellido.Text = reader.GetString(2);
                        txtEmail.Text = reader.GetString(3);
                        txtTelefono.Text = reader.GetInt32(4).ToString();
                        ddlLocalidad.SelectedValue = reader.GetInt32(5).ToString();
                    }

                    connection.Close();

                }
                catch (Exception)
                {


                }
            }

        }

        protected void btnModificarProfesor_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(Cadena))
            {
                try
                {
                    string script = String.Format( "UPDATE PROFESOR SET NOMBRE = '{0}', APELLIDO = '{1}', EMAIL = '{2}', TELEFONO = '{3}', ID_LOCALIDAD = '{4}' WHERE ID_PROFESOR = {5}", 
                        txtNombre.Text, txtApellido.Text, txtEmail.Text, txtTelefono.Text, ddlLocalidad.SelectedValue, id);

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

        protected void Btn_Volver_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("profesores.aspx");
        }


    }
 }