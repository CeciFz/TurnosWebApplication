using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using TurnosDominio;
using TurnosNegocio;

namespace TurnosAppWeb.Gestion
{
    public partial class PanelTurnosGeneral : System.Web.UI.Page
    {
        public List<Turno> listaTurnos { get; set; }
        public List<Usuario> listaPacientes { get; set; }
        List<DateTime> listaFechasTurnos { get; set; }
        private Int64 idPaciente { get; set; }
        private Int64 idProfesional { get; set; }
        private Int32 idEspecialidad { get; set; }
        private Int64 idHorario { get; set; }
        private bool isTurno { get; set; }
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
                if (probando == 3) { Response.Redirect("/default.aspx"); }

            }
            else if (Session["ingresos"] != null)
            {// no deja entrar tamp a tipo de usuario que le coloquemo probando==1?
                int probando;
                probando = int.Parse(Session["ingresos"].ToString());
                if (probando == 4) { Response.Redirect("/default.aspx"); }

            }
            





            /* if (Session["ingresos"] == null)
             {
                 Response.Redirect("../default.aspx");
             }*/

            listaFechasTurnos = new List<DateTime>();
            TurnoNegocio negocio = new TurnoNegocio();
            listaTurnos = negocio.listarTurnosConSP();

            foreach (Turno t in listaTurnos)
            {
                if (!listaFechasTurnos.Contains(t.fecha) && t.fecha >= DateTime.Today)
                {
                    listaFechasTurnos.Add(t.fecha);
                }

            }

            repTurnos.DataSource = listaFechasTurnos;
            repTurnos.DataBind();

            isTurno = false;
            btnReAgendar.Visible = false;
        }

        protected void dgvlistaTurnosGeneral_SelectedIndexChanged(object sender, EventArgs e)
        {
            UsuarioNegocio usNeg = new UsuarioNegocio();

            GridView grid = (GridView)sender;
            RepeaterItem repeater = (RepeaterItem)((GridView)sender).Parent;
            //int i = repeater.ItemIndex;
            grid = (GridView)repeater.FindControl("dgvlistaTurnosGeneral");
            string idTurno = grid.SelectedDataKey.Value.ToString();
            Session["idTurno"] = idTurno;

            grid.SelectedRow.ForeColor = Color.White;
            grid.SelectedRow.BackColor = Color.Black;

            List<Turno> listaTurnosFiltrados = listaTurnos.FindAll(x => x.id.ToString() == idTurno);
            Session["turno"] = listaTurnosFiltrados;

            idPaciente = ((List<Turno>)Session["turno"])[0].paciente.id;
            idEspecialidad = ((List<Turno>)Session["turno"])[0].especialidad.id;
            idProfesional = ((List<Turno>)Session["turno"])[0].profesional.id;
            idHorario = ((List<Turno>)Session["turno"])[0].idHorario;
            isTurno = true;

            cargaTurno();
            listaPacientes = usNeg.listarPacientes(idPaciente);
            repPaciente.DataSource = listaPacientes;
            repPaciente.DataBind();
            btnReAgendar.Visible = false;
        }

        private void cargaTurno()
        {
            ProfesionalNegocio profNeg = new ProfesionalNegocio();
            HorarioNegocio horNeg = new HorarioNegocio();
            DateTime fecha = ((List<Turno>)Session["turno"])[0].fecha;
            TimeSpan hora = ((List<Turno>)Session["turno"])[0].hora;

            try
            {
                lblSinTurno.Visible = false;
                lblTurnoNoAgendado.Visible = false;
                lblTurnoRepetido.Visible = false;
                lblTurno.Text = "Turno: " + fecha.ToString("dd/MM/yyyy") + " - " + hora.ToString("hh\\:mm") + " Hrs";
                lblEspecialidad.Text = ((List<Turno>)Session["turno"])[0].especialidad.descripcion;
                ddlProfesionales.DataSource = profNeg.listarProfesionalesConSP(idEspecialidad);
                ddlProfesionales.DataValueField = "id";
                ddlProfesionales.DataTextField = "nombres";
                ddlProfesionales.DataBind();
                ddlProfesionales.SelectedValue = idProfesional.ToString();

                ddlDias.DataSource = horNeg.listarHorariosConSP(idEspecialidad, idProfesional);
                ddlDias.DataValueField = "idHorario";
                ddlDias.DataTextField = "descripcion";
                ddlDias.DataBind();
                ddlDias.SelectedValue = idHorario.ToString();

                List<DateTime> date = listaDias(idHorario);
                ddlFecha.DataSource = date;
                ddlFecha.DataBind();
                ddlFecha.SelectedValue = fecha.ToString();

                List<TimeSpan> horas = listaHoras(idProfesional, idEspecialidad, idHorario);
                ddlHora.DataSource = horas;
                ddlHora.DataBind();
                ddlHora.SelectedValue = hora.ToString();

                lblSinTurno.Visible = false;
                lblTurnoNoAgendado.Visible = false;
                txtObservaciones.Text = ((List<Turno>)Session["turno"])[0].observaciones;
                DivTurnos.Visible = true;
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
            }
        }

        protected void repTurnos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                GridView gv = (GridView)e.Item.FindControl("dgvlistaTurnosGeneral");
                Label lblFecha = (Label)e.Item.FindControl("lblFecha");
                DateTime fecha = (DateTime)e.Item.DataItem;
                lblFecha.Text = fecha.ToString("dd-MM-yyyy");

                if (gv != null)
                {
                    gv.DataSource = listaTurnos.FindAll(x => x.fecha == fecha);
                    gv.DataBind();
                }
            }
        }

        protected void btnAsistio_Click(object sender, EventArgs e)
        {
          /*  Int64 idTurno = Int64.Parse(((Button)sender).CommandArgument);

            try
            {
                TurnoNegocio negocio = new TurnoNegocio();
                Int16 idEstado = 0;

                if (((Button)sender).ID == "btnAsistio")
                {
                    idEstado = 5;
                    ((Button)sender).Text = "Asistió ✔️";
                    ((Button)sender).CssClass = "btn btn-success mx-4 mb-3";
                    Button btn = (Button)repDetalleTurno.Items[0].FindControl("btnNoAsistio");
                    btn.Text = "No Asistió";
                    btn.CssClass = "btn btn-primary mb-3";
                }
                else if (((Button)sender).ID == "btnNoAsistio")
                {
                    idEstado = 3;
                    ((Button)sender).Text = "No Asistió ✔️";
                    ((Button)sender).CssClass = "btn btn-success mb-3";
                    Button btn = (Button)repDetalleTurno.Items[0].FindControl("btnAsistio");
                    btn.Text = "Asistió";
                    btn.CssClass = "btn btn-primary mx-4 mb-3";
                }

                Session["idEstado"] = idEstado;

            }
            catch (Exception ex)
            {

                throw ex;
            }*/
        }

        protected void ddlProfesionales_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnReAgendar.Visible = true;
            idProfesional = Int64.Parse(ddlProfesionales.SelectedItem.Value);
            idEspecialidad = ((List<Turno>)Session["turno"])[0].especialidad.id;

            HorarioNegocio horNeg = new HorarioNegocio();
            List<Horario> diasAtencion = horNeg.listarHorariosConSP(idEspecialidad, idProfesional);

            ddlDias.DataSource = diasAtencion;
            ddlDias.DataValueField = "idHorario";
            ddlDias.DataTextField = "descripcion";
            ddlDias.DataBind();
            if (ddlDias.Items.Count > 1) ddlDias.Items.Insert(0, new ListItem("Seleccione una opción", "0"));

            if (idEspecialidad > 0 && idProfesional > 0) ddlDias_SelectedIndexChanged(sender, e);
            else
            {
                ddlFecha.Items.Clear();
                ddlFecha.DataBind();
                ddlHora.Items.Clear();
                ddlHora.DataBind();
            }
        }

        protected void ddlDias_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnReAgendar.Visible = true;
            if (!isTurno)
            {
                idEspecialidad = ((List<Turno>)Session["turno"])[0].especialidad.id;
                idProfesional = Int64.Parse(ddlProfesionales.SelectedItem.Value);
                if (idProfesional > 0) idHorario = Int64.Parse(ddlDias.SelectedItem.Value);
            }

            if (idHorario > 0)
            {
                List<DateTime> date = listaDias(idHorario);
                ddlFecha.DataSource = date;
                ddlFecha.DataBind();
                ddlFecha_SelectedIndexChanged(sender, e);
            }
            else
            {
                ddlFecha.Items.Clear();
                ddlFecha.DataBind();
                ddlHora.Items.Clear();
                ddlHora.DataBind();
            }
        }

        private List<DateTime> listaDias(Int64 idHorario)
        {
            btnReAgendar.Visible = true;
            HorarioNegocio horNeg = new HorarioNegocio();
            Horario horario = horNeg.listarHorarioSeleccionadoConSP(idHorario);
            int hoy = (int)DateTime.Now.DayOfWeek;
            int diaSeleccionado = diaSemana(horario.dia);
            int aux = 0;

            DateTime firstDay = DateTime.Today;

            if (hoy > diaSeleccionado)
            {
                aux = 7 - hoy + diaSeleccionado;
                firstDay = firstDay.AddDays(aux);
            }
            else if (hoy < diaSeleccionado)
            {
                aux = diaSeleccionado - hoy;
                firstDay = firstDay.AddDays(aux);
            }

            List<DateTime> list = new List<DateTime>();

            for (int i = 0; i < 8; i++)
            {
                list.Add(firstDay);
                firstDay = firstDay.AddDays(7);
            }

            return list;
        }

        private int diaSemana(string dia)
        {
            int result = -1;

            switch (dia)
            {
                case "Domingo":
                    result = 0;
                    break;
                case "Lunes":
                    result = 1;
                    break;
                case "Martes":
                    result = 2;
                    break;
                case "Miércoles":
                    result = 3;
                    break;
                case "Jueves":
                    result = 4;
                    break;
                case "Viernes":
                    result = 5;
                    break;
                case "Sábado":
                    result = 6;
                    break;
            }
            return result;
        }

        protected void ddlFecha_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnReAgendar.Visible = true;
            lblSinTurno.Visible = false;
            if (!isTurno)
            {
                idEspecialidad = ((List<Turno>)Session["turno"])[0].especialidad.id;
                idProfesional = Int64.Parse(ddlProfesionales.SelectedItem.Value);
                if (idProfesional > 0) idHorario = Int64.Parse(ddlDias.SelectedItem.Value);
            }

            if (idHorario > 0)
            {
                List<TimeSpan> horas = listaHoras(idProfesional, idEspecialidad, idHorario);
                ddlHora.DataSource = horas;
                ddlHora.DataBind();
                if (ddlHora.Items.Count == 0) lblSinTurno.Visible = true;
            }
        }

        private List<TimeSpan> listaHoras(Int64 idProfesional, Int32 idEspecialidad, Int64 idHorario)
        {
            List<Turno> listaTurnosTomados = new List<Turno>();
            TurnoNegocio negocio = new TurnoNegocio();

            DateTime fechaSeleccionada = DateTime.Parse(ddlFecha.SelectedItem.Value);
            listaTurnosTomados = negocio.listarTurnosFiltradosConSP(fechaSeleccionada, idProfesional, idEspecialidad, idHorario);

            HorarioNegocio horNeg = new HorarioNegocio();
            Horario horario = horNeg.listarHorarioSeleccionadoConSP(idHorario);

            TimeSpan horaInicio = horario.horaInicio;
            TimeSpan horaFin = horario.horaFin;
            TimeSpan frecuencia = new TimeSpan(00, horario.frecuencia, 00);

            TimeSpan ActualHr = TimeSpan.Parse(DateTime.Now.ToShortTimeString());

            List<TimeSpan> listaHoras = new List<TimeSpan>();

            while (horaInicio < horaFin)
            {
                listaHoras.Add(horaInicio);
                horaInicio = horaInicio.Add(frecuencia);
            }

            TimeSpan horaTurno = ((List<Turno>)Session["turno"])[0].hora;
            int compara = 0;
            if (listaTurnosTomados.Count > 0)
            {
                foreach (Turno t1 in listaTurnosTomados)
                {
                    horaInicio = horario.horaInicio;
                    while (horaInicio < horaFin)
                    {
                        compara = TimeSpan.Compare(t1.hora, horaInicio);
                        if (compara == 0)                                     // Si es = 0, son iguales (está tomado)
                        {
                            if (!isTurno) listaHoras.Remove(horaInicio);
                            else if (isTurno && horaTurno != horaInicio) listaHoras.Remove(horaInicio);
                        }
                        horaInicio = horaInicio.Add(frecuencia);
                    }
                }
            }

            return listaHoras;
        }

        protected void btnReAgendar_Click(object sender, EventArgs e)
        {
            idPaciente = ((List<Turno>)Session["turno"])[0].paciente.id;
            idEspecialidad = ((List<Turno>)Session["turno"])[0].especialidad.id;
            idProfesional = Int64.Parse(ddlProfesionales.SelectedItem.Value);
             if (idProfesional > 0) idHorario = Int64.Parse(ddlDias.SelectedItem.Value);

             if (idHorario > 0)
             {
                 try
                 {
                    Turno turno = new Turno();
                    TurnoNegocio negocio = new TurnoNegocio();
                     
                    turno.id = ((List<Turno>)Session["turno"])[0].id;
                    turno.profesional = new Profesional();
                    turno.profesional.id = idProfesional;
                    turno.fecha = DateTime.Parse(ddlFecha.SelectedItem.Value);
                    turno.hora = TimeSpan.Parse(ddlHora.SelectedItem.Value);
                    turno.observaciones = txtObservaciones.Text;
                    turno.idHorario = idHorario;

                    bool repetido = validaTurnoRepetido(idPaciente, turno.fecha, idProfesional, idEspecialidad);
                    bool tieneOtroTurno = validaOtroTurno(idPaciente, turno.fecha, turno.hora);

                     if (!tieneOtroTurno)
                     {
                         if (!repetido)
                         {
                             negocio.modificarTurnoConSP(turno);
                             Response.Redirect("PanelTurnosGeneral.aspx", false);
                         }
                         else
                         {
                             Session.Add("TurnoNoAgendado", turno);
                             lblTurnoRepetido.Visible = true;
                             btnAceptar.Visible = true;
                             btnCancelar.Visible = true;
                         }

                     }
                     else
                     {
                         lblTurnoNoAgendado.Visible = true;
                     }
                 }
                 catch (Exception ex)
                 {
                     Session.Add("error", ex);
                     throw;
                 }
             }
        }

        private bool validaOtroTurno(Int64 idPaciente, DateTime fecha, TimeSpan hora)
        {
            TurnoNegocio negocio = new TurnoNegocio();
            List<Turno> controlTurnosPaciente = negocio.controlTurnosPacienteConSP(idPaciente, fecha, hora);

            if (controlTurnosPaciente.Count == 0) return false;
            else return true;
        }

        private bool validaTurnoRepetido(Int64 idPaciente, DateTime fecha, Int64 idProfesional, Int32 idEspecialidad)
        {
            TurnoNegocio negocio = new TurnoNegocio();
            List<Turno> filtrados = negocio.listarTurnosFiltradosConSP(fecha, idProfesional, idEspecialidad, 0, idPaciente);

            if (filtrados.Count == 0) return false;
            else return true;
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                TurnoNegocio negocio = new TurnoNegocio();
                negocio.modificarTurnoConSP((Turno)Session["TurnoNoAgendado"]);
                Response.Redirect("PanelTurnosGeneral.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("PanelTurnosGeneral.aspx", false);
        }

        protected void btnSiCancela_Click(object sender, EventArgs e)
        {
            //MODAL CANCELAR TURNO

            Int64 IdTurno = ((List<Turno>)Session["turno"])[0].id;
            String observ = txtObservaciones.Text;
            try
            {
                TurnoNegocio negocio = new TurnoNegocio();
                negocio.cancelarTurnoConSP(IdTurno, observ);
                Response.Redirect("PanelTurnosGeneral.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}





/***********  BOTON ASISTENCIA *****/
/*Button btnSi = (Button)repDetalleTurno.Items[0].FindControl("btnAsistio");
Button btnNo = (Button)repDetalleTurno.Items[0].FindControl("btnNoAsistio");


if (turno.estado.id == 5)
{
    btnSi.Text = "Asistió ✔️";
    btnSi.CssClass = "btn btn-success mx-4 mb-3";
}
else if (turno.estado.id == 3)
{
    btnNo.Text = "No Asistió ✔️";
    btnNo.CssClass = "btn btn-success mb-3";
}*/           