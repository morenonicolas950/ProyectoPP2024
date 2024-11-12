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
        string connectionString = ConfigurationManager.ConnectionStrings["PRACTICAPROFESIONALConnectionString1"].ConnectionString;
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




                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                     
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            if (dt.Rows.Count == 0)
                            {
                                // Mostrar mensaje si no se encontraron resultados
                                lblMensaje.Text = "No se encontraron resultados.";
                                lblMensaje.Visible = true;
                            }
                            else
                            {
                                // Ocultar mensaje y llenar el GridView
                                lblMensaje.Visible = false;
                                DataTable dataTable = new DataTable();
                                sda.Fill(dataTable);

                                //Aca cargan los registros al gridview que crearon.
                                GridViewResultados.DataSource = dataTable;
                                GridViewResultados.DataBind();
                            }


                           
                        }
                    }
                }
            }

        }
        protected void GridViewResultados_SelectedIndexChanged(object sender, EventArgs e)
        {

            //GridViewResultados.DataBind();

        }
        

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("InicioUsuario.aspx");
        }

    }
}