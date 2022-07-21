using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurnosDominio;
using TurnosNegocio;

namespace TurnosAppWeb.Gestion
{
    public partial class PanelTurnosPaciente : System.Web.UI.Page
    {
        public List<Turno> listaTurnosPacienteSinHistorial { get; set; }
        public List<Turno> listaTurnosPacienteConHistorial { get; set; }
        Int64 idPaciente { get; set; }

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
                if (probando !=3) { Response.Redirect("/default.aspx"); }

            }
            








            /* if (Session["ingresos"] == null)
             {
                 Response.Redirect("../default.aspx");
             }*/
            TurnoNegocio negocio = new TurnoNegocio();
            idPaciente = (Int64)Session["IdUsuario"];

            listaTurnosPacienteSinHistorial = negocio.listaTurnosPacienteConSP(idPaciente, false);

            lblPaciente.Text = "Paciente: " + listaTurnosPacienteSinHistorial[0].paciente.nombres;
            dgvlistaTurnosPaciente.DataSource = listaTurnosPacienteSinHistorial;
            dgvlistaTurnosPaciente.DataBind();
        }

        protected void dgvlistaTurnosPaciente_SelectedIndexChanged(object sender, EventArgs e)
        {
            String id = dgvlistaTurnosPaciente.SelectedDataKey.Value.ToString();

        }

        protected void btnHistorial_Click(object sender, EventArgs e)
        {
            if (divHistorial.Visible == true) divHistorial.Visible = false;
            else
            {
                TurnoNegocio negocio = new TurnoNegocio();
                listaTurnosPacienteConHistorial = negocio.listaTurnosPacienteConSP(idPaciente, true);

                divHistorial.Visible = true;
                dgvlistaTurnosPacienteConH.DataSource = listaTurnosPacienteConHistorial;
                dgvlistaTurnosPacienteConH.DataBind();
            }
        }
    }
}