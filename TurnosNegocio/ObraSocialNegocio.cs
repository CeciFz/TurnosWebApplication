using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;
using TurnosNegocio;

namespace TurnosNegocio
{
    public class ObraSocialNegocio
    {
        private AccesoDatos datos = new AccesoDatos();
        public List<ObraSocial> listarObrasSociales()  //No muestra los que no están activos
        {
            List<ObraSocial> lista = new List<ObraSocial>();

            try
            {
                datos.setearConsulta("Select Id, Descripcion, Activo from Obras_Sociales");
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    ObraSocial aux = new ObraSocial();
                    aux.id = (Int32)datos.Lector["Id"];
                    aux.descripcion = (string)datos.Lector["Descripcion"];

                    if(aux.activo=(bool)datos.Lector["Activo"]) lista.Add(aux);
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

        public void agregarObraSocial(ObraSocial obraSocial)
        {
 
            try
            {
                datos.setearConsulta("Insert into Obras_Sociales (Descripcion) VALUES (@Descripcion)");
                datos.SetearParametro("@Descripcion", obraSocial.descripcion);


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

        public void modificarObraSocial(ObraSocial obraSocial)
        {
            try
            {
                datos.setearConsulta("Update Obras_Sociales Set Descripcion = @descripcion where Id = @id");
                datos.SetearParametro("@descripcion", obraSocial.descripcion);
                datos.SetearParametro("@id", obraSocial.id);

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

        public void eliminarLogicoObraSocial(int id)
        {
            try
            {
                datos.setearConsulta("Update Obras_Sociales set Activo = 0 where id = @Id");
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

