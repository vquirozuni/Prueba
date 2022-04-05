using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPI.Models
{
    public class Ratificacion
    {

        public int Id { get; set; }
        public DateTime Fecha_Registro { get; set; }
        public string Id_Cliente { get; set; }
        public string Numero_Contacto { get; set; }
        public string Id_Seguro_Ratificable { get; set; }
        public string Tipo_Metodo { get; set; }

    }
}