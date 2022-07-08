using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TurnosDominio
{
    public class Especialidad
    {
        public int id { get; set; }
        public string descripcion { get; set; }
        public bool activo { get; set; }
        public override string ToString()
        {
            return descripcion;
        }

       /* public override bool Equals(System.Object obj)
        {
            if (obj == null)
                return false;

            Especialidad especialidad = obj as Especialidad;
            if ((System.Object)especialidad == null)
                return false;

            return (id == especialidad.id) && (descripcion == especialidad.descripcion);
        }*/
        public bool Equals(Especialidad especialidad)
        {
            if (especialidad == null)
                return false;

            return (id == especialidad.id) && (descripcion == especialidad.descripcion);
        }

    }
}
