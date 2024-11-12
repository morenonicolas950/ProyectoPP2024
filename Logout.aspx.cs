using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoPP2024
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          // Finalizar la sesión
           Session.Clear(); // Borra todos los datos de sesión
           Session.Abandon(); // Termina la sesión actual
           Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
           Response.Cache.SetCacheability(HttpCacheability.NoCache);
           Response.Cache.SetNoStore();
           Response.Redirect("Login.aspx"); // Redirige a la página de inicio de sesión
        }
    }
}