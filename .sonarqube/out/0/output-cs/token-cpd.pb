Œ
VC:\Users\eduar\Documents\Proyectos_NET\ProyectoWebAPI\WebAPI\App_Start\WebApiConfig.cs
	namespace 	
WebAPI
 
{		 
public

 

static

 
class

 
WebApiConfig

 $
{ 
public 
static 
void 
Register #
(# $
HttpConfiguration$ 5
config6 <
)< =
{ 	
var 
cors 
= 
new 
EnableCorsAttribute .
(. /
$str/ 2
,2 3
$str4 7
,7 8
$str9 <
)< =
;= >
config 
. 

EnableCors 
( 
cors "
)" #
;# $
config 
. "
MapHttpAttributeRoutes )
() *
)* +
;+ ,
config 
. 
MessageHandlers "
." #
Add# &
(& '
new' *"
TokenValidationHandler+ A
(A B
)B C
)C D
;D E
config 
. 
Routes 
. 
MapHttpRoute &
(& '
name 
: 
$str "
," #
routeTemplate 
: 
$str 6
,6 7
defaults 
: 
new 
{ 
id  "
=# $
RouteParameter% 3
.3 4
Optional4 <
}= >
) 
; 
} 	
} 
} ∑:
bC:\Users\eduar\Documents\Proyectos_NET\ProyectoWebAPI\WebAPI\Controllers\TokenValidationHandler.cs
	namespace 	
WebAPI
 
. 
Controllers 
{ 
internal 
class "
TokenValidationHandler )
:* +
DelegatingHandler, =
{ 
private 
static 
bool 
TryRetrieveToken ,
(, -
HttpRequestMessage- ?
request@ G
,G H
outI L
stringM S
tokenT Y
)Y Z
{ 	
token 
= 
null 
; 
IEnumerable 
< 
string 
> 
authzHeaders  ,
;, -
if 
( 
! 
request 
. 
Headers  
.  !
TryGetValues! -
(- .
$str. =
,= >
out? B
authzHeadersC O
)O P
||Q S
authzHeadersT `
.` a
Counta f
(f g
)g h
>i j
$numk l
)l m
{ 
return 
false 
; 
} 
var 
bearerToken 
= 
authzHeaders *
.* +
	ElementAt+ 4
(4 5
$num5 6
)6 7
;7 8
token 
= 
bearerToken 
.  

StartsWith  *
(* +
$str+ 4
)4 5
?6 7
bearerToken8 C
.C D
	SubstringD M
(M N
$numN O
)O P
:Q R
bearerTokenS ^
;^ _
return 
true 
; 
}   	
	protected"" 
override"" 
Task"" 
<""  
HttpResponseMessage""  3
>""3 4
	SendAsync""5 >
(""> ?
HttpRequestMessage""? Q
request""R Y
,""Y Z
CancellationToken""[ l
cancellationToken""m ~
)""~ 
{## 	
HttpStatusCode$$ 

statusCode$$ %
;$$% &
string%% 
token%% 
;%% 
if,, 
(,, 
!,, 
TryRetrieveToken,, !
(,,! "
request,," )
,,,) *
out,,+ .
token,,/ 4
),,4 5
),,5 6
{-- 

statusCode.. 
=.. 
HttpStatusCode.. +
...+ ,
Unauthorized.., 8
;..8 9
return// 
base// 
.// 
	SendAsync// %
(//% &
request//& -
,//- .
cancellationToken/// @
)//@ A
;//A B
}00 
try22 
{33 
var44 
	secretKey44 
=44  
ConfigurationManager44  4
.444 5
AppSettings445 @
[44@ A
$str44A Q
]44Q R
;44R S
var55 
audienceToken55 !
=55" # 
ConfigurationManager55$ 8
.558 9
AppSettings559 D
[55D E
$str55E Y
]55Y Z
;55Z [
var66 
issuerToken66 
=66  ! 
ConfigurationManager66" 6
.666 7
AppSettings667 B
[66B C
$str66C U
]66U V
;66V W
var77 
securityKey77 
=77  !
new77" % 
SymmetricSecurityKey77& :
(77: ;
System77; A
.77A B
Text77B F
.77F G
Encoding77G O
.77O P
Default77P W
.77W X
GetBytes77X `
(77` a
	secretKey77a j
)77j k
)77k l
;77l m
SecurityToken99 
securityToken99 +
;99+ ,
var:: 
tokenHandler::  
=::! "
new::# &
System::' -
.::- .
IdentityModel::. ;
.::; <
Tokens::< B
.::B C
Jwt::C F
.::F G#
JwtSecurityTokenHandler::G ^
(::^ _
)::_ `
;::` a%
TokenValidationParameters;; ) 
validationParameters;;* >
=;;? @
new;;A D%
TokenValidationParameters;;E ^
(;;^ _
);;_ `
{<< 
ValidAudience== !
===" #
audienceToken==$ 1
,==1 2
ValidIssuer>> 
=>>  !
issuerToken>>" -
,>>- .
ValidateLifetime?? $
=??% &
true??' +
,??+ ,$
ValidateIssuerSigningKey@@ ,
=@@- .
true@@/ 3
,@@3 4
LifetimeValidatorAA %
=AA& '
thisAA( ,
.AA, -
LifetimeValidatorAA- >
,AA> ?
IssuerSigningKeyBB $
=BB% &
securityKeyBB' 2
}CC 
;CC 
ThreadFF 
.FF 
CurrentPrincipalFF '
=FF( )
tokenHandlerFF* 6
.FF6 7
ValidateTokenFF7 D
(FFD E
tokenFFE J
,FFJ K 
validationParametersFFL `
,FF` a
outFFb e
securityTokenFFf s
)FFs t
;FFt u
HttpContextGG 
.GG 
CurrentGG #
.GG# $
UserGG$ (
=GG) *
tokenHandlerGG+ 7
.GG7 8
ValidateTokenGG8 E
(GGE F
tokenGGF K
,GGK L 
validationParametersGGM a
,GGa b
outGGc f
securityTokenGGg t
)GGt u
;GGu v
returnII 
baseII 
.II 
	SendAsyncII %
(II% &
requestII& -
,II- .
cancellationTokenII/ @
)II@ A
;IIA B
}JJ 
catchKK 
(KK ,
 SecurityTokenValidationExceptionKK 3
)KK3 4
{LL 

statusCodeMM 
=MM 
HttpStatusCodeMM +
.MM+ ,
UnauthorizedMM, 8
;MM8 9
}NN 
catchOO 
(OO 
	ExceptionOO 
)OO 
{PP 

statusCodeQQ 
=QQ 
HttpStatusCodeQQ +
.QQ+ ,
InternalServerErrorQQ, ?
;QQ? @
}RR 
returnTT 
TaskTT 
<TT 
HttpResponseMessageTT +
>TT+ ,
.TT, -
FactoryTT- 4
.TT4 5
StartNewTT5 =
(TT= >
(TT> ?
)TT? @
=>TTA C
newTTD G
HttpResponseMessageTTH [
(TT[ \

statusCodeTT\ f
)TTf g
{TTh i
}TTj k
)TTk l
;TTl m
}UU 	
publicWW 
boolWW 
LifetimeValidatorWW %
(WW% &
DateTimeWW& .
?WW. /
	notBeforeWW0 9
,WW9 :
DateTimeWW; C
?WWC D
expiresWWE L
,WWL M
SecurityTokenWWN [
securityTokenWW\ i
,WWi j&
TokenValidationParameters	WWk Ñ"
validationParameters
WWÖ ô
)
WWô ö
{XX 	
ifYY 
(YY 
expiresYY 
!=YY 
nullYY 
&&YY  "
DateTimeYY# +
.YY+ ,
UtcNowYY, 2
<YY3 4
expiresYY5 <
)YY< =
{ZZ 
return[[ 
true[[ 
;[[ 
}\\ 
return]] 
false]] 
;]] 
}^^ 	
}__ 
}`` µ
_C:\Users\eduar\Documents\Proyectos_NET\ProyectoWebAPI\WebAPI\Controllers\CustomersController.cs
	namespace 	
WebAPI
 
. 
Controllers 
{ 
[ 
	Authorize 
] 
[		 
RoutePrefix		 
(		 
$str		  
)		  !
]		! "
public

 

class

 
CustomersController

 $
:

% &
ApiController

' 4
{ 
[ 	
HttpGet	 
] 
public 
IHttpActionResult  
GetId! &
(& '
int' *
id+ -
)- .
{ 	
var 
customerFake 
= 
$str .
;. /
return 
Ok 
( 
customerFake "
)" #
;# $
} 	
[ 	
HttpGet	 
] 
public 
IHttpActionResult  
GetAll! '
(' (
)( )
{ 	
var 
customersFake 
= 
new  #
string$ *
[* +
]+ ,
{- .
$str/ ;
,; <
$str= I
,I J
$strK W
}X Y
;Y Z
return 
Ok 
( 
customersFake #
)# $
;$ %
} 	
} 
} ﬁ0
[C:\Users\eduar\Documents\Proyectos_NET\ProyectoWebAPI\WebAPI\Controllers\LoginController.cs
	namespace		 	
WebAPI		
 
.		 
Controllers		 
{

 
[ 
AllowAnonymous 
] 
[ 
RoutePrefix 
( 
$str 
) 
] 
public 

class 
LoginController  
:! "
ApiController# 0
{ 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
] 
public 
IHttpActionResult  
EchoPing! )
() *
)* +
{ 	
return 
Ok 
( 
true 
) 
; 
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
] 
public 
IHttpActionResult  
EchoUser! )
() *
)* +
{ 	
var 
identity 
= 
Thread !
.! "
CurrentPrincipal" 2
.2 3
Identity3 ;
;; <
return 
Ok 
( 
$" 
$str *
{* +
identity+ 3
.3 4
Name4 8
}8 9
$str9 M
{M N
identityN V
.V W
IsAuthenticatedW f
}f g
"g h
)h i
;i j
}   	
["" 	
HttpPost""	 
]"" 
[## 	
Route##	 
(## 
$str## 
)## 
]## 
public%% 
HttpResponseMessage%% "
Authenticate%%# /
(%%/ 0
LoginRequest%%0 <
login%%= B
)%%B C
{&& 	
if'' 
('' 
login'' 
=='' 
null'' 
)'' 
throw(( 
new(( !
HttpResponseException(( /
(((/ 0
HttpStatusCode((0 >
.((> ?

BadRequest((? I
)((I J
;((J K
JsonResponse** 
json** 
=** 
new**  #
JsonResponse**$ 0
(**0 1
)**1 2
;**2 3
HttpResponseMessage,, 
response,,  (
=,,) *
Request,,+ 2
.,,2 3
CreateResponse,,3 A
(,,A B
),,B C
;,,C D
bool00 
isCredentialValid00 "
=00# $
(00% &
login00& +
.00+ ,
Password00, 4
==005 7
$str008 J
&&00K M
login00N S
.00S T
Username00T \
==00] _
$str00` j
)00j k
;00k l
if11 
(11 
isCredentialValid11 !
)11! "
{22 
var33 
token33 
=33 
TokenGenerator33 *
.33* +
GenerateTokenJwt33+ ;
(33; <
login33< A
.33A B
Username33B J
)33J K
;33K L
json44 
.44 
name44 
=44 
$str44  
;44  !
json55 
.55 
status55 
=55 
$str55 #
;55# $
json66 
.66 
	timestamp66 
=66  
DateTime66! )
.66) *
Now66* -
.66- .
ToString66. 6
(666 7
)667 8
;668 9
json77 
.77 
code77 
=77 
$str77 
;77 
json88 
.88 
resource88 
=88 
$str88  :
;88: ;
json99 
.99 
message99 
=99 
token99 $
;99$ %
response;; 
.;; 

StatusCode;; #
=;;$ %
HttpStatusCode;;& 4
.;;4 5
OK;;5 7
;;;7 8
response<< 
.<< 
Content<<  
=<<! "
new<<# &
StringContent<<' 4
(<<4 5
new<<5 8 
JavaScriptSerializer<<9 M
(<<M N
)<<N O
.<<O P
	Serialize<<P Y
(<<Y Z
json<<Z ^
)<<^ _
.<<_ `
ToString<<` h
(<<h i
)<<i j
,<<j k
System<<l r
.<<r s
Text<<s w
.<<w x
Encoding	<<x Ä
.
<<Ä Å
UTF8
<<Å Ö
,
<<Ö Ü
$str
<<á ô
)
<<ô ö
;
<<ö õ
}>> 
else?? 
{@@ 
jsonAA 
.AA 
nameAA 
=AA 
$strAA *
;AA* +
jsonBB 
.BB 
statusBB 
=BB 
$strBB #
;BB# $
jsonCC 
.CC 
	timestampCC 
=CC  
DateTimeCC! )
.CC) *
NowCC* -
.CC- .
ToStringCC. 6
(CC6 7
)CC7 8
;CC8 9
jsonDD 
.DD 
codeDD 
=DD 
$strDD 
;DD 
jsonEE 
.EE 
resourceEE 
=EE 
$strEE  :
;EE: ;
jsonFF 
.FF 
messageFF 
=FF 
$strFF !
;FF! "
responseHH 
.HH 

StatusCodeHH #
=HH$ %
HttpStatusCodeHH& 4
.HH4 5
UnauthorizedHH5 A
;HHA B
responseII 
.II 
ContentII  
=II! "
newII# &
StringContentII' 4
(II4 5
newII5 8 
JavaScriptSerializerII9 M
(IIM N
)IIN O
.IIO P
	SerializeIIP Y
(IIY Z
jsonIIZ ^
)II^ _
.II_ `
ToStringII` h
(IIh i
)IIi j
,IIj k
SystemIIl r
.IIr s
TextIIs w
.IIw x
Encoding	IIx Ä
.
IIÄ Å
UTF8
IIÅ Ö
,
IIÖ Ü
$str
IIá ô
)
IIô ö
;
IIö õ
}KK 
returnMM 
responseMM 
;MM 
}NN 	
}OO 
}PP ¯(
bC:\Users\eduar\Documents\Proyectos_NET\ProyectoWebAPI\WebAPI\Controllers\RatificacionController.cs
	namespace 	
WebAPI
 
. 
Controllers 
{ 
[ 
	Authorize 
] 
public 

class "
RatificacionController '
:( )
ApiController* 7
{ 
public 
List 
< 
Ratificacion  
>  !
Get" %
(% &
)& '
{ 	
Logger 
. 

EscribeLog 
( 
$str F
)F G
;G H
return 
RatificacionData #
.# $
Listar$ *
(* +
)+ ,
;, -
} 	
public   
HttpResponseMessage   "
Post  # '
(  ' (
[  ( )
FromBody  ) 1
]  1 2
Ratificacion  3 ?
oRatificacion  @ M
)  M N
{!! 	
Logger## 
.## 

EscribeLog## 
(## 
$str## ;
+##< =
oRatificacion##> K
.##K L

Id_Cliente##L V
)##V W
;##W X
string%% 
	respuesta%% 
=%% 
RatificacionData%% /
.%%/ 0
	Registrar%%0 9
(%%9 :
oRatificacion%%: G
)%%G H
;%%H I
JsonResponse'' 
json'' 
='' 
new''  #
JsonResponse''$ 0
(''0 1
)''1 2
;''2 3
HttpResponseMessage)) 
response))  (
=))) *
Request))+ 2
.))2 3
CreateResponse))3 A
())A B
)))B C
;))C D
if++ 
(++ 
	respuesta++ 
.++ 
Equals++  
(++  !
$str++! %
)++% &
)++& '
{,, 
json-- 
.-- 
name-- 
=-- 
$str--  
;--  !
json.. 
... 
status.. 
=.. 
$str.. #
;..# $
json// 
.// 
	timestamp// 
=//  
DateTime//! )
.//) *
Now//* -
.//- .
ToString//. 6
(//6 7
)//7 8
;//8 9
json00 
.00 
code00 
=00 
$str00 
;00 
json11 
.11 
resource11 
=11 
$str11  4
;114 5
json22 
.22 
message22 
=22 
$str22 !
;22! "
response44 
.44 

StatusCode44 #
=44$ %
HttpStatusCode44& 4
.444 5
OK445 7
;447 8
response55 
.55 
Content55  
=55! "
new55# &
StringContent55' 4
(554 5
new555 8 
JavaScriptSerializer559 M
(55M N
)55N O
.55O P
	Serialize55P Y
(55Y Z
json55Z ^
)55^ _
.55_ `
ToString55` h
(55h i
)55i j
,55j k
System55l r
.55r s
Text55s w
.55w x
Encoding	55x Ä
.
55Ä Å
UTF8
55Å Ö
,
55Ö Ü
$str
55á ô
)
55ô ö
;
55ö õ
}66 
else77 
{88 
json99 
.99 
name99 
=99 
$str99 #
;99# $
json:: 
.:: 
status:: 
=:: 
$str:: #
;::# $
json;; 
.;; 
	timestamp;; 
=;;  
DateTime;;! )
.;;) *
Now;;* -
.;;- .
ToString;;. 6
(;;6 7
);;7 8
;;;8 9
json<< 
.<< 
code<< 
=<< 
	respuesta<< %
.<<% &
Split<<& +
(<<+ ,
$char<<, /
)<</ 0
[<<0 1
$num<<1 2
]<<2 3
;<<3 4
json== 
.== 
resource== 
=== 
$str==  4
;==4 5
json>> 
.>> 
message>> 
=>> 
	respuesta>> (
.>>( )
Split>>) .
(>>. /
$char>>/ 2
)>>2 3
[>>3 4
$num>>4 5
]>>5 6
;>>6 7
response@@ 
.@@ 

StatusCode@@ #
=@@$ %
HttpStatusCode@@& 4
.@@4 5
NotFound@@5 =
;@@= >
responseAA 
.AA 
ContentAA  
=AA! "
newAA# &
StringContentAA' 4
(AA4 5
newAA5 8 
JavaScriptSerializerAA9 M
(AAM N
)AAN O
.AAO P
	SerializeAAP Y
(AAY Z
jsonAAZ ^
)AA^ _
.AA_ `
ToStringAA` h
(AAh i
)AAi j
,AAj k
SystemAAl r
.AAr s
TextAAs w
.AAw x
Encoding	AAx Ä
.
AAÄ Å
UTF8
AAÅ Ö
,
AAÖ Ü
$str
AAá ô
)
AAô ö
;
AAö õ
}BB 
returnDD 
responseDD 
;DD 
}EE 	
}GG 
}HH ∆
ZC:\Users\eduar\Documents\Proyectos_NET\ProyectoWebAPI\WebAPI\Controllers\TokenGenerator.cs
	namespace 	
WebAPI
 
. 
Controllers 
{ 
internal 
static 
class 
TokenGenerator (
{ 
public 
static 
string 
GenerateTokenJwt -
(- .
string. 4
username5 =
)= >
{ 	
Logger 
. 

EscribeLog 
( 
$str ,
), -
;- .
var 
	secretKey 
=  
ConfigurationManager 0
.0 1
AppSettings1 <
[< =
$str= M
]M N
;N O
var 
audienceToken 
=  
ConfigurationManager  4
.4 5
AppSettings5 @
[@ A
$strA U
]U V
;V W
var 
issuerToken 
=  
ConfigurationManager 2
.2 3
AppSettings3 >
[> ?
$str? Q
]Q R
;R S
var 

expireTime 
=  
ConfigurationManager 1
.1 2
AppSettings2 =
[= >
$str> R
]R S
;S T
var 
securityKey 
= 
new ! 
SymmetricSecurityKey" 6
(6 7
System7 =
.= >
Text> B
.B C
EncodingC K
.K L
DefaultL S
.S T
GetBytesT \
(\ ]
	secretKey] f
)f g
)g h
;h i
var 
signingCredentials "
=# $
new% (
SigningCredentials) ;
(; <
securityKey< G
,G H
SecurityAlgorithmsI [
.[ \
HmacSha256Signature\ o
)o p
;p q
ClaimsIdentity 
claimsIdentity )
=* +
new, /
ClaimsIdentity0 >
(> ?
new? B
[B C
]C D
{E F
newG J
ClaimK P
(P Q

ClaimTypesQ [
.[ \
Name\ `
,` a
usernameb j
)j k
}l m
)m n
;n o
var 
tokenHandler 
= 
new "
System# )
.) *
IdentityModel* 7
.7 8
Tokens8 >
.> ?
Jwt? B
.B C#
JwtSecurityTokenHandlerC Z
(Z [
)[ \
;\ ]
var   
jwtSecurityToken    
=  ! "
tokenHandler  # /
.  / 0"
CreateJwtSecurityToken  0 F
(  F G
audience!! 
:!! 
audienceToken!! '
,!!' (
issuer"" 
:"" 
issuerToken"" #
,""# $
subject## 
:## 
claimsIdentity## '
,##' (
	notBefore$$ 
:$$ 
DateTime$$ #
.$$# $
UtcNow$$$ *
,$$* +
expires%% 
:%% 
DateTime%% !
.%%! "
UtcNow%%" (
.%%( )

AddMinutes%%) 3
(%%3 4
Convert%%4 ;
.%%; <
ToInt32%%< C
(%%C D

expireTime%%D N
)%%N O
)%%O P
,%%P Q
signingCredentials&& "
:&&" #
signingCredentials&&$ 6
)&&6 7
;&&7 8
var(( 
jwtTokenString(( 
=((  
tokenHandler((! -
.((- .

WriteToken((. 8
(((8 9
jwtSecurityToken((9 I
)((I J
;((J K
return)) 
jwtTokenString)) !
;))! "
}** 	
}++ 
},, Ø
MC:\Users\eduar\Documents\Proyectos_NET\ProyectoWebAPI\WebAPI\Data\Conexion.cs
	namespace 	
WebAPI
 
. 
Data 
{ 
public		 

class		 
Conexion		 
{

 
public 
static 
string 
rutaConexion )
=* + 
ConfigurationManager, @
.@ A
ConnectionStringsA R
[R S
$strS l
]l m
.m n
ConnectionStringn ~
;~ 
} 
} º0
UC:\Users\eduar\Documents\Proyectos_NET\ProyectoWebAPI\WebAPI\Data\RatificacionData.cs
	namespace		 	
WebAPI		
 
.		 
Data		 
{

 
public 

class 
RatificacionData !
{ 
public 
static 
string 
	Registrar &
(& '
Ratificacion' 3
oRatificacion4 A
)A B
{ 	
using 
( 
SqlConnection  
	oConexion! *
=+ ,
new- 0
SqlConnection1 >
(> ?
Conexion? G
.G H
rutaConexionH T
)T U
)U V
{ 

SqlCommand 
cmd 
=  
new! $

SqlCommand% /
(/ 0
$str0 I
,I J
	oConexionK T
)T U
;U V
cmd 
. 
CommandType 
=  !
CommandType" -
.- .
StoredProcedure. =
;= >
cmd 
. 

Parameters 
. 
AddWithValue +
(+ ,
$str, 9
,9 :
oRatificacion; H
.H I

Id_ClienteI S
)S T
;T U
cmd 
. 

Parameters 
. 
AddWithValue +
(+ ,
$str, >
,> ?
oRatificacion@ M
.M N
Numero_ContactoN ]
)] ^
;^ _
cmd 
. 

Parameters 
. 
AddWithValue +
(+ ,
$str, D
,D E
oRatificacionF S
.S T!
Id_Seguro_RatificableT i
)i j
;j k
cmd 
. 

Parameters 
. 
AddWithValue +
(+ ,
$str, :
,: ;
oRatificacion< I
.I J
Tipo_MetodoJ U
)U V
;V W
try 
{ 
	oConexion 
. 
Open "
(" #
)# $
;$ %
cmd 
. 
ExecuteNonQuery '
(' (
)( )
;) *
return 
$str 
;  
} 
catch 
( 
	Exception  
ex! #
)# $
{   
string!! 
error!!  
=!!! "
ex!!# %
.!!% &
HResult!!& -
.!!- .
ToString!!. 6
(!!6 7
)!!7 8
+!!9 :
$str!!: ?
+!!? @
ex!!A C
.!!C D
Message!!D K
;!!K L
return"" 
error""  
;""  !
}## 
}$$ 
}%% 	
public'' 
static'' 
List'' 
<'' 
Ratificacion'' '
>''' (
Listar'') /
(''/ 0
)''0 1
{(( 	
List)) 
<)) 
Ratificacion)) 
>)) 
oListaRatificacion)) 1
=))2 3
new))4 7
List))8 <
<))< =
Ratificacion))= I
>))I J
())J K
)))K L
;))L M
using** 
(** 
SqlConnection**  
	oConexion**! *
=**+ ,
new**- 0
SqlConnection**1 >
(**> ?
Conexion**? G
.**G H
rutaConexion**H T
)**T U
)**U V
{++ 

SqlCommand,, 
cmd,, 
=,,  
new,,! $

SqlCommand,,% /
(,,/ 0
$str,,0 J
,,,J K
	oConexion,,L U
),,U V
;,,V W
cmd-- 
.-- 
CommandType-- 
=--  !
CommandType--" -
.--- .
StoredProcedure--. =
;--= >
try11 
{22 
	oConexion33 
.33 
Open33 "
(33" #
)33# $
;33$ %
cmd44 
.44 
ExecuteNonQuery44 '
(44' (
)44( )
;44) *
using88 
(88 
SqlDataReader88 (
dr88) +
=88, -
cmd88. 1
.881 2
ExecuteReader882 ?
(88? @
)88@ A
)88A B
{99 
while;; 
(;; 
dr;; !
.;;! "
Read;;" &
(;;& '
);;' (
);;( )
{<< 
oListaRatificacion== .
.==. /
Add==/ 2
(==2 3
new==3 6
Ratificacion==7 C
(==C D
)==D E
{>> 
Id??  "
=??# $
Convert??% ,
.??, -
ToInt32??- 4
(??4 5
dr??5 7
[??7 8
$str??8 <
]??< =
)??= >
,??> ?
Fecha_Registro@@  .
=@@/ 0
Convert@@1 8
.@@8 9

ToDateTime@@9 C
(@@C D
dr@@D F
[@@F G
$str@@G W
]@@W X
.@@X Y
ToString@@Y a
(@@a b
)@@b c
)@@c d
,@@d e

Id_ClienteAA  *
=AA+ ,
drAA- /
[AA/ 0
$strAA0 <
]AA< =
.AA= >
ToStringAA> F
(AAF G
)AAG H
,AAH I
Numero_ContactoBB  /
=BB0 1
drBB2 4
[BB4 5
$strBB5 F
]BBF G
.BBG H
ToStringBBH P
(BBP Q
)BBQ R
,BBR S!
Id_Seguro_RatificableCC  5
=CC6 7
drCC8 :
[CC: ;
$strCC; R
]CCR S
.CCS T
ToStringCCT \
(CC\ ]
)CC] ^
,CC^ _
Tipo_MetodoDD  +
=DD, -
drDD. 0
[DD0 1
$strDD1 >
]DD> ?
.DD? @
ToStringDD@ H
(DDH I
)DDI J
}FF 
)FF 
;FF 
}GG 
}KK 
}OO 
catchPP 
(PP 
	ExceptionPP  
exPP! #
)PP# $
{QQ 
}SS 
returnTT 
oListaRatificacionTT )
;TT) *
}UU 
}VV 	
}XX 
}YY ö
KC:\Users\eduar\Documents\Proyectos_NET\ProyectoWebAPI\WebAPI\Global.asax.cs
	namespace 	
WebAPI
 
{ 
public 

class 
WebApiApplication "
:# $
System% +
.+ ,
Web, /
./ 0
HttpApplication0 ?
{ 
	protected 
void 
Application_Start (
(( )
)) *
{ 	
GlobalConfiguration		 
.		  
	Configure		  )
(		) *
WebApiConfig		* 6
.		6 7
Register		7 ?
)		? @
;		@ A
}

 	
} 
} ö	
FC:\Users\eduar\Documents\Proyectos_NET\ProyectoWebAPI\WebAPI\Logger.cs
	namespace 	
WebAPI
 
{		 
public

 

static

 
class

 
Logger

 
{ 
public 
static 
void 

EscribeLog %
(& '
string' -
mensaje. 5
)5 6
{ 	
string 
logPath 
=  
ConfigurationManager 1
.1 2
AppSettings2 =
[= >
$str> G
]G H
;H I
using 
( 
StreamWriter 
writer %
=& '
new( +
StreamWriter, 8
(8 9
logPath9 @
,@ A
trueB F
)F G
)G H
{ 
writer 
. 
	WriteLine  
(  !
$"! #
{# $
DateTime$ ,
., -
Now- 0
}0 1
$str1 4
{4 5
mensaje5 <
}< =
"= >
)> ?
;? @
} 
} 	
} 
} ﬁ
SC:\Users\eduar\Documents\Proyectos_NET\ProyectoWebAPI\WebAPI\Models\JsonResponse.cs
	namespace 	
WebAPI
 
. 
Models 
{ 
public 

class 
JsonResponse 
{		 
public

 
string

 
name

 
;

 
public 
string 
status 
; 
public 
string 
	timestamp 
;  
public 
string 
code 
; 
public 
string 
resource 
; 
public 
string 
message 
; 
} 
} “
SC:\Users\eduar\Documents\Proyectos_NET\ProyectoWebAPI\WebAPI\Models\LoginRequest.cs
	namespace 	
WebAPI
 
. 
Models 
{ 
public 

class 
LoginRequest 
{		 
public

 
string

 
Username

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ⁄	
SC:\Users\eduar\Documents\Proyectos_NET\ProyectoWebAPI\WebAPI\Models\Ratificacion.cs
	namespace 	
WebAPI
 
. 
Models 
{ 
public 

class 
Ratificacion 
{		 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
DateTime 
Fecha_Registro &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 

Id_Cliente  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Numero_Contacto %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string !
Id_Seguro_Ratificable +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
string 
Tipo_Metodo !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} Ç
WC:\Users\eduar\Documents\Proyectos_NET\ProyectoWebAPI\WebAPI\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str !
)! "
]" #
[		 
assembly		 	
:			 

AssemblyDescription		 
(		 
$str		 !
)		! "
]		" #
[

 
assembly

 	
:

	 
!
AssemblyConfiguration

  
(

  !
$str

! #
)

# $
]

$ %
[ 
assembly 	
:	 

AssemblyCompany 
( 
$str 
) 
] 
[ 
assembly 	
:	 

AssemblyProduct 
( 
$str #
)# $
]$ %
[ 
assembly 	
:	 

AssemblyCopyright 
( 
$str 0
)0 1
]1 2
[ 
assembly 	
:	 

AssemblyTrademark 
( 
$str 
)  
]  !
[ 
assembly 	
:	 

AssemblyCulture 
( 
$str 
) 
] 
[ 
assembly 	
:	 


ComVisible 
( 
false 
) 
] 
[ 
assembly 	
:	 

Guid 
( 
$str 6
)6 7
]7 8
["" 
assembly"" 	
:""	 

AssemblyVersion"" 
("" 
$str"" $
)""$ %
]""% &
[## 
assembly## 	
:##	 

AssemblyFileVersion## 
(## 
$str## (
)##( )
]##) *