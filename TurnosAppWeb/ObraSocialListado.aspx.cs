using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurnosNegocio;
using TurnosDominio;

namespace TurnosAppWeb
{
    public partial class ObraSocialListado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["listaObrasSociales"] == null)
            {
                ObraSocialNegocio negocio = new ObraSocialNegocio();
                Session.Add("listaObrasSociales", negocio.listarObrasSociales());
            }

            dgvlistaObrasSociales.DataSource = Session["listaObrasSociales"];
            dgvlistaObrasSociales.DataBind();
        }

        protected void dgvlistaObrasSociales_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = dgvlistaObrasSociales.SelectedDataKey.Value.ToString();
            Response.Redirect("ObraSocialForm.aspx?id=" + id);
        }
    }
}