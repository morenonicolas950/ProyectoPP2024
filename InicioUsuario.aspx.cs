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
    public partial class InicioUsuario : System.Web.UI.Page
    {
        private static string materia = string.Empty;
        private static string zon = string.Empty;


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void tipo_DataBound(object sender, EventArgs e)
        {

            // Agregar la opción "Todos" al DropDownList de Materias
            tipo.Items.Insert(0, new ListItem("TODOS", "0"));
        }

        protected void zona_DataBound(object sender, EventArgs e)
        {
            // Agregar la opción "Todas" al DropDownList de Localidades
            zona.Items.Insert(0, new ListItem("TODAS", "0"));
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {


            //SqlDataSource1.SelectParameters.Clear();
            //SqlDataSource2.SelectParameters.Clear();
            // Obtener los valores seleccionados de los DropDownList
            string materia = tipo.SelectedValue; // ID_MATERIA o "todos"
            string zon = zona.SelectedValue; // ID_LOCALIDAD o "todas"
            string query = "";

            //if (materia == "0" & zon == "0")
            //{
            //    query = "SELECT * FROM [vw_FILTRO]";
            //}
            //else
            //{
            //    if (materia == "0")
            //    {
            //        query = "SELECT * FROM [vw_FILTRO] WHERE ID_LOCALIDAD= " + zon;
            //    }
            //    else if (zon == "0")
            //    {
            //        query = "SELECT * FROM [vw_FILTRO] WHERE ID_MATERIA= " + materia;
            //    }
            //    else
            //    {
            //        query = "SELECT * FROM [vw_FILTRO] WHERE ID_MATERIA= " + materia + " AND ID_LOCALIDAD = " + zon;
            //    }
            //}


            //string connectionString = ConfigurationManager.ConnectionStrings["Cadena"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(connectionString))
            //{
            //    using (SqlCommand cmd = new SqlCommand(query, con))
            //    {
            //        // Agrega parámetros para evitar inyecciones SQL
            //        //if (materia != "TODOS")
            //        //{
            //        //    cmd.Parameters.AddWithValue("@Materia", materia);
            //        //}

            //        //if (zon != "TODAS")
            //        //{
            //        //    cmd.Parameters.AddWithValue("@Localidad", zon);
            //        //}

            //        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            //        {
            //            DataTable dt = new DataTable();
            //            sda.Fill(dt);

            //            // Crear y configurar el GridView de manera dinámica
            //            GridView gridView = new GridView();
            //            gridView.ID = "GridViewDinamico";
            //            gridView.AutoGenerateColumns = true;
            //            gridView.DataSource = dt;
            //            gridView.DataBind();

            //            // Agrega el GridView dinámico a un contenedor en la página
            //            PlaceHolderGridView.Controls.Clear(); // Limpia el panel para evitar duplicados
            //            PlaceHolderGridView.Controls.Add(gridView);
            //        }
            //    }

                //SqlDataSource1.SelectCommand = query1;
                //SqlDataSource1.SelectCommand = query2;
                // Redirigir con los parámetros seleccionados
                Response.Redirect(String.Format("Resultados.aspx?materia={0}&localidad={1}", materia, zon));

            
        }
    }
}