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

        protected void Page_Load(object sender, EventArgs e)
        {
            /* if (Session["ingresos"] == null)
             {
                 Response.Redirect("../default.aspx");
             }*/

            Int64 idProf = 13;             //TODO: Esto lo debe capturar del Inicio de SESION!!
            Int32 idEsp = 12;
            listaFechasTurnos = new List<DateTime>();

            TurnoNegocio negocio = new TurnoNegocio();
            listaTurnosProfesional = negocio.listarTurnosConSP(idProf, idEsp);
            //listaTurnosProfesional = negocio.listarTurnosConSP();
            //Session.Add("listaTurnosProfesional", listaTurnosProfesional);

            foreach (Turno t in listaTurnosProfesional)
            {
                if (!listaFechasTurnos.Contains(t.fecha) && t.fecha >= DateTime.Today)
                {
                    listaFechasTurnos.Add(t.fecha); 
                }

            }

            lblProfesional.Text = "Profesional: " + listaTurnosProfesional[0].profesional.ToString();
            lblEspecialidad.Text = "Especialidad: " + listaTurnosProfesional[0].especialidad.ToString();

            repTurnos.DataSource = listaFechasTurnos;
            repTurnos.DataBind();

        }

        protected void dgvlistaTurnosProfesional_SelectedIndexChanged(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            GridView grid = (GridView)sender;

            RepeaterItem repeater = (RepeaterItem)((GridView)sender).Parent;
            int i = repeater.ItemIndex;
            grid = (GridView)repeater.FindControl("dgvlistaTurnosProfesional");
            string id = grid.SelectedDataKey.Value.ToString();

            //btnSiguiente.Visible = true;
            //btnAnterior.Visible = true;

            List<Turno> listaTurnosFiltrados = listaTurnosProfesional.FindAll(x => x.id.ToString() == id);

            Turno turno = listaTurnosFiltrados[0];
            Session["idEstado"] = turno.estado.id;
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

            Button btnSi = (Button)repNotasTurno.Items[0].FindControl("btnAsistio");
            Button btnNo = (Button)repNotasTurno.Items[0].FindControl("btnNoAsistio");


            if (turno.estado.id == 5)
            {
                btnSi.Text = "Asistió ✔️";
                btnSi.CssClass = "btn btn-success mx-4 mb-3";
            }
            else if (turno.estado.id == 3)
            {
                btnNo.Text = "No Asistió ✔️";
                btnNo.CssClass = "btn btn-success mb-3";
            }


            /*  DropDownList estado = (DropDownList)repNotasTurno.Items[0].FindControl("ddlEstadoTurno");
              List<EstadoTurno> estadoTurnos = estNeg.listarEstadosTurnos();

              estado.DataSource = estadoTurnos;
              estado.DataValueField = "id";
              estado.DataTextField = "descripcion";
              estado.DataBind();
              estado.SelectedValue = listaTurnosFiltrados[0].estado.id.ToString();*/

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
                    gv.DataSource = listaTurnosProfesional.FindAll(x => x.fecha == fecha);
                    gv.DataBind();
                }
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Int64 idTurno = Int64.Parse(((Button)sender).CommandArgument);
            TextBox txt = (TextBox)repNotasTurno.Items[0].FindControl("txtObservaciones");
            //DropDownList estado = (DropDownList)repNotasTurno.Items[0].FindControl("ddlEstadoTurno");
            Int16 idEstado = (Int16)Session["idEstado"];

            try
            {
                TurnoNegocio negocio = new TurnoNegocio();
                String observaciones = txt.Text;

                negocio.modificarTurnoConSP(idTurno, idEstado, observaciones);
                //   Response.Redirect("PanelProfesional.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }

            Page_Load(sender, e);

        }

        protected void btnActualizarEstado_Click(object sender, EventArgs e)
        {
            Int64 idTurno = Int64.Parse(((Button)sender).CommandArgument);

            try
            {
                TurnoNegocio negocio = new TurnoNegocio();
                Int16 idEstado = 0;

                if (((Button)sender).ID == "btnAsistio")
                {
                    idEstado = 5;
                    ((Button)sender).Text = "Asistió ✔️";
                    ((Button)sender).CssClass = "btn btn-success mx-4 mb-3";
                    Button btn = (Button)repNotasTurno.Items[0].FindControl("btnNoAsistio");
                    btn.Text = "No Asistió";
                    btn.CssClass = "btn btn-primary mb-3";
                }
                else if (((Button)sender).ID == "btnNoAsistio")
                {
                    idEstado = 3;
                    ((Button)sender).Text = "No Asistió ✔️";
                    ((Button)sender).CssClass = "btn btn-success mb-3";
                    Button btn = (Button)repNotasTurno.Items[0].FindControl("btnAsistio");
                    btn.Text = "Asistió";
                    btn.CssClass = "btn btn-primary mx-4 mb-3";
                }

                Session["idEstado"] = idEstado;

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        //protected void btnSiguiente_Click(object sender, EventArgs e)
        //{

        //}

        //protected void btnAnterior_Click(object sender, EventArgs e)
        //{

        //}
    }
}