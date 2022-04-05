using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;

namespace WebAPI
{
    public static class Logger
    {
        public static void EscribeLog (string mensaje)
        {
            string logPath = ConfigurationManager.AppSettings["logPath"];

            using(StreamWriter writer = new StreamWriter(logPath, true))
            {
                writer.WriteLine($"{DateTime.Now} : {mensaje}");
            }
        }
    }
}