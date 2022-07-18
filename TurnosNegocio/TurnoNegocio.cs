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

        public void modificarTurnoConSP(Turno turno)
        {
            try
            {
                datos.setearSP("SP_ModificarTurno");
                datos.SetearParametro("@IdTurno", turno.id);
                datos.SetearParametro("@IdEstado", turno.estado.id);
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

        public List<Turno> turnosTomadosConSP(DateTime fechaSeleccionada, Int64 idProfesional, Int32 idEspecialidad, Int64 idHorario)
        {
            List<Turno> lista = new List<Turno>();

            try
            {
                datos.setearSP("SP_ValidaTurnoTomado");
                datos.SetearParametro("@Fecha", fechaSeleccionada);
                datos.SetearParametro("@IdProfesional", idProfesional);
                datos.SetearParametro("@IdEspecialidad", idEspecialidad);
                datos.SetearParametro("@IdHorario", idHorario);
                //datos.ejecutarAccion();
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    Turno aux = new Turno();
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
    }
}
