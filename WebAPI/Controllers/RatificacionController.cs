using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using WebAPI.Data;
using WebAPI.Models;
using Newtonsoft.Json.Linq;
using System.Text;
using System.Web.Script.Serialization;

namespace WebAPI.Controllers
{
    /// <summary>
    /// customer controller class for testing security token
    /// </summary>
    [Authorize]
    public class RatificacionController : ApiController
    {
        // GET api/<controller>
        public List<Ratificacion> Get()
        {
            Logger.EscribeLog("Consulta listado de Ratificacion en BD");
            return RatificacionData.Listar();
        }


        // POST api/<controller>
        public HttpResponseMessage Post([FromBody] Ratificacion oRatificacion)
        {

            Logger.EscribeLog("Inserta Ratificacion para: " + oRatificacion.Id_Cliente);

            string respuesta = RatificacionData.Registrar(oRatificacion);

            JsonResponse json = new JsonResponse();

            HttpResponseMessage response = Request.CreateResponse();

            if (respuesta.Equals("OK"))
            {
                json.name = "OK";
                json.status = "200";
                json.timestamp = DateTime.Now.ToString();
                json.code = "";
                json.resource = "/api/Ratificacion/";
                json.message = "";

                response.StatusCode = HttpStatusCode.OK;
                response.Content = new StringContent(new JavaScriptSerializer().Serialize(json).ToString(), System.Text.Encoding.UTF8, "application/json");
            }
            else
            {
                json.name = "Error";
                json.status = "404";
                json.timestamp = DateTime.Now.ToString();
                json.code = respuesta.Split('|')[0];
                json.resource = "/api/Ratificacion/";
                json.message = respuesta.Split('|')[1];

                response.StatusCode = HttpStatusCode.NotFound;
                response.Content = new StringContent(new JavaScriptSerializer().Serialize(json).ToString(), System.Text.Encoding.UTF8, "application/json");                
            }

            return response;
        }

    }
}