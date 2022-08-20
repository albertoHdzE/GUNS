unit RefugioEnemigo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, stdCtrls;


Const
 {MENSAJES DE SOLDADO}
 MSendCooSol      = WM_USER + 172;    //  Soldado manda pedir coo
 MResAtacWoodSol  = WM_USER + 174;    //  recibe ataque de soldado
 MResAtacRockSol  = WM_USER + 134;    //  ataque con Piedra
 MResAtacMetalSol = WM_USER + 425;    //  ataque con metal

 {MENSAJES DE BOMBER}
 MSendCoo_Bom      = WM_USER + 200;    //solicita coordenadas
 MResAtacWood_Bom  = WM_USER + 193;     // Ataque con Madera
 MResAtacRock_Bom  = WM_USER + 331;     // Ataque con Madera
 MResAtacMetal_Bom = WM_USER + 413;     // Ataque con Madera

 {MENSAJES DE ESPIA}
 MSendCoo_Esp      = WM_USER + 566;    //solicita coordenadas
 MResAtacWood_Esp  = WM_USER + 207;     // Ataque con Madera
 MResAtacRock_Esp  = WM_USER + 484;     // Ataque con Madera
 MResAtacMetal_Esp = WM_USER + 495;     // Ataque con Madera

 {MENSAJES DE ESPIA ENEMIGO}
 MRefugiame_EspE    = WM_USER + 352;
 MSendMeCooEspEne   = WM_USER + 243;
 MResWoodEspE     = WM_USER + 560;    // recibe madera
 MResMetalEspE    = WM_USER + 390;    // recibe metal
 MResRockEspE     = WM_USER + 521;    // recibe piedra

 {MENSAJES DE BOMBER ENEMIGO}
  MRefugiame_BomE  = WM_USER + 228;
  MSendMeCooBomE   = WM_USER + 362;    // pide coordenadas
  MResWoodBomE     = WM_USER + 302;    //recibe madera
  MResMetalBomE    = WM_USER + 586;    //recibo metal
  MResRockBomE     = WM_USER + 476;    //recibe piedra

 {MENSJES DE SOLDADO ENEMIGO}
 MGiveMeCoo_SolE     = WM_USER + 487;
 MRefugiame_SolE     = WM_USER + 122;



type
  TRefugioEnemigo = class(TGraphicControl)
  private
    FBitmap            : TBitmap;
    FColor             : TColor;
    Fposicion          : String;
    FMetalAlmacenado     : Integer;
    FMaderaAlmacenada  : Integer;
    FPiedraAlmacenada  : Integer;
    FTimer             : TTimer;
    FResistencia       : Integer;

    procedure SetColor(Color : TColor);
    procedure SetResistencia(AResistencia : Integer);

    {------------------------------------  procesamiento de mensajes----------------}
    procedure SendCooSol      (var Msg : TMessage);  message MSendCooSol;
    procedure SendMeCooEspEne (Var Msg : TMessage);  message MSendMeCooEspEne;
//    procedure SendCooEsp     (var Msg : TMessage);  message MSendCooEsp;
    procedure ResWoodEspE     (Var Msg : TMessage);  message MResWoodEspE;
    procedure ResMetalEspE    (Var Msg : TMessage);  message MResMetalEspE;
    procedure ResRockEspE     (Var Msg : TMessage);  message MResRockEspE;
    procedure ResWoodBomE     (Var Msg : TMessage);  message MResWoodBomE;
    procedure ResMetalBomE    (Var Msg : TMessage);  message MResMetalBomE;
    procedure ResRockBomE     (Var Msg : TMessage);  message MResRockBomE;
    procedure SendMeCooBomE   (Var Msg : TMessage);  message MSendMeCooBomE;
    procedure ResAtacWoodSol  (Var Msg : TMessage);  message MResAtacWoodSol;
    procedure ResAtacRockSol  (Var Msg : TMessage);  message MResAtacRockSol;
    procedure ResAtacMetalSol (Var Msg : TMessage);  message MResAtacMetalSol;
    procedure SendCoo_Bom     (var Msg : TMessage);  message MSendCoo_Bom;
    procedure ResAtacWood_Bom (Var Msg : TMessage);  message MResAtacWood_Bom;
    procedure ResAtacRock_Bom (Var Msg : TMessage);  message MResAtacRock_Bom;
    procedure ResAtacMetal_Bom(Var Msg : TMessage);  message MResAtacMetal_Bom;
    procedure SendCoo_Esp     (var Msg : TMessage);  message MSendCoo_Esp;
    procedure ResAtacWood_Esp (Var Msg : TMessage);  message MResAtacWood_Esp;
    procedure ResAtacRock_Esp (Var Msg : TMessage);  message MResAtacRock_Esp;
    procedure ResAtacMetal_Esp(Var Msg : TMessage);  message MResAtacMetal_Esp;
    procedure GiveMeCoo_SolE  (Var Msg : TMessage);  message MGiveMeCoo_SolE;
    procedure Refugiame_SolE  (Var Msg : TMessage);  message MRefugiame_SolE;
    procedure Refugiame_BomE  (Var Msg : TMessage);  message MRefugiame_BomE;
    procedure Refugiame_EspE  (Var Msg : TMessage);  message MRefugiame_EspE;





  protected
    procedure paint; override;
    Function  GetPosicion:String;
    procedure OnTimer(Sender : TObject); virtual;


  public
    constructor Create(AOwner: TComponent); override;
    destructor destroy; override;
    property MetalAlmacenado : Integer read FMetalAlmacenado  write FMetalAlmacenado;
    property MaderaAlmacenada: Integer read FMaderaAlmacenada write FMaderaAlmacenada;
    property PiedraAlmacenada: Integer read FPiedraAlmacenada write FPiedraAlmacenada;


  published
    property Color    : TColor   read FColor write SetColor;
    property Posicion : String   read GetPosicion;
    property Resistencia: Integer read FResistencia write SetResistencia default 0;

    property Hint;
    property ShowHint;
    property Name;
  end;

procedure Register;

implementation
var
  Mensaje : TMessage;


{-------------------------------------------------------------  constructor}
constructor TRefugioEnemigo.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := ControlStyle + [csOpaque];
  FBitmap := TBitmap.Create;
  Width := 40;
  Height := 40;
  MaderaAlmacenada := 0;
  PiedraAlmacenada := 0;
  MetalAlmacenado  := 0;
  FResistencia     := 0;
  ShowHint := true;
  Hint := 'Madera = ' + IntToStr(MaderaAlmacenada) + #13 +
          'Piedra = ' + IntToStr(PiedraAlmacenada) + #13 +
          'Metal = '    + IntToStr(MetalAlmacenado);

  FColor := clWhite;
  FTimer := TTimer.Create(Self);
  FTimer.Interval := 200;
  FTimer.OnTimer := OnTimer;
  FTimer.Enabled := true;
end;
{-------------------------------------------------------------  destructor}
destructor TRefugioEnemigo.destroy;
begin
 FBitmap.Free;
 inherited destroy;
end;

{-------------------------------------------------------------  Establece color}
procedure TRefugioEnemigo.SetColor(Color: TColor);
begin
  if FColor <> Color then
    begin
      FColor := Color;
      Repaint;
    end;
end;

{-------------------------------------------------------------  RESISTENCIA}
procedure TRefugioEnemigo.SetResistencia(AResistencia : Integer);
begin
  if (AResistencia <= 40) then
    FResistencia := AResistencia;
  repaint;
end;

{-------------------------------------------------------------  Dibuja}
procedure TRefugioEnemigo.paint;
var
 Rectangulo : TRect;
 i: Integer;
begin
  rectangulo := rect(0,0,Width,Height);
  FBitmap.Width := Width;
  FBitmap.Height := Height;
  FBitmap.Canvas.Brush.Color := FColor;
  FBitmap.Canvas.FillRect(rectangulo);
  FBitmap.Canvas.Pen.Color := clAqua;
  FBitmap.Canvas.Brush.Color := clRed;
  FBitmap.Canvas.Polygon([Point(0,36),Point(20,0),Point(40,36)]);
  FBitmap.Canvas.Brush.Color := clBlack;
  FBitmap.Canvas.Polygon([Point(13,36),Point(20,22),Point(28,36)]);
  FBitmap.Canvas.Brush.Color := clBtnFace;
  FBitmap.Canvas.TextOut(0,12,Name);
  FBitmap.Canvas.Pen.Color := clRed;
  FBitmap.Canvas.Brush.Color := clRed;
  For i := 1 To FResistencia Do
    begin
      FBitmap.Canvas.MoveTo(i,40);
      FBitmap.Canvas.LineTo(i,36);
    end;

  Canvas.Draw(0,0,FBitmap);

end;

{----------------------------------------------------------- Obtiene la posición en un string}
Function TRefugioEnemigo.GetPosicion: String;
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

////////////////////////////////////////////////////////////////////////////////
///////////////  SOLICITUD DE COORDENADAS  /////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TRefugioEnemigo.SendMeCooEspEne(var Msg: TMessage);      {ESPIA ENEMIGO PIDE COOR}
begin
  Mensaje.Msg := WM_USER + 433;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

////////////////////////////////////////////////////////////////////////////////
///////////////  MENSAJES DE SOLDADO/////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TRefugioEnemigo.SendCooSol(var Msg : TMessage);       {SOLICITA COORDENADAS}
begin
  Mensaje.Msg := WM_USER + 173;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TRefugioEnemigo.ResAtacWoodSol(var Msg : TMessage);    {        ATACA CON MADERA}
begin
  if MaderaAlmacenada > 0 then MaderaAlmacenada := MaderaAlmacenada - 1;
  if FResistencia > 0 then  FResistencia := FResistencia - 1;
  if FResistencia = 0 then
    begin
      Mensaje.Msg := WM_USER + 271;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TRefugioEnemigo.ResAtacRockSol(var Msg : TMessage);    {        ATACA CON PIEDRA}
begin
  if PiedraAlmacenada <= 2 then MaderaAlmacenada := 0;
  if PiedraAlmacenada > 2 then MaderaAlmacenada := MaderaAlmacenada - 2;
  if FResistencia <= 2 then FResistencia := 0;
  if FResistencia > 2 then FResistencia := FResistencia - 2;
  if FResistencia = 0 then
    begin
      Mensaje.Msg := WM_USER + 271;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TRefugioEnemigo.ResAtacMetalSol(var Msg : TMessage);    {        ATACA CON METAÑ}
begin
  if MetalAlmacenado <= 3 then MetalAlmacenado := 0;
  if MetalAlmacenado > 3  then MetalAlmacenado := MetalAlmacenado - 3;
  if FResistencia <= 3 then FResistencia := 0;
  if FResistencia > 3 then  FResistencia := FResistencia - 3;
  if FResistencia = 0 then
    begin
      Mensaje.Msg := WM_USER + 271;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;



////////////////////////////////////////////////////////////////////////////////
///////////////  RECIBE MATERIALES DE ESPIA ENEMIGO ////////////////////////////
////////////////////////////////////////////////////////////////////////////////


procedure TRefugioEnemigo.Refugiame_EspE(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 497;
  if FResistencia  > 0 then Mensaje.WParam := 1;
  if FResistencia <= 0 then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TRefugioEnemigo.ResWoodEspE(var Msg : TMessage);        {RECIBE MADEARA DE ESPIA ENEMY}
begin
  Mensaje.Msg := WM_USER + 551;
  if MaderaAlmacenada < 10 then
    begin
      Resistencia := Resistencia + 1;
      MaderaAlmacenada := MaderaAlmacenada + 1;
      Mensaje.WParam := 1;
    end;

  if MaderaAlmacenada >= 10 then
    begin
     Mensaje.WParam := 0;
     MaderaAlmacenada := 10;
    end;

   Mensaje.LParam := 0;
   Mensaje.Result := 0;
   Application.MainForm.Broadcast(Mensaje);
end;


procedure TRefugioEnemigo.ResMetalEspE(var Msg : TMessage);          {RECIBE METAL DE ESPIA ENEMY}
begin
  Mensaje.Msg := WM_USER + 502;
  if MetalAlmacenado < 20 then
    begin
     Resistencia := Resistencia + 1;
     MetalAlmacenado := MetalAlmacenado + 1;
     Mensaje.WParam := 1;
    end;

  if MetalAlmacenado >= 20 then
    begin
     Mensaje.WParam := 0;
     MetalAlmacenado := 20;
    end;

  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TRefugioEnemigo.ResRockEspE(var Msg : TMessage);            {RECIBE PIEDRA DE ESPIA ENEMY}
begin
 Mensaje.Msg := WM_USER + 272;
  if PiedraAlmacenada < 10 then
    begin
      Resistencia := Resistencia + 1;
      PiedraAlmacenada := PiedraAlmacenada + 1;
      Mensaje.WParam := 1;
    end;

  if PiedraAlmacenada >= 10 then
    begin
      Mensaje.WParam := 0;
      PiedraAlmacenada := 10;
    end;

  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

////////////////////////////////////////////////////////////////////////////////
///////////////  RECIBE MATERIALES DE bomber ENEMIGO ////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TRefugioEnemigo.Refugiame_SolE(var Msg : TMessage);                {SOLICITA REFUGIO}
begin
  Mensaje.Msg := WM_USER + 424;
  if FResistencia  > 0 then Mensaje.WParam := 1;
  if FResistencia <= 0 then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

//recibe madera BOMBER
procedure TRefugioEnemigo.ResWoodBomE(var Msg : TMessage);            {RECIBE MADERA DE BOMBER ENEMY}
begin
  Mensaje.Msg := WM_USER + 300;

  if MaderaAlmacenada < 10 then
    begin
      Resistencia := Resistencia + 1;
      MaderaAlmacenada := MaderaAlmacenada + 1;
      Mensaje.WParam := 1;
    end;

  if MaderaAlmacenada >= 10 then
    begin
     Mensaje.WParam := 0;
     MaderaAlmacenada := 10;
    end;

   Mensaje.LParam := 0;
   Mensaje.Result := 0;
   Application.MainForm.Broadcast(Mensaje);
end;


// recibe metal  BOMBER
procedure TRefugioEnemigo.ResMetalBomE(var Msg : TMessage);           {RECIBE METAL DE BOMBER ENEMY}
begin
  Mensaje.Msg := WM_USER + 520;

  if MetalAlmacenado < 20 then
    begin
     Resistencia := Resistencia + 1;
     MetalAlmacenado := MetalAlmacenado + 1;
     Mensaje.WParam := 1;
    end;

  if MetalAlmacenado >= 20 then
    begin
     Mensaje.WParam := 0;
     MetalAlmacenado := 20;
    end;

  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;


// recibe piedra  BOMBER
procedure TRefugioEnemigo.ResRockBomE(var Msg : TMessage);          {RECIBE PIEDRA DE BOMBER ENEMY}
begin
 Mensaje.Msg := WM_USER + 120;
  if PiedraAlmacenada < 10 then
    begin
      Resistencia := Resistencia + 1;
      PiedraAlmacenada := PiedraAlmacenada + 1;
      Mensaje.WParam := 1;
    end;

  if PiedraAlmacenada >= 10 then
    begin
      Mensaje.WParam := 0;
      PiedraAlmacenada := 10;
    end;

  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

// Bomber Enemigo solicita coordenadas
procedure TRefugioEnemigo.SendMeCooBomE(Var Msg : TMessage);         {ENVIA COOR A BOMBER ENEMIGO}
begin
  Mensaje.Msg := WM_USER + 589;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;


////////////////////////////////////////////////////////////////////////////////
///////////////  MENSAJES DE BOMBER  ///////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TRefugioEnemigo.SendCoo_Bom(var Msg : TMessage);        {BOMBER SOLICITA COORDENADAS}
begin
  Mensaje.Msg := WM_USER + 454;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TRefugioEnemigo.ResAtacWood_Bom(var Msg : TMessage);    {        ATACA CON MADERA}
begin
  if MaderaAlmacenada > 0 then MaderaAlmacenada := MaderaAlmacenada - 1;
  if FResistencia > 0 then  FResistencia := FResistencia - 1;
  if FResistencia = 0 then
    begin
      Mensaje.Msg := WM_USER + 271;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TRefugioEnemigo.ResAtacRock_Bom(var Msg : TMessage);    {        ATACA CON PIEDRA}
begin
  if PiedraAlmacenada <= 2 then MaderaAlmacenada := 0;
  if PiedraAlmacenada > 2 then MaderaAlmacenada := MaderaAlmacenada - 2;
  if FResistencia <= 2 then FResistencia := 0;
  if FResistencia > 2 then FResistencia := FResistencia - 2;
  if FResistencia = 0 then
    begin
      Mensaje.Msg := WM_USER + 271;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TRefugioEnemigo.ResAtacMetal_Bom(var Msg : TMessage);    {        ATACA CON METAÑ}
begin
  if MetalAlmacenado <= 3 then MetalAlmacenado := 0;
  if MetalAlmacenado > 3  then MetalAlmacenado := MetalAlmacenado - 3;
  if FResistencia <= 3 then FResistencia := 0;
  if FResistencia > 3 then  FResistencia := FResistencia - 3;
  if FResistencia = 0 then
    begin
      Mensaje.Msg := WM_USER + 271;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;


////////////////////////////////////////////////////////////////////////////////
///////////////  MENSAJES DE ESPIA  ///////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TRefugioEnemigo.SendCoo_Esp(var Msg : TMessage);        {BOMBER SOLICITA COORDENADAS}
begin
  Mensaje.Msg := WM_USER + 219;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TRefugioEnemigo.ResAtacWood_Esp(var Msg : TMessage);    {        ATACA CON MADERA}
begin
  if MaderaAlmacenada > 0 then MaderaAlmacenada := MaderaAlmacenada - 1;
  if FResistencia > 0 then  FResistencia := FResistencia - 1;
  if FResistencia = 0 then
    begin
      Mensaje.Msg := WM_USER + 271;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TRefugioEnemigo.ResAtacRock_Esp(var Msg : TMessage);    {        ATACA CON PIEDRA}
begin
  if PiedraAlmacenada <= 2 then MaderaAlmacenada := 0;
  if PiedraAlmacenada > 2 then MaderaAlmacenada := MaderaAlmacenada - 2;
  if FResistencia <= 2 then FResistencia := 0;
  if FResistencia > 2 then FResistencia := FResistencia - 2;
  if FResistencia = 0 then
    begin
      Mensaje.Msg := WM_USER + 271;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TRefugioEnemigo.ResAtacMetal_Esp(var Msg : TMessage);    {        ATACA CON METAÑ}
begin
  if MetalAlmacenado <= 3 then MetalAlmacenado := 0;
  if MetalAlmacenado > 3  then MetalAlmacenado := MetalAlmacenado - 3;
  if FResistencia <= 3 then FResistencia := 0;
  if FResistencia > 3 then  FResistencia := FResistencia - 3;
  if FResistencia = 0 then
    begin
      Mensaje.Msg := WM_USER + 271;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;


////////////////////////////////////////////////////////////////////////////////
///////////////  MENSAJES DE SOLDADO ENEMIGO  /////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TRefugioEnemigo.GiveMeCoo_SolE(var Msg : TMessage);       {SOLICITA COORDENDAS}
begin
  Mensaje.Msg := WM_USER + 471;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;


procedure TRefugioEnemigo.Refugiame_BomE(var Msg : TMessage);                {SOLICITA REFUGIO}
begin
  Mensaje.Msg := WM_USER + 345;
  if FResistencia  > 0 then Mensaje.WParam := 1;
  if FResistencia <= 0 then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

{-------------------------------------------------------------  TIMER}

procedure TRefugioEnemigo.OnTimer(Sender : TObject);
begin
  Hint := 'Madera = ' + IntToStr(MaderaAlmacenada) + #13 +
          'Piedra = ' + IntToStr(PiedraAlmacenada) + #13 +
          'Metal = '    + IntToStr(metalAlmacenado) + #13 +
          'Resistencia = ' + IntToStr(Resistencia);
end;


procedure Register;
begin
  RegisterComponents('Juego', [TRefugioEnemigo]);
end;

end.
