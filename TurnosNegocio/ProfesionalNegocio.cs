using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;

namespace TurnosNegocio
{
    public class ProfesionalNegocio
    {
        private AccesoDatos datos = new AccesoDatos();
        public List<Profesional> listarProfesionalesConSP(Int32 idEspecialidad = -1)
        {
            List<Profesional> lista = new List<Profesional>();

            try
            {
                datos.setearSP("SP_ListarProfesionales");
                datos.SetearParametro("@IdEspecialidad", idEspecialidad);
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    Profesional aux = new Profesional();

                    aux.id = (Int64)datos.Lector["Id"];
                    if (idEspecialidad == -1)
                    {
                        aux.apellidos = (string)datos.Lector["Apellidos"];
                        aux.nombres = (string)datos.Lector["nombres"];
                    }
                    else
                    {
                        aux.nombres = (string)datos.Lector["NombreCompleto"];
                    }
                    aux.sexo = (string)datos.Lector["Sexo"];
                    aux.telefono = (string)datos.Lector["Telefono"];
                    aux.mail = (string)datos.Lector["Mail"];

                    cargarEspecialidades(aux);
                    cargarHorarios(aux);

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

        private void cargarEspecialidades(Profesional profesional)
        {
            AccesoDatos datosEspecialidad = new AccesoDatos();
            profesional.especialidades = new List<Especialidad>();

            try
            {
                datosEspecialidad.setearConsulta("Select IdUsuario, IdEspecialidad, Especialidad, Habilitado from VW_ProfesionalesConEspecialidad");
                datosEspecialidad.lecturaDatos();

                while (datosEspecialidad.Lector.Read())
                {
                    Profesional aux = new Profesional();
                    aux.id = (Int64)datosEspecialidad.Lector["IdUsuario"];

                    if (aux.id == profesional.id)
                    {
                        Especialidad especialidad = new Especialidad();
                        especialidad.id = (int)datosEspecialidad.Lector["IdEspecialidad"];
                        especialidad.descripcion = (String)datosEspecialidad.Lector["Especialidad"];
                        especialidad.activo = (bool)datosEspecialidad.Lector["Habilitado"];
                        profesional.especialidades.Add(especialidad);
                    }
                }
            }
            catch (Exception ex)
            {

                throw;
            }
            finally
            {
                datosEspecialidad.cerrarConexion();
            }
        }

        private void cargarHorarios(Profesional profesional)
        {
            AccesoDatos datosHorario= new AccesoDatos();
            profesional.horarios = new List<Horario>();

            try
            {
                datosHorario.setearConsulta("Select IdUsuario, IdEspecialidad, Especialidad, IdHorario, Dia, " +
                    "Hora_Inicio, Hora_Fin, Frecuencia from VW_HorariosDeProfesionales");
                datosHorario.lecturaDatos();

                while (datosHorario.Lector.Read())
                {
                    Profesional aux = new Profesional();
                    aux.id = (Int64)datosHorario.Lector["IdUsuario"];

                    if (aux.id == profesional.id)
                    {
                        Horario horario = new Horario();
                        horario.idHorario = (Int64)datosHorario.Lector["IdHorario"];
                        horario.dia = (String)datosHorario.Lector["Dia"];
                        horario.horaInicio = (TimeSpan)datosHorario.Lector["Hora_Inicio"];
                        horario.horaFin = (TimeSpan)datosHorario.Lector["Hora_Fin"];
                        horario.frecuencia = (Int16)datosHorario.Lector["Frecuencia"];
                        profesional.horarios.Add(horario);
                    }
                }
            }
            catch (Exception ex)
            {

                throw;
            }
            finally
            {
                datosHorario.cerrarConexion();
            }
        }
    }
}