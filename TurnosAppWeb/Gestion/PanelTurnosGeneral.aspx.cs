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
    public partial class PanelTurnosGeneral : System.Web.UI.Page
    {
        public List<Turno> listaTurnos { get; set; }
        public List<Usuario> listaPacientes { get; set; }
        List<DateTime> listaFechasTurnos { get; set; }
        private Int64 idPaciente { get; set; }
        private Int64 idProfesional { get; set; }
        private Int32 idEspecialidad { get; set; }
        private Int64 idHorario { get; set; }
        DropDownList ddlProfesionales { get; set; }
        DropDownList ddlDias { get; set; }
        DropDownList ddlFecha { get; set; }
        DropDownList ddlHora { get; set; }
        Label lblSinTurno { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
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

            //lblProfesional.Text = "Profesional: " + ((Profesional)Session["InfoProfesional"]).nombres;

            repTurnos.DataSource = listaFechasTurnos;
            repTurnos.DataBind();


        }

        protected void dgvlistaTurnosGeneral_SelectedIndexChanged(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            GridView grid = (GridView)sender;

            RepeaterItem repeater = (RepeaterItem)((GridView)sender).Parent;
            int i = repeater.ItemIndex;
            grid = (GridView)repeater.FindControl("dgvlistaTurnosGeneral");
            string id = grid.SelectedDataKey.Value.ToString();

            List<Turno> listaTurnosFiltrados = listaTurnos.FindAll(x => x.id.ToString() == id);

            Turno turno = listaTurnosFiltrados[0];
            Session["idEstado"] = turno.estado.id;
            idPaciente = turno.paciente.id;
            idEspecialidad = turno.especialidad.id;
            Session["idEspecialidad"] = idEspecialidad;
            idProfesional = turno.profesional.id;
            listaPacientes = negocio.listarPacientes(idPaciente);
            Session["hora"] = turno.hora;
            Session["fecha"] = turno.fecha;

            repPaciente.DataSource = listaPacientes;
            repPaciente.DataBind();

            repDetalleTurno.DataSource = listaTurnosFiltrados;
            repDetalleTurno.DataBind();

            /////////////////////////////////////////////////////
            /// PRIMERO PRECARGA DDL
            ProfesionalNegocio profNeg = new ProfesionalNegocio();
            HorarioNegocio horNeg = new HorarioNegocio();

            ddlProfesionales = (DropDownList)repDetalleTurno.Items[0].FindControl("ddlProfesionales");
            ddlDias = (DropDownList)repDetalleTurno.Items[0].FindControl("ddlDias");
            ddlFecha = (DropDownList)repDetalleTurno.Items[0].FindControl("ddlFecha");
            ddlHora = (DropDownList)repDetalleTurno.Items[0].FindControl("ddlHora");
            lblSinTurno = (Label)repDetalleTurno.Items[0].FindControl("lblSinTurno");

            try
            {
                ddlProfesionales.DataSource = profNeg.listarProfesionalesConSP();
                ddlProfesionales.DataValueField = "id";
                ddlProfesionales.DataTextField = "nombres";
                ddlProfesionales.DataBind();

                ddlDias.DataSource = horNeg.listarHorariosConSP(idEspecialidad, idProfesional);
                ddlDias.DataValueField = "idHorario";
                ddlDias.DataTextField = "descripcion";
                ddlDias.DataBind();

                lblSinTurno.Visible = false;

                ddlProfesionales.SelectedValue = turno.profesional.id.ToString();
                ddlDias.SelectedValue = turno.idHorario.ToString();
                ddlDias_SelectedIndexChanged(sender, e);
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
            }

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

            //////////////////////////
            ///

//            lblTurnoTomado.Visible = false;

            Label lblEspecialidad = (Label)repDetalleTurno.Items[0].FindControl("lblEspecialidad");
            lblEspecialidad.Text = turno.especialidad.descripcion;
          
            ddlHora.SelectedValue = turno.hora.ToString();           

            TextBox txt = (TextBox)repDetalleTurno.Items[0].FindControl("txtObservaciones");
            txt.Text = turno.observaciones;

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

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Int64 idTurno = Int64.Parse(((Button)sender).CommandArgument);
            TextBox txt = (TextBox)repDetalleTurno.Items[0].FindControl("txtObservaciones");
            Int16 idEstado = (Int16)Session["idEstado"];

            try
            {
                TurnoNegocio negocio = new TurnoNegocio();
                String observaciones = txt.Text;

                negocio.modificarTurnoConSP(idTurno, idEstado, observaciones);
            }
            catch (Exception ex)
            {

                throw ex;
            }

            Page_Load(sender, e);
        }
        /// VER ESTE: VER SI ACA USO PARA MODIFICAR TURNO
        protected void btnAsistio_Click(object sender, EventArgs e)
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
            }
        }

        protected void ddlProfesionales_SelectedIndexChanged(object sender, EventArgs e)
        {
            idProfesional = Int64.Parse(ddlProfesionales.SelectedItem.Value);
            idEspecialidad = (Int32)Session["idEspecialidad"];

            HorarioNegocio horNeg = new HorarioNegocio();
            List<Horario> diasAtencion = horNeg.listarHorariosConSP(idEspecialidad, idProfesional);

            DropDownList ddlDias = (DropDownList)repDetalleTurno.Items[0].FindControl("ddlHora");
            ddlDias.DataSource = diasAtencion;
            ddlDias.DataValueField = "idHorario";
            ddlDias.DataTextField = "dia";
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
            if (idEspecialidad > 0) idProfesional = Int64.Parse(ddlProfesionales.SelectedItem.Value);
            if (idProfesional > 0) idHorario = Int64.Parse(ddlDias.SelectedItem.Value);

            if (idHorario > 0)
            {
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

                List<DateTime> date = new List<DateTime>();
                for (int i = 0; i < 8; i++)
                {
                    date.Add(firstDay);
                    firstDay = firstDay.AddDays(7);
                }

                ddlFecha.DataSource = date;
                ddlFecha.DataBind();
                ddlFecha.SelectedValue = ((DateTime)Session["fecha"]).ToString();   //////////////VERRRR SI ME MOLESTA AL CAMBIAR TURNO
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
            if (idEspecialidad > 0) idProfesional = Int64.Parse(ddlProfesionales.SelectedItem.Value);
            if (idProfesional > 0) idHorario = Int64.Parse(ddlDias.SelectedItem.Value);

            if (idHorario > 0)
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


                List<TimeSpan> horas = new List<TimeSpan>();

                while (horaInicio < horaFin)
                {
                    horas.Add(horaInicio);
                    horaInicio = horaInicio.Add(frecuencia);
                }


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
                                horas.Remove(horaInicio);
                            }
                            horaInicio = horaInicio.Add(frecuencia);
                        }
                    }
                }
                TimeSpan horaTurno = (TimeSpan)Session["hora"];
                horas.Add(horaTurno);

                ddlHora.DataSource = horas;
                ddlHora.DataBind();
                if (ddlHora.Items.Count == 0) lblSinTurno.Visible = true;
            }
        }

        //txtFechaNac.Text = seleccionado.fechaNacimiento.ToString("yyyy-MM-dd");

        protected void btnReAgendar_Click(object sender, EventArgs e)
        {
            Label lblTurnoRepetido = (Label)repDetalleTurno.Items[0].FindControl("lblTurnoRepetido");
            Label lblTurnoTomado = (Label)repDetalleTurno.Items[0].FindControl("lblTurnoTomado");
            Button btnAceptar = (Button)repDetalleTurno.Items[0].FindControl("btnAceptar");
            Button btnCancelar = (Button)repDetalleTurno.Items[0].FindControl("btnCancelar");


            //Int64 idPaciente = Int64.Parse(ddlPaciente.SelectedItem.Value);
            if (idEspecialidad > 0) idProfesional = Int64.Parse(ddlProfesionales.SelectedItem.Value);
            if (idProfesional > 0) idHorario = Int64.Parse(ddlDias.SelectedItem.Value);

            if (idHorario > 0 && idPaciente > 0)
            {
                try
                {
                    Turno turno = new Turno();
                    TurnoNegocio negocio = new TurnoNegocio();

                    turno.paciente = new Usuario();
                    turno.paciente.id = idPaciente;
                    turno.profesional = new Profesional();
                    turno.profesional.id = idProfesional;
                    turno.especialidad = new Especialidad();
                    turno.especialidad.id = idEspecialidad;
                    turno.idHorario = idHorario;

                    turno.fecha = DateTime.Parse(ddlFecha.SelectedItem.Value);
                    turno.hora = TimeSpan.Parse(ddlHora.SelectedItem.Value);
                    //turno.observaciones = txtObservaciones.Text;

                    bool repetido = validaTurnoRepetido(idPaciente, turno.fecha, idProfesional, idEspecialidad);
                    bool tieneOtroTurno = validaOtroTurno(idPaciente, turno.fecha, turno.hora);


                    if (!tieneOtroTurno)
                    {
                        if (!repetido)
                        {
                            //negocio.agregarTurnoConSP(turno);
                            Response.Redirect("TurnoForm.aspx", false);
                        }
                        else
                        {
                            Session.Add("Turno", turno);
                            lblTurnoRepetido.Visible = true;
                            btnAceptar.Visible = true;
                            btnCancelar.Visible = true;
                        }

                    }
                    else
                    {
                        lblTurnoTomado.Visible = true;
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
                negocio.agregarTurnoConSP((Turno)Session["Turno"]);
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
    }
}