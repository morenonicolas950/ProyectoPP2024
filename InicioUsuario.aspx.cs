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

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            // Obtener los valores seleccionados por el usuario
            string materia = tipo.SelectedValue;
            string zona = zona.SelectedValue;


             // Redirigir con los parámetros seleccionados
            Response.Redirect($"Resultados.aspx?materia={materia}&zona={zona}");
        }
    }
}