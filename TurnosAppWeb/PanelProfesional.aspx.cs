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
    public partial class PanelProfesional : System.Web.UI.Page
    {
        public List<Turno> listaTurnosProfesional { get; set; }
        public List<Usuario> listaPacientes { get; set; }
        List<DateTime> listaFechasTurnos { get; set; }
        //Dictionary<DateTime, int> cantReg { get; set; }
        //public List<Turno> filtrada { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            /* if (Session["ingresos"] == null)
             {
                 Response.Redirect("../default.aspx");
             }*/

            Int64 idProf = 13;             //TODO: Esto lo debe capturar del Inicio de SESION!!
            Int32 idEsp = 12;
            listaFechasTurnos = new List<DateTime>();

            if (!IsPostBack)
            {
                if (Session["listaTurnosProfesional"] == null)
                {
                    TurnoNegocio negocio = new TurnoNegocio();
                    listaTurnosProfesional = negocio.listarTurnosConSP(idProf, idEsp);
                    //listaTurnosProfesional = negocio.listarTurnosConSP();
                    Session.Add("listaTurnosProfesional", listaTurnosProfesional);
                }

                foreach (Turno t in (List<Turno>)Session["listaTurnosProfesional"])
                {
                    // if(cantReg.ContainsKey(t.fecha)) cantReg[t.fecha]++;
                    if (!listaFechasTurnos.Contains(t.fecha))
                    {
                        listaFechasTurnos.Add(t.fecha);
                        // cantReg.Add(t.fecha, 1);
                    }

                }

                lblProfesional.Text = "Profesional: " + ((List<Turno>)Session["listaTurnosProfesional"])[0].profesional.ToString();
                lblEspecialidad.Text = "Especialidad: " + ((List<Turno>)Session["listaTurnosProfesional"])[0].especialidad.ToString();

                repTurnos.DataSource = listaFechasTurnos;
                repTurnos.DataBind();

            }
        }

        protected void dgvlistaTurnosProfesional_SelectedIndexChanged(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            EstadoTurnoNegocio estNeg = new EstadoTurnoNegocio();
            GridView grid = (GridView)sender;

            RepeaterItem repeater = (RepeaterItem)((GridView)sender).Parent;
            int i = repeater.ItemIndex;
            grid = (GridView)repeater.FindControl("dgvlistaTurnosProfesional");
            string id = grid.SelectedDataKey.Value.ToString();

            List<Turno> listaTurnosFiltrados = ((List<Turno>)Session["listaTurnosProfesional"]).FindAll(x => x.id.ToString() == id);

            Turno turno = listaTurnosFiltrados[0];
            Int64 idPaciente = turno.paciente.id;
            listaPacientes = negocio.listarPacientes(idPaciente);

            repPaciente.DataSource = listaPacientes;
            repPaciente.DataBind();


            repNotasTurno.DataSource = listaTurnosFiltrados;
            repNotasTurno.DataBind();

            //foreach (RepeaterItem item in repNotasTurno.Items)
            //{
            //    TextBox txt = (TextBox)item.FindControl("txtObservaciones");
            //    txt.Text = listaTurnosFiltrados[0].observaciones.ToString();
            //}

            TextBox txt = (TextBox)repNotasTurno.Items[0].FindControl("txtObservaciones");
            txt.Text = listaTurnosFiltrados[0].observaciones;

            DropDownList estado = (DropDownList)repNotasTurno.Items[0].FindControl("ddlEstadoTurno");
            List<EstadoTurno> estadoTurnos = estNeg.listarEstadosTurnos();

            estado.DataSource = estadoTurnos;
            estado.DataValueField = "id";
            estado.DataTextField = "descripcion";
            estado.DataBind();
            estado.SelectedValue = listaTurnosFiltrados[0].estado.id.ToString();

        }

        protected void repTurnos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                GridView gv = (GridView)e.Item.FindControl("dgvlistaTurnosProfesional");
                Label lblFecha = (Label)e.Item.FindControl("lblFecha");
                DateTime fecha = (DateTime)e.Item.DataItem;
                lblFecha.Text = fecha.ToString("dd-MM-yyyy");



                if (gv != null)
                {
                    //GridViewRow drv = (GridViewRow)e.Item.DataItem;
                    gv.DataSource = ((List<Turno>)Session["listaTurnosProfesional"]).FindAll(x => x.fecha == fecha);
                    gv.DataBind();
                }
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Int64 idTurno = Int64.Parse(((Button)sender).CommandArgument);
            TextBox txt = (TextBox)repNotasTurno.Items[0].FindControl("txtObservaciones");
            DropDownList estado = (DropDownList)repNotasTurno.Items[0].FindControl("ddlEstadoTurno");

            try
            {
                Turno turno = new Turno();
                TurnoNegocio negocio = new TurnoNegocio();

                turno.id = idTurno;
                turno.estado = new EstadoTurno();
                turno.estado.id = Int16.Parse(estado.SelectedValue);
                turno.observaciones = txt.Text;

                negocio.modificarTurnoConSP(turno);
                Response.Redirect("PanelProfesional.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }
                
        }
}
}