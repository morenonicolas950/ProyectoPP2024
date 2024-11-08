using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace ProyectoPP2024
{
    public partial class Contacto : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["PRACTICAPROFESIONALConnectionString1"].ConnectionString;
        private static string id = string.Empty;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                id = Request.QueryString["ID_PROFESOR"];

                TraerContacto(id);
            }
        }

        public void TraerContacto(string id)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {

                    //string script = "SELECT * FROM PROFESOR WHERE ID_PROFESOR= " + id;
                    string script = "SELECT NOMBRE, APELLIDO, EMAIL, TELEFONO FROM PROFESOR WHERE ID_PROFESOR= " + id;

                    connection.Open();

                    SqlCommand command = new SqlCommand(script, connection);

                    SqlDataReader reader = command.ExecuteReader();


                    while (reader.Read())
                    {
                        //lblNombre.Text = reader.GetString(1);
                        //lblApellido.Text = reader.GetString(2);
                        //lblEmail.Text = reader.GetString(4);
                        //lblTelefono.Text = reader.GetInt32(5).ToString();

                        lblNombre.Text = reader["NOMBRE"].ToString();
                        lblApellido.Text = reader["APELLIDO"].ToString();
                        lblEmail.Text = reader["EMAIL"].ToString();
                        lblTelefono.Text = reader["TELEFONO"].ToString();
                    }

                    connection.Close();

                }
                catch (Exception)
                {


                }
            }

        }

       protected void btnVolver_Click(object sender, EventArgs e)
       {
           Response.Redirect("InicioUsuario.aspx");
       }

    }
}