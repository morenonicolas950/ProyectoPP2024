using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoPP2024
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                if (!Page.IsPostBack)
                {
                    if (Session["NombreUsuario"] == null)
                    {
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        if (Session["NombreUsuario"].ToString() == String.Empty)
                            Response.Redirect("Login.aspx");
                    }
                }
            }
        }

    }
}