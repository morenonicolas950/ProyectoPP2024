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
    public partial class Resultados : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Cadena"].ConnectionString;
        private static string materia = string.Empty;
        private static string zon = string.Empty;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                materia = Request.QueryString["materia"];
                zon = Request.QueryString["localidad"];
                cargardatagridview(materia, zon);

            }
        }
        public void cargardatagridview(string materia, string zon)
        {
            using (SqlConnection connection = new SqlConnection(materia))
            {
                SqlCommand consulta = new SqlCommand(string.Format("SELECT * FROM vw_FILTRO WHERE materia={0} AND localidad{1}", materia, zon), connection);
                        // Abrir la conexión
                        connection.Open();

                        //Es el adaptador de SQL al que asignaremos nuestra consulta.
                        SqlDataAdapter Adaptador = new SqlDataAdapter(consulta);

                        //Tabla virtual
                        DataTable dataTable = new DataTable();

                        // Llenar el DataTable con los datos del adaptador
                        Adaptador.Fill(dataTable);

                        // Asignar los datos al GridView
                        GridViewResultados.DataSource = dataTable;
                        GridViewResultados.DataBind();
             }           

        
        protected void GridViewResultados_SelectedIndexChanged(object sender, EventArgs e)
        {

            //GridViewResultados.DataBind();

        }
        protected void GridViewResultados_SelectedIndexChanged1(object sender, EventArgs e)
        {
            //GridViewResultados2.DataBind();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("InicioUsuario.aspx");
        }

     
        
    }
}