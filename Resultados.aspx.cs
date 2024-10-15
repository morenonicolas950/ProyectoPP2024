using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoPP2024
{
    public partial class Resultados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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