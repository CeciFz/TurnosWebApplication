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
    public partial class TurnoListado : System.Web.UI.Page
    {
        public List<Turno> listaTurnos { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ingresos"] == null)
            {
                Response.Redirect("../default.aspx");
            }


            if (!IsPostBack)
            {
                if (Session["listaTurnos"] == null)
                {
                    TurnoNegocio negocio = new TurnoNegocio();
                   // listaTurnos = negocio.listarTurnos();
                    //Session.Add("listaTurnos", listaTurnos);
                }

            }
            dgvlistaTurnos.DataSource = Session["listaTurnos"];
            dgvlistaTurnos.DataBind();
        }

        protected void dgvlistaTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void dgvlistaTurnos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}