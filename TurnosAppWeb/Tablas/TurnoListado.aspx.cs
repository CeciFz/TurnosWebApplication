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
        public List<DateTime> fechas { get; set; }


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
                    listaTurnos = negocio.listarTurnosConSP();
                    Session.Add("listaTurnos", listaTurnos);

                    /* repTurnos.DataSource = Session["listaTurnos"];
                     repTurnos.DataBind();
                    */

                    fechas = new List<DateTime>();
                    foreach (Turno t in listaTurnos)
                    {
                        if (!fechas.Contains(t.fecha))
                        {
                            fechas.Add(t.fecha);

                            // lblFecha.Text = t.fecha.ToString();
                        }
                    }
                    //dgvlistaTurnos.DataSource = listaTurnos;
                    //dgvlistaTurnos.DataBind();

                }

            }

        }

        protected void dgvlistaTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void dgvlistaTurnos_SelectedIndexChanged(object sender, EventArgs e)
        {
            String id = dgvlistaTurnos.SelectedDataKey.Value.ToString();
            Response.Redirect("TurnoForm.aspx?id=" + id);
        }
    }
}