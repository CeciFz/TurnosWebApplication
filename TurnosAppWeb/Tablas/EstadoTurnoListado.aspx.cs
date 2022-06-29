using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurnosDominio;
using TurnosNegocio;

namespace TurnosAppWeb.Tablas
{
    public partial class EstadoTurnoListado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["listaEstadosTurnos"] == null)
                {
                    EstadoTurnoNegocio negocio = new EstadoTurnoNegocio();
                    Session.Add("listaEstadosTurnos", negocio.listarEstadosTurnos());
                }

                dgvlistaEstadosTurnos.DataSource = Session["listaEstadosTurnos"];
                dgvlistaEstadosTurnos.DataBind();
            }
        }

        protected void dgvlistaEstadosTurnos_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = dgvlistaEstadosTurnos.SelectedDataKey.Value.ToString();
            Response.Redirect("EstadoTurnoForm.aspx?id=" + id);
        }
    }
}