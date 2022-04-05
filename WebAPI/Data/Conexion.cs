using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace WebAPI.Data
{
    public class Conexion
    {
        public static string rutaConexion = ConfigurationManager.ConnectionStrings["conexionBD_Ratificacion"].ConnectionString;
    }
}