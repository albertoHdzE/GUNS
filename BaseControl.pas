unit BaseControl;

interface
 {$R BaseControl.res}
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, stdCtrls;

const
 {MENSAJES DE SOLDADO}
 MSendCooBase    = WM_USER + 13;     // pide coordenadas
 MGiveMeWoodS    = WM_USER + 152;    // dame arma de madera
 MGiveMeMetalS   = WM_USER + 298;    //      arma de metal
 MGiveMeRockS    = WM_USER + 314;    //      arma de Piedra

 {MENSAJES DE BOMBER}
 MSendCooBaseB   = WM_USER + 30;     // pide coordenadas
 MGiveMeWoodB    = WM_USER + 73;     // dame madera  para construir
 MGiveMeMetalB   = WM_USER + 74;     //      metal   para construir
 MGiveMePiedraB  = WM_USER + 75;     //      piedra  para construir

 MGiveArmaWood_Bom   = WM_USER + 225;    // dame arma de Madera
 MGiveArmaRock_Bom   = WM_USER + 330;    // dame arma de Piedra
 MGiveArmaMetal_Bom  = WM_USER + 485;    // dame arma de Metal

 {MENSAJES DE ESPIA}
 MSendCooBaseS   = WM_USER + 44;     // pide coordenadas
 MGiveMeWood     = WM_USER + 55;     // dame madera  para construir
 MGiveMeMetal    = WM_USER + 58;     //      metal   para construir
 MGiveMePiedra   = WM_USER + 59;     //      piedra  para construir

 MGiveArmaWood_Esp   = WM_USER + 138;    // dame arma de Madera
 MGiveArmaRock_Esp   = WM_USER + 358;    // dame arma de Piedra
 MGiveArmaMetal_Esp  = WM_USER + 380;    // dame arma de Metal

 {MENSAJES DE EQUIPO}
 MResWood        = WM_USER + 15;     // recibe madera
 MResMetal       = WM_USER + 16;     //        metal
 MResRock        = WM_USER + 17;     //        piedra

 {MENSAJES DE SOLDADO ENEMIGO}
 MDameCoo_SolE       = WM_USER + 468; // solicita coordendas
 MResAtacWood_SolE   = WM_USER + 489; // recibe ataque con Madera
 MResAtacRock_SolE   = WM_USER + 242; // recibe ataque con Piedra
 MResAtacMetal_SolE  = WM_USER + 227; // recibe ataque con Metal

 {MENSAHES DE BOMBER ENEMIGO}
 MDameCoo_BomE       = WM_USER + 189; // solicita coordendas
 MResAtacWood_BomE   = WM_USER + 119; // recibe ataque con Madera
 MResAtacRock_BomE   = WM_USER + 321; // recibe ataque con Piedra
 MResAtacMetal_BomE  = WM_USER + 463; // recibe ataque con Metal

 {MENSAHES DE ESPIA ENEMIGO}
 MDameCoo_EspE       = WM_USER + 264; // solicita coordendas
 MResAtacWood_EspE   = WM_USER + 558; // recibe ataque con Madera
 MResAtacRock_EspE   = WM_USER + 529; // recibe ataque con Piedra
 MResAtacMetal_EspE  = WM_USER + 148; // recibe ataque con Metal


 type
  TBaseControl = class(TGraphicControl)
  private
 {-------}
    FBitmap            : TBitmap;
    FColor             : TColor;
    Fposicion          : String;
    FMetalAlmacenado   : Integer;
    FMaderaAlmacenada  : Integer;
    FPiedraAlmacenada  : Integer;
    FResistencia       : Integer;
    FTimer             : TTimer;

    procedure SetColor(Color : TColor);
    {---------------------  MENSAJES RECIBIDOS---------------------}
    procedure SendCooBase            (var Msg : TMessage);  message MSendCooBase;
    procedure SendCooBaseB       (var Msg : TMessage);  message MSendCooBaseB;
    procedure SendCooBaseS       (var Msg : TMessage);  message MSendCooBaseS;
    procedure ResWood            (Var Msg : TMessage);  message MResWood;
    procedure ResMetal           (Var Msg : TMessage);  message MResMetal;
    procedure ResRock            (Var Msg : TMessage);  message MResRock;
    procedure GiveMeWood         (Var Msg : TMessage);  message MGiveMeWood;
    procedure GiveMeMetal        (Var Msg : TMessage);  message MGiveMeMetal;
    procedure GiveMePiedra       (Var Msg : TMessage);  message MGiveMePiedra;
    procedure GiveMeWoodB        (Var Msg : TMessage);  message MGiveMeWoodB;
    procedure GiveMeMetalB       (Var Msg : TMessage);  message MGiveMeMetalB;
    procedure GiveMePiedraB      (Var Msg : TMessage);  message MGiveMePiedraB;
    procedure GiveMeWoodS        (Var Msg : TMessage);  message MGiveMeWoodS;
    procedure GiveMeMetalS       (Var Msg : TMessage);  message MGiveMeMetalS;
    procedure GiveMeRockS        (Var Msg : TMessage);  message MGiveMeRockS;
    procedure GiveArmaWood_Bom   (Var Msg : TMessage);  message MGiveArmaWood_Bom;
    procedure GiveArmaRock_Bom   (Var Msg : TMessage);  message MGiveArmaRock_Bom;
    procedure GiveArmaMetal_Bom  (Var Msg : TMessage);  message MGiveArmaMetal_Bom;
    procedure GiveArmaWood_Esp   (Var Msg : TMessage);  message MGiveArmaWood_Esp;
    procedure GiveArmaRock_Esp   (Var Msg : TMessage);  message MGiveArmaRock_Esp;
    procedure GiveArmaMetal_Esp  (Var Msg : TMessage);  message MGiveArmaMetal_Esp;
    procedure DameCoo_SolE       (Var Msg : TMessage);  message MDameCoo_SolE;
    procedure ResAtacWood_SolE   (Var Msg : TMessage);  message MResAtacWood_SolE;
    procedure ResAtacRock_SolE   (Var Msg : TMessage);  message MResAtacRock_SolE;
    procedure ResAtacMetal_SolE  (Var Msg : TMessage);  message MResAtacMetal_SolE;
    procedure DameCoo_BomE       (Var Msg : TMessage);  message MDameCoo_BomE;
    procedure ResAtacWood_BomE   (Var Msg : TMessage);  message MResAtacWood_BomE;
    procedure ResAtacRock_BomE   (Var Msg : TMessage);  message MResAtacRock_BomE;
    procedure ResAtacMetal_BomE  (Var Msg : TMessage);  message MResAtacMetal_BomE;
    procedure DameCoo_EspE       (Var Msg : TMessage);  message MDameCoo_EspE;
    procedure ResAtacWood_EspE   (Var Msg : TMessage);  message MResAtacWood_EspE;
    procedure ResAtacRock_EspE   (Var Msg : TMessage);  message MResAtacRock_EspE;
    procedure ResAtacMetal_EspE  (Var Msg : TMessage);  message MResAtacMetal_EspE;


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
    property Resistencia : Integer read FResistencia write FResistencia;

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
constructor TBaseControl.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := ControlStyle + [csOpaque];
  FBitmap := TBitmap.Create;
  Width := 40;
  Height := 40;

  MaderaAlmacenada := 0; {***************** }
  PiedraAlmacenada := 0;
  MetalAlmacenado  := 0;

  FResistencia := 60;
  ShowHint := true;
  Hint := 'Madera = ' + IntToStr(MaderaAlmacenada) + #13 +
          'Piedra = ' + IntToStr(PiedraAlmacenada) + #13 +
          'Metal = '    + IntToStr(MetalAlmacenado);

  FColor := clBlue;
  FTimer := TTimer.Create(Self);
  FTimer.Interval := 200;
  FTimer.OnTimer := OnTimer;
  FTimer.Enabled := true;
end;
{-------------------------------------------------------------  destructor}
destructor TBaseControl.destroy;
begin
 FBitmap.Free;
 inherited destroy;
end;

{-------------------------------------------------------------  Establece color}
procedure TBaseControl.SetColor(Color: TColor);
begin
  if FColor <> Color then
    begin
      FColor := Color;
      Repaint;
    end;
end;

{-------------------------------------------------------------  Dibuja}
procedure TBaseControl.paint;
var
 Rectangulo : TRect;
begin
  rectangulo := rect(0,0,Width,Height);
  FBitmap.Width := Width;
  FBitmap.Height := Height;
  FBitmap.Canvas.Brush.Color := FColor;
  FBitmap.Canvas.FillRect(rectangulo);
  FBitmap.Canvas.Pen.Color := clAqua;
  FBitmap.Canvas.Brush.Color := clBlack;
  FBitmap.Canvas.Polygon([Point(10,0),Point(20,20),Point(30,0)]);
  FBitmap.Canvas.Polygon([Point(0,10),Point(20,20),Point(0,30)]);
  FBitmap.Canvas.Polygon([Point(10,40),Point(20,20),Point(30,40)]);
  FBitmap.Canvas.Polygon([Point(40,10),Point(20,20),Point(40,30)]);
  Canvas.Draw(0,0,FBitmap);
end;

{----------------------------------------------------------- Obtiene la posición en un string}
Function TBaseControl.GetPosicion: String;
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





//recibe madera
procedure TBaseControl.ResWood(var Msg : TMessage);
begin
  MaderaAlmacenada := MaderaAlmacenada + 1;
end;
// recibe metal
procedure TBaseControl.ResMetal(var Msg : TMessage);
begin
  MetalAlmacenado := MetalAlmacenado + 1;
end;
// recibe piedra
procedure TBaseControl.ResRock(var Msg : TMessage);
begin
  PiedraAlmacenada := PiedraAlmacenada + 1;
end;


{=====================================  peticiones de material   ============================}

////////////////////////////////////////////////////////////////////////////////
////////////  MENSAJES DE ESPIA  //////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


procedure TBaseControl.SendCooBaseS(var Msg : TMessage);   {PIDE COORDENADAS}
begin
  Mensaje.Msg := WM_USER + 45;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseControl.GiveMeWood(var Msg: TMessage);   {PIDE MADERA PARA CONSTRUIR}
begin
   Mensaje.Msg := WM_USER + 56;
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

//    METAL
procedure TBaseControl.GiveMeMetal(var Msg : TMessage);  {PIDE METAL PARA ACONSTRUIR}
begin
  Mensaje.Msg := WM_USER + 60;
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
//   PIEDRA
procedure TBaseControl.GiveMePiedra(var Msg : TMessage);  {PIDE PIEDRA PARA CONSTURI}
begin
 Mensaje.Msg := WM_USER + 61;
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

procedure TBaseControl.GiveArmaWood_Esp(var Msg: TMessage);    {SOLICITA arma MADERA}
begin
  Mensaje.Msg := WM_USER + 452;
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

procedure TBaseControl.GiveArmaMetal_Esp(var Msg : TMessage);   {SOLICITA arma METAL}
begin
  Mensaje.Msg := WM_USER + 440;
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

procedure TBaseControl.GiveArmaRock_Esp(var Msg : TMessage);     {SOLICITA arma PIEDRA}
begin
 Mensaje.Msg := WM_USER + 574;
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
////////////  MENSAJES DE BOMBER  //////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBaseControl.SendCooBaseB(var Msg : TMessage);  {SOLICITA COORDENADAS}
begin
  Mensaje.Msg := WM_USER + 31;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseControl.GiveMeWoodB(var Msg: TMessage);    {PIDE MADERA para construir}
begin
   Mensaje.Msg := WM_USER + 64;
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

procedure TBaseControl.GiveMeMetalB(var Msg : TMessage);  {PIDE METAL para construir}
begin
  Mensaje.Msg := WM_USER + 65;
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


procedure TBaseControl.GiveMePiedraB(var Msg : TMessage);  {PIDE PIEDRA para construir}
begin
 Mensaje.Msg := WM_USER + 66;
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

procedure TBaseControl.GiveArmaWood_Bom(var Msg: TMessage);    {SOLICITA arma MADERA}
begin
  Mensaje.Msg := WM_USER + 224;
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

procedure TBaseControl.GiveArmaMetal_Bom(var Msg : TMessage);   {SOLICITA arma METAL}
begin
  Mensaje.Msg := WM_USER + 212;
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

procedure TBaseControl.GiveArmaRock_Bom(var Msg : TMessage);     {SOLICITA arma PIEDRA}
begin
 Mensaje.Msg := WM_USER + 386;
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
////////////  MENSAJES DE SOLDADO   ////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBaseControl.SendCooBase(var Msg : TMessage);   {SOLICITA COORDENDAS}
begin
  Mensaje.Msg := WM_USER + 14;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseControl.GiveMeWoodS(var Msg: TMessage);    {SOLICITA arma MADERA}
begin
  Mensaje.Msg := WM_USER + 155;
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

procedure TBaseControl.GiveMeMetalS(var Msg : TMessage);   {SOLICITA arma METAL}
begin
  Mensaje.Msg := WM_USER + 203;
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

procedure TBaseControl.GiveMeRockS(var Msg : TMessage);     {SOLICITA arma PIEDRA}
begin
 Mensaje.Msg := WM_USER + 263;
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
/////////////////  MENSAJES DE SOLDADO ENEMIGO   ///////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBaseControl.DameCoo_SolE(var Msg : TMessage);       {SOLDADO ENE PIDE COORDENADAS}
begin
  Mensaje.Msg := WM_USER + 378;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseControl.ResAtacWood_SolE(var Msg : TMessage);        {ATAQUE CON MADERA}
begin
 if FResistencia > 0 then  FResistencia := FResistencia - 1;
 if MaderaAlmacenada > 0 then MaderaAlmacenada := MaderaAlmacenada - 1;
end;

procedure TBaseControl.ResAtacRock_SolE(var Msg : TMessage);        {ATAQUE CON PIEDRA}
begin
 if FResistencia <= 2 then FResistencia := 0;
 if PiedraAlmacenada <= 2 then PiedraAlmacenada := 0;
 if FResistencia > 1 then  FResistencia := FResistencia - 2;
 if PiedraAlmacenada > 1 then PiedraAlmacenada := PiedraAlmacenada - 2;
end;

procedure TBaseControl.ResAtacMetal_SolE(var Msg : TMessage);        {ATAQUE CON METAL}
begin
 if FResistencia <= 3 then FResistencia := 0;
 if MetalAlmacenado <= 3 then MetalAlmacenado := 0;
 if FResistencia > 3 then  FResistencia := FResistencia - 3;
 if MetalAlmacenado > 3 then MetalAlmacenado := MetalAlmacenado - 3;
end;

////////////////////////////////////////////////////////////////////////////////
/////////////////  MENSAJES DE BOMBER  ENEMIGO   ///////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBaseControl.DameCoo_BomE(var Msg : TMessage);            {PIDE COORDENADAS}
begin
  Mensaje.Msg := WM_USER + 429;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseControl.ResAtacWood_BomE(var Msg : TMessage);        {ATAQUE CON MADERA}
begin
 if FResistencia > 0 then  FResistencia := FResistencia - 1;
 if MaderaAlmacenada > 0 then MaderaAlmacenada := MaderaAlmacenada - 1;
end;

procedure TBaseControl.ResAtacRock_BomE(var Msg : TMessage);        {ATAQUE CON PIEDRA}
begin
 if FResistencia <= 2 then FResistencia := 0;
 if PiedraAlmacenada <= 2 then PiedraAlmacenada := 0;
 if FResistencia > 1 then  FResistencia := FResistencia - 2;
 if PiedraAlmacenada > 1 then PiedraAlmacenada := PiedraAlmacenada - 2;
end;

procedure TBaseControl.ResAtacMetal_BomE(var Msg : TMessage);        {ATAQUE CON METAL}
begin
 if FResistencia <= 3 then FResistencia := 0;
 if MetalAlmacenado <= 3 then MetalAlmacenado := 0;
 if FResistencia > 3 then  FResistencia := FResistencia - 3;
 if MetalAlmacenado > 3 then MetalAlmacenado := MetalAlmacenado - 3;
end;

////////////////////////////////////////////////////////////////////////////////
/////////////////  MENSAJES DE ESPIA  ENEMIGO   ////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBaseControl.DameCoo_EspE(var Msg : TMessage);            {PIDE COORDENADAS}
begin
  Mensaje.Msg := WM_USER + 175;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBaseControl.ResAtacWood_EspE(var Msg : TMessage);        {ATAQUE CON MADERA}
begin
 if FResistencia > 0 then  FResistencia := FResistencia - 1;
 if MaderaAlmacenada > 0 then MaderaAlmacenada := MaderaAlmacenada - 1;
end;

procedure TBaseControl.ResAtacRock_EspE(var Msg : TMessage);        {ATAQUE CON PIEDRA}
begin
 if FResistencia <= 2 then FResistencia := 0;
 if PiedraAlmacenada <= 2 then PiedraAlmacenada := 0;
 if FResistencia > 1 then  FResistencia := FResistencia - 2;
 if PiedraAlmacenada > 1 then PiedraAlmacenada := PiedraAlmacenada - 2;
end;

procedure TBaseControl.ResAtacMetal_EspE(var Msg : TMessage);        {ATAQUE CON METAL}
begin
 if FResistencia <= 3 then FResistencia := 0;
 if MetalAlmacenado <= 3 then MetalAlmacenado := 0;
 if FResistencia > 3 then  FResistencia := FResistencia - 3;
 if MetalAlmacenado > 3 then MetalAlmacenado := MetalAlmacenado - 3;
end;





{-------------------------------------------------------------  TIMER}

procedure TBaseControl.OnTimer(Sender : TObject);
begin
  Hint := 'Madera = ' + IntToStr(MaderaAlmacenada) + #13 +
          'Piedra = ' + IntToStr(PiedraAlmacenada) + #13 +
          'Metal = '    + IntToStr(metalAlmacenado) + #13 +
          'Resistencia = ' + IntToStr(Resistencia);
end;



procedure Register;
begin
  RegisterComponents('Juego', [TBaseControl]);
end;

end.
