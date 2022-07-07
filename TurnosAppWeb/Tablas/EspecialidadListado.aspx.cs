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
    public partial class EspecialidadListado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ingresos"] == null)
            {
                Response.Redirect("../default.aspx");
            }

            if (!IsPostBack)
            {
                if (Session["listaEspecialidades"] == null)
                {
                    EspecialidadNegocio negocio = new EspecialidadNegocio();
                    Session.Add("listaEspecialidades", negocio.listarEspecialidades());
                }

                dgvlistaespecialidades.DataSource = Session["listaEspecialidades"];
                dgvlistaespecialidades.DataBind();
            }
        }

        protected void listaespecialidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            //captura el id seleccionado
            var id = dgvlistaespecialidades.SelectedDataKey.Value.ToString();
            Response.Redirect("EspecialidadForm.aspx?id=" + id);
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            if (txtbuscar.Text != "")
            {
                string buscar = txtbuscar.Text;
                dgvlistaespecialidades.DataSource = ((List<Especialidad>)Session["listaEspecialidades"]).FindAll(x => x.descripcion == buscar);
                dgvlistaespecialidades.DataBind();
            }
            else
            {
                dgvlistaespecialidades.DataSource = ((List<Especialidad>)Session["listaEspecialidades"]);
                dgvlistaespecialidades.DataBind();
            }
        }
    }
}