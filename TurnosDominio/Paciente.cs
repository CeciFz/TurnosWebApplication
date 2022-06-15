using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TurnosDominio
{
    public class Paciente:Persona   
    {
        public int idPaciente { get; set; }
        public ObraSocial obraSocial { get; set; }
        public bool habilitado { get; set; }

    }
}
