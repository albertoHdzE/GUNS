unit BaseEnemiga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, stdCtrls;


  const
 {mensajes de soldado}
 MSendCooBESol    = WM_USER + 88;        // pide coordenadas
 MResAtacSolWood  = WM_USER + 171;       // recibe ataque de soldado con madera
 MResAtacSolRock  = WM_USER + 446;       // recibe ataque de soldado con madera
 MResAtacSolMetal = WM_USER + 297;       // recibe ataque de soldado con madera

 {MENSAJES DE BOMBER}
 MSendCoo_Bom      = WM_USER + 395;        // pide coordenadas
 MResAtacWood_Bom  = WM_USER + 234;        // Ataque con madera
 MResAtacRock_Bom  = WM_USER + 338;        // Ataque con Piedra
 MResAtacMetal_Bom = WM_USER + 222;        // Ataque con Metal

 {MENSAJES DE ESPIA}
 MSendCoo_Esp      = WM_USER + 319;        // pide coordenadas
 MResAtacWood_Esp  = WM_USER + 201;        // Ataque con madera
 MResAtacRock_Esp  = WM_USER + 320;        // Ataque con Piedra
 MResAtacMetal_Esp = WM_USER + 532;        // Ataque con Metal

 {mensajes de espia}
// MSendCooBEEsp   = WM_USER + 119;        // pide coordenadas

 {MENSAJES DE SOLDADO ENEMIGO}
 MSendMeCoo_SolE       = WM_USER + 163;        // dame coordenadas
 MGiveMeWoodGun_SolE   = WM_USER + 249;        // dame arma de madera
 MGiveMeRockGun_SolE   = WM_USER + 512;        // dame arma de piedra
 MGiveMeMetalGun_SolE  = WM_USER + 504;       // dame arma de metal


 {MENSAJES DE ESPIA ENEMIGO}
 MSendMeCoorEspE     = WM_USER + 583;     // deme coordenadas
 MGiveMeWoodEspE     = WM_USER + 246;     // dame madera para construir
 MGiveMeMetalEspE    = WM_USER + 368;     //      metal  para construir
 MGiveMePiedraEspE   = WM_USER + 213;     //      piedra para construir

 MGiveMeWoodGun_EspE   = WM_USER + 519;       // dame arma de madera
 MGiveMeRockGun_EspE   = WM_USER + 369;       // dame arma de metal
 MGiveMeMetalGun_EspE  = WM_USER + 537;       // dame arma de piedra

 {MENSAJES DE BOMBER ENEMIGO}
 MSendMeCooBomE     = WM_USER + 233;       // dame coordenadas
 MGiveMeWoodBomE    = WM_USER + 365;       // dame madera para construir
 MGiveMeMetalBomE   = WM_USER + 144;       //      metal  para construir
 MGiveMePiedraBomE  = WM_USER + 359;       //      piedra para construir

 MGiveMeWoodGun_BomE   = WM_USER + 557;       // dame arma de madera
 MGiveMeRockGun_BomE   = WM_USER + 376;       // dame arma de metal
 MGiveMeMetalGun_BomE  = WM_USER + 581;       // dame arma de piedra


 {MENSAHES DE EQUIPO ENEMIGO}
 MResWoodE        = WM_USER + 90;        // recibe madera
 MResMetalE       = WM_USER + 91;        // recibe metal
 MResRockE        = WM_USER + 92;        // recibe piedra



type
  TBaseEnemiga = class(TGraphicControl)
  private
 {-------}
    FBitmap            : TBitmap;
    FColor             : TColor;
    FResistencia       : Integer;
    Fposicion          : String;
    FMetalAlmacenado   : Integer;
    FMaderaAlmacenada  : Integer;
    FPiedraAlmacenada  : Integer;
    FTimer             : TTimer;

    procedure SetColor(Color : TColor);
    {---------------------  MENSAJES RECIBIDOS---------------------}
    procedure SendCooBESol        (var Msg : TMessage);  message MSendCooBESol;
    procedure ResWoodE            (Var Msg : TMessage);  message MResWoodE;
    procedure ResMetalE           (Var Msg : TMessage);  message MResMetalE;
    procedure ResRockE            (Var Msg : TMessage);  message MResRockE;
    procedure GiveMeWoodEspE      (Var Msg : TMessage);  message MGiveMeWoodEspE;
    procedure GiveMeMetalEspE     (Var Msg : TMessage);  message MGiveMeMetalEspE;
    procedure GiveMePiedraEspE    (Var Msg : TMessage);  message MGiveMePiedraEspE;
    procedure GiveMeWoodBomE      (Var Msg : TMessage);  message MGiveMeWoodBomE;
    procedure GiveMeMetalBomE     (Var Msg : TMessage);  message MGiveMeMetalBomE;
    procedure GiveMePiedraBomE    (Var Msg : TMessage);  message MGiveMePiedraBomE;
    procedure ResAtacSolWood      (Var Msg : TMessage);  message MResAtacSolWood;
    procedure ResAtacSolRock      (Var Msg : TMessage);  message MResAtacSolRock;
    procedure ResAtacSolMetal     (Var Msg : TMessage);  message MResAtacSolMetal;
    procedure SendMeCooBomE       (Var Msg : TMessage);  message MSendMeCooBomE;
    procedure SendMeCooEspE       (Var Msg : TMessage);  message MSendMeCoorEspE;
    procedure SendCoo_Bom         (Var Msg : TMessage);  message MSendCoo_Bom;
    procedure ResAtacWood_Bom     (Var Msg : TMessage);  message MResAtacWood_Bom;
    procedure ResAtacRock_Bom     (Var Msg : TMessage);  message MResAtacRock_Bom;
    procedure ResAtacMetal_Bom    (Var Msg : TMessage);  message MResAtacMetal_Bom;
    procedure SendCoo_Esp         (Var Msg : TMessage);  message MSendCoo_Esp;
    procedure ResAtacWood_Esp     (Var Msg : TMessage);  message MResAtacWood_Esp;
    procedure ResAtacRock_Esp     (Var Msg : TMessage);  message MResAtacRock_Esp;
    procedure ResAtacMetal_Esp    (Var Msg : TMessage);  message MResAtacMetal_Esp;
    procedure SendMeCoo_SolE      (Var Msg : TMessage);  message MSendMeCoo_SolE;
    procedure GiveMeWoodGun_SolE  (Var Msg : TMessage);  message MGiveMeWoodGun_SolE;
    procedure GiveMeRockGun_SolE  (Var Msg : TMessage);  message MGiveMeRockGun_SolE;
    procedure GiveMeMetalGun_SolE (Var Msg : TMessage);  message MGiveMeMetalGun_SolE;
    procedure GiveMeWoodGun_BomE  (Var Msg : TMessage);  message MGiveMeWoodGun_BomE;
    procedure GiveMeRockGun_BomE  (Var Msg : TMessage);  message MGiveMeRockGun_BomE;
    procedure GiveMeMetalGun_BomE (Var Msg : TMessage);  message MGiveMeMetalGun_BomE;
    procedure GiveMeWoodGun_EspE  (Var Msg : TMessage);  message MGiveMeWoodGun_EspE;
    procedure GiveMeRockGun_EspE  (Var Msg : TMessage);  message MGiveMeRockGun_EspE;
    procedure GiveMeMetalGun_EspE (Var Msg : TMessage);  message MGiveMeMetalGun_EspE;


  protected
 {---------}
    procedure paint; override;
    Function  GetPosicion:String;
    procedure OnTimer(Sender : TObject); virtual;

  public
 {------}
    constructor Create(AOwner: TComponent); override;
    destructor destroy; override;
    property MetalAlmacenado : Integer read FMetalAlmacenado  write FMetalAlmacenado;
    property MaderaAlmacenada: Integer read FMaderaAlmacenada write FMaderaAlmacenada;
    property PiedraAlmacenada: Integer read FPiedraAlmacenada write FPiedraAlmacenada;
    property Resistencia     : integer read FResistencia      write FResistencia;

  published
 {---------}
    property Color    : TColor   read FColor write SetColor;
    property Posicion : String   read GetPosicion;
    property Hint;
    property ShowHint;
  end;

procedure Register;


implementation
var
  Mensaje : TMessage;


{-------------------------------------------------------------  constructor}
constructor TBaseEnemiga.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := ControlStyle + [csOpaque];
  FBitmap := TBitmap.Create;
  Width := 40;
  Height := 40;
  MaderaAlmacenada := 0;
  PiedraAlmacenada := 0;
  MetalAlmacenado  := 0;
  FResistencia     := 60;
  ShowHint := true;
  Hint := 'Madera = ' + IntToStr(MaderaAlmacenada) + #13 +
          'Piedra = ' + IntToStr(PiedraAlmacenada) + #13 +
          'Metal = '    + IntToStr(MetalAlmacenado);

  FColor := clBlue;
  FTimer := TTimer.Create(Self);
  FTimer.Interval := 20;
  FTimer.OnTimer := OnTimer;
  FTimer.Enabled := true;
end;
{-------------------------------------------------------------  destructor}
destructor TBaseEnemiga.destroy;
begin
 FBitmap.Free;
 inherited destroy;
end;

{-------------------------------------------------------------  Establece color}
procedure TBaseEnemiga.SetColor(Color: TColor);
begin
  if FColor <> Color then
    begin
      FColor := Color;
      Repaint;
    end;
end;

{-------------------------------------------------------------  Dibuja}
procedure TBaseEnemiga.paint;
var
 Rectangulo : TRect;
begin
  rectangulo := rect(0,0,Width,Height);
  FBitmap.Width := Width;
  FBitmap.Height := Height;
  FBitmap.Canvas.Brush.Color := FColor;
  FBitmap.Canvas.FillRect(rectangulo);
  FBitmap.Canvas.Pen.Color := clBlue;
  FBitmap.Canvas.Brush.Color := clRed;
  FBitmap.Canvas.Polygon([Point(10,0),Point(20,20),Point(30,0)]);
  FBitmap.Canvas.Polygon([Point(0,10),Point(20,20),Point(0,30)]);
  FBitmap.Canvas.Polygon([Point(10,40),Point(20,20),Point(30,40)]);
  FBitmap.Canvas.Polygon([Point(40,10),Point(20,20),Point(40,30)]);
  Canvas.Draw(0,0,FBitmap);
end;

{----------------------------------------------------------- Obtiene la posición en un string}
Function TBaseEnemiga.GetPosicion: String;
var
 S: String;
begin
 FPosicion := '';
 Str(Left,S);
 FPosicion := '(' + S + ',';
 Str(Top,S);
 FPosicion := FPosicion + S + ')';
 GetPosicion := FPosicion;
end;


{---------------------------------------------------------------------- recepcion de materiales}
//recibe madera
procedure TBaseEnemiga.ResWoodE(var Msg : TMessage);
begin
  MaderaAlmacenada := MaderaAlmacenada + 1;
end;
// recibe metal
procedure TBaseEnemiga.ResMetalE(var Msg : TMessage);
begin
  MetalAlmacenado := MetalAlmacenado + 1;
end;
// recibe piedra
procedure TBaseEnemiga.ResRockE(var Msg : TMessage);
begin
  PiedraAlmacenada := PiedraAlmacenada + 1;
end;

////////////////////////////////////////////////////////////////////////////////
/////////////////  ESPIA ENEMIGO PIDE MATERIALES ///////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBaseEnemiga.SendMeCooEspE(var Msg : TMessage);    {ESPIA ENE PIDE COORDENADAS}
begin
  Mensaje.Msg := WM_USER + 539;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseEnemiga.GiveMeWoodEspE(var Msg: TMessage);         {ESPIA ENEMIGO PIDE MADERA}
begin
   Mensaje.Msg := WM_USER + 472;
   if FMaderaAlmacenada = 0 then Mensaje.WParam := 0;
   If FMaderaAlmacenada > 0 then
    begin
     Mensaje.WParam := 1;
     FMaderaAlmacenada := FMaderaAlmacenada - 1;
    end;

   Mensaje.LParam := 0;
   Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
end;


procedure TBaseEnemiga.GiveMeMetalEspE(var Msg : TMessage);        {ESPIA ENEMIGO PIDE METAL}
begin
  Mensaje.Msg := WM_USER + 501;
  if FMetalAlmacenado = 0 then Mensaje.WParam := 0;
  if FMetalAlmacenado > 0 then
    begin
      Mensaje.WParam := 1;
      FMetalAlmacenado := FMetalAlmacenado - 1;
    end;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;


procedure TBaseEnemiga.GiveMePiedraEspE(var Msg : TMessage);        {ESPIA ENEMIGO PIDE PIEDRA}
begin
 Mensaje.Msg := WM_USER + 199;
 if FPiedraAlmacenada = 0 then Mensaje.WParam := 0;
  if FPiedraAlmacenada > 0 then
    begin
      Mensaje.WParam := 1;
      FPiedraAlmacenada := FPiedraAlmacenada - 1;
    end;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseEnemiga.GiveMeWoodGun_EspE(var Msg: TMessage);    {SOLICITA arma MADERA}
begin
  Mensaje.Msg := WM_USER + 432;
  if FMaderaAlmacenada = 0 then Mensaje.WParam := 0;
  if FMaderaAlmacenada > 0 then
    begin
      Mensaje.WParam := 1;
      FMaderaAlmacenada := FMaderaAlmacenada - 1;
    end;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseEnemiga.GiveMeMetalGun_EspE(var Msg : TMessage);   {SOLICITA arma METAL}
begin
  Mensaje.Msg := WM_USER + 251;
  if FMetalAlmacenado <= 2 then Mensaje.WParam := 0;
  if FMetalAlmacenado > 2 then
    begin
      Mensaje.WParam := 1;
      FMetalAlmacenado := FMetalAlmacenado - 3;
    end;

  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseEnemiga.GiveMeRockGun_EspE(var Msg : TMessage);     {SOLICITA arma PIEDRA}
begin
 Mensaje.Msg := WM_USER + 238;
 if FPiedraAlmacenada <= 1 then Mensaje.WParam := 0;
  if FPiedraAlmacenada > 1 then
    begin
      Mensaje.WParam := 1;
      FPiedraAlmacenada := FPiedraAlmacenada - 2;
    end;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;


////////////////////////////////////////////////////////////////////////////////
/////////////////  bomber ENEMIGO PIDE MATERIALES //////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBaseEnemiga.SendMeCooBomE(var Msg : TMessage);    {BOMBER ENEMIGO PIDE COORD}
begin
  Mensaje.Msg := WM_USER + 273;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseEnemiga.GiveMeWoodBomE(var Msg: TMessage);     {BOMBER ENEMIGO PIDE MADERA}
begin
   Mensaje.Msg := WM_USER + 313;
   if FMaderaAlmacenada = 0 then Mensaje.WParam := 0;
   If FMaderaAlmacenada > 0 then
    begin
     Mensaje.WParam := 1;
     FMaderaAlmacenada := FMaderaAlmacenada - 1;
    end;
   Mensaje.LParam := 0;
   Mensaje.Result := 0;
   Application.MainForm.Broadcast(Mensaje);
end;


procedure TBaseEnemiga.GiveMeMetalBomE(var Msg : TMessage);    {BOMBER ENEMIGO PIDE METAL}
begin
  Mensaje.Msg := WM_USER + 266;
  if FMetalAlmacenado = 0 then Mensaje.WParam := 0;
  if FMetalAlmacenado > 0 then
    begin
      Mensaje.WParam := 1;
      FMetalAlmacenado := FMetalAlmacenado - 1;
    end;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseEnemiga.GiveMePiedraBomE(var Msg : TMessage);     {BOMBER ENEMIGO PIDE PIEDRA}
begin
 Mensaje.Msg := WM_USER + 593;
 if FPiedraAlmacenada = 0 then Mensaje.WParam := 0;
  if FPiedraAlmacenada > 0 then
    begin
      Mensaje.WParam := 1;
      FPiedraAlmacenada := FPiedraAlmacenada - 1;
    end;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseEnemiga.GiveMeWoodGun_BomE(var Msg: TMessage);    {SOLICITA arma MADERA}
begin
  Mensaje.Msg := WM_USER + 357;
  if FMaderaAlmacenada = 0 then Mensaje.WParam := 0;
  if FMaderaAlmacenada > 0 then
    begin
      Mensaje.WParam := 1;
      FMaderaAlmacenada := FMaderaAlmacenada - 1;
    end;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseEnemiga.GiveMeMetalGun_BomE(var Msg : TMessage);   {SOLICITA arma METAL}
begin
  Mensaje.Msg := WM_USER + 190;
  if FMetalAlmacenado <= 2 then Mensaje.WParam := 0;
  if FMetalAlmacenado > 2 then
    begin
      Mensaje.WParam := 1;
      FMetalAlmacenado := FMetalAlmacenado - 3;
    end;

  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseEnemiga.GiveMeRockGun_BomE(var Msg : TMessage);     {SOLICITA arma PIEDRA}
begin
 Mensaje.Msg := WM_USER + 262;
 if FPiedraAlmacenada <= 1 then Mensaje.WParam := 0;
  if FPiedraAlmacenada > 1 then
    begin
      Mensaje.WParam := 1;
      FPiedraAlmacenada := FPiedraAlmacenada - 2;
    end;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;


////////////////////////////////////////////////////////////////////////////////
/////////////////  MENSAJES DE SOLDADO   //////// //////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBaseEnemiga.SendCooBESol(var Msg : TMessage);       {SOLDADO PIDE COORDENADAS}
begin
  Mensaje.Msg := WM_USER + 169;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseEnemiga.ResAtacSolWood(var Msg : TMessage);        {ATAQUE CON MADERA}
begin
 if FResistencia > 0 then  FResistencia := FResistencia - 1;
 if MaderaAlmacenada > 0 then MaderaAlmacenada := MaderaAlmacenada - 1;
end;

procedure TBaseEnemiga.ResAtacSolRock(var Msg : TMessage);        {ATAQUE CON PIEDRA}
begin
 if FResistencia <= 2 then FResistencia := 0;
 if PiedraAlmacenada <= 2 then PiedraAlmacenada := 0;
 if FResistencia > 1 then  FResistencia := FResistencia - 2;
 if PiedraAlmacenada > 1 then PiedraAlmacenada := PiedraAlmacenada - 2;
end;

procedure TBaseEnemiga.ResAtacSolMetal(var Msg : TMessage);        {ATAQUE CON METAL}
begin
 if FResistencia <= 3 then FResistencia := 0;
 if MetalAlmacenado <= 3 then MetalAlmacenado := 0;
 if FResistencia > 3 then  FResistencia := FResistencia - 3;
 if MetalAlmacenado > 3 then MetalAlmacenado := MetalAlmacenado - 3;
end;

////////////////////////////////////////////////////////////////////////////////
/////////////////  MENSAJES DE BOMBER    ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBaseEnemiga.SendCoo_Bom(var Msg : TMessage);        {PIDE COORDENADAS}
begin
 Mensaje.Msg := WM_USER + 445;
 Mensaje.WParam := Left;
 Mensaje.LParam := Top;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseEnemiga.ResAtacWood_Bom(var Msg : TMessage);        {ATAQUE CON MADERA}
begin
 if FResistencia > 0 then  FResistencia := FResistencia - 1;
 if MaderaAlmacenada > 0 then MaderaAlmacenada := MaderaAlmacenada - 1;
end;

procedure TBaseEnemiga.ResAtacRock_Bom(var Msg : TMessage);        {ATAQUE CON PIEDRA}
begin
 if FResistencia <= 2 then FResistencia := 0;
 if PiedraAlmacenada <= 2 then PiedraAlmacenada := 0;
 if FResistencia > 1 then  FResistencia := FResistencia - 2;
 if PiedraAlmacenada > 1 then PiedraAlmacenada := PiedraAlmacenada - 2;
end;

procedure TBaseEnemiga.ResAtacMetal_Bom(var Msg : TMessage);        {ATAQUE CON METAL}
begin
 if FResistencia <= 3 then FResistencia := 0;
 if MetalAlmacenado <= 3 then MetalAlmacenado := 0;
 if FResistencia > 3 then  FResistencia := FResistencia - 3;
 if MetalAlmacenado > 3 then MetalAlmacenado := MetalAlmacenado - 3;
end;


////////////////////////////////////////////////////////////////////////////////
/////////////////  MENSAJES DE ESPIA    ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBaseEnemiga.SendCoo_Esp(var Msg : TMessage);        {PIDE COORDENADAS}
begin
 Mensaje.Msg := WM_USER + 329;
 Mensaje.WParam := Left;
 Mensaje.LParam := Top;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseEnemiga.ResAtacWood_Esp(var Msg : TMessage);        {ATAQUE CON MADERA}
begin
 if FResistencia > 0 then  FResistencia := FResistencia - 1;
 if MaderaAlmacenada > 0 then MaderaAlmacenada := MaderaAlmacenada - 1;
end;

procedure TBaseEnemiga.ResAtacRock_Esp(var Msg : TMessage);        {ATAQUE CON PIEDRA}
begin
 if FResistencia <= 2 then FResistencia := 0;
 if PiedraAlmacenada <= 2 then PiedraAlmacenada := 0;
 if FResistencia > 1 then  FResistencia := FResistencia - 2;
 if PiedraAlmacenada > 1 then PiedraAlmacenada := PiedraAlmacenada - 2;
end;

procedure TBaseEnemiga.ResAtacMetal_Esp(var Msg : TMessage);        {ATAQUE CON METAL}
begin
 if FResistencia <= 3 then FResistencia := 0;
 if MetalAlmacenado <= 3 then MetalAlmacenado := 0;
 if FResistencia > 3 then  FResistencia := FResistencia - 3;
 if MetalAlmacenado > 3 then MetalAlmacenado := MetalAlmacenado - 3;
end;

////////////////////////////////////////////////////////////////////////////////
/////////////////  MENSAJES DE SOLDADO ENEMIGO    //////////////////////////////
////////////////////////////////////////////////////////////////////////////////


procedure TBaseEnemiga.SendMeCoo_SolE(var Msg : TMessage);        {PIDE COORDENADAS}
begin
 Mensaje.Msg := WM_USER + 89;
 Mensaje.WParam := Left;
 Mensaje.LParam := Top;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseEnemiga.GiveMeWoodGun_SolE(var Msg: TMessage);    {SOLICITA arma MADERA}
begin
  Mensaje.Msg := WM_USER + 538;
  if FMaderaAlmacenada = 0 then Mensaje.WParam := 0;
  if FMaderaAlmacenada > 0 then
    begin
      Mensaje.WParam := 1;
      FMaderaAlmacenada := FMaderaAlmacenada - 1;
    end;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseEnemiga.GiveMeRockGun_SolE(var Msg : TMessage);     {SOLICITA arma PIEDRA}
begin
 Mensaje.Msg := WM_USER + 591;
 if FPiedraAlmacenada <= 1 then Mensaje.WParam := 0;
  if FPiedraAlmacenada > 1 then
    begin
      Mensaje.WParam := 1;
      FPiedraAlmacenada := FPiedraAlmacenada - 2;
    end;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseEnemiga.GiveMeMetalGun_SolE(var Msg : TMessage);   {SOLICITA arma METAL}
begin
  Mensaje.Msg := WM_USER + 580;
  if FMetalAlmacenado <= 2 then Mensaje.WParam := 0;
  if FMetalAlmacenado > 2 then
    begin
      Mensaje.WParam := 1;
      FMetalAlmacenado := FMetalAlmacenado - 3;
    end;

  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;


{-------------------------------------------------------------  TIMER}

procedure TBaseEnemiga.OnTimer(Sender : TObject);
begin
  Hint := 'Madera = ' + IntToStr(MaderaAlmacenada) + #13 +
          'Piedra = ' + IntToStr(PiedraAlmacenada) + #13 +
          'Metal = '    + IntToStr(metalAlmacenado) + #13 +
          'Resistencia = ' + IntToStr(FResistencia);
end;


procedure Register;
begin
  RegisterComponents('Juego', [TBaseEnemiga]);
end;

end.

