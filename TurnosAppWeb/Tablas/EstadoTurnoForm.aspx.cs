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
    public partial class EstadoTurnoForm : System.Web.UI.Page
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
                if (probando == 2) { Response.Redirect("/listados.aspx"); }

            }
            if (Request.QueryString["id"] != null && btnModificar.Visible == false)
            {
                Int16 id = Int16.Parse(Request.QueryString["id"].ToString());
                List<EstadoTurno> temporal = ((List<EstadoTurno>)Session["listaEstadosTurnos"]);
                EstadoTurno seleccionado = temporal.Find(x => x.id == id);
                txtId.Text = seleccionado.id.ToString();
                txtDescripcion.Text = seleccionado.descripcion;

                btnRegistrar.Visible = false;
                btnModificar.Visible = true;
                btnEliminar.Visible = true;
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            EstadoTurno estadoTurno = new EstadoTurno();
            EstadoTurnoNegocio negocio = new EstadoTurnoNegocio();

            estadoTurno.descripcion = txtDescripcion.Text;
            negocio.agregarEstadoTurno(estadoTurno);

            ((List<EstadoTurno>)Session["listaEstadosTurnos"]).Add(estadoTurno);
            Response.Redirect("EstadoTurnoListado.aspx");
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            EstadoTurno estadoTurno = new EstadoTurno();
            EstadoTurnoNegocio negocio = new EstadoTurnoNegocio();

            estadoTurno.id = Int16.Parse(txtId.Text);
            estadoTurno.descripcion = txtDescripcion.Text;

            negocio.modificarEstadoTurno(estadoTurno);
            Session.RemoveAll();   // TODO: Ver si esto está ok
            Response.Redirect("EstadoTurnoListado.aspx");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            EstadoTurnoNegocio negocio = new EstadoTurnoNegocio();

            int id = Int16.Parse(txtId.Text);

            negocio.eliminarLogicoEstadoTurno(id);
            Session.RemoveAll();   // TODO: Ver si esto está ok
            Response.Redirect("EstadoTurnoListado.aspx");
        }
    }
}