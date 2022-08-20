unit Refugio;

interface
  {$R Refugio.res}
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, stdCtrls;


Const
 {MENSAJES DE SOLDADO}
 MSendCooSo     = WM_USER + 46;  // --> Soldado manda pedir coo
 MRefugiame_Sol = WM_USER + 554; // pide ser refugiado;

 {MENSAJES DE ESPIA}
 MRefugiame_Esp = WM_USER + 127;
 MSendCooS  = WM_USER + 48;    //  solicita coo
 MResWoodR  = WM_USER + 49;    // recibe madera
 MResMetalR = WM_USER + 50;    // recibe metal
 MResRockR  = WM_USER + 51;    // recibe piedra

 {MENSAJES DE BOMBER}
 MRefugiame_Bom = WM_USER + 396;
 MSendCooB  = WM_USER + 47;   //solicita coordenadas
 MResWoodRB = WM_USER + 70;   //recibe madera
 MResMetalRB= WM_USER + 71;   //recibo metal
 MResRockRB = WM_USER + 72;   //recibe piedra

 {MENSAJES DE SOLDADO ENEMIGO}
 MDameCoo_SolE        = WM_USER + 408; // solicita coo
 MResAtacWood_SolE    = WM_USER + 470; // ataque con madera
 MResAtacRock_SolE    = WM_USER + 522; // ataque con Piedra
 MResAtacMetal_SolE   = WM_USER + 465; // ataque con Metal

 {MENSAJES DE BOMBER ENEMIGO}
 MDameCoo_BomE        = WM_USER + 270; // solicita coo
 MResAtacWood_BomE    = WM_USER + 247; // ataque con madera
 MResAtacRock_BomE    = WM_USER + 96;  // ataquec on piedra
 MResAtacMetal_BomE   = WM_USER + 515; // ataque con Metal

 {MENSAJES DE ESPIA ENEMIGO}
 MDameCoo_EspE        = WM_USER + 567; // solicita coo
 MResAtacWood_EspE    = WM_USER + 294; // ataque con madera
 MResAtacRock_EspE    = WM_USER + 491;  // ataquec on piedra
 MResAtacMetal_EspE   = WM_USER + 447; // ataque con Metal


type
  TRefugio = class(TGraphicControl)
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
    procedure SendCooS         (var Msg : TMessage);  message MSendCooS;
    procedure SendCooB         (var Msg : TMessage);  message MSendCooB;
    procedure SendCooSo        (var Msg : TMessage);  message MSendCooSo;
    procedure ResWoodR         (Var Msg : TMessage);  message MResWoodR;
    procedure ResMetalR        (Var Msg : TMessage);  message MResMetalR;
    procedure ResRockR         (Var Msg : TMessage);  message MResRockR;
    procedure ResWoodRB        (Var Msg : TMessage);  message MResWoodRB;
    procedure ResMetalRB       (Var Msg : TMessage);  message MResMetalRB;
    procedure ResRockRB        (Var Msg : TMessage);  message MResRockRB;
    procedure DameCoo_SolE     (Var Msg : TMessage);  message MDameCoo_SolE;
    procedure ResAtacWood_SolE (Var Msg : TMessage);  message MResAtacWood_SolE;
    procedure ResAtacRock_SolE (Var Msg : TMessage);  message MResAtacRock_SolE;
    procedure ResAtacMetal_SolE(Var Msg : TMessage);  message MResAtacMetal_SolE;
    procedure DameCoo_BomE     (Var Msg : TMessage);  message MDameCoo_BomE;
    procedure ResAtacWood_BomE (Var Msg : TMessage);  message MResAtacWood_BomE;
    procedure ResAtacRock_BomE (Var Msg : TMessage);  message MResAtacRock_BomE;
    procedure ResAtacMetal_BomE(Var Msg : TMessage);  message MResAtacMetal_BomE;
    procedure DameCoo_EspE     (Var Msg : TMessage);  message MDameCoo_EspE;
    procedure ResAtacWood_EspE (Var Msg : TMessage);  message MResAtacWood_EspE;
    procedure ResAtacRock_EspE (Var Msg : TMessage);  message MResAtacRock_EspE;
    procedure ResAtacMetal_EspE(Var Msg : TMessage);  message MResAtacMetal_EspE;
    procedure Refugiame_Sol    (Var Msg : TMessage);  message MRefugiame_Sol;
    procedure Refugiame_Bom    (Var Msg : TMessage);  message MRefugiame_Bom;
    procedure Refugiame_Esp    (Var Msg : TMessage);  message MRefugiame_Esp;





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
constructor TRefugio.Create(AOwner: TComponent);
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
destructor TRefugio.destroy;
begin
 FBitmap.Free;
 inherited destroy;
end;

{-------------------------------------------------------------  Establece color}
procedure TRefugio.SetColor(Color: TColor);
begin
  if FColor <> Color then
    begin
      FColor := Color;
      Repaint;
    end;
end;

{-------------------------------------------------------------  RESISTENCIA}
procedure TRefugio.SetResistencia(AResistencia : Integer);
begin
  if (AResistencia <= 40) then
    FResistencia := AResistencia;
  repaint;
end;

{-------------------------------------------------------------  Dibuja}
procedure TRefugio.paint;
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
  FBitmap.Canvas.Brush.Color := clBlue;
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
Function TRefugio.GetPosicion: String;
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
///////////////  MENSAJES DE SOLDADO/////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TRefugio.SendCooS(var Msg : TMessage);         {SOLICITA COORDENDAS}
begin
  Mensaje.Msg := WM_USER + 52;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TRefugio.Refugiame_Sol(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 339;
  if FResistencia  > 0 then Mensaje.WParam := 1;
  if FResistencia <= 0 then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

////////////////////////////////////////////////////////////////////////////////
///////////////  MENSAJES DE BOMBER /////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TRefugio.SendCooB(var Msg : TMessage);      {SOLICITA COORDENDAS}
begin
  Mensaje.Msg := WM_USER + 53;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TRefugio.Refugiame_Bom(var Msg : TMessage);      {PIDE REFUGIO}
begin
  Mensaje.Msg := WM_USER + 572;
  if FResistencia  > 0 then Mensaje.WParam := 1;
  if FResistencia <= 0 then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TRefugio.ResWoodRB(var Msg : TMessage);       {RECIBE MADERA}
begin
  Mensaje.Msg := WM_USER + 67;

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


procedure TRefugio.ResMetalRB(var Msg : TMessage);       {RECIBE METAL}
begin
  Mensaje.Msg := WM_USER + 68;

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

procedure TRefugio.ResRockRB(var Msg : TMessage);   {RECIBE PIEDRA}
begin
 Mensaje.Msg := WM_USER + 69;
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
///////////////  MENSAJES DE ESPIA /////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TRefugio.SendCooSo(var Msg : TMessage);      {SOLICITA COORDENDAS}
begin
  Mensaje.Msg := WM_USER + 54;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TRefugio.Refugiame_Esp(var Msg : TMessage);      {PIDE REFUGIO}
begin
  Mensaje.Msg := WM_USER + 310;
  if FResistencia  > 0 then Mensaje.WParam := 1;
  if FResistencia <= 0 then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;


procedure TRefugio.ResWoodR(var Msg : TMessage);       {RECIBE MADERA}
begin
  Mensaje.Msg := WM_USER + 57;
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


procedure TRefugio.ResMetalR(var Msg : TMessage);      {RECIBE METAL}
begin
  Mensaje.Msg := WM_USER + 62;
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


procedure TRefugio.ResRockR(var Msg : TMessage);        {RECIBE PIEDRA}
begin
 Mensaje.Msg := WM_USER + 63;
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
///////////////  MENSAJES DE SOLDADO ENEMIGO  //////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TRefugio.DameCoo_SolE(var Msg : TMessage);       {SOLICITA COORDENADAS}
begin
  Mensaje.Msg := WM_USER + 505;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TRefugio.ResAtacWood_SolE(var Msg : TMessage);    {        ATACA CON MADERA}
begin
  if MaderaAlmacenada > 0 then MaderaAlmacenada := MaderaAlmacenada - 1;
  if FResistencia > 0 then  FResistencia := FResistencia - 1;
  if FResistencia = 0 then
    begin
      Mensaje.Msg := WM_USER + 498;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TRefugio.ResAtacRock_SolE(var Msg : TMessage);    {        ATACA CON PIEDRA}
begin
  if PiedraAlmacenada <= 2 then MaderaAlmacenada := 0;
  if PiedraAlmacenada > 2 then MaderaAlmacenada := MaderaAlmacenada - 2;
  if FResistencia <= 2 then FResistencia := 0;
  if FResistencia > 2 then FResistencia := FResistencia - 2;
  if FResistencia = 0 then
    begin
      Mensaje.Msg := WM_USER + 498;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TRefugio.ResAtacMetal_SolE(var Msg : TMessage);    {        ATACA CON METAÑ}
begin

  if MetalAlmacenado <= 3 then MetalAlmacenado := 0;
  if MetalAlmacenado > 3  then MetalAlmacenado := MetalAlmacenado - 3;
  if FResistencia <= 3 then FResistencia := 0;
  if FResistencia > 3 then  FResistencia := FResistencia - 3;
  if FResistencia = 0 then
    begin
      Mensaje.Msg := WM_USER + 498;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;

////////////////////////////////////////////////////////////////////////////////
///////////////  MENSAJES DE BOMBER ENEMIGO   //////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TRefugio.DameCoo_BomE(var Msg : TMessage);       {SOLICITA COORDENADAS}
begin
  Mensaje.Msg := WM_USER + 157;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TRefugio.ResAtacWood_BomE(var Msg : TMessage);    {        ATACA CON MADERA}
begin
  if MaderaAlmacenada > 0 then MaderaAlmacenada := MaderaAlmacenada - 1;
  if FResistencia > 0 then  FResistencia := FResistencia - 1;
  if FResistencia = 0 then
    begin
      Mensaje.Msg := WM_USER + 498;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TRefugio.ResAtacRock_BomE(var Msg : TMessage);    {        ATACA CON PIEDRA}
begin
  if PiedraAlmacenada <= 2 then MaderaAlmacenada := 0;
  if PiedraAlmacenada > 2 then MaderaAlmacenada := MaderaAlmacenada - 2;
  if FResistencia <= 2 then FResistencia := 0;
  if FResistencia > 2 then FResistencia := FResistencia - 2;
  if FResistencia = 0 then
    begin
      Mensaje.Msg := WM_USER + 498;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TRefugio.ResAtacMetal_BomE(var Msg : TMessage);    {        ATACA CON METAÑ}
begin
  if MetalAlmacenado <= 3 then MetalAlmacenado := 0;
  if MetalAlmacenado > 3  then MetalAlmacenado := MetalAlmacenado - 3;
  if FResistencia <= 3 then FResistencia := 0;
  if FResistencia > 3 then  FResistencia := FResistencia - 3;
  if FResistencia = 0 then
    begin
      Mensaje.Msg := WM_USER + 498;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;


////////////////////////////////////////////////////////////////////////////////
///////////////  MENSAJES DE  ESPIA ENEMIGO   //////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TRefugio.DameCoo_EspE(var Msg : TMessage);       {SOLICITA COORDENADAS}
begin
  Mensaje.Msg := WM_USER + 268;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TRefugio.ResAtacWood_EspE(var Msg : TMessage);    {        ATACA CON MADERA}
begin
  if MaderaAlmacenada > 0 then MaderaAlmacenada := MaderaAlmacenada - 1;
  if FResistencia > 0 then  FResistencia := FResistencia - 1;
  if FResistencia = 0 then
    begin
      Mensaje.Msg := WM_USER + 498;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TRefugio.ResAtacRock_EspE(var Msg : TMessage);    {        ATACA CON PIEDRA}
begin
  if PiedraAlmacenada <= 2 then MaderaAlmacenada := 0;
  if PiedraAlmacenada > 2 then MaderaAlmacenada := MaderaAlmacenada - 2;
  if FResistencia <= 2 then FResistencia := 0;
  if FResistencia > 2 then FResistencia := FResistencia - 2;
  if FResistencia = 0 then
    begin
      Mensaje.Msg := WM_USER + 498;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TRefugio.ResAtacMetal_EspE(var Msg : TMessage);    {        ATACA CON METAÑ}
begin
  if MetalAlmacenado > 3  then MetalAlmacenado := MetalAlmacenado - 3;
  if FResistencia <= 3 then FResistencia := 0;
  if FResistencia > 3 then  FResistencia := FResistencia - 3;
  if FResistencia = 0 then
    begin
      Mensaje.Msg := WM_USER + 498;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;


{-------------------------------------------------------------  TIMER}

procedure TRefugio.OnTimer(Sender : TObject);
begin
  Hint := 'Madera = ' + IntToStr(MaderaAlmacenada) + #13 +
          'Piedra = ' + IntToStr(PiedraAlmacenada) + #13 +
          'Metal = '    + IntToStr(metalAlmacenado) + #13 +
          'Resistencia = ' + IntToStr(Resistencia);
end;


procedure Register;
begin
  RegisterComponents('Juego', [TRefugio]);
end;

end.
