using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;
using TurnosNegocio;

namespace TurnosNegocio
{
    public class EspecialidadNegocio
    {
        private AccesoDatos datos = new AccesoDatos();

        public List<Especialidad> listarEspecialidades()
        {
            List<Especialidad> lista = new List<Especialidad>();

            try
            {
                datos.setearConsulta("select Id, Descripcion, Activo from Especialidades");
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    Especialidad aux = new Especialidad();
                    aux.id = (int)datos.Lector["Id"];
                    aux.descripcion = (string)datos.Lector["Descripcion"];

                    if (aux.activo = (bool)datos.Lector["Activo"]) lista.Add(aux);
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

        public void agregarEspecialidad(Especialidad especialidad)
        {
            try
            {
                datos.setearConsulta("Insert into Especialidades (Descripcion) VALUES (@Descripcion)");
                datos.SetearParametro("@Descripcion", especialidad.descripcion);


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

        public void modificarEspecialidad(Especialidad especialidad)
        {
            try
            {
                datos.setearConsulta("Update Especialidades Set Descripcion = @descripcion where Id = @id");
                datos.SetearParametro("@descripcion",especialidad.descripcion);
                datos.SetearParametro("@id",especialidad.id);

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

        public void eliminarLogicoEspecialidad(int id)
        {
            try
            {
                datos.setearConsulta("Update Especialidades set Activo = 0 where id = @Id");
                datos.SetearParametro("@Id", id);
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

    }
}
