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
        public List<Profesional> listarProfesionalesConSP()
        {
            List<Profesional> lista = new List<Profesional>();

            try
            {
                datos.setearSP("SP_ListarProfesionales");
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    Profesional aux = new Profesional();

                    aux.id = (Int64)datos.Lector["Id"];
                    aux.apellidos = (string)datos.Lector["Apellidos"];
                    aux.nombres = (string)datos.Lector["Nombres"];
                    aux.sexo = (string)datos.Lector["Sexo"];
                    aux.telefono = (string)datos.Lector["Telefono"];
                    aux.mail = (string)datos.Lector["Mail"];

                    cargarEspecialidades(aux);

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
                datosEspecialidad.setearConsulta("Select IdUsuario, IdEspecialidad, Especialidad from VW_ProfesionalesConEspecialidad");
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
    }
}