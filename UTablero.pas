unit UTablero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,BaseEnemiga,Soldado,Material,BaseControl, RefugioEnemigo,SoldadoEnemy,
  BomberEnemigo,Bomber,Refugio,Spy,SpyEnemigo, StdCtrls, Gauges, ExtCtrls, Qt,
  ExcelXP, OleServer, Menus, Trampa, Mercaderes, Robot, Guardian, GuardianEnemigo, Bomba,
  AntiBombas, Power, Tornado, ImgList;

 Const
  MMuestraComprasS     = WM_USER + 734;    // Soldado solicita Menú de compras
  MMuestraComprasB     = WM_USER + 704;    // Bomber  solicita Menú de compras
  MMuestraComprasE     = WM_USER + 757;    // Espia solicita Menú de compras
  MBloodToSoldier      = WM_USER + 665;    // Soldado compro sangre
  MBloodToBomber       = WM_USER + 607;    // Bomber compro sangre
  MBloodToEspia        = WM_USER + 680;    // Espia compro sangre
  MPongoBombaEqu       = WM_USER + 760;    // Bomber Coloca Bomba;
  MPongoAntiBombaEq    = WM_USER + 482;    // Bomber pone antibombas

  MEquComproRobot      = WM_USER + 600;     // Equipo compró un ROBOT
  MEquComproGuar       = WM_USER + 759;     // Equipo compró un GUARDIAN
  MEquComproBomba      = WM_USER + 280;     // Equipo compró un BOMBA
  MEquComproAntiBombas = WM_USER + 265;     // Equipo comprp un Anti-BOMBAS

  MExplote             = WM_USER + 685;     // Mensaje de Bomba
  MAutodestruccion     = WM_USER + 578;     // Mensaje de Anti para Autodestrucción

  MEquRecogeTargeta    = WM_USER + 639;     // Equipo recogió targeta de PODER

  MTornadoDestruyeme   = WM_USER + 635;     // Tornado pide ser destruido



type
  TTABLERO = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BloodSol: TGauge;
    BloodBom: TGauge;
    BloodEsp: TGauge;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BloodSolE: TGauge;
    BloodBomE: TGauge;
    BloodEspE: TGauge;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    BloodBase: TGauge;
    BloodBaseE: TGauge;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    BloodRef: TGauge;
    BloodRefE: TGauge;
    Label23: TLabel;
    Label24: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Timer1: TTimer;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    a: TImage;
    Image10: TImage;
    Panel2: TPanel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Image13: TImage;
    Image12: TImage;
    Image11: TImage;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    PausaBtn: TButton;
    Button1: TButton;
    Ordenes: TPopupMenu;
    SOLDADO1: TMenuItem;
    BOMBARDERO1: TMenuItem;
    ESPIA1: TMenuItem;
    IRPORMATERIAL1: TMenuItem;
    ATACAR1: TMenuItem;
    REFUGUARSE1: TMenuItem;
    MADERA11: TMenuItem;
    MADERA21: TMenuItem;
    PIEDRA11: TMenuItem;
    PIEDRA21: TMenuItem;
    METAL11: TMenuItem;
    METAL21: TMenuItem;
    CONMADERA1: TMenuItem;
    CONPIEDRA1: TMenuItem;
    CONMETAL1: TMenuItem;
    ASOLDADO1: TMenuItem;
    ABOMBARDERO1: TMenuItem;
    AESPIA1: TMenuItem;
    ASOLDADO2: TMenuItem;
    ABOMBARDERO2: TMenuItem;
    AESPIA2: TMenuItem;
    ASOLDADO3: TMenuItem;
    ABOMBARDERO3: TMenuItem;
    AESPIA3: TMenuItem;
    IRPORMATERIAL2: TMenuItem;
    ATACAR2: TMenuItem;
    CONSTRUIR1: TMenuItem;
    REFUGUARSE2: TMenuItem;
    MADERA12: TMenuItem;
    MADERA22: TMenuItem;
    PIEDRA12: TMenuItem;
    PIEDRA22: TMenuItem;
    METAL12: TMenuItem;
    METAL22: TMenuItem;
    CONMADERA2: TMenuItem;
    CONPIEDRA2: TMenuItem;
    CONMETAL2: TMenuItem;
    ASOLDADO4: TMenuItem;
    ABOMBARDERO4: TMenuItem;
    AESPIA4: TMenuItem;
    ASOLDADO5: TMenuItem;
    ABOMBARDERO5: TMenuItem;
    AESPIA5: TMenuItem;
    ASOLDADO6: TMenuItem;
    ABOMBARDERO6: TMenuItem;
    AESPIA6: TMenuItem;
    CONMADERA3: TMenuItem;
    CONPIEDRA3: TMenuItem;
    CONMETAL3: TMenuItem;
    IRPORMATERIAL3: TMenuItem;
    ATACAR3: TMenuItem;
    CONSTRUIR2: TMenuItem;
    REFUGIARSE1: TMenuItem;
    MADERA13: TMenuItem;
    MADERA23: TMenuItem;
    PIEDRA13: TMenuItem;
    PIEDRA23: TMenuItem;
    METAL13: TMenuItem;
    METAL23: TMenuItem;
    CONMADERA4: TMenuItem;
    CONPIEDRA4: TMenuItem;
    CONMETAL4: TMenuItem;
    ASOLDADO7: TMenuItem;
    ABOMBARDERO7: TMenuItem;
    AESPIA7: TMenuItem;
    ASOLDADO8: TMenuItem;
    ABOMBARDERO8: TMenuItem;
    AESPIA8: TMenuItem;
    ASOLDADO9: TMenuItem;
    ABOMBARDERO9: TMenuItem;
    AESPIA9: TMenuItem;
    CONMADERAL1: TMenuItem;
    CONPIEDRA5: TMenuItem;
    CONMETAL5: TMenuItem;
    DESPLAZARSE1: TMenuItem;
    DESPLAZARSE2: TMenuItem;
    DESPLAZARSE3: TMenuItem;
    ESTRATEGIA1: TMenuItem;
    COLOCARREFUGIO1: TMenuItem;
    COLOCARTRAMPA1: TMenuItem;
    PlayMode: TRadioGroup;
    a1: TMenuItem;
    AREFUGIO1: TMenuItem;
    ABASE1: TMenuItem;
    AREFUGIO2: TMenuItem;
    ABASE2: TMenuItem;
    AREFUGIO3: TMenuItem;
    ABASE3: TMenuItem;
    AREFUGIO4: TMenuItem;
    ABASE4: TMenuItem;
    AREFUGIO5: TMenuItem;
    ABASE5: TMenuItem;
    AREFUGIO6: TMenuItem;
    ABASE6: TMenuItem;
    AREFUGIO7: TMenuItem;
    ABASE7: TMenuItem;
    AREFUGIO8: TMenuItem;
    ABASE8: TMenuItem;
    AREFUGIO9: TMenuItem;
    COMPRAR1: TMenuItem;
    COMPRAR2: TMenuItem;
    COMPRAR3: TMenuItem;
    ROBOT1: TMenuItem;
    CONFIGURAR1: TMenuItem;
    IRPORMADERA11: TMenuItem;
    IRPORMADERA21: TMenuItem;
    IRPORMETAL11: TMenuItem;
    IRPORMETAL21: TMenuItem;
    IRPORPIEDRA11: TMenuItem;
    IRPORPIEDRA21: TMenuItem;
    GUARDIANES1: TMenuItem;
    N11: TMenuItem;
    N21: TMenuItem;
    CONFIGURAR2: TMenuItem;
    CONFIGURAR3: TMenuItem;
    SUR1: TMenuItem;
    ESTE1: TMenuItem;
    SUR2: TMenuItem;
    ESTE2: TMenuItem;
    BOMBARDEAR1: TMenuItem;
    DESACTIVABOMBA1: TMenuItem;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    IRPORTARGETA1: TMenuItem;
    IRPORTARGETA2: TMenuItem;
    MenuCompras: TPopupMenu;
    ROBOT2: TMenuItem;
    INVISIBILIDAD1: TMenuItem;
    SANGRE1: TMenuItem;
    BOMBA1: TMenuItem;
    ANTIBOMBAS1: TMenuItem;
    VIGILANTE1: TMenuItem;
    ImageList1: TImageList;
    ImageList2: TImageList;
    Cursor: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PausaBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DESPLAZARSE1Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure DESPLAZARSE2Click(Sender: TObject);
    procedure DESPLAZARSE3Click(Sender: TObject);
    procedure MADERA11Click(Sender: TObject);
    procedure MADERA21Click(Sender: TObject);
    procedure PIEDRA11Click(Sender: TObject);
    procedure PIEDRA21Click(Sender: TObject);
    procedure METAL11Click(Sender: TObject);
    procedure METAL21Click(Sender: TObject);
    procedure MADERA12Click(Sender: TObject);
    procedure MADERA22Click(Sender: TObject);
    procedure PIEDRA12Click(Sender: TObject);
    procedure PIEDRA22Click(Sender: TObject);
    procedure METAL12Click(Sender: TObject);
    procedure METAL22Click(Sender: TObject);
    procedure MADERA13Click(Sender: TObject);
    procedure MADERA23Click(Sender: TObject);
    procedure PIEDRA13Click(Sender: TObject);
    procedure PIEDRA23Click(Sender: TObject);
    procedure METAL13Click(Sender: TObject);
    procedure METAL23Click(Sender: TObject);
    procedure COLOCARREFUGIO1Click(Sender: TObject);
    procedure CONMADERA3Click(Sender: TObject);
    procedure CONPIEDRA3Click(Sender: TObject);
    procedure CONMETAL3Click(Sender: TObject);
    procedure COLOCARTRAMPA1Click(Sender: TObject);
    procedure PlayModeClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure ASOLDADO1Click(Sender: TObject);
    procedure ABOMBARDERO1Click(Sender: TObject);
    procedure AESPIA1Click(Sender: TObject);
    procedure ASOLDADO2Click(Sender: TObject);
    procedure ABOMBARDERO2Click(Sender: TObject);
    procedure AESPIA2Click(Sender: TObject);
    procedure ASOLDADO3Click(Sender: TObject);
    procedure ABOMBARDERO3Click(Sender: TObject);
    procedure AESPIA3Click(Sender: TObject);
    procedure ASOLDADO4Click(Sender: TObject);
    procedure ABOMBARDERO4Click(Sender: TObject);
    procedure AESPIA4Click(Sender: TObject);
    procedure ASOLDADO5Click(Sender: TObject);
    procedure ABOMBARDERO5Click(Sender: TObject);
    procedure AESPIA5Click(Sender: TObject);
    procedure ASOLDADO6Click(Sender: TObject);
    procedure ABOMBARDERO6Click(Sender: TObject);
    procedure AESPIA6Click(Sender: TObject);
    procedure a1Click(Sender: TObject);
    procedure AREFUGIO1Click(Sender: TObject);
    procedure ABASE1Click(Sender: TObject);
    procedure AREFUGIO2Click(Sender: TObject);
    procedure ABASE2Click(Sender: TObject);
    procedure AREFUGIO3Click(Sender: TObject);
    procedure ABASE3Click(Sender: TObject);
    procedure AREFUGIO4Click(Sender: TObject);
    procedure ABASE4Click(Sender: TObject);
    procedure AREFUGIO5Click(Sender: TObject);
    procedure ABASE5Click(Sender: TObject);
    procedure AREFUGIO6Click(Sender: TObject);
    procedure ASOLDADO7Click(Sender: TObject);
    procedure ABOMBARDERO7Click(Sender: TObject);
    procedure AESPIA7Click(Sender: TObject);
    procedure ABASE6Click(Sender: TObject);
    procedure AREFUGIO7Click(Sender: TObject);
    procedure ASOLDADO8Click(Sender: TObject);
    procedure ABOMBARDERO8Click(Sender: TObject);
    procedure AESPIA8Click(Sender: TObject);
    procedure ABASE7Click(Sender: TObject);
    procedure AREFUGIO8Click(Sender: TObject);
    procedure ASOLDADO9Click(Sender: TObject);
    procedure ABOMBARDERO9Click(Sender: TObject);
    procedure AESPIA9Click(Sender: TObject);
    procedure ABASE8Click(Sender: TObject);
    procedure AREFUGIO9Click(Sender: TObject);
    procedure COMPRAR2Click(Sender: TObject);
    procedure COMPRAR1Click(Sender: TObject);
    procedure COMPRAR3Click(Sender: TObject);
    procedure IRPORMADERA11Click(Sender: TObject);
    procedure IRPORMADERA21Click(Sender: TObject);
    procedure IRPORMETAL11Click(Sender: TObject);
    procedure IRPORMETAL21Click(Sender: TObject);
    procedure IRPORPIEDRA11Click(Sender: TObject);
    procedure IRPORPIEDRA21Click(Sender: TObject);
    procedure SUR1Click(Sender: TObject);
    procedure ESTE1Click(Sender: TObject);
    procedure SUR2Click(Sender: TObject);
    procedure ESTE2Click(Sender: TObject);
    procedure BOMBARDEAR1Click(Sender: TObject);
    procedure DESACTIVABOMBA1Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure IRPORTARGETA1Click(Sender: TObject);
    procedure IRPORTARGETA2Click(Sender: TObject);
    procedure ROBOT2Click(Sender: TObject);
    procedure VIGILANTE1Click(Sender: TObject);
    procedure BOMBA1Click(Sender: TObject);
    procedure SANGRE1Click(Sender: TObject);
    procedure ANTIBOMBAS1Click(Sender: TObject);

  private
    BaseE   : TBaseEnemiga;
    Soldado : TSoldado;
    SolEne  : TSoldadoEnemy;
    BomEne  : TBomberEnemigo;
    Bom     : TBomber;
    Mad1    : TMaterial;
    Mad2    : TMaterial;
    Met1    : TMaterial;
    Met2    : TMaterial;
    Pie1    : TMaterial;
    Pie2    : TMaterial;
    Base    : TBaseControl;
    Ref     : TRefugio;
    Spy     : TSpy;
    SpyEne  : TSpyEnemigo;
    Trampa  : TTrampa;
    Mercado : TMercaderes;
    Robot   : TRobot;
    Guardian1  : TGuardian;
    Guardian2  : TGuardian;
    GEne1      : TGuardianEnemigo;
    Gene2      : TGuardianEnemigo;
    Bomba      : TBomba;
    Anti       : TAntiBombas;
    Power      : TPower;
    Tornado    : TTornado;
    procedure MuestraComprasS     (var Msg : TMessage); message MMuestraComprasS;
    procedure MuestraComprasB     (var Msg : TMessage); message MMuestraComprasB;
    procedure MuestraComprasE     (var Msg : TMessage); message MMuestraComprasE;
    procedure BloodToSoldier      (var Msg : TMessage); message MBloodToSoldier;
    procedure BloodToBomber       (var Msg : TMessage); message MBloodToBomber;
    procedure BloodToEspia        (var Msg : TMessage); message MBloodToEspia;
    procedure EquComproRobot      (var Msg : TMessage); message MEquComproRobot;
    procedure EquComproGuar       (var Msg : TMessage); message MEquComproGuar;
    procedure EquComproBomba      (var Msg : TMessage); message MEquComproBomba;
    procedure EquComproAntiBombas (var Msg : TMessage); message MEquComproAntiBombas;
    procedure Explote             (var Msg : TMessage); message MExplote;
    procedure PongoBombaEqu       (var Msg : TMessage); message MPongoBombaEqu;
    procedure PongoAntiBombaEq    (var Msg : TMessage); message MPongoAntiBombaEq;
    procedure Atodestruccion      (var Msg : TMessage); message MAutodestruccion;
    procedure EquRecogeTargeta    (var Msg : TMessage); message MEquRecogeTargeta;
    procedure TornadoDestruyeme   (var Msg : TMessage); message MTornadoDestruyeme;

 public

  end;

var
  TABLERO: TTABLERO;
  Sol_cambio        : boolean;
  Bom_cambio        : boolean;
  Esp_cambio        : boolean;
  ANTES             : array[1..6,1..3] of string;
  DESPUES           : array[1..6,1..3] of string;
  veces             : integer;
  historial         : textFile;
  Direct            : string;
  AuxFile           : TextFile;
  desplazoSol       : boolean;
  desplazoBom       : boolean;
  desplazoEsp       : Boolean;
  desplazoSolE      : boolean;
  desplazoBomE      : boolean;
  desplazoEspE      : Boolean;
  locaTrampa        : Boolean;
  CreaRef           : Boolean;
  ExisteRef         : Boolean;
  ExisteRefE        : Boolean;
  MODO              : Boolean;  //falso = Usuarios; true: IA
  EquAzul           : boolean;
  EquRojo           : Boolean;
  Eq_EqE            : Boolean;
  MaderaTotalEqu    : integer;
  MetalTotalEqu     : integer;
  PiedraTotalEqu    : Integer;
  BombardearEqu     : Boolean;
  DesactivarEqu     : Boolean;
  carta             : Boolean;
  Torna             : Boolean;
  segundos          : integer;

  Guardianes        : integer;  // maximo 2 guardianes por equipo
  Bombas            : Integer;
  AntiBombas        : Integer;

  {variables de prueba}
  BombNow           : Boolean;
  AntiNow           : Boolean;


implementation

uses UContextos, UEjecutaInstrucciones, UEngagement, UReflection, UAtomos,
  UOrdendes, UCompras;

{$R *.dfm}



{=========================================================================== crea personajes}
procedure TTABLERO.FormCreate(Sender: TObject);
begin

  KeyPreview := True;

  MODO       := false;  // modo usuarios por default;
  Guardianes := 0;
  Bombas     := 0;
  AntiBombas := 0;
  carta := false;

 { Anti := TAntiBombas.Create(Self);
  Anti.Parent := Self;
  Anti.Left := 10;
  Anti.Top := 10;  }



 {

  GEne := TGuardianEnemigo.Create(Self);
  GEne.Parent := self;
  Gene.Left := 500;
  GEne.Top  := 500;
  GEne.Orientacion := 'Norte'; }

  



  {-------------------------------------- EQUIPO}
  Base            := TBaseControl.Create(Self);
  Base.Parent     := Self;
  Base.Name       := 'Base';
  Base.Left       := 40;
  Base.Top        := 55;
  Base.MaderaAlmacenada := 40;
  Base.MetalAlmacenado  := 40;
  Base.PiedraAlmacenada := 40;
  Base.Cursor := crNo;

  Trampa          := TTrampa.create(Self);
  Trampa.Parent   := Self;
  Trampa.Left     := 70;
  Trampa.Top      := 80;
  Trampa.Cursor   := crNo;

  Soldado         := TSoldado.Create(Self);
  Soldado.Parent  := Self;
  Soldado.Name    := 'Soldado';
  Soldado.Left    := 40;
  Soldado.Top     := 35;
  Soldado.Cursor  := crNo;

  Bom             := TBomber.Create(Self);
  Bom.Parent      := Self;
  Bom.Name        := 'Bom';
  Bom.Left        := 55;
  Bom.Top         := 35;
  Bom.Cursor      := crNo;


  Spy             := TSpy.Create(Self);
  SPy.Parent      := Self;
  SPy.Left        := 70;
  Spy.Name        := 'Spy';
  SPy.Top         := 35;
  Spy.Cursor      := crNo;

  {-------------------------------------- EQUIPO ENEMIGO}
  BaseE           := TBaseEnemiga.Create(Self);
  BaseE.Parent    := Self;
  BaseE.Name      := 'BaseE';
  BaseE.Left      := 650;
  BaseE.Top       := 500;
  BaseE.Cursor    := crNo;

  SolEne          := TSoldadoEnemy.Create(Self);
  SolEne.Parent   := Self;
  SolEne.Name     := 'SolEne';
  SolEne.Left     := 650;
  SolEne.Top      := 475;
  SolEne.Cursor   := crNo;


  BomEne          := TBomberEnemigo.Create(Self);
  BomEne.Parent   := Self;
  BomEne.Name     := 'BomEne';
  BomEne.Left     := 665;
  BomEne.Top      := 475;
  BomEne.Cursor   := crNo;


  SpyEne          := TSpyEnemigo.Create(Self);
  SpyEne.Parent   := Self;
  SpyEne.Name     := 'SpyEne';
  SpyEne.Left     := 680;
  SpyEne.Top      := 475;
  SpyEne.Cursor   := crNo;

  {------------------------------------------------MATERIALES}
  Mad1 := TMaterial.Create(Self);;
  Mad1.Parent := Self;
  Mad1.Name := 'Madera1';
  Mad1.Left := 740;
  Mad1.Top := 110;
  Mad1.Cursor := crNo;


  Mad2 := TMaterial.Create(Self);;
  Mad2.Parent := Self;
  Mad2.Name := 'Madera2';
  Mad2.Left := 100;
  Mad2.Top := 270;
  Mad2.Cursor := crNo;


  Met1 := TMaterial.Create(Self);;
  Met1.Parent := Self;
  Met1.Name := 'Metal1';
  Met1.Left := 730;
  Met1.Top := 310;
  Met1.Cursor := crNo;


  Met2 := TMaterial.Create(Self);;
  Met2.Parent := Self;
  Met2.Name := 'Metal2';
  Met2.Left := 65;
  Met2.Top := 430;
  Met2.Cursor := crNo;


  Pie1 := TMaterial.Create(Self);;
  Pie1.Parent := Self;
  Pie1.Name := 'Piedra1';
  Pie1.Left := 460;
  Pie1.Top := 55;
  Pie1.Cursor := crNo;


  Pie2 := TMaterial.Create(Self);;
  Pie2.Parent := Self;
  Pie2.Name := 'Piedra2';
  Pie2.Left := 335;
  Pie2.Top  := 415;
  Pie2.Cursor := crNo;

  Mercado := TMercaderes.Create(Self);
  Mercado.Parent := Self;
  Mercado.Left   := 700;
  Mercado.Top    := 20;
  Mercado.Cursor := crNo;



end;

{============================================================= CONTEXTOS INICIALES}
procedure contextos_iniciales;
begin
  context_sol.Haciendo    := 'ESPERANDO_ORDEN';
  context_sol.Victima     := '';
  context_sol.Resistencia := 40;
  context_sol.Amenazado   := 'no';
  context_sol.P_Equipo    := 0;
  context_sol.P_ToBomber  := 0;
  context_sol.P_ToEsp     := 0;
  context_sol.Odio_Ene    := 0;
  context_sol.Od_ToSolEne := 0;
  context_sol.Od_ToBomEne := 0;
  context_sol.SegInRisk   := 0;
  context_sol.LifeInRisk  := 0;

  context_solE.Haciendo    := 'ESPERANDO_ORDEN';
  context_solE.Victima     := '';
  context_solE.Resistencia := 40;
  context_solE.Amenazado   := 'no';
  context_solE.P_Equipo    := 0;
  context_solE.P_ToBomber  := 0;
  context_solE.P_ToEsp     := 0;
  context_solE.Odio_Ene    := 0;
  context_solE.Od_ToSolEne := 0;
  context_solE.Od_ToBomEne := 0;
  context_solE.SegInRisk   := 0;
  context_solE.LifeInRisk  := 0;

  context_BOM.Haciendo    := 'ESPERANDO_ORDEN';
  context_BOM.Victima     := '';
  context_BOM.Resistencia := 40;
  context_BOM.Amenazado   := 'no';
  context_BOM.P_Equipo    := 0;
  context_BOM.P_ToSoldado := 0;
  context_BOM.P_ToEsp     := 0;
  context_BOM.Odio_Ene    := 0;
  context_BOM.Od_ToSolEne := 0;
  context_BOM.Od_ToBomEne := 0;
  context_BOM.SegInRisk   := 0;
  context_BOM.LifeInRisk  := 0;

  context_BOME.Haciendo    := 'ESPERANDO_ORDEN';
  context_BOME.Victima     := '';
  context_BOME.Resistencia := 40;
  context_BOME.Amenazado   := 'no';
  context_BOME.P_Equipo    := 0;
  context_BOME.P_ToSoldado := 0;
  context_BOME.P_ToEsp     := 0;
  context_BOME.Odio_Ene    := 0;
  context_BOME.Od_ToSolEne := 0;
  context_BOME.Od_ToBomEne := 0;
  context_BOME.SegInRisk   := 0;
  context_BOME.LifeInRisk  := 0;

  context_ESP.Haciendo    := 'ESPERANDO_ORDEN';
  context_ESP.Victima     := '';
  context_ESP.Resistencia := 40;
  context_ESP.Amenazado   := 'no';
  context_ESP.P_Equipo    := 0;
  context_ESP.P_ToBomber  := 0;
  context_ESP.P_ToSoldado := 0;
  context_ESP.Odio_Ene    := 0;
  context_ESP.Od_ToSolEne := 0;
  context_ESP.Od_ToBomEne := 0;
  context_ESP.SegInRisk   := 0;
  context_ESP.LifeInRisk  := 0;

  context_ESPE.Haciendo    := 'ESPERANDO_ORDEN';
  context_ESPE.Victima     := '';
  context_ESPE.Resistencia := 40;
  context_ESPE.Amenazado   := 'no';
  context_ESPE.P_Equipo    := 0;
  context_ESPE.P_ToBomber  := 0;
  context_ESPE.P_ToSoldado := 0;
  context_ESPE.Odio_Ene    := 0;
  context_ESPE.Od_ToSolEne := 0;
  context_ESPE.Od_ToBomEne := 0;
  context_ESPE.SegInRisk   := 0;
  context_ESPE.LifeInRisk  := 0;

  context_base.Resistencia       := 40;
  context_base.MaderaAlmacenada  := 0;
  context_base.PiedraAlmacenada  := 0;
  context_base.MetalAlmacenado   := 0;
  context_base.SegInRisk         := 0;

  context_baseE.Resistencia       := 40;
  context_baseE.MaderaAlmacenada  := 0;
  context_baseE.PiedraAlmacenada  := 0;
  context_baseE.MetalAlmacenado   := 0;
  context_baseE.SegInRisk         := 0;

  context_ref.Resistencia         := 0;
  context_ref.MaderaAlmacenada    := 0;
  context_ref.PiedraAlmacenada    := 0;
  context_ref.MetalAlmacenado     := 0;
  context_ref.SegInRisk           := 0;

  context_refE.Resistencia         := 0;
  context_refE.MaderaAlmacenada    := 0;
  context_refE.PiedraAlmacenada    := 0;
  context_refE.MetalAlmacenado     := 0;
  context_refE.SegInRisk           := 0;
end;

procedure lee_instrucciones;
var
 accion,a_quien : string;
 lin1,lin2,lin3 : string;
begin
 {soldado- enemigo}
 accion := PLAN_ESTRATEGIA[1,2];
 a_quien := PLAN_ESTRATEGIA[1,3];
 lin1 := '1.- ' + PLAN_ESTRATEGIA[1,1] + ': ' + accion + ' a quien: ' + a_quien;

 if pos('IR_POR_MADERA1',accion) > 0 then
   begin
      Tablero.SolEne.IrMaterial('Madera1');
      IR_POR_MADERA1('SOLDADO_ENEMIGO');
   end;
 if pos('IR_POR_MADERA2',accion) > 0 then
   begin
      Tablero.SolEne.IrMaterial('Madera2');
      IR_POR_MADERA2('SOLDADO_ENEMIGO');
   end;
 if pos('IR_POR_PIEDRA1',accion) > 0 then
   begin
      Tablero.SolEne.IrMaterial('Piedra1');
      IR_POR_MADERA1('SOLDADO_ENEMIGO');
   end;
 if pos('IR_POR_PIEDRA2',accion) > 0 then
  begin
     Tablero.SolEne.IrMaterial('Piedra2');
     IR_POR_PIEDRA2('SOLDADO_ENEMIGO');
  end;
 if pos('IR_POR_METAL1',accion)  > 0 then
   begin
      Tablero.SolEne.IrMaterial('Metal1');
      IR_POR_METAL1('SOLDADO_ENEMIGO');
   end;
 if pos('IR_POR_METAL2',accion)  > 0 then
   begin
      Tablero.SolEne.IrMaterial('Metal2');
      IR_POR_METAL2('SOLDADO_ENEMIGO');
   end;
 if pos('ATACAR_CON_MADERA',accion) > 0 then
   begin
      Tablero.SolEne.Atacar(a_quien,'Madera');
      ATACAR_CON_MADERA('SOLDADO_ENEMIGO',a_quien);
   end;
 if pos('ATACAR_CON_PIEDRA',accion) > 0 then
   begin
      Tablero.SolEne.Atacar(a_quien,'Piedra');
      ATACAR_CON_PIEDRA('SOLDADO_ENEMIGO',a_quien);
   end;
 if pos('ATACAR_CON_METAL',accion)  > 0 then
   begin
      Tablero.SolEne.Atacar(a_quien,'Metal');
      ATACAR_CON_METAL('SOLDADO_ENEMIGO',a_quien);
   end;
 if pos('REFUGIARSE',accion) > 0 then
   begin
      Tablero.SolEne.Refugiarse;
      REFUGIARSE('SOLDADO_ENEMIGO');
   end;
 {bomber-enemigo}
 accion  := PLAN_ESTRATEGIA[2,2];
 a_quien := PLAN_ESTRATEGIA[2,3];
 lin2 := '2.- ' + PLAN_ESTRATEGIA[2,1] + ': ' + accion + ' a quien: ' + a_quien;
 if pos('IR_POR_MADERA1',accion) > 0 then
   begin
      Tablero.bomEne.IrMaterial('Madera1');
      IR_POR_MADERA1('BOMBER_ENEMIGO');
   end;
 if pos('IR_POR_MADERA2',accion) > 0 then
   begin
      Tablero.bomEne.IrMaterial('Madera2');
      IR_POR_MADERA2('BOMBER_ENEMIGO');
   end;
 if pos('IR_POR_PIEDRA1',accion) > 0 then
   begin
      Tablero.bomEne.IrMaterial('Piedra1');
      IR_POR_PIEDRA1('BOMBER_ENEMIGO');
   end;
 if pos('IR_POR_PIEDRA2',accion) > 0 then
   begin
      Tablero.bomEne.IrMaterial('Piedra2');
      IR_POR_PIEDRA2('BOMBER_ENEMIGO');
   end;
 if pos('IR_POR_METAL1',accion)  > 0 then
   begin
      Tablero.bomEne.IrMaterial('Metal1');
      IR_POR_METAL1('BOMBER_ENEMIGO');
   end;
 if pos('IR_POR_METAL2',accion)  > 0 then
  begin
     Tablero.bomEne.IrMaterial('Metal2');
     IR_POR_METAL2('BOMBER_ENEMIGO');
  end;
 if pos('ATACAR_CON_MADERA',accion) > 0 then
   begin
      Tablero.bomEne.Atacar(a_quien,'Madera');
      ATACAR_CON_MADERA('BOMBER_ENEMIGO',a_quien);
   end;
 if pos('ATACAR_CON_PIEDRA',accion) > 0 then
   begin
      Tablero.bomEne.Atacar(a_quien,'Piedra');
      ATACAR_CON_PIEDRA('BOMBER_ENEMIGO',a_quien);
   end;
 if pos('ATACAR_CON_METAL',accion)  > 0 then
   begin
      Tablero.bomEne.Atacar(a_quien,'Metal');
      ATACAR_CON_METAL('BOMBER_ENEMIGO',a_quien);
   end;
 if pos('CONSTRUIR_CON_MADERA',accion)  > 0  then
   begin
      Tablero.BomEne.Construir('Madera');
      CONSTRUIR_CON_MADERA('BOMBER_ENEMIGO');
   end;
 if pos('CONSTRUIR_CON_PIEDRA',accion)  > 0  then
   begin
      Tablero.BomEne.Construir('Piedra');
      CONSTRUIR_CON_PIEDRA('BOMBER_ENEMIGO');
   end;
 if pos('CONSTRUIR_CON_METAL',accion)  > 0  then
   begin
      Tablero.BomEne.Construir('Metal');
      CONSTRUIR_CON_METAL('BOMBER_ENEMIGO');
   end;
 if pos('REFUGIARSE',accion) > 0 then
   begin
      Tablero.bomEne.Refugiarse;
      REFUGIARSE('BOMBER_ENEMIGO');
   end;
 {espia enemigo}
 accion  := PLAN_ESTRATEGIA[3,2];
 a_quien := PLAN_ESTRATEGIA[3,3];
 lin3 := '3.- '+ PLAN_ESTRATEGIA[3,1] + ': ' + accion + ' a quien: ' + a_quien;
 if pos('IR_POR_MADERA1',accion) > 0 then
   begin
      Tablero.SpyEne.IrMaterial('Madera1');
      IR_POR_MADERA1('ESPIA_ENEMIGO');
   end;
 if pos('IR_POR_MADERA2',accion) > 0 then
   begin
      Tablero.SpyEne.IrMaterial('Madera2');
      IR_POR_MADERA2('ESPIA_ENEMIGO');
   end;
 if pos('IR_POR_PIEDRA1',accion) > 0 then
   begin
      Tablero.SpyEne.IrMaterial('Piedra1');
      IR_POR_PIEDRA1('ESPIA_ENEMIGO');
   end;
 if pos('IR_POR_PIEDRA2',accion) > 0 then
   begin
      Tablero.SpyEne.IrMaterial('Piedra2');
      IR_POR_PIEDRA2('ESPIA_ENEMIGO');
   end;
 if pos('IR_POR_METAL1',accion)  > 0 then
   begin
      Tablero.SpyEne.IrMaterial('Metal1');
      IR_POR_METAL1('ESPIA_ENEMIGO');
   end;
 if pos('IR_POR_METAL2',accion)  > 0 then
  begin
     Tablero.SpyEne.IrMaterial('Metal2');
     IR_POR_METAL2('ESPIA_ENEMIGO');
  end;
 if pos('ATACAR_CON_MADERA',accion) > 0 then
   begin
      Tablero.SpyEne.Atacar(a_quien,'Madera');
      ATACAR_CON_MADERA('ESPIA_ENEMIGO',a_quien);
   end;
 if pos('ATACAR_CON_PIEDRA',accion) > 0 then
   begin
      Tablero.SpyEne.Atacar(a_quien,'Piedra');
      ATACAR_CON_PIEDRA('ESPIA_ENEMIGO',a_quien);
   end;
 if pos('ATACAR_CON_METAL',accion)  > 0 then
   begin
      Tablero.SpyEne.Atacar(a_quien,'Metal');
      ATACAR_CON_METAL('ESPIA_ENEMIGO',a_quien);
   end;
 if pos('CONSTRUIR_CON_MADERA',accion)  > 0  then
   begin
      Tablero.SpyEne.Construir('Refugio enemigo','Madera');
      CONSTRUIR_CON_MADERA('ESPIA_ENEMIGO');
   end;
 if pos('CONSTRUIR_CON_PIEDRA',accion)  > 0  then
   begin
      Tablero.SpyEne.Construir('Refugio enemigo','Piedra');
      CONSTRUIR_CON_PIEDRA('ESPIA_ENEMIGO');
   end;
 if pos('CONSTRUIR_CON_METAL',accion)  > 0  then
   begin
      Tablero.SpyEne.Construir('Refugio enemigo','Metal');
      CONSTRUIR_CON_METAL('ESPIA_ENEMIGO');
   end;
 if pos('REFUGIARSE',accion) > 0 then
   begin
      Tablero.SpyEne.Refugiarse;
      REFUGIARSE('ESPIA_ENEMIGO');
   end;
 {Tablero.Memo1.Lines.Clear;
 Tablero.Memo1.Lines.Add(lin1);
 Tablero.Memo1.Lines.Add(lin2);
 Tablero.Memo1.Lines.Add(lin3); }
end;

{====================================================== actualiza el estado inicial}
procedure TTABLERO.FormShow(Sender: TObject);
begin
 MODO               := False;  // inicia el el modo Usuarios  
 BloodSol.MaxValue  := Soldado.Resistencia;
 BloodSol.Progress  := Soldado.Resistencia;
 BloodBom.MaxValue  := Bom.Resistencia;
 BloodBom.Progress  := Bom.Resistencia;
 BloodEsp.MaxValue  := Spy.Resistencia;
 BloodEsp.Progress  := Spy.Resistencia;
 BloodBase.MaxValue := Base.Resistencia;
 BloodBase.Progress := Base.Resistencia;
// BloodREF.MaxValue  := 40;
// BloodRef.Progress  := Ref.Resistencia;

 BloodSolE.MaxValue  := SolEne.Resistencia;
 BloodSolE.Progress  := SolEne.Resistencia;
 BloodBomE.MaxValue  := BomEne.Resistencia;
 BloodBomE.Progress  := BomEne.Resistencia;
 BloodEspE.MaxValue  := SpyEne.Resistencia;
 BloodEspE.Progress  := SpyEne.Resistencia;
 BloodBaseE.MaxValue := BaseE.Resistencia;
 BloodBaseE.Progress := BaseE.Resistencia;
// BloodRefE.MaxValue  := 40;
// BloodRefE.Progress  := RefE.Resistencia;

 sol_cambio := true;
 bom_cambio := true;
 esp_cambio := true;
 crea_atomos;
 contextos_iniciales;

 veces := 0;
 Direct := GetCurrentDir;
 AssignFile(historial,Direct + '\DEF\HISTORIAL.txt');
 rewrite(historial);

 ExisteRef          := false;
 ExisteRefE         := false;
 CreaRef            := false;
 //ENGAGEMENT;
 //REFLECTION;
 //lee_instrucciones;

end;


{========================================================================= actualiza los contextos}
procedure ActualizaContextos;
begin
  {lanza tensiones}
 {BASE}
 if (Tablero.Base.Resistencia > 0)  and (Tablero.base.Resistencia <= 20) then context_base.LifeInRisk := 1;
 if (Tablero.base.Resistencia > 20) and (Tablero.base.Resistencia <= 40) then context_base.LifeInRisk := 0;

 if (Tablero.Base.MaderaAlmacenada > 0)  and (Tablero.Base.MaderaAlmacenada <= 4)  then context_base.Nece_Madera := 3;
 if (Tablero.Base.MaderaAlmacenada > 4)  and (Tablero.Base.MaderaAlmacenada <= 10) then context_base.Nece_Madera := 2;
 if (Tablero.Base.MaderaAlmacenada > 10) and (Tablero.Base.MaderaAlmacenada <= 15) then context_base.Nece_Madera := 1;
 if (Tablero.Base.MaderaAlmacenada > 15) then context_base.Nece_Madera := 0;

 if (Tablero.Base.PiedraAlmacenada > 0) and (Tablero.Base.PiedraAlmacenada <= 4)  then context_base.Nece_Piedra := 3;
 if (Tablero.Base.PiedraAlmacenada > 4) and (Tablero.Base.PiedraAlmacenada <= 10) then context_base.Nece_Piedra := 2;
 if (Tablero.Base.PiedraAlmacenada > 10)and (Tablero.Base.PiedraAlmacenada <= 15) then context_base.Nece_Piedra := 1;
 if (Tablero.Base.PiedraAlmacenada > 15)then context_base.Nece_Piedra := 0;

 if (Tablero.Base.MetalAlmacenado > 0)  and (Tablero.Base.MetalAlmacenado <= 4)  then context_base.Nece_Metal := 3;
 if (Tablero.Base.MetalAlmacenado > 4)  and (Tablero.Base.MetalAlmacenado <= 10) then context_base.Nece_Metal := 2;
 if (Tablero.Base.MetalAlmacenado > 10) and (Tablero.Base.MetalAlmacenado <= 15) then context_base.Nece_Metal := 1;
 if (Tablero.Base.MetalAlmacenado > 15) then context_base.Nece_Metal := 0;
 {Tablero.Base ENEMIGA}
 if (Tablero.Basee.Resistencia > 0)  and (Tablero.Basee.Resistencia <= 20) then context_basee.LifeInRisk := 1;
 if (Tablero.Basee.Resistencia > 20) and (Tablero.Basee.Resistencia <= 40) then context_basee.LifeInRisk := 0;

 if (Tablero.Basee.MaderaAlmacenada > 0)  and (Tablero.Basee.MaderaAlmacenada <= 4)  then context_basee.Nece_Madera := 3;
 if (Tablero.Basee.MaderaAlmacenada > 4)  and (Tablero.Basee.MaderaAlmacenada <= 10) then context_basee.Nece_Madera := 2;
 if (Tablero.Basee.MaderaAlmacenada > 10) and (Tablero.Basee.MaderaAlmacenada <= 15) then context_basee.Nece_Madera := 1;
 if (Tablero.Basee.MaderaAlmacenada > 15) then context_basee.Nece_Madera := 0;

 if (Tablero.Basee.PiedraAlmacenada > 0) and (Tablero.Basee.PiedraAlmacenada <= 4)  then context_basee.Nece_Piedra := 3;
 if (Tablero.Basee.PiedraAlmacenada > 4) and (Tablero.Basee.PiedraAlmacenada <= 10) then context_basee.Nece_Piedra := 2;
 if (Tablero.Basee.PiedraAlmacenada > 10)and (Tablero.Basee.PiedraAlmacenada <= 15) then context_basee.Nece_Piedra := 1;
 if (Tablero.Basee.PiedraAlmacenada > 15)then context_basee.Nece_Piedra := 0;

 if (Tablero.Basee.MetalAlmacenado > 0)  and (Tablero.Basee.MetalAlmacenado <= 4)  then context_basee.Nece_Metal := 3;
 if (Tablero.Basee.MetalAlmacenado > 4)  and (Tablero.Basee.MetalAlmacenado <= 10) then context_basee.Nece_Metal := 2;
 if (Tablero.Basee.MetalAlmacenado > 10) and (Tablero.Basee.MetalAlmacenado <= 15) then context_basee.Nece_Metal := 1;
 if (Tablero.basee.MetalAlmacenado > 15) then context_basee.Nece_Metal := 0;
 {REFUGIO}
if existeRef = true then
begin
 if (Tablero.Ref.Resistencia > 0)  and (Tablero.Ref.Resistencia  <= 20) then context_ref.LifeInRisk := 1;
 if (Tablero.Ref.Resistencia > 20) and (Tablero.Ref.Resistencia  <= 40) then context_ref.LifeInRisk := 0;

 if (Tablero.Ref.MetalAlmacenado > 0) and (Tablero.Ref.MetalAlmacenado <= 3) then context_ref.Nece_Metal := 3;
 if (Tablero.Ref.MetalAlmacenado > 3) and (Tablero.Ref.MetalAlmacenado <= 6) then context_ref.Nece_Metal := 2;
 if (Tablero.Ref.MetalAlmacenado > 6) and (Tablero.Ref.MetalAlmacenado <= 9) then context_ref.Nece_Metal := 1;
 if (Tablero.Ref.MetalAlmacenado = 10) then context_ref.Nece_Metal := 0;

 if (Tablero.Ref.MaderaAlmacenada > 0) and (Tablero.Ref.MaderaAlmacenada <= 3) then context_ref.Nece_Madera := 3;
 if (Tablero.Ref.MaderaAlmacenada > 3) and (Tablero.Ref.MaderaAlmacenada <= 6) then context_ref.Nece_Madera := 2;
 if (Tablero.Ref.MaderaAlmacenada > 6) and (Tablero.Ref.MaderaAlmacenada <= 9) then context_ref.Nece_Madera := 1;
 if (Tablero.Ref.MaderaAlmacenada = 10)then context_ref.Nece_Madera := 0;

 if (Tablero.Ref.PiedraAlmacenada > 0) and (Tablero.Ref.PiedraAlmacenada <= 3) then context_ref.Nece_Piedra := 3;
 if (Tablero.Ref.PiedraAlmacenada > 3) and (Tablero.Ref.PiedraAlmacenada <= 6) then context_ref.Nece_Piedra := 2;
 if (Tablero.Ref.PiedraAlmacenada > 6) and (Tablero.Ref.PiedraAlmacenada <= 9) then context_ref.Nece_Piedra := 1;
 if (Tablero.Ref.PiedraAlmacenada = 10) then context_ref.Nece_Piedra := 0;
end;
 {REFUGIO ENEMIGO}
 {if (Tablero.Refe.Resistencia > 0)  and (Tablero.Refe.Resistencia  <= 20) then context_refe.LifeInRisk := 1;
 if (Tablero.Refe.Resistencia > 20) and (Tablero.Refe.Resistencia  <= 40) then context_refe.LifeInRisk := 0;

 if (Tablero.Refe.MetalAlmacenado > 0) and (Tablero.Refe.MetalAlmacenado <= 3) then context_refe.Nece_Metal := 3;
 if (Tablero.Refe.MetalAlmacenado > 3) and (Tablero.Refe.MetalAlmacenado <= 6) then context_refe.Nece_Metal := 2;
 if (Tablero.Refe.MetalAlmacenado > 6) and (Tablero.Refe.MetalAlmacenado <= 9) then context_refe.Nece_Metal := 1;
 if (Tablero.Refe.MetalAlmacenado = 10) then context_refe.Nece_Metal := 0;

 if (Tablero.Refe.MaderaAlmacenada > 0) and (Tablero.Refe.MaderaAlmacenada <= 3) then context_refe.Nece_Madera := 3;
 if (Tablero.Refe.MaderaAlmacenada > 3) and (Tablero.Refe.MaderaAlmacenada <= 6) then context_refe.Nece_Madera := 2;
 if (Tablero.Refe.MaderaAlmacenada > 6) and (Tablero.Refe.MaderaAlmacenada <= 9) then context_refe.Nece_Madera := 1;
 if (Tablero.Refe.MaderaAlmacenada = 10)then context_refe.Nece_Madera := 0;

 if (Tablero.Refe.PiedraAlmacenada > 0) and (Tablero.Refe.PiedraAlmacenada <= 3) then context_refe.Nece_Piedra := 3;
 if (Tablero.Refe.PiedraAlmacenada > 3) and (Tablero.Refe.PiedraAlmacenada <= 6) then context_refe.Nece_Piedra := 2;
 if (Tablero.Refe.PiedraAlmacenada > 6) and (Tablero.Refe.PiedraAlmacenada <= 9) then context_refe.Nece_Piedra := 1;
 if (Tablero.Refe.PiedraAlmacenada = 10) then context_refe.Nece_Piedra := 0;  }
 {SOLDADO}
 if (Tablero.Soldado.Resistencia > 0)  and (Tablero.Soldado.Resistencia  <= 20) then context_sol.LifeInRisk := 1;
 if (Tablero.Soldado.Resistencia > 20) and (Tablero.Soldado.Resistencia  <= 40) then context_sol.LifeInRisk := 0;
 {Tablero.Soldado ENEMIGO}
 if (Tablero.Solene.Resistencia > 0) and (Tablero.Solene.Resistencia  <= 20) then context_sole.LifeInRisk := 1;
 if (Tablero.Solene.Resistencia > 20)and (Tablero.Solene.Resistencia  <= 40) then context_sole.LifeInRisk := 0;
 {BOMBER}
 if (Tablero.Bom.Resistencia > 0) and (Tablero.Bom.Resistencia  <= 20) then context_bom.LifeInRisk := 1;
 if (Tablero.Bom.Resistencia > 20) and (Tablero.Bom.Resistencia  <= 40) then context_bom.LifeInRisk := 0;
  {BOMBER ENEMIGO}
 if (Tablero.BomEne.Resistencia > 0) and (Tablero.BomEne.Resistencia  <= 20) then context_bome.LifeInRisk := 1;
 if (Tablero.BomEne.Resistencia > 20) and (Tablero.BomEne.Resistencia  <= 40) then context_bome.LifeInRisk := 0;
  {ESPIA}
 if (Tablero.Spy.Resistencia > 0) and (Tablero.Spy.Resistencia  <= 20) then context_esp.LifeInRisk := 1;
 if (Tablero.Spy.Resistencia > 20) and (Tablero.Spy.Resistencia  <= 40) then context_esp.LifeInRisk := 0;
 {ESPIA ENEMIGO}
 if (Tablero.SpyEne.Resistencia > 0) and (Tablero.SpyEne.Resistencia  <= 20) then context_espe.LifeInRisk := 1;
 if (Tablero.SpyEne.Resistencia > 20) and (Tablero.SpyEne.Resistencia  <= 40) then context_espe.LifeInRisk := 0;
end;


{==================================================================== timer maestro}
procedure TTABLERO.Timer1Timer(Sender: TObject);
var
  coo      : TPoint;
  c1,c2    : string;
  numero   : integer;

begin
 GetCursorPos(coo);
 str(coo.X,c1);
 str(coo.Y,c2);
 Label26.Caption := c1 + ',' + c2;

 Label28.Caption := IntToStr(Cursor.Left) + ',' + IntToStr(Cursor.Top);


 if BombNow = true then Label123.Caption := IntToStr(Bomba.Left) + ',' + IntToStr(Bomba.Top);
 if AntiNow = true then Label124.Caption := IntToStr(Anti.Left) + ',' + IntToStr(Anti.Top);

 if carta = false then
   begin
     randomize;
     numero := random(9999);
     Label30.Caption := IntToStr(numero);
     if numero < 3 then
       begin
         Power := TPower.Create(Self);
         Power.Parent := self;
         randomize;
         Power.Left := random(800);
         randomize;
         POwer.Top := random(550);
         carta := true;
         segundos := 0;
        end;
   end;

 if Torna = false then
   begin
     randomize;
     numero := random(9999);
     Label30.Caption := IntToStr(numero);
     if numero < 5 then
       begin
         Tornado          := TTornado.Create(Self);
         Tornado.Parent   := self;
         Tornado.Habilitado := true;
         randomize;
         Tornado.Left := Random(800);
         Tornado.Top  := Random(550);
         randomize;
         Tornado.Viaje(random(800),random(550));
         Torna := true;
        end;
   end;

 if carta = true then
   begin
     segundos := segundos + 1;
     Label30.Caption := intToStr(segundos);
     if segundos = 1500 then
       begin
         carta := false;
         Power.Free;
       end;
   end;




 BloodSol.Progress := Soldado.Resistencia;
 BloodBom.Progress := Bom.Resistencia;
 BloodEsp.Progress := Spy.Resistencia;
 BloodBase.Progress := Base.Resistencia;
// BloodRef.Progress  := Ref.Resistencia;

 BloodSolE.Progress := SolEne.Resistencia;
 BloodBomE.Progress := BomEne.Resistencia;
 BloodEspE.Progress := SpyEne.Resistencia;
 BloodBaseE.Progress := BaseE.Resistencia;
// BloodRefE.Progress  := RefE.Resistencia;

 Label17.Caption := IntToStr(Base.MaderaAlmacenada);
 Label18.Caption := IntToStr(Base.MetalAlmacenado);
 Label19.Caption := IntToStr(Base.PiedraAlmacenada);
 Label20.Caption := IntToStr(BaseE.MaderaAlmacenada);
 Label21.Caption := IntToStr(BaseE.MetalAlmacenado);
 Label22.Caption := IntToStr(BaseE.PiedraAlmacenada);

 if existeRef = true then
 begin
   Label31.Caption              := INtToStr(Ref.MaderaAlmacenada);
   Label32.Caption              := INtToStr(Ref.MetalAlmacenado);
   Label33.Caption              := INtToStr(Ref.PiedraAlmacenada);
   context_ref.Resistencia      := ref.Resistencia;
   context_ref.MaderaAlmacenada := ref.MaderaAlmacenada;
   context_ref.PiedraAlmacenada := ref.PiedraAlmacenada;
   context_ref.MetalAlmacenado  := ref.MetalAlmacenado;
   Label91.Caption              := IntToStr(context_Ref.LifeInRisk);
   label92.Caption              := IntToStr(context_Ref.Nece_Madera);
   label93.Caption              := IntToStr(context_Ref.Nece_Piedra);
   label94.Caption              := IntToStr(context_Ref.Nece_Metal);
 end;
 {
 Label34.Caption := IntToStr(RefE.MaderaAlmacenada);
 Label35.Caption := INtToStr(RefE.MetalAlmacenado);
 Label36.Caption := INtToStr(RefE.PiedraAlmacenada);}

 Label37.Caption := IntToStr(Soldado.Left);
 Label38.Caption := IntToStr(Soldado.Top);
 Label39.Caption := IntToStr(Bom.Left);
 Label40.Caption := IntToStr(Bom.Top);
 Label41.Caption := IntToStr(Spy.Left);
 Label42.Caption := IntToStr(Spy.Top);

 Label43.Caption := IntToStr(SolEne.Left);
 Label44.Caption := IntToStr(SolEne.Top);
 Label45.Caption := IntToStr(BomEne.Left);
 Label46.Caption := IntToStr(BomEne.Top);
 Label47.Caption := IntToStr(SpyEne.Left);
 Label48.Caption := IntToStr(SpyEne.Top);

 {llena los contextos frecuentemente}
 context_sol.Resistencia := Soldado.Resistencia;
 context_bom.Resistencia := Bom.Resistencia;
 context_esp.Resistencia := Spy.Resistencia;
 context_sole.Resistencia := SolEne.Resistencia;
 context_bome.Resistencia := BomEne.Resistencia;
 context_espe.Resistencia := SpyEne.Resistencia;

 context_base.Resistencia      := base.Resistencia;
 context_base.MaderaAlmacenada := base.MaderaAlmacenada;
 context_base.PiedraAlmacenada := base.MaderaAlmacenada;
 context_base.MetalAlmacenado  := base.MetalAlmacenado;

 context_basee.Resistencia      := basee.Resistencia;
 context_basee.MaderaAlmacenada := basee.MaderaAlmacenada;
 context_basee.PiedraAlmacenada := basee.MaderaAlmacenada;
 context_basee.MetalAlmacenado  := basee.MetalAlmacenado;



{ context_refe.Resistencia      := refe.Resistencia;
 context_refe.MaderaAlmacenada := refe.MaderaAlmacenada;
 context_refe.PiedraAlmacenada := refe.PiedraAlmacenada;
 context_refe.MetalAlmacenado  := refe.MetalAlmacenado; }

 actualizaContextos;
 {equipo}
 Label65.Caption := context_sol.Haciendo;
 label66.Caption := context_sol.Amenazado;
 label67.Caption := IntToStr(context_sol.P_Equipo);
 label68.Caption := IntToStr(context_sol.Odio_Ene);
 label69.Caption := IntToStr(context_sol.SegInRisk);
 label70.Caption := IntToStr(context_sol.LifeInRisk);

 Label71.Caption := context_bom.Haciendo;
 label72.Caption := context_bom.Amenazado;
 label73.Caption := IntToStr(context_bom.P_Equipo);
 label74.Caption := IntToStr(context_bom.Odio_Ene);
 label75.Caption := IntToStr(context_bom.SegInRisk);
 label76.Caption := IntToStr(context_bom.LifeInRisk);

 Label77.Caption := context_esp.Haciendo;
 label78.Caption := context_esp.Amenazado;
 label79.Caption := IntToStr(context_esp.P_Equipo);
 label80.Caption := IntToStr(context_esp.Odio_Ene);
 label81.Caption := IntToStr(context_esp.SegInRisk);
 label82.Caption := IntToStr(context_esp.LifeInRisk);

 Label87.Caption := IntToStr(context_base.LifeInRisk);
 label88.Caption := IntToStr(context_base.Nece_Madera);
 label89.Caption := IntToStr(context_base.Nece_Piedra);
 label90.Caption := IntToStr(context_base.Nece_Metal);


 {equipo enemigo}
 Label86.Caption  := context_solE.Haciendo;
 label100.Caption := context_solE.Amenazado;
 label103.Caption := IntToStr(context_solE.P_Equipo);
 label108.Caption := IntToStr(context_solE.Odio_Ene);
 label113.Caption := IntToStr(context_solE.SegInRisk);
 label118.Caption := IntToStr(context_solE.LifeInRisk);

 Label84.Caption  := context_bomE.Haciendo;
 label101.Caption := context_bomE.Amenazado;
 label104.Caption := IntToStr(context_bomE.P_Equipo);
 label109.Caption := IntToStr(context_bomE.Odio_Ene);
 label114.Caption := IntToStr(context_bomE.SegInRisk);
 label119.Caption := IntToStr(context_bomE.LifeInRisk);

 Label85.Caption  := context_espE.Haciendo;
 label102.Caption := context_esp.Amenazado;
 label105.Caption := IntToStr(context_espE.P_Equipo);
 label110.Caption := IntToStr(context_espE.Odio_Ene);
 label115.Caption := IntToStr(context_espE.SegInRisk);
 label120.Caption := IntToStr(context_espE.LifeInRisk);

 Label121.Caption := IntToStr(context_baseE.LifeInRisk);
 label106.Caption := IntToStr(context_baseE.Nece_Madera);
 label111.Caption := IntToStr(context_baseE.Nece_Piedra);
 label116.Caption := IntToStr(context_baseE.Nece_Metal);

 {Label122.Caption := IntToStr(context_RefE.LifeInRisk);
 label107.Caption := IntToStr(context_RefE.Nece_Madera);
 label112.Caption := IntToStr(context_RefE.Nece_Piedra);
 label117.Caption := IntToStr(context_RefE.Nece_Metal);}

end;

procedure agrega_historial;
var
 linea: string;
begin
  assignFile(auxFile,direct + '\DEF\EST_ASOC.txt');
  reset(auxFile);
  writeln(historial,'');
  writeln(historial,'  $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ ESTRUCTURA ASOCIATIVA AL DETECTAR MOMIVIENTO');
  writeln(historial,'');
  while not EOF(auxFile) Do
    begin
      readln(auxfile,linea);
      writeln(historial,linea);
    end;
  closefile(auxFile);

  writeln(historial,'');
  writeln(historial,'  $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ RESULTADO DEL ESTADO DE ENSIMISMAMIENTO');
  writeln(historial,'');
  assignFile(auxFile,direct + '\DEF\POS_ACC.txt');
  reset(auxFile);
  while not EOF(auxFile) Do
    begin
      readln(auxfile,linea);
      writeln(historial,linea);
    end;
  closefile(auxFile);

  writeln(historial,'');
  writeln(historial,'  $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ RESULTADO DEL ESTADO DE REFLEXIÓN');
  writeln(historial,'');
  assignFile(auxFile,direct + '\DEF\REFLECT.txt');
  reset(auxFile);
  while not EOF(auxFile) Do
    begin
      readln(auxfile,linea);
      writeln(historial,linea);
    end;
  closefile(auxFile);
end;

procedure actualiza_historial;
begin
  veces := veces + 1;
  writeln(historial,'');
  writeln(historial,'');
  writeln(historial,'///////////////////////////////////////////////////////////');
  writeln(historial,'////////////////////////MOVIMIENTO #' + intToStr(veces) + '/////////////////////');
  writeln(historial,'///////////////////////////////////////////////////////////');
  agrega_historial;
end;

{------------------------------------------------ guarda el estado antes de cualquier acción}
procedure antes_accion;
begin
  ANTES[1,2] := context_Sol.Haciendo;
  ANTES[2,2] := context_Bom.Haciendo;
  ANTES[3,2] := context_Esp.Haciendo;
  ANTES[1,3] := context_Sol.Victima;
  ANTES[2,3] := context_Bom.Victima;
  ANTES[3,3] := context_Esp.Victima;
end;
{------------------------------------------------ guarda el estado despues de cualquier acción}
procedure despues_accion;
begin
  DESPUES[1,2] := context_Sol.Haciendo;
  DESPUES[2,2] := context_Bom.Haciendo;
  DESPUES[3,2] := context_Esp.Haciendo;
  DESPUES[1,3] := context_Sol.Victima;
  DESPUES[2,3] := context_Bom.Victima;
  DESPUES[3,3] := context_Esp.Victima;
end;

{------------------------------------------------ detecta cambios, y ejectua ciclo IA}
procedure detecta_cambios;
begin
 if  (ANTES[1,2] <> DESPUES[1,2]) then sol_cambio := true;
 if  (ANTES[2,2] <> DESPUES[2,2]) then bom_cambio := true;
 if  (ANTES[3,2] <> DESPUES[3,2]) then esp_cambio := true;

 if (sol_cambio = true) or (bom_cambio = true) or (esp_cambio = true) then
    begin
      ENGAGEMENT;
      REFLECTION;
      lee_instrucciones;
      actualiza_historial;
    end;
end;


procedure TTABLERO.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
Begin
  KeyPreview := True;
  if KEY = Ord('A') then
    begin
       Tablero.Ordenes.Popup(200,200);
       EquAzul := true;
       EquRojo := false;
    end;

  if (EquAzul = true) and (key = Ord('G')) then
    Cursor.Left := Cursor.Left + 8;

  if (EquAzul = true) and (key = Ord('D')) then
    Cursor.Left := Cursor.Left - 8;

  if (EquAzul = true) and (key = Ord('R')) then
    Cursor.Top := Cursor.Top - 8;

  if (EquAzul = true) and (key = Ord('F')) then
    Cursor.Top := Cursor.Top + 8;
  {-------- desplazamiento de Soldado}
  if (EquAzul = true) and (key = Ord('S')) and
      (DesplazoSol = true) then
        begin
          DesplazoSol := false;
          Soldado.desplazate(Cursor.Left + 10,Cursor.Top + 10,10);
          Cursor.Visible := false;
        end;
  {Desplazameinto de Bomber}
  if (EquAzul = true) and (key = Ord('S')) and
      (DesplazoBom = true) then
        begin
          DesplazoBom := false;
          Bom.desplazate(Cursor.Left + 10,Cursor.Top + 10,10);
          Cursor.Visible := false;
        end;
  {Desplazamiento de Espia}
  if (EquAzul = true) and (key = Ord('S')) and
      (DesplazoEsp = true) then
        begin
          DesplazoEsp := false;
          Spy.desplazate(Cursor.Left + 10,Cursor.Top + 10,10);
          Cursor.Visible := false;
        end;
   {Bombardeo}
   if (EquAzul = true) and (key = Ord('S')) and
      (BombardearEqu = true) then
        begin
          BombardearEqu := false;
          Bom.Velocidad := 10;
          Bom.Bombardear(Cursor.Left + 10,Cursor.Top + 10);
          Cursor.Visible := false;
        end;
  {desactivando bomba}
  if (EquAzul = true) and (key = Ord('S')) and
      (DesactivarEqu = true) then
        begin
          DesactivarEqu := false;
          Bom.Velocidad := 10;
          Bom.DesactivarBomba(Cursor.Left + 10,Cursor.Top + 10);
          Cursor.Visible := false;
        end;
   {crea refugio}
   if (EquAzul = true) and (key = Ord('S')) and
      (CreaRef = true) and (ExisteRef = false) then
        begin
          CreaRef    := false;              // nota: en la destrucción del refugio habrá que
          ExisteRef  := true;               // colocar ExisteRef a false y CreaRef a true
          Ref := TRefugio.Create(self);
          Ref.Parent := self;
          Ref.Top := Cursor.Top - 10;
          Ref.Left:= Cursor.Left - 10;
        end;

  if (EquAzul = true) and (key = Ord('S')) and
      (LocaTrampa = true) then
        begin
          locaTrampa := false;
          Trampa.Left := Cursor.Left + 10;
          Trampa.Top  := Cursor.Top  + 10;
          Cursor.Visible :=  false;
        end;

end;

procedure TTABLERO.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 { ANTES[1,2] := context_Sol.Haciendo;
  ANTES[2,2] := context_Bom.Haciendo;
  ANTES[3,2] := context_Esp.Haciendo;
  ANTES[1,3] := context_Sol.Victima;
  ANTES[2,3] := context_Bom.Victima;
  ANTES[3,3] := context_Esp.Victima;

 {MOVIMIENTOS DEL BOMBER-ENEMIGO}
 {if (shift = ([ssCtrl]))  then if Key = VK_NUMPAD1 then
   begin
     Bom.IrMaterial('Madera1');
     IR_POR_MADERA1('BOMBER');
   end;
 if (shift = ([ssCtrl]))  then if Key = VK_NUMPAD2 then
   begin
     Bom.IrMaterial('Madera2');
     IR_POR_MADERA2('BOMBER');
   end;
 if (shift = ([ssCtrl]))  then if Key = VK_NUMPAD4 then
   begin
      Bom.IrMaterial('Piedra1');
      IR_POR_PIEDRA1('BOMBER');
   end;
 if (shift = ([ssCtrl]))  then if Key = VK_NUMPAD5 then
   begin
      Bom.IrMaterial('Piedra2');
      IR_POR_PIEDRA2('BOMBER');
   end;
 if (shift = ([ssCtrl]))  then if Key = VK_NUMPAD7 then
   begin
      Bom.IrMaterial('Metal1');
      IR_POR_METAL1('BOMBER');
   end;
 if (shift = ([ssCtrl]))  then if Key = VK_NUMPAD8 then
   begin
     Bom.IrMaterial('Metal2');
     IR_POR_METAL2('BOMBER');
   end;
 if (shift = ([ssCtrl]))  then if Key = VK_NUMPAD0 then
   begin
      Bom.Refugiarse;
      REFUGIARSE('BOMBER');
   end;
 if (shift = ([ssCtrl]))  then if Key = Ord('Z')   then
   begin
      Bom.Atacar('Soldado','Madera');
      ATACAR_CON_MADERA('BOMBER','SOLDADO_ENEMIGO');
   end;
 if (shift = ([ssCtrl]))  then if Key = Ord('X')   then
   begin
     Bom.Atacar('Soldado','Piedra');
     ATACAR_CON_PIEDRA('BOMBER','SOLDADO_ENEMIGO');
   end;
 if (shift = ([ssCtrl]))  then if Key = Ord('C')   then
   begin
      Bom.Atacar('Soldado','Metal');
      ATACAR_CON_METAL('BOMBER','SOLDADO_ENEMIGO');
   end;
 if (shift = ([ssCtrl]))  then if Key = Ord('A')   then
   begin
      Bom.Atacar('Bomber','Madera');
      ATACAR_CON_MADERA('BOMBER','BOMBER_ENEMIGO');
   end;
 if (shift = ([ssCtrl]))  then if Key = Ord('S')   then
   begin
      Bom.Atacar('Bomber','Piedra');
      ATACAR_CON_PIEDRA('BOMBER','BOMBER_ENEMIGO');
   end;
 if (shift = ([ssCtrl]))  then if Key = Ord('D')   then
   begin
      Bom.Atacar('Bomber','Metal');
      ATACAR_CON_METAL('BOMBER','BOMBER_ENEMIGO');
   end;
 if (shift = ([ssCtrl]))  then if Key = Ord('Q')   then
   begin
      Bom.Atacar('Espia','Madera');
      ATACAR_CON_MADERA('BOMBER','ESPIA_ENEMIGO');
   end;
 if (shift = ([ssCtrl]))  then if Key = Ord('W')   then
   begin
     Bom.Atacar('Espia','Piedra');
     ATACAR_CON_PIEDRA('BOMBER','ESPIA_ENEMIGO');
   end;
 if (shift = ([ssCtrl]))  then if Key = Ord('E')   then
   begin
      Bom.Atacar('Espia','Metal');
      ATACAR_CON_METAL('BOMBER','ESPIA_ENEMIGO');
   end;
 if (shift = ([ssCtrl]))  then if Key = Ord('V')   then
   begin
      Bom.Construir('Refugio','Madera');
      CONSTRUIR_CON_MADERA('BOMBER');
   end;
  if (shift = ([ssCtrl]))  then if Key = Ord('B')   then
   begin
      Bom.Construir('Refugio','Piedra');
      CONSTRUIR_CON_PIEDRA('BOMBER');
   end;
   if (shift = ([ssCtrl]))  then if Key = Ord('N')   then
   begin
      Bom.Construir('Refugio','Metal');
      CONSTRUIR_CON_METAL('BOMBER');
   end;
 {MOVIMIENTOS DEL ESPIA ENEMIGO}
 {if (shift = ([ssAlt]))  then if Key = VK_NUMPAD1 then
   begin
     Spy.IrMaterial('Madera1');
     IR_POR_MADERA1('ESPIA');
   end;
 if (shift = ([ssAlt]))  then if Key = VK_NUMPAD2 then
   begin
     Spy.IrMaterial('Madera2');
     IR_POR_MADERA2('ESPIA');
   end;
 if (shift = ([ssAlt]))  then if Key = VK_NUMPAD4 then
   begin
     Spy.IrMaterial('Piedra1');
     IR_POR_PIEDRA1('ESPIA');
   end;
 if (shift = ([ssAlt]))  then if Key = VK_NUMPAD5 then
   begin
     Spy.IrMaterial('Piedra2');
     IR_POR_PIEDRA2('ESPIA');
   end;
 if (shift = ([ssAlt]))  then if Key = VK_NUMPAD7 then
   begin
     Spy.IrMaterial('Metal1');
     IR_POR_METAL1('ESPIA');
   end;
 if (shift = ([ssAlt]))  then if Key = VK_NUMPAD8 then
   begin
     Spy.IrMaterial('Metal2');
     IR_POR_METAL2('ESPIA');
   end;
 if (shift = ([ssAlt]))  then if Key = VK_NUMPAD0 then
   begin
      Spy.Refugiarse;
      REFUGIARSE('ESPIA');
   end;
 if (shift = ([ssAlt]))  then if Key = Ord('Z')   then
   begin
      Spy.Atacar('Soldado','Madera');
      ATACAR_CON_MADERA('ESPIA','SOLDADO_ENEMIGO');
   end;
 if (shift = ([ssAlt]))  then if Key = Ord('X')   then
   begin
      Spy.Atacar('Soldado','Piedra');
      ATACAR_CON_PIEDRA('ESPIA','SOLDADO_ENEMIGO');
   end;
 if (shift = ([ssAlt]))  then if Key = Ord('C')   then
   begin
      Spy.Atacar('Soldado','Metal');
      ATACAR_CON_METAL('ESPIA','SOLDADO_ENEMIGO');
   end;
 if (shift = ([ssAlt]))  then if Key = Ord('A')   then
   begin
      Spy.Atacar('Bomber','Madera');
      ATACAR_CON_MADERA('ESPIA','BOMBER_ENEMIGO');
   end;
 if (shift = ([ssAlt]))  then if Key = Ord('S')   then
   begin
      Spy.Atacar('Bomber','Piedra');
      ATACAR_CON_PIEDRA('ESPIA','BOMBER_ENEMIGO');
   end;
 if (shift = ([ssAlt]))  then if Key = Ord('D')   then
  begin
      Spy.Atacar('Bomber','Metal');
      ATACAR_CON_METAL('ESPIA','BOMBER_ENEMIGO');
   end;
 if (shift = ([ssAlt]))  then if Key = Ord('Q')   then
   begin
      Spy.Atacar('Espia','Madera');
      ATACAR_CON_MADERA('ESPIA','ESPIA_ENEMIGO');
   end;
 if (shift = ([ssAlt]))  then if Key = Ord('W')   then
   begin
      Spy.Atacar('Espia','Piedra');
      ATACAR_CON_PIEDRA('ESPIA','ESPIA_ENEMIGO');
   end;
 if (shift = ([ssAlt]))  then if Key = Ord('E')   then
   begin
      Spy.Atacar('Espia','Metal');
      ATACAR_CON_METAL('ESPIA','ESPIA_ENEMIGO');
   end;
 if (shift = ([ssAlt]))  then if Key = Ord('V')   then
   begin
      Spy.Construir('Refugio','Madera');
      CONSTRUIR_CON_MADERA('ESPIA');
   end;
  if (shift = ([ssAlt]))  then if Key = Ord('B')   then
   begin
      Spy.Construir('Refugio','Piedra');
      CONSTRUIR_CON_PIEDRA('ESPIA');
   end;
   if (shift = ([ssAlt]))  then if Key = Ord('N')   then
   begin
      Spy.Construir('Refugio','Metal');
      CONSTRUIR_CON_METAL('ESPIA');
   end;
  DESPUES[1,2] := context_Sol.Haciendo;
  DESPUES[2,2] := context_Bom.Haciendo;
  DESPUES[3,2] := context_Esp.Haciendo;
  DESPUES[1,3] := context_Sol.Victima;
  DESPUES[2,3] := context_Bom.Victima;
  DESPUES[3,3] := context_Esp.Victima;

 detecta_cambios;
  if (sol_cambio = true) or (bom_cambio = true) or (esp_cambio = true) then
    begin
      ENGAGEMENT;
      REFLECTION;
      lee_instrucciones;
      actualiza_historial;
    end;  }
end;

procedure pausa;
begin
 Tablero.Soldado.Abilitado := not(Tablero.Soldado.Abilitado);
 Tablero.SolEne.Habilitado  := not(Tablero.SolEne.Habilitado);
 Tablero.Bom.Habilitado     := not(Tablero.Bom.Habilitado);
 Tablero.BomEne.Habilitado  := not(Tablero.BomEne.Habilitado);
 Tablero.Spy.Abilitado     := not(Tablero.Spy.Abilitado);
 Tablero.SpyEne.Habilitado  := not(Tablero.SpyEne.Habilitado);
end;

procedure TTABLERO.PausaBtnClick(Sender: TObject);
begin
 pausa;
 if Soldado.Abilitado = false then PausaBtn.Caption := 'Continuar';
 if Soldado.Abilitado = true  then PausaBtn.Caption := 'Pausa';
end;

procedure TTABLERO.Button1Click(Sender: TObject);
begin
 Atomos.ShowModal;
end;

procedure TTABLERO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 CloseFile(historial)
end;

{---------------------------------------------------------- colocar refugio}
procedure TTABLERO.COLOCARREFUGIO1Click(Sender: TObject);
begin
 if existeRef = false then
  begin
    CreaRef := true;
    Cursor.Visible := true;
  end;
end;

procedure TTABLERO.COLOCARTRAMPA1Click(Sender: TObject);
begin
 if EquAzul = true then
  begin
     locaTrampa := true;
     Cursor.Visible := true;
  end; 
end;


{---------------------------------------------------------- desplazamientos}
procedure TTABLERO.DESPLAZARSE1Click(Sender: TObject);
Begin

  if EquAzul = true then
    begin
     Cursor.Visible := true;
     desplazoSol := true;
    end;
    
  if EquRojo = true then
    begin
       desplazoSolE := true;
       Screen.Cursor := crCross;
    end;
end;

procedure TTABLERO.DESPLAZARSE2Click(Sender: TObject);
begin

    if EquAzul = true then
    begin
     Cursor.Visible := true;
     desplazoBom := true;
    end;

  if EquRojo = true then
    begin
      Screen.Cursor := crCross;
      desplazoBomE := true;
    end;
end;

procedure TTABLERO.DESPLAZARSE3Click(Sender: TObject);
begin

  if EquAzul = true then
    begin
     Cursor.Visible := true;
     desplazoEsp := true;
    end;
    
  if EquRojo = true then
    begin
      desplazoEspE := true;
      Screen.Cursor := crCross;
    end;
end;


procedure TTABLERO.BOMBARDEAR1Click(Sender: TObject);
begin

  if EquAzul = true then
    begin
       BombardearEqu := true;
       Bom.Habilitado := true;
       Cursor.Visible := true;
    end;

  if EquRojo = true then
    begin
      Screen.Cursor := crCross;
    end;
end;

procedure TTABLERO.DESACTIVABOMBA1Click(Sender: TObject);
begin

   if EquAzul = true then
     begin
       DesactivarEqu := true;
       Bom.Habilitado := true;
       Cursor.Visible := true;
     end;

   if EquRojo = true then
     begin
       Screen.Cursor := crCross;
     end;
end;


{---------------------------------------------------------- cada click sobre el tablero}
procedure TTABLERO.FormClick(Sender: TObject);
var
loca      : TPoint;
begin
 if desplazoSol = true then
   begin
     desplazoSol := false;
     Screen.Cursor := crDefault;
     GetCursorPos(loca);
     soldado.desplazate(loca.X-5,loca.Y-30,10);
   end;

 if desplazoSolE = true then
   begin
     SolEne.Habilitado := true;
     desplazoSolE := false;
     Screen.Cursor := crDefault;
     GetCursorPos(loca);
     solEne.desplazate(loca.X-5,loca.Y-30,10);
   end;

 if desplazoBom = true then
   begin
     desplazoBom := false;
     Screen.Cursor := crDefault;
     GetCursorPos(loca);
     Bom.desplazate(loca.X-5,loca.Y-30,10);
   end;

 if desplazoBomE = true then
   begin
     BomEne.Habilitado := true;
     desplazoBomE := false;
     Screen.Cursor := crDefault;
     GetCursorPos(loca);
     BomEne.desplazate(loca.X-5,loca.Y-30,10);
   end;

 if desplazoEsp = true then
   begin
     desplazoEsp := false;
     Screen.Cursor := crDefault;
     GetCursorPos(loca);
     Spy.desplazate(loca.X-5,loca.Y-30,10);
   end;

 if desplazoEspE = true then
   begin
     SpyEne.Habilitado := true;
     desplazoEspE := false;
     Screen.Cursor := crDefault;
     GetCursorPos(loca);
     SpyEne.desplazate(loca.X-5,loca.Y-30,10);
   end;



 {if (BombardearEqu = true) and (Base.Bombas > 0) then    {BOMBARDEANDO}
   {begin
     BombardearEqu := false;
     Bombas        := Bombas - 1;
     Screen.Cursor := crDefault;
     GetCursorPos(loca);
     Bom.Velocidad := 10;
     Bom.Bombardear(Loca.X-5,loca.Y-30);
   end;    }

  {if (DesactivarEqu = true) and (Base.AntiBombas > 0) then }   {desactivando BOMBA}
   {begin
     DesactivarEqu := false;
     AntiBombas    := AntiBombas - 1;
     Screen.Cursor := crDefault;
     GetCursorPos(loca);
     Bom.Velocidad := 10;
     Bom.DesactivarBomba(Loca.X,loca.Y-30);
   end;     }


end;

{----------------------------------------------------------------- define modo de juego}
procedure TTABLERO.PlayModeClick(Sender: TObject);
begin
 if Playmode.ItemIndex = 0 then MODO := false; // Usuarios
 if PlayMode.ItemIndex = 1 then MODO := true;  // IA
end;


{----------------------------------------------------------------- en MODO MANUAL, Ordenes a enemigo}
procedure TTABLERO.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    begin
      EquAzul := false;
      EquRojo := true;
    end;
end;

////////////////////////////////////////////////////////////////////////////////
////////////////////  RECEPCIÓN DE ORDENES  ////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


{----------------------------------------------------------------------  soldado}

procedure TTABLERO.MADERA11Click(Sender: TObject);
begin
  if EquAzul = true then
    begin
       Soldado.Abilitado := true;
       Soldado.IrMaterial('Madera1');
       IR_POR_MADERA1('SOLDADO');
    end;

  if (EquRojo = true) and (MODO = false) then
    Begin
      solEne.IrMaterial('Madera1');
      IR_POR_MADERA1('SOLDADO_ENEMIGO');
    end;

end;

procedure TTABLERO.MADERA21Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then
    begin
       Soldado.IrMaterial('Madera2');
       IR_POR_MADERA2('SOLDADO');
    end;

  if (EquRojo = true) and (MODO = false) then
    Begin
      solEne.IrMaterial('Madera2');
      IR_POR_MADERA2('SOLDADO_ENEMIGO');
    end;
end;

procedure TTABLERO.PIEDRA11Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then
    begin
       Soldado.IrMaterial('Piedra1');
       IR_POR_PIEDRA1('SOLDADO');
    end;

  if (EquRojo = true) and (MODO = false) then
    Begin
      solEne.IrMaterial('Piedra1');
      IR_POR_PIEDRA1('SOLDADO_ENEMIGO');
    end;
end;

procedure TTABLERO.PIEDRA21Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then
    begin
       Soldado.IrMaterial('Piedra2');
       IR_POR_PIEDRA2('SOLDADO');
    end;

  if (EquRojo = true) and (MODO = false) then
    Begin
      solEne.IrMaterial('Piedra2');
      IR_POR_PIEDRA2('SOLDADO_ENEMIGO');
    end;
end;

procedure TTABLERO.METAL11Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then
    begin
       Soldado.IrMaterial('Metal1');
       IR_POR_METAL1('SOLDADO');
    end;

  if (EquRojo = true) and (MODO = false) then
    Begin
      solEne.IrMaterial('Metal1');
      IR_POR_METAL1('SOLDADO_ENEMIGO');
    end;
end;

procedure TTABLERO.METAL21Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then
    begin
       Soldado.IrMaterial('Metal2');
       IR_POR_METAL2('SOLDADO');
    end;

  if (EquRojo = true) and (MODO = false) then
    Begin
      solEne.IrMaterial('Metal2');
      IR_POR_METAL2('SOLDADO_ENEMIGO');
    end;
end;

procedure TTABLERO.ASOLDADO1Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then Soldado.Atacar('SOLDADO','Madera');
  if (EquRojo = true) and (MODO = false) then SolEne.Atacar('SOLDADO','Madera');
end;

procedure TTABLERO.ABOMBARDERO1Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then Soldado.Atacar('BOMBER','Madera');
  if (EquRojo = true) and (MODO = false) then SolEne.Atacar('BOMBER','Madera');
end;

procedure TTABLERO.AESPIA1Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then Soldado.Atacar('ESPIA','Madera');
  if (EquRojo = true) and (MODO = false) then SolEne.Atacar('ESPIA','Madera');
end;

procedure TTABLERO.a1Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then Soldado.Atacar('BASE','Madera');
  if (EquRojo = true) and (MODO = false) then SolEne.Atacar('BASE','Madera');
end;

procedure TTABLERO.AREFUGIO1Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then Soldado.Atacar('REFUGIO','Madera');
  if (EquRojo = true) and (MODO = false) then SolEne.Atacar('REFUGIO','Madera');
end;

procedure TTABLERO.ASOLDADO2Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then Soldado.Atacar('SOLDADO','Piedra');
  if (EquRojo = true) and (MODO = false) then SolEne.Atacar('SOLDADO','Piedra');
end;

procedure TTABLERO.ABOMBARDERO2Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then Soldado.Atacar('BOMBER','Piedra');
  if (EquRojo = true) and (MODO = false) then SolEne.Atacar('BOMBER','Piedra');
end;

procedure TTABLERO.AESPIA2Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then Soldado.Atacar('ESPIA','Piedra');
  if (EquRojo = true) and (MODO = false) then SolEne.Atacar('ESPIA','Piedra');
end;

procedure TTABLERO.ABASE1Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then Soldado.Atacar('BASE','Piedra');
  if (EquRojo = true) and (MODO = false) then SolEne.Atacar('BASE','Piedra');
end;

procedure TTABLERO.AREFUGIO2Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then Soldado.Atacar('REFUGIO','Metal');
  if (EquRojo = true) and (MODO = false) then SolEne.Atacar('REFUGIO','Piedra');
end;

procedure TTABLERO.ASOLDADO3Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then Soldado.Atacar('SOLDADO','Metal');
  if (EquRojo = true) and (MODO = false) then SolEne.Atacar('SOLDADO','Metal');
end;

procedure TTABLERO.ABOMBARDERO3Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then Soldado.Atacar('BOMBER','Metal');
  if (EquRojo = true) and (MODO = false) then SolEne.Atacar('BOMBER','Metal');
end;

procedure TTABLERO.AESPIA3Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then Soldado.Atacar('ESPIA','Metal');
  if (EquRojo = true) and (MODO = false) then SolEne.Atacar('ESPIA','Metal');
end;

procedure TTABLERO.ABASE2Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then Soldado.Atacar('BASE','Metal');
  if (EquRojo = true) and (MODO = false) then SolEne.Atacar('BASE','Metal');
end;

procedure TTABLERO.AREFUGIO3Click(Sender: TObject);
begin
  Soldado.Abilitado := true;
  if EquAzul = true then Soldado.Atacar('REFUGIO','Metal');
  if (EquRojo = true) and (MODO = false) then SolEne.Atacar('REFUGIO','Metal');
end;

 {---------------------------------------------------------------------- bomber }
procedure TTABLERO.MADERA12Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then
    begin
      Bom.IrMaterial('Madera1');
      IR_POR_MADERA1('BOMBER');
    end;
  if (EquRojo = true) and (MODO = false) then
    begin
      BomEne.IrMaterial('Madera1');
      IR_POR_MADERA1('BOMBER_ENEMIGO');
    end;
end;

procedure TTABLERO.MADERA22Click(Sender: TObject);
begin
   Bom.Habilitado := true;
   if EquAzul = true then
    begin
      Bom.IrMaterial('Madera2');
      IR_POR_MADERA2('BOMBER');
    end;
  if (EquRojo = true) and (MODO = false) then
    begin
      BomEne.IrMaterial('Madera2');
      IR_POR_MADERA2('BOMBER_ENEMIGO');
    end;
end;

procedure TTABLERO.PIEDRA12Click(Sender: TObject);
begin
   Bom.Habilitado := true;
   if EquAzul = true then
    begin
      Bom.IrMaterial('Piedra1');
      IR_POR_PIEDRA1('BOMBER');
    end;
  if (EquRojo = true) and (MODO = false) then
    begin
      BomEne.IrMaterial('Piedra1');
      IR_POR_PIEDRA1('BOMBER_ENEMIGO');
    end;
end;

procedure TTABLERO.PIEDRA22Click(Sender: TObject);
begin
   Bom.Habilitado := true;
   if EquAzul = true then
    begin
      Bom.IrMaterial('Piedra2');
      IR_POR_PIEDRA2('BOMBER');
    end;
  if (EquRojo = true) and (MODO = false) then
    begin
      BomEne.IrMaterial('Piedra2');
      IR_POR_PIEDRA2('BOMBER_ENEMIGO');
    end;
end;

procedure TTABLERO.METAL12Click(Sender: TObject);
begin
   Bom.Habilitado := true;
   if EquAzul = true then
    begin
      Bom.IrMaterial('Metal1');
      IR_POR_METAL1('BOMBER');
    end;
  if (EquRojo = true) and (MODO = false) then
    begin
      BomEne.IrMaterial('Metal1');
      IR_POR_METAL1('BOMBER_ENEMIGO');
    end;
end;

procedure TTABLERO.METAL22Click(Sender: TObject);
begin
   Bom.Habilitado := true;
   if EquAzul = true then
    begin
      Bom.IrMaterial('Metal2');
      IR_POR_METAL2('BOMBER');
    end;
  if (EquRojo = true) and (MODO = false) then
    begin
      BomEne.IrMaterial('Metal2');
      IR_POR_METAL2('BOMBER_ENEMIGO');
    end;
end;

procedure TTABLERO.CONMADERA3Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then
    begin
      Bom.Construir('Madera');
      CONSTRUIR_CON_MADERA('BOMBER');
    end;
  if (EquRojo = true) and (MODO = false) then
    begin
      BomEne.Construir('Madera');
      CONSTRUIR_CON_MADERA('BOMBER_ENEMIGO');
    end;
end;

procedure TTABLERO.CONPIEDRA3Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then
    begin
      Bom.Construir('Piedra');
      CONSTRUIR_CON_PIEDRA('BOMBER');
    end;
  if (EquRojo = true) and (MODO = false) then
    begin
      BomEne.Construir('Piedra');
      CONSTRUIR_CON_PIEDRA('BOMBER_ENEMIGO');
    end;
end;

procedure TTABLERO.CONMETAL3Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then
    begin
      Bom.Construir('Metal');
      CONSTRUIR_CON_METAL('BOMBER');
    end;
  if (EquRojo = true) and (MODO = false) then
    begin
      BomEne.Construir('Metal');
      CONSTRUIR_CON_METAL('BOMBER_ENEMIGO');
    end;
end;

procedure TTABLERO.ASOLDADO4Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then Bom.Atacar('SOLDADO','Madera');
  if (EquRojo = true) and (MODO = false) then BomEne.Atacar('SOLDADO','Madera');
end;

procedure TTABLERO.ABOMBARDERO4Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then Bom.Atacar('BOMBER','Madera');
  if (EquRojo = true) and (MODO = false) then BomEne.Atacar('SBOMBER','Madera');
end;

procedure TTABLERO.AESPIA4Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then Bom.Atacar('ESPIA','Madera');
  if (EquRojo = true) and (MODO = false) then BomEne.Atacar('ESPIA','Madera');
end;

procedure TTABLERO.ABASE3Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then Bom.Atacar('BASE','Madera');
  if (EquRojo = true) and (MODO = false) then BomEne.Atacar('BASE','Madera');
end;

procedure TTABLERO.AREFUGIO4Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then Bom.Atacar('REFUGIO','Madera');
  if (EquRojo = true) and (MODO = false) then BomEne.Atacar('REFUGIO','Madera');
end;

procedure TTABLERO.ASOLDADO5Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then Bom.Atacar('SOLDADO','Piedra');
  if (EquRojo = true) and (MODO = false) then BomEne.Atacar('SOLDADO','Piedra');
end;

procedure TTABLERO.ABOMBARDERO5Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then Bom.Atacar('BOMBER','Piedra');
  if (EquRojo = true) and (MODO = false) then BomEne.Atacar('BOMBER','Piedra');
end;

procedure TTABLERO.AESPIA5Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then Bom.Atacar('ESPIA','Piedra');
  if (EquRojo = true) and (MODO = false) then BomEne.Atacar('ESPIA','Piedra');
end;

procedure TTABLERO.ABASE4Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then Bom.Atacar('BASE','Piedra');
  if (EquRojo = true) and (MODO = false) then BomEne.Atacar('BASE','Piedra');
end;

procedure TTABLERO.AREFUGIO5Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then Bom.Atacar('REFUGIO','Piedra');
  if (EquRojo = true) and (MODO = false) then BomEne.Atacar('REFUGIO','Piedra');
end;

procedure TTABLERO.ASOLDADO6Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then Bom.Atacar('SOLDADO','Metal');
  if (EquRojo = true) and (MODO = false) then BomEne.Atacar('SOLDADO','Metal');
end;

procedure TTABLERO.ABOMBARDERO6Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then Bom.Atacar('BOMBER','Metal');
  if (EquRojo = true) and (MODO = false) then BomEne.Atacar('BOMBER','Metal');
end;

procedure TTABLERO.AESPIA6Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then Bom.Atacar('ESPIA','Metal');
  if (EquRojo = true) and (MODO = false) then BomEne.Atacar('ESPIA','Metal');
end;

procedure TTABLERO.ABASE5Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then Bom.Atacar('BASE','Metal');
  if (EquRojo = true) and (MODO = false) then BomEne.Atacar('BASE','Metal');
end;

procedure TTABLERO.AREFUGIO6Click(Sender: TObject);
begin
  Bom.Habilitado := true;
  if EquAzul = true then Bom.Atacar('REFUGIO','Metal');
  if (EquRojo = true) and (MODO = false) then BomEne.Atacar('REFUGIO','Metal');
end;


{------------------------------------------------------------------------- espia }

procedure TTABLERO.MADERA13Click(Sender: TObject);
begin
  if EquAzul = true then
    begin
      Spy.Abilitado := true;
      Spy.IrMaterial('Madera1');
      IR_POR_MADERA1('ESPIA');
    end;
  if (EquRojo = true) and (MODO = false) then
    begin
      SpyEne.IrMaterial('Madera1');
      IR_POR_MADERA1('ESPIA_ENEMIGO');
    end;
end;

procedure TTABLERO.MADERA23Click(Sender: TObject);
begin
  if EquAzul = true then
    begin
      Spy.Abilitado := true;
      Spy.IrMaterial('Madera2');
      IR_POR_MADERA2('ESPIA');
    end;
  if (EquRojo = true) and (MODO = false) then
    begin
      SpyEne.IrMaterial('Madera2');
      IR_POR_MADERA2('ESPIA_ENEMIGO');
    end;
end;

procedure TTABLERO.PIEDRA13Click(Sender: TObject);
begin
   if EquAzul = true then
    begin
      Spy.Abilitado := true;
      Spy.IrMaterial('Piedra1');
      IR_POR_PIEDRA1('ESPIA');
    end;
  if (EquRojo = true) and (MODO = false) then
    begin
      SpyEne.IrMaterial('Piedra1');
      IR_POR_PIEDRA1('ESPIA_ENEMIGO');
    end;
end;

procedure TTABLERO.PIEDRA23Click(Sender: TObject);
begin
   if EquAzul = true then
    begin
      Spy.Abilitado := true;
      Spy.IrMaterial('Piedra2');
      IR_POR_PIEDRA2('ESPIA');
    end;
  if (EquRojo = true) and (MODO = false) then
    begin
      SpyEne.IrMaterial('Piedra2');
      IR_POR_PIEDRA2('ESPIA_ENEMIGO');
    end;
end;

procedure TTABLERO.METAL13Click(Sender: TObject);
begin
   if EquAzul = true then
    begin
      Spy.Abilitado := true;
      Spy.IrMaterial('Metal1');
      IR_POR_METAL1('ESPIA');
    end;
  if (EquRojo = true) and (MODO = false) then
    begin
      SpyEne.IrMaterial('Metal1');
      IR_POR_METAL1('ESPIA_ENEMIGO');
    end;
end;

procedure TTABLERO.METAL23Click(Sender: TObject);
begin
   if EquAzul = true then
    begin
      Spy.Abilitado := true;
      Spy.IrMaterial('Metal2');
      IR_POR_METAL2('ESPIA');
    end;
  if (EquRojo = true) and (MODO = false) then
    begin
      SpyEne.IrMaterial('Metal2');
      IR_POR_METAL2('ESPIA_ENEMIGO');
    end;
end;

procedure TTABLERO.ASOLDADO7Click(Sender: TObject);
begin
  if EquAzul = true then begin Spy.Abilitado := true;; Spy.Atacar('SOLDADO','Madera'); end;
  if (EquRojo = true) and (MODO = false) then SpyEne.Atacar('SOLDADO','Madera');
end;

procedure TTABLERO.ABOMBARDERO7Click(Sender: TObject);
begin
  if EquAzul = true then begin Spy.Abilitado := true; Spy.Atacar('BOMBER','Madera');end;
  if (EquRojo = true) and (MODO = false) then SpyEne.Atacar('BOMBER','Madera');
end;

procedure TTABLERO.AESPIA7Click(Sender: TObject);
begin
  if EquAzul = true then begin Spy.Abilitado := true;Spy.Atacar('ESPIA','Madera');end;
  if (EquRojo = true) and (MODO = false) then SpyEne.Atacar('ESPIA','Madera');
end;

procedure TTABLERO.ABASE6Click(Sender: TObject);
begin
  if EquAzul = true then begin Spy.Abilitado := true;Spy.Atacar('BASE','Madera');end;
  if (EquRojo = true) and (MODO = false) then SpyEne.Atacar('BASE','Madera');
end;

procedure TTABLERO.AREFUGIO7Click(Sender: TObject);
begin
  if EquAzul = true then begin Spy.Abilitado := true;Spy.Atacar('REFUGIO','Madera');end;
  if (EquRojo = true) and (MODO = false) then SpyEne.Atacar('REFUGIO','Madera');
end;

procedure TTABLERO.ASOLDADO8Click(Sender: TObject);
begin
  if EquAzul = true then begin Spy.Abilitado := true;Spy.Atacar('SOLDADO','Piedra');end;
  if (EquRojo = true) and (MODO = false) then SpyEne.Atacar('SOLDADO','Piedra');
end;

procedure TTABLERO.ABOMBARDERO8Click(Sender: TObject);
begin
  if EquAzul = true then begin Spy.Abilitado := true;Spy.Atacar('BOMBER','Piedra'); end;
  if (EquRojo = true) and (MODO = false) then SpyEne.Atacar('BOMBER','Piedra');
end;

procedure TTABLERO.AESPIA8Click(Sender: TObject);
begin
  if EquAzul = true then begin Spy.Abilitado := true;Spy.Atacar('ESPIA','Piedra'); end;
  if (EquRojo = true) and (MODO = false) then SpyEne.Atacar('ESPIA','Piedra');
end;

procedure TTABLERO.ABASE7Click(Sender: TObject);
begin
  if EquAzul = true then begin Spy.Abilitado := true;Spy.Atacar('BASE','Piedra'); end;
  if (EquRojo = true) and (MODO = false) then SpyEne.Atacar('BASE','Piedra');
end;

procedure TTABLERO.AREFUGIO8Click(Sender: TObject);
begin
  if EquAzul = true then begin Spy.Abilitado := true;Spy.Atacar('REFUGIO','Piedra'); end;
  if (EquRojo = true) and (MODO = false) then SpyEne.Atacar('REFUGIO','Piedra');
end;

procedure TTABLERO.ASOLDADO9Click(Sender: TObject);
begin
  if EquAzul = true then begin Spy.Abilitado := true;Spy.Atacar('SOLDADO','Metal'); end;
  if (EquRojo = true) and (MODO = false) then SpyEne.Atacar('SOLDADO','Metal');
end;

procedure TTABLERO.ABOMBARDERO9Click(Sender: TObject);
begin
  if EquAzul = true then begin Spy.Abilitado := true;Spy.Atacar('BOMBER','Metal');end;
  if (EquRojo = true) and (MODO = false) then SpyEne.Atacar('BOMBER','Metal');
end;

procedure TTABLERO.AESPIA9Click(Sender: TObject);
begin
  if EquAzul = true then begin Spy.Abilitado := true;Spy.Atacar('ESPIA','Metal');end;
  if (EquRojo = true) and (MODO = false) then SpyEne.Atacar('ESPIA','Metal');
end;

procedure TTABLERO.ABASE8Click(Sender: TObject);
begin
  if EquAzul = true then begin Spy.Abilitado := true;Spy.Atacar('BASE','Metal');end;
  if (EquRojo = true) and (MODO = false) then SpyEne.Atacar('BASE','Metal');
end;

procedure TTABLERO.AREFUGIO9Click(Sender: TObject);
begin
  if EquAzul = true then begin Spy.Abilitado := true;Spy.Atacar('REFUGIO','Metal');end;
  if (EquRojo = true) and (MODO = false) then SpyEne.Atacar('REFUGIO','Metal');
end;

procedure TTABLERO.COMPRAR2Click(Sender: TObject);
begin
   if EquAzul = true then begin Bom.Habilitado := true; Bom.desplazate(705,25,10); end;
end;

procedure TTABLERO.COMPRAR1Click(Sender: TObject);
begin
 if EquAzul = true then Soldado.desplazate(705,25,10);
end;

procedure TTABLERO.COMPRAR3Click(Sender: TObject);
begin
 if EquAzul = true then Spy.desplazate(705,25,10);
end;



procedure TTABLERO.IRPORMADERA11Click(Sender: TObject);
begin
 if EquAzul = true then Robot.IrMaterial('Madera1');
end;

procedure TTABLERO.IRPORMADERA21Click(Sender: TObject);
begin
 if EquAzul = true then Robot.IrMaterial('Madera2');
end;

procedure TTABLERO.IRPORMETAL11Click(Sender: TObject);
begin
 if EquAzul = true then Robot.IrMaterial('Metal1');
end;

procedure TTABLERO.IRPORMETAL21Click(Sender: TObject);
begin
 if EquAzul = true then Robot.IrMaterial('Metal2');
end;

procedure TTABLERO.IRPORPIEDRA11Click(Sender: TObject);
begin
 if EquAzul = true then Robot.IrMaterial('Piedra1');
end;

procedure TTABLERO.IRPORPIEDRA21Click(Sender: TObject);
begin
 if EquAzul = true then Robot.IrMaterial('Piedra2');
end;

{============================================================ configuración de Guardianes}
procedure TTABLERO.SUR1Click(Sender: TObject);
begin
 if Guardianes > 0 then Guardian1.Orientacion := 'Sur';
end;

procedure TTABLERO.ESTE1Click(Sender: TObject);
begin
 if Guardianes > 0 then Guardian1.Orientacion := 'Este';
end;

procedure TTABLERO.SUR2Click(Sender: TObject);
begin
 if Guardianes > 1 then Guardian2.Orientacion := 'Sur';
end;

procedure TTABLERO.ESTE2Click(Sender: TObject);
begin
  if Guardianes > 1 then Guardian2.Orientacion := 'Este';
end;


{================================================================ ROBOT}


////////////////////////////////////////////////////////////////////////////////
///////////////////////  PROCESA MENSAJES   ////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

                     {**** soldado *** }
procedure TTABLERO.MuestraComprasS(var Msg : TMessage);
begin
  if Msg.WParam = 1 then Eq_EqE := true;    // equipo solicita comprar
  if Msg.WParam = 0 then Eq_EqE := false;   // EEnemigo solicita comprar;
  {compras de equipo}
  Tablero.PopupMenu := MenuCompras;
  Tablero.MenuCompras.Popup(550,30);
end;

procedure TTABLERO.SANGRE1Click(Sender: TObject);
begin
 if Eq_EqE = true then
   begin
       if (Soldado.Left = 721)                 and
          (UTablero.MaderaTotalEqu >= 1)       and
          (UTablero.MetalTotalEqu  >= 1)       and
          (UTablero.PiedraTotalEqu >= 1 )      then
          SendMessage(Tablero.Handle,WM_USER + 665,0,0); {Soldado compró sangre}

       if (Bom.Left = 721)                 and
          (UTablero.MaderaTotalEqu >= 1)       and
          (UTablero.MetalTotalEqu  >= 1)       and
          (UTablero.PiedraTotalEqu >= 1 )      then
          SendMessage(Tablero.Handle,WM_USER + 607,0,0); {Bomber compró sangre}

       if (Spy.Left = 721)                 and
          (UTablero.MaderaTotalEqu >= 1)       and
          (UTablero.MetalTotalEqu  >= 1)       and
          (UTablero.PiedraTotalEqu >= 1 )      then
          SendMessage(Tablero.Handle,WM_USER + 680,0,0); {Espia compró sangre}
   end;

end;

procedure TTABLERO.ROBOT2Click(Sender: TObject);
begin
 if Eq_EqE = true then
   begin
      UTablero.MaderaTotalEqu := Base.MaderaAlmacenada;
      UTablero.MetalTotalEqu  := Base.MetalAlmacenado;
      UTablero.PiedraTotalEqu := Base.PiedraAlmacenada;
      if (UTablero.MaderaTotalEqu >= 20)      and
     (UTablero.MetalTotalEqu  >= 20)      and
     (UTablero.PiedraTotalEqu >= 20)     then
     SendMessage(Tablero.Handle,WM_USER + 600,0,0); {compraron un ROBOT}
   end;
end;

procedure TTABLERO.VIGILANTE1Click(Sender: TObject);
begin
  if Eq_EqE = true then
   begin
      UTablero.MaderaTotalEqu := Base.MaderaAlmacenada;
      UTablero.MetalTotalEqu  := Base.MetalAlmacenado;
      UTablero.PiedraTotalEqu := Base.PiedraAlmacenada;
      if (UTablero.MaderaTotalEqu >= 20)      and
      (UTablero.MetalTotalEqu  >= 20)      and
      (UTablero.PiedraTotalEqu >= 20 )     and
      (UTablero.Guardianes < 2)            then
      SendMessage(Tablero.Handle,WM_USER + 759,0,0); {compraron un GUARDIAN}
   end;
end;

procedure TTABLERO.BOMBA1Click(Sender: TObject);
begin
  if Eq_EqE = true then
   begin
      UTablero.MaderaTotalEqu := Base.MaderaAlmacenada;
      UTablero.MetalTotalEqu  := Base.MetalAlmacenado;
      UTablero.PiedraTotalEqu := Base.PiedraAlmacenada;
      if (UTablero.MaderaTotalEqu >= 5)       and
         (UTablero.MetalTotalEqu  >= 5)       and
         (UTablero.PiedraTotalEqu >= 5)       then
              SendMessage(Tablero.Handle,WM_USER + 280,0,0); {compraron una BOMBA}
   end;
end;


procedure TTABLERO.ANTIBOMBAS1Click(Sender: TObject);
begin
  if Eq_EqE = true then
    begin
      UTablero.MaderaTotalEqu := Base.MaderaAlmacenada;
      UTablero.MetalTotalEqu  := Base.MetalAlmacenado;
      UTablero.PiedraTotalEqu := Base.PiedraAlmacenada;
      if (UTablero.MaderaTotalEqu >= 5)       and
         (UTablero.MetalTotalEqu  >= 5)       and
         (UTablero.PiedraTotalEqu >= 5)       then
            SendMessage(Tablero.Handle,WM_USER + 265,0,0); {compraron una ANTI-BOMBAS}
     end; 
end;

                    {***  bomber   ****}
procedure TTABLERO.MuestraComprasB(var Msg : TMessage);
begin
  if Msg.WParam = 1 then Eq_EqE := true;    // equipo solicita comprar
  if Msg.WParam = 0 then Eq_EqE := false;   // EEnemigo solicita comprar;
  {compras de equipo}
  Tablero.PopupMenu := MenuCompras;
  Tablero.MenuCompras.Popup(550,30);
end;

                    {***  espia   ****}
procedure TTABLERO.MuestraComprasE(var Msg : TMessage);
begin
  if Msg.WParam = 1 then Eq_EqE := true;    // equipo solicita comprar
  if Msg.WParam = 0 then Eq_EqE := false;   // EEnemigo solicita comprar;
  {compras de equipo}
  Tablero.PopupMenu := MenuCompras;
  Tablero.MenuCompras.Popup(550,30);
end;
{---------------------------------------------------------------- equ compra Robot}
procedure TTablero.EquComproRobot(var Msg : TMessage);
begin
  Base.MaderaAlmacenada := Base.MaderaAlmacenada - 20;
  Base.MetalAlmacenado  := Base.MetalAlmacenado  - 20;
  Base.PiedraAlmacenada := Base.PiedraAlmacenada - 20;
  Robot := TRobot.Create(Self);;
  Robot.Parent := self;
  Robot.Left   := 40;
  Robot.Top    := 20;
  Robot.Cursor := crNo;
end;

{------------------------------------------------------------------ equ compra Guardian}
procedure TTablero.EquComproGuar(var Msg : TMessage);
begin
  Base.MaderaAlmacenada := Base.MaderaAlmacenada - 20;
  Base.MetalAlmacenado  := Base.MetalAlmacenado  - 20;
  Base.PiedraAlmacenada := Base.PiedraAlmacenada - 20;
  Guardianes := Guardianes + 1;
    if Guardianes = 1 then
      begin
        Guardian1 := TGuardian.Create(Self);
        Guardian1.Parent := self;
        Guardian1.Left := 10;
        Guardian1.Top  := 10;
        Guardian1.Orientacion := 'Sur';
        Guardian1.Cursor := crNo;
      end;

    if Guardianes = 2 then
      begin
        Guardian2 := TGuardian.Create(Self);
        Guardian2.Parent := self;
        Guardian2.Left := 10;
        Guardian2.Top  := 10;
        Guardian2.Orientacion := 'Sur';
        Guardian2.Cursor := crNo;
      end;
end;

{----------------------------------------------------------------------- equ compró bomba}
procedure TTablero.EquComproBomba(var Msg : TMessage);
begin
  Bombas := Bombas + 1;
  Base.Bombas := Bombas;
  Base.MaderaAlmacenada := Base.MaderaAlmacenada - 5;
  Base.PiedraAlmacenada := Base.PiedraAlmacenada - 5;
  Base.MetalAlmacenado  := Base.MetalAlmacenado  - 5;
end;

procedure TTablero.EquComproAntiBombas(var Msg : TMessage);
begin
  AntiBombas := Base.AntiBombas + 1;
  Base.AntiBombas := AntiBombas;
  Base.MaderaAlmacenada := Base.MaderaAlmacenada - 5;
  Base.MetalAlmacenado  := Base.MetalAlmacenado  - 5;
  Base.PiedraAlmacenada := Base.PiedraAlmacenada - 5;
end;


{---------------------------------------------------------------------- soldado compra sangre}
procedure TTablero.BloodToSoldier(var Msg : TMessage);
begin
  Soldado.Resistencia    := Soldado.Resistencia + 2;
  Base.MaderaAlmacenada  := Base.MaderaAlmacenada - 1;
  Base.MetalAlmacenado   := Base.MetalAlmacenado  - 1;
  Base.PiedraAlmacenada  := Base.PiedraAlmacenada - 1;
end;

{---------------------------------------------------------------------- Bomber compra sangre}
procedure TTablero.BloodToBomber(var Msg : TMessage);
begin
  Bom.Resistencia        := Bom.Resistencia + 2;
  Base.MaderaAlmacenada  := Base.MaderaAlmacenada - 1;
  Base.MetalAlmacenado   := Base.MetalAlmacenado  - 1;
  Base.PiedraAlmacenada  := Base.PiedraAlmacenada - 1;
end;

{---------------------------------------------------------------------- Espia compra sangre}
procedure TTablero.BloodToEspia(var Msg : TMessage);
begin
  Spy.Resistencia        := Spy.Resistencia + 2;
  Base.MaderaAlmacenada  := Base.MaderaAlmacenada - 1;
  Base.MetalAlmacenado   := Base.MetalAlmacenado  - 1;
  Base.PiedraAlmacenada  := Base.PiedraAlmacenada - 1;
end;

{------------------------------------------------------------------------ Bomba Explota}
procedure TTablero.Explote(var Msg : TMessage);
begin
  Bomba.Estallada := false;
  Bomba.Free;
  {Código de prueba}
  BombNow := false;
end;

{----------------------------------------------------------------------- Autodestruccion de Anti-Bombas}
procedure TTablero.Atodestruccion(var Msg : TMessage);
begin
  Anti.Habilitado := false;
  Anti.Free;
  {Código de prueba}
  AntiNow := false;
end;

{--------------------------------------------------------------------- BOMBER PONE BOMBA}
procedure TTablero.PongoBombaEqu(var Msg : TMessage);
begin
  Bomba              := TBomba.Create(Self);
  Bomba.Parent       := Self;
  Bomba.Cursor       := crNo;
  Bomba.Left         := Msg.WParam;
  Bomba.Top          := Msg.LParam;
  Bomba.Visible      := true;
  Bomba.Habilitada   := True;
  Base.Bombas        := Base.Bombas - 1;
  {codigo de prueba}
  BombNow            := true;

end;

{----------------------------------------------------------------------- BOMBER COLOCA ANTI-BOMBAS}
procedure TTablero.PongoAntiBombaEq(var Msg : TMessage);
begin
  Anti             := TAntiBombas.Create(Self);
  Anti.Parent      := Self;
  Anti.Left        := Msg.WParam;
  Anti.Top         := Msg.LParam;
  Anti.Habilitado  := true;
  Anti.Cursor      := crNo;
  Base.AntiBombas  := Base.AntiBombas - 1;
  AntiNow          := true;
end;

{------------------------------------------------------  EQUIPO RECOGIÓ TARGETA DEL PODER}
procedure TTablero.EquRecogeTargeta(var Msg : TMessage);
begin
  if carta = true then
    begin
      Power.Free;
      carta := false;
      Base.Targetas := Base.Targetas + 1;
    end;
end;

{---------------------------------------------------------- destruye TORNADO}
procedure TTablero.TornadoDestruyeme(var Msg : TMessage);
begin
  Torna := false;
  Tornado.Free;
end;







procedure TTABLERO.Image7Click(Sender: TObject);
var
 loca : TPoint;
begin

if desplazoSol = true then
   begin
     desplazoSol := false;
     Screen.Cursor := crDefault;
     GetCursorPos(loca);
     soldado.desplazate(loca.X-5,loca.Y-30,10);
   end;

 if desplazoSolE = true then
   begin
     SolEne.Habilitado := true;
     desplazoSolE := false;
     Screen.Cursor := crDefault;
     GetCursorPos(loca);
     solEne.desplazate(loca.X-5,loca.Y-30,10);
   end;

 if desplazoBom = true then
   begin
     desplazoBom := false;
     Screen.Cursor := crDefault;
     GetCursorPos(loca);
     Bom.desplazate(loca.X-5,loca.Y-30,10);
   end;

   if (BombardearEqu = true) and (Base.Bombas > 0) then    {BOMBARDEANDO}
   begin
     BombardearEqu := false;
     Bombas        := Bombas - 1;
     Screen.Cursor := crDefault;
     GetCursorPos(loca);
     Bom.Velocidad := 10;
     Bom.Bombardear(Loca.X-5,loca.Y-30);
   end;

end;

procedure TTABLERO.IRPORTARGETA1Click(Sender: TObject);
begin
 iF EquAzul = true then Soldado.IrCarta;
end;

procedure TTABLERO.IRPORTARGETA2Click(Sender: TObject);
begin
  if EquAzul = true then Bom.IrCarta;
end;












end.
