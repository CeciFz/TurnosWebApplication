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
    public partial class TipoDocumentoForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ingresos"] == null)
            {
                Response.Redirect("../default.aspx");
            }


            if (Request.QueryString["id"] != null && btnModificar.Visible == false)
            {
                Int16 id = Int16.Parse(Request.QueryString["id"].ToString());
                List<TipoDocumento> temporal = ((List<TipoDocumento>)Session["listaTiposDocumentos"]);
                TipoDocumento seleccionado = temporal.Find(x => x.id == id);
                txtId.Text = seleccionado.id.ToString();
                txtDescripcion.Text = seleccionado.descripcion;

                btnRegistrar.Visible = false;
                btnModificar.Visible = true;
                btnEliminar.Visible = true;
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            TipoDocumento tipoDoc = new TipoDocumento();
            TipoDocumentoNegocio negocio = new TipoDocumentoNegocio();

            tipoDoc.descripcion = txtDescripcion.Text;
            negocio.agregarTipoDocumento(tipoDoc);

            ((List<TipoDocumento>)Session["listaTiposDocumentos"]).Add(tipoDoc);
            Response.Redirect("TipoDocumentoListado.aspx");
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            TipoDocumento tipoDoc = new TipoDocumento();
            TipoDocumentoNegocio negocio = new TipoDocumentoNegocio();

            tipoDoc.id = Int16.Parse(txtId.Text);
            tipoDoc.descripcion = txtDescripcion.Text;

            negocio.modificarTipoDocumento(tipoDoc);
            Session.RemoveAll();   // TODO: Ver si esto está ok
            Response.Redirect("TipoDocumentoListado.aspx");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            TipoDocumentoNegocio negocio = new TipoDocumentoNegocio();

            int id = Int16.Parse(txtId.Text);

            negocio.eliminarLogicoTipoDocumento(id);
            Session.RemoveAll();   // TODO: Ver si esto está ok
            Response.Redirect("TipoDocumentoListado.aspx");
        }
    }
}