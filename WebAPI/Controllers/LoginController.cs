using System;
using System.Net;
using System.Threading;
using System.Web.Http;
using WebAPI.Models;
using System.Web.Script.Serialization;
using System.Net.Http;

namespace WebAPI.Controllers
{
    /// <summary>
    /// login controller class for authenticate users
    /// </summary>
    [AllowAnonymous]
    [RoutePrefix("api/login")]
    public class LoginController : ApiController
    {
        [HttpGet]
        [Route("echoping")]
        public IHttpActionResult EchoPing()
        {
            return Ok(true);
        }


        [HttpGet]
        [Route("echouser")]
        public IHttpActionResult EchoUser()
        {
            var identity = Thread.CurrentPrincipal.Identity;
            return Ok($" IPrincipal-user: {identity.Name} - IsAuthenticated: {identity.IsAuthenticated}");
        }

        [HttpPost]
        [Route("authenticate")]
        //public IHttpActionResult Authenticate(LoginRequest login)
        public HttpResponseMessage Authenticate(LoginRequest login)
        {
            if (login == null)
                throw new HttpResponseException(HttpStatusCode.BadRequest);

            JsonResponse json = new JsonResponse();

            HttpResponseMessage response = Request.CreateResponse();



            bool isCredentialValid = (login.Password == "h7c04qbys1VsFesU" && login.Username == "adminCat");
            if (isCredentialValid)
            {
                var token = TokenGenerator.GenerateTokenJwt(login.Username);
                json.name = "OK";
                json.status = "200";
                json.timestamp = DateTime.Now.ToString();
                json.code = "";
                json.resource = "/api/login/authenticate/";
                json.message = token;

                response.StatusCode = HttpStatusCode.OK;
                response.Content = new StringContent(new JavaScriptSerializer().Serialize(json).ToString(), System.Text.Encoding.UTF8, "application/json");
                
            }
            else
            {
                json.name = "Unauthorized";
                json.status = "401";
                json.timestamp = DateTime.Now.ToString();
                json.code = "";
                json.resource = "/api/login/authenticate/";
                json.message = "";

                response.StatusCode = HttpStatusCode.Unauthorized;
                response.Content = new StringContent(new JavaScriptSerializer().Serialize(json).ToString(), System.Text.Encoding.UTF8, "application/json");
                
            }

            return response;
        }
    }
}
