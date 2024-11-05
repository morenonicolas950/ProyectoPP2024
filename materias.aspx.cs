using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoPP2024
{
    public partial class materias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string id = Request.QueryString["id"];

        }

        protected void btn_AgregarMateria_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("AgregarMateria.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                //e.CommandArgument.ToString();
                int index = int.Parse(e.CommandArgument.ToString());
                string id = GridView1.DataKeys[index].Value.ToString();
                Response.Redirect("ModificarMateria.aspx?ID=" + id);
                //GridView1.data
            }
        }
    }
}