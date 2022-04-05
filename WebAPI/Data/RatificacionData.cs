using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebAPI.Models;

namespace WebAPI.Data
{
    public class RatificacionData
    {
        public static string Registrar(Ratificacion oRatificacion)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("SP_Ratificacion_Inserta", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_cliente", oRatificacion.Id_Cliente);
                cmd.Parameters.AddWithValue("@numero_contacto", oRatificacion.Numero_Contacto);
                cmd.Parameters.AddWithValue("@id_seguro_ratificable", oRatificacion.Id_Seguro_Ratificable);
                cmd.Parameters.AddWithValue("@tipo_metodo", oRatificacion.Tipo_Metodo);


                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return "OK";
                }
                catch (Exception ex)
                {
                    string error = ex.HResult.ToString() +" | "+ ex.Message; 
                    return error;
                }
            }
        }

        public static List<Ratificacion> Listar()
        {
            List<Ratificacion> oListaRatificacion = new List<Ratificacion>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("SP_Ratificacion_Consulta", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;



                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();



                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListaRatificacion.Add(new Ratificacion()
                            {
                                Id = Convert.ToInt32(dr["id"]),
                                Fecha_Registro = Convert.ToDateTime(dr["fecha_registro"].ToString()),
                                Id_Cliente = dr["id_cliente"].ToString(),
                                Numero_Contacto = dr["numero_contacto"].ToString(),
                                Id_Seguro_Ratificable = dr["id_seguro_ratificable"].ToString(),
                                Tipo_Metodo = dr["tipo_metodo"].ToString()

                            });
                        }



                    }

                    

                }
                catch (Exception ex)
                {
                    //return oListaRatificacion;
                }
                return oListaRatificacion;
            }
        }

    }
}