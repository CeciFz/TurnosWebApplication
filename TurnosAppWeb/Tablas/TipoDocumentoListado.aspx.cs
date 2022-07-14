using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurnosNegocio;
using TurnosDominio;

namespace TurnosAppWeb.Tablas
{
    public partial class TipoDocumentoListado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ingresos"] == null)
            {
                Response.Redirect("/default.aspx");
            }
            else if (Session["ingresos"] != null)
            {// no deja entrar tamp a tipo de usuario que le coloquemo probando==1?
                int probando;
                probando = int.Parse(Session["ingresos"].ToString());
                if (probando == 0) { Response.Redirect("/default.aspx"); }

            }


            if (Session["listaTiposDocumentos"] == null)
            {
                TipoDocumentoNegocio negocio = new TipoDocumentoNegocio();
                Session.Add("listaTiposDocumentos", negocio.listarTiposDeDocumento());
            }

            dgvlistaTiposDocumentos.DataSource = Session["listaTiposDocumentos"];
            dgvlistaTiposDocumentos.DataBind();

        }

        protected void dgvlistaTiposDocumentos_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = dgvlistaTiposDocumentos.SelectedDataKey.Value.ToString();
            Response.Redirect("TipoDocumentoForm.aspx?id=" + id);
        }
    }
}