using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TurnosDominio
{
    public class Profesional:Persona
    {
        public int idProfesional { get; set; }
        public decimal costoConsulta { get; set; }
        public bool habilitado { get; set; }

    }
}
