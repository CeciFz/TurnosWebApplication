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
        public List<ObraSocial> listarObrasSociales()
        {
            List<ObraSocial> lista = new List<ObraSocial>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select Id, Descripcion from Obras_Sociales");
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    ObraSocial aux = new ObraSocial();
                    aux.id = (Int32)datos.Lector["Id"];
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

        public void agregarObraSocial(ObraSocial obraSocial)
        {
            AccesoDatos datos = new AccesoDatos();
            
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
            AccesoDatos datos = new AccesoDatos();

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

    }
}

