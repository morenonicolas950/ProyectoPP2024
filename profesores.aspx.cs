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
    public partial class profesores : System.Web.UI.Page
    {



        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void Btn_NuevoProfesor_Click(object sender, EventArgs e)
        {
            Response.Redirect("nuevoprofesor.aspx");
        }

    }
}