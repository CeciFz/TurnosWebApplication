using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;


namespace TurnosNegocio
{
    public class TurnoNegocio
    {
        private AccesoDatos datos = new AccesoDatos();
        
        public List<Turno> listarTurnosConSP(Int64 idProfesional = -1, Int32 idEspecialidad=-1)
        { 
            List<Turno> lista = new List<Turno>();

            try
            {
                datos.setearSP("SP_ListarTurnos");
                datos.SetearParametro("@IdProfesional", idProfesional);
                datos.SetearParametro("@IdEspecialidad", idEspecialidad);
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    Turno aux = new Turno();
                    aux.id = (Int64)datos.Lector["IdTurno"];
                    aux.paciente = new Usuario();
                    aux.paciente.id = (Int64)datos.Lector["IdPaciente"];
                    aux.paciente.nombres = (string)datos.Lector["Paciente"];
                    aux.fecha = (DateTime)datos.Lector["Fecha"];
                    aux.hora = (TimeSpan)datos.Lector["Hora"];
                    aux.profesional = new Profesional();
                    aux.profesional.id = (Int64)datos.Lector["IdProfesional"];
                    aux.profesional.nombres = (string)datos.Lector["Profesional"];
                    aux.especialidad = new Especialidad();
                    aux.especialidad.id = (Int32)datos.Lector["IdEspecialidad"];
                    aux.especialidad.descripcion = (string)datos.Lector["Especialidad"];
                    aux.idHorario = (Int64)datos.Lector["idHorario"];
                    aux.estado = new EstadoTurno();
                    aux.estado.id = (Int16)datos.Lector["IdEstado"];
                    aux.estado.descripcion = (String)datos.Lector["Estado"];
                    aux.observaciones = (String)datos.Lector["Observaciones"];

                    lista.Add(aux);
                }

                return lista;

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void agregarTurnoConSP(Turno turno)
        {
            try
            {
                datos.setearSP("SP_AltaTurno");
                datos.SetearParametro("@IdPaciente", turno.paciente.id);
                datos.SetearParametro("@Fecha", turno.fecha);
                datos.SetearParametro("@Hora", turno.hora);
                datos.SetearParametro("@IdProfesional", turno.profesional.id);
                datos.SetearParametro("@IdEspecialidad", turno.especialidad.id);
                //datos.SetearParametro("@IdHorario", turno.profesional.horarios[0].idHorario);
                datos.SetearParametro("@IdHorario", turno.idHorario);
                datos.SetearParametro("@Observaciones", turno.observaciones);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void modificarTurnoConSP(Int64 idTurno, Int16 idEstado, String observaciones)
        {
            try
            {
                datos.setearSP("SP_ModificarTurno");
                datos.SetearParametro("@IdTurno", idTurno);
                datos.SetearParametro("@IdEstado", idEstado);
                datos.SetearParametro("@Observaciones", observaciones);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public List<Turno> listarTurnosFiltradosConSP(DateTime fechaSeleccionada, Int64 idProfesional, Int32 idEspecialidad, Int64 idHorario,Int64 idPaciente=-1)
        {
            List<Turno> lista = new List<Turno>();

            try
            {
                datos.setearSP("SP_FiltroTurnos");
                datos.SetearParametro("@Fecha", fechaSeleccionada);
                datos.SetearParametro("@IdProfesional", idProfesional);
                datos.SetearParametro("@IdEspecialidad", idEspecialidad);
                datos.SetearParametro("@IdHorario", idHorario);
                datos.SetearParametro("@IdPaciente", idPaciente);
                //datos.ejecutarAccion();
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    Turno aux = new Turno();
                    aux.paciente = new Usuario();
                    aux.paciente.id = (Int64)datos.Lector["IdPaciente"];
                    aux.fecha = (DateTime)datos.Lector["Fecha"];
                    aux.hora = (TimeSpan)datos.Lector["Hora"];
                    aux.profesional = new Profesional();
                    aux.profesional.id = (Int64)datos.Lector["IdProfesional"];
                    aux.especialidad = new Especialidad();
                    aux.especialidad.id = (Int32)datos.Lector["IdEspecialidad"];
                    aux.estado = new EstadoTurno();
                    aux.estado.id = (Int16)datos.Lector["IdEstado"];

                    lista.Add(aux);
                }

                return lista;

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        
        public List<Turno> controlTurnosPacienteConSP(Int64 idPaciente,DateTime fecha, TimeSpan hora)
        {
            List<Turno> lista = new List<Turno>();

            try
            {
                datos.setearSP("SP_ControlTurnosPacientes");
                datos.SetearParametro("@IdPaciente", idPaciente);
                datos.SetearParametro("@Fecha", fecha);
                datos.SetearParametro("@Hora", hora);
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    Turno aux = new Turno();
                    aux.paciente = new Usuario();
                    aux.paciente.id = (Int64)datos.Lector["IdPaciente"];
                    aux.fecha = (DateTime)datos.Lector["Fecha"];
                    aux.hora = (TimeSpan)datos.Lector["Hora"];
                    aux.profesional = new Profesional();
                    aux.profesional.id = (Int64)datos.Lector["IdProfesional"];
                    aux.especialidad = new Especialidad();
                    aux.especialidad.id = (Int32)datos.Lector["IdEspecialidad"];
                    aux.estado = new EstadoTurno();
                    aux.estado.id = (Int16)datos.Lector["IdEstado"];

                    lista.Add(aux);
                }

                return lista;

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public List<Turno> listaTurnosPacienteConSP(Int64 idPaciente, bool historial = false)
        {
            List<Turno> lista = new List<Turno>();

            try
            {
                datos.setearSP("SP_ListarTurnosPaciente");
                datos.SetearParametro("@IdPaciente", idPaciente);
                datos.SetearParametro("@ConHistorial", historial);
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    Turno aux = new Turno();
                    aux.id = (Int64)datos.Lector["IdTurno"];
                    aux.paciente = new Usuario();
                    aux.paciente.id = (Int64)datos.Lector["IdPaciente"];
                    aux.paciente.nombres = (String)datos.Lector["Paciente"];
                    aux.fecha = (DateTime)datos.Lector["Fecha"];
                    aux.hora = (TimeSpan)datos.Lector["Hora"];
                    aux.profesional = new Profesional();
                    aux.profesional.id = (Int64)datos.Lector["IdProfesional"];
                    aux.profesional.nombres = (String)datos.Lector["Profesional"];
                    aux.especialidad = new Especialidad();
                    aux.especialidad.id = (Int32)datos.Lector["IdEspecialidad"];
                    aux.especialidad.descripcion = (String)datos.Lector["Especialidad"];
                    aux.estado = new EstadoTurno();
                    aux.estado.id = (Int16)datos.Lector["IdEstado"];
                    aux.estado.descripcion = (string)datos.Lector["Estado"];

                    lista.Add(aux);
                }

                return lista;

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        }
}
