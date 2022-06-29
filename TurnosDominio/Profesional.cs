using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TurnosDominio
{
    public class Profesional:Usuario
    {
        public Int64 idProfesional { get; set; }
        //public List<Especialidad> especialidades { get; set; }
        public Especialidad especialidad { get; set; }
        public decimal costoConsulta { get; set; }
        public bool habilitado { get; set; }

        //matrícula
    }
}
