using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TurnosDominio
{
    public class Profesional:Usuario
    {
        public List<Especialidad> especialidades { get; set; }
        public bool habilitado { get; set; }

    }
}
