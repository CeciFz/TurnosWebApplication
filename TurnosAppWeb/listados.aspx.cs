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
    public partial class listados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["ingresos"] == null)
            {
                Response.Redirect("default.aspx");
            }

            TipoDocumentoNegocio tipoDoc = new TipoDocumentoNegocio();
            listaTiposDocumentos.DataSource = tipoDoc.listarTiposDeDocumento();
            listaTiposDocumentos.DataBind();

            ObraSocialNegocio obraSoc = new ObraSocialNegocio();
            listaObrasSociales.DataSource = obraSoc.listarObrasSociales();
            listaObrasSociales.DataBind();

            PerfilUsuarioNegocio perfilUs = new PerfilUsuarioNegocio();
            listaPerfilesUsuarios.DataSource = perfilUs.listarPerfilesUsuarios();
            listaPerfilesUsuarios.DataBind();

            EstadoTurnoNegocio estadoTurno = new EstadoTurnoNegocio();
            listaEstadosTurnos.DataSource = estadoTurno.listarEstadosTurnos();
            listaEstadosTurnos.DataBind();

        }
    }
}