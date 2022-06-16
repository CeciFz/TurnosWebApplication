using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;

namespace TurnosNegocio
{
    public class EspecialidadesNegocio
    {
        public List<Especialidad> listarEspecialidades()
        {
            List<Especialidad> lista = new List<Especialidad>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select Id, Descripcion from Especialidades");
                datos.lecturaDatos();

                //desplaza al siguiente registro mientras sea true
                while (datos.Lector.Read())
                {
                    Especialidad aux = new Especialidad();
                    aux.id = (int)datos.Lector["Id"];
                    aux.descripcion = (string)datos.Lector["Descripcion"];

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
