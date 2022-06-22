using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurnosDominio;

namespace TurnosAppWeb
{
    public partial class modificar_especialidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                List<Especialidad> temporal = ((List<Especialidad>) Session["listaespecialidades"]);
                Especialidad especialidad = temporal.Find(x => x.id == id);

                txtDescripcion.Text = especialidad.descripcion;

            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

        }
    }
}