using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TurnosDominio
{
    public enum tipousuarios
    {
        normal = 1,
        admin = 2

    }

    public class ingresos
    {

        public int Id { get; set; }
        public string User { get; set; }

        public string Pass { get; set; }

        public tipousuarios TipoUsuario { get; set; }


        public ingresos (string user, string pass, bool admin)
      {
            User = user;
             Pass = pass;

            //?operador ternario, if de una linea, envia true si es admin, sino false
        TipoUsuario = admin? tipousuarios.admin : tipousuarios.normal;


         }
    }
}
