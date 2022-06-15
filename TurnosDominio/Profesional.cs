using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TurnosDominio
{
    public class Profesional:Persona
    {
        public int id { get; set; }
        public decimal costoConsulta { get; set; }
        public bool activo { get; set; }

    }
}
