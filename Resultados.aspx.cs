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

                //using (SqlConnection conn = new SqlConnection("cadena"))
                //{
                //    SqlCommand cmd = new SqlCommand("SELECT * FROM [vw_FILTRO]", conn);
                //    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                //    {
                //        DataTable dt = new DataTable();
                //        sda.Fill(dt);

                //        if (dt.Rows.Count > 0)
                //        {
                //            GridView gridView = new GridView();
                //            gridView.ID = "GridViewDinamico";
                //            gridView.AutoGenerateColumns = true;
                //            gridView.DataSource = dt;
                //            gridView.DataBind();

                //            PlaceHolder1.Controls.Add(gridView); // Asegúrate de tener un PlaceHolder en tu .aspx
                //        }
                //        else
                //        {
                //            // Opcional: mostrar un mensaje si no hay datos
                //            LiteralControl noDataMessage = new LiteralControl("No se encontraron datos.");
                //            PlaceHolder1.Controls.Add(noDataMessage);
                //        }
                //    }
                //}

            }
        }
        public void cargardatagridview(string materia, string zon)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "";

                if (materia == "0" & zon == "0")
                {
                    query = "SELECT * FROM [vw_FILTRO]";
                }
                else
                {
                    if (materia == "0")
                    {
                        query = "SELECT * FROM [vw_FILTRO] WHERE ID_LOCALIDAD= " + zon;
                    }
                    else if (zon == "0")
                    {
                        query = "SELECT * FROM [vw_FILTRO] WHERE ID_MATERIA= " + materia;
                    }
                    else
                    {
                        query = "SELECT * FROM [vw_FILTRO] WHERE ID_MATERIA= " + materia + " AND ID_LOCALIDAD = " + zon;
                    }
                }

                //SqlCommand consulta = new SqlCommand(query, connection);
                //// Abrir la conexión
                //connection.Open();

                ////Es el adaptador de SQL al que asignaremos nuestra consulta.
                //SqlDataAdapter Adaptador = new SqlDataAdapter(consulta);

                ////Tabla virtual
                //DataTable dataTable = new DataTable();

                //// Llenar el DataTable con los datos del adaptador
                //Adaptador.Fill(dataTable);

                //// Asignar los datos al GridView
                //GridViewResultados.DataSource = dataTable;
                //GridViewResultados.DataBind();

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                     
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);

                            // Crear y configurar el GridView de manera dinámica
                            GridView gridView = new GridView();
                            gridView.ID = "GridViewDinamico";
                            gridView.AutoGenerateColumns = true;
                            gridView.DataSource = dt;
                            gridView.DataBind();

                            // Agrega el GridView dinámico a un contenedor en la página
                            //PlaceHolderGridView.Controls.Clear(); // Limpia el panel para evitar duplicados
                            //PlaceHolderGridView.Controls.Add(gridView);
                        }
                    }
                }
            }

        }
        protected void GridViewResultados_SelectedIndexChanged(object sender, EventArgs e)
        {

            //GridViewResultados.DataBind();

        }
        //protected void GridViewResultados_SelectedIndexChanged1(object sender, EventArgs e)
        //{
        //    //GridViewResultados2.DataBind();
        //}

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("InicioUsuario.aspx");
        }



    }
}