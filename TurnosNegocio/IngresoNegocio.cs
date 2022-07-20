﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;
using TurnosNegocio;


namespace TurnosNegocio
{
   public class IngresoNegocio
    {
       /* public bool Loguear(Ingreso ingresos)
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


        }*/



        public Ingreso Loguear(Ingreso ingreso)
        {

            AccesoDatos datos = new AccesoDatos();
            ingreso.tipoUsuario = 0;

            try
            {
                datos.setearConsulta("select IdIngreso, TipoUser, IdUsuario from VW_IdPerfilUsuario where Usuario=@user and Pass=@pass");
                datos.SetearParametro("@user", ingreso.user);
                datos.SetearParametro("@pass", ingreso.pass);
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    ingreso.idIngreso = (int)datos.Lector["IdIngreso"];
                    //ingresos.TipoUsuario = (int)(datos.Lector["TipoUser"]) == 2 ? tipousuarios.admin : tipousuarios.normal;
                    ingreso.usuario = new Usuario();
                    ingreso.usuario.id = (Int64)datos.Lector["IdUsuario"];
                    ingreso.tipoUsuario = (Int16)datos.Lector["TipoUser"];


                    //if ((Int16)(datos.Lector["TipoUser"]) == 1)
                    //{
                    //    // ingresos.TipoUsuario = tipousuarios.admin;
                    //    //ingresos.tipousuarios = 1;
                    //    return 1;
                    //}
                    //else if ((Int16)(datos.Lector["TipoUser"]) == 2)
                    //{
                    //   // ingresos.TipoUsuario = tipousuarios.gestion;
                    //   // ingresos.tipousuarios = 2;
                    //    return 2;
                    //}
                    //else if ((Int16)(datos.Lector["TipoUser"]) == 3)
                    //{
                    //    //ingresos.TipoUsuario = tipousuarios.paciente;
                    //   // ingresos.tipousuarios = 3;
                    //    return 3;
                    //}
                    //else if ((Int16)(datos.Lector["TipoUser"]) == 4)
                    //{
                    //    //ingresos.TipoUsuario = tipousuarios.profesional;
                    //    //ingresos.tipousuarios = 4;
                    //    return 4;
                    //}

                    


                }
                return ingreso;

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

        
         public int agregaringresoConSP(Int64 dni, string usuario,string contraseña)
        {    AccesoDatos datos = new AccesoDatos();
            int ing;
            try
            {
                datos.setearSP("sp_agregaringreso");
                datos.SetearParametro("@dni", dni);
                datos.SetearParametro("@usuario",usuario );
                datos.SetearParametro("@pass",contraseña );
                 datos.ejecutarAccion();

                
                

                  ing =(int)datos.Lector["sp_agregaringreso"];

                if (ing == 1) { return 1; }
                return 0;
                



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
