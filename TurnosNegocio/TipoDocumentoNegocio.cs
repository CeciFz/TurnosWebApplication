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
        private AccesoDatos datos = new AccesoDatos();

        public List<TipoDocumento> listarTiposDeDocumento()
        {
            List<TipoDocumento> lista = new List<TipoDocumento>(); 

            try
            {
                datos.setearConsulta("Select Id, Descripcion, Activo from Tipos_Documentos");
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    TipoDocumento aux = new TipoDocumento();
                    aux.id = (Int16)datos.Lector["Id"];
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

        public void agregarTipoDocumento(TipoDocumento tipoDoc)
        {

            try
            {
                datos.setearConsulta("Insert into Tipos_Documentos (Descripcion) VALUES (@Descripcion)");
                datos.SetearParametro("@Descripcion", tipoDoc.descripcion);


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

        public void modificarTipoDocumento(TipoDocumento tipoDoc)
        {

            try
            {
                datos.setearConsulta("Update Tipos_Documentos Set Descripcion = @descripcion where Id = @id");
                datos.SetearParametro("@descripcion", tipoDoc.descripcion);
                datos.SetearParametro("@id", tipoDoc.id);

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

        public void eliminarLogicoTipoDocumento(int id)
        {
            try
            {
                datos.setearConsulta("Update Tipos_Documentos set Activo = 0 where id = @Id");
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
