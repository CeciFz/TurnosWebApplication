using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;


namespace TurnosNegocio
{
   public class IngresoNegocio
    {
        public bool Loguear(Ingreso ingresos)
        {

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select Id, TipoUser from Ingresos where Usuario=@user and Pass=@pass");
                datos.SetearParametro("@user", ingresos.User);
                datos.SetearParametro("@pass", ingresos.Pass);

               // datos.ejecutarAccion();
                datos.lecturaDatos();
                
                while (datos.Lector.Read())
                {
                    ingresos.Id = (int)datos.Lector["Id"];
                    ingresos.TipoUsuario = (int)(datos.Lector["TipoUser"]) == 2 ? tipousuarios.admin : tipousuarios.normal;
                    return true;       
                }
                return false;
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
