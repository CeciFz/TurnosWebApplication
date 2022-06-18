using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;

namespace TurnosNegocio
{
    public class TipoDocumentoNegocio
    {
        public List<TipoDocumento> listarTiposDeDocumento()
        {
            List<TipoDocumento> lista = new List<TipoDocumento>(); 
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select Id, Descripcion from Tipos_Documentos");
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    TipoDocumento aux = new TipoDocumento();
                    aux.id = (Int16)datos.Lector["Id"];
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
