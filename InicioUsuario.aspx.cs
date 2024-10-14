using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ProyectoPP2024
{
    public partial class InicioUsuario : System.Web.UI.Page
    {
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
           

                        
                    // Obtener los valores seleccionados de los DropDownList
                    string materia = tipo.SelectedValue; // ID_MATERIA o "todos"
                    string zon = zona.SelectedValue; // ID_LOCALIDAD o "todas"
    
                    // Crear una consulta SQL base
                    string query1 = "SELECT [DESCRIPCION] FROM [MATERIA] WHERE 1=1"; // "WHERE 1=1" es un truco para evitar problemas al concatenar filtros
                    string query2 = "SELECT [DESCRIPCION] FROM [LOCALIDAD] WHERE 1=1";       

                    // Verificar si el usuario seleccionó algo distinto de "todos" para Materias
                    if (materia != "TODOS")
                    {
                        query1 += " AND ID_MATERIA = @ID_MATERIA"; // Agregar un filtro para Materias
                    }

                    // Verificar si el usuario seleccionó algo distinto de "todas" para Zonas
                    if (zon != "TODAS")
                    {
                        query2 += " AND ID_LOCALIDAD = @ID_LOCALIDAD"; // Agregar un filtro para Zonas
                    }

                    


             // Redirigir con los parámetros seleccionados
            Response.Redirect(String.Format("Resultados.aspx?materia={0}&zona={1}", materia, zon));
        }
    }
}