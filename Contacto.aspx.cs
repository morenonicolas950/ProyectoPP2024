using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoPP2024
{
    public partial class Contacto : System.Web.UI.Page
    {
        private static string id = string.Empty;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                id = Request.QueryString["ID_PROFESOR"];

                TraerContacto(id);
            }
        }
    }
}