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
            tipo.Items.Insert(0, new ListItem("TODOS", "todos"));
        }

        protected void zona_DataBound(object sender, EventArgs e)
        {
            // Agregar la opción "Todas" al DropDownList de Localidades
            zona.Items.Insert(0, new ListItem("TODAS", "todas"));
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {


                    //SqlDataSource1.SelectParameters.Clear();
                    //SqlDataSource2.SelectParameters.Clear();
                    // Obtener los valores seleccionados de los DropDownList
                    //string materia = tipo.SelectedValue; // ID_MATERIA o "todos"
                   // string zon = zona.SelectedValue; // ID_LOCALIDAD o "todas"
    
                    // Consulta para MATERIA
                   // string query1 = "SELECT [DESCRIPCION] FROM [vw_FILTRO] WHERE 1=1";
                    //SqlDataSource1.SelectParameters.Add(new Parameter("ID_MATERIA", DbType.String, materia));
           
                    // Verificar si el usuario seleccionó algo distinto de "todos" para Materias
                   // if (materia != "TODOS")
                    {
                       //query1 += " AND ID_MATERIA = @ID_MATERIA"; // Agregar un filtro para Materias
                    }

                    // Consulta para LOCALIDAD
                    //string query2 = "SELECT [DESCRIPCION] FROM [vw_FILTRO] WHERE 1=1";
                    //SqlDataSource1.SelectParameters.Add(new Parameter("ID_LOCALIDAD", DbType.String, zon));
                    
                    // Verificar si el usuario seleccionó algo distinto de "todas" para Zonas
                    //if (zon != "TODAS")
                    {
                       //query2 += " AND ID_LOCALIDAD = @ID_LOCALIDAD"; // Agregar un filtro para Zonas
                    }



                    //SqlDataSource1.SelectCommand = query1;
                    //SqlDataSource1.SelectCommand = query2;
                     // Redirigir con los parámetros seleccionados
                    Response.Redirect(String.Format("Resultados.aspx?materia={0}&localidad={1}", materia, zon));
                   
}
        }
    }
}