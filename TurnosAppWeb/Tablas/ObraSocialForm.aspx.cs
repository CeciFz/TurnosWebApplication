using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurnosDominio;
using TurnosNegocio;

namespace TurnosAppWeb
{
    public partial class ObraSocialForm : System.Web.UI.Page
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


            if (Request.QueryString["id"] != null && btnModificar.Visible==false)
            {
                Int32 id = Int32.Parse(Request.QueryString["id"].ToString());
                List<ObraSocial> temporal = ((List<ObraSocial>)Session["listaObrasSociales"]);
                ObraSocial seleccionado = temporal.Find(x => x.id == id);
                txtId.Text = seleccionado.id.ToString();
                txtDescripcion.Text = seleccionado.descripcion;

                btnRegistrar.Visible = false;
                btnModificar.Visible = true;
                btnEliminar.Visible = true;
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
                ObraSocial obraSocial = new ObraSocial();
                ObraSocialNegocio negocio = new ObraSocialNegocio();

                obraSocial.descripcion = txtDescripcion.Text;
                negocio.agregarObraSocial(obraSocial);

            // se agrega a la lista session para mostrar en el modificar
                ((List<ObraSocial>)Session["listaObrasSociales"]).Add(obraSocial);
                Response.Redirect("ObraSocialListado.aspx");

            }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            ObraSocial obraSocial = new ObraSocial();
            ObraSocialNegocio negocio = new ObraSocialNegocio();

            obraSocial.id = Int32.Parse(txtId.Text);
            obraSocial.descripcion = txtDescripcion.Text;

            negocio.modificarObraSocial(obraSocial);
            Session.RemoveAll();   // TODO: Ver si esto está ok
            Response.Redirect("ObraSocialListado.aspx");

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ObraSocialNegocio negocio = new ObraSocialNegocio();

            int id = Int32.Parse(txtId.Text);

            negocio.eliminarLogicoObraSocial(id);
            Session.RemoveAll();   // TODO: Ver si esto está ok
            Response.Redirect("ObraSocialListado.aspx");

        }
    }
}