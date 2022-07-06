using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;


namespace TurnosNegocio
{
   public class ingresosnegocio
    {
        public bool loguear(ingresos ingresos)
        {

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select Id, TipoUser from Ingresos where Usuario=@user and Pass=@pass");
                datos.SetearParametro("@user", ingresos.user);
                datos.SetearParametro("@pass", ingresos.pass);

                datos.ejecutarAccion();
                while (datos.Lector.Read())
                {
                    ingresos.id = (int)datos.Lector["Id"];
                    ingresos.tipoUsuario = (int)datos.Lector["TipoUser"] == 2 ? tipousuarios.admin : tipousuarios.normal;
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
