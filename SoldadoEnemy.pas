unit SoldadoEnemy;

interface
 {$R SoldadoEnemy.res}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, stdCtrls,Types;


const
 {MENSAJES DE MATERIAL}
 MResCooWood1SE  = WM_USER + 82;    // coordenadas
 MResCooWood2SE  = WM_USER + 83;
 MResCooMetal1SE = WM_USER + 84;
 MResCooMetal2SE = WM_USER + 85;
 MResCooRock1SE  = WM_USER + 86;
 MResCooRock2SE  = WM_USER + 87;


 {MENSAJES de SOLDADO}
 MDaCoorSold1     = WM_USER + 150;   // manda tus coordenadas a soldado
 MResCoo_Sol      = WM_USER + 534;   // recibe coordenadas de soldado
 MResAtaqueMadera = WM_USER + 158;   // recibe ataque con madera de soldado
 MResAtaquePiedra = WM_USER + 451;   // recibe ataque con madera de soldado
 MResAtaqueMetal  = WM_USER + 412;   // recibe ataque con madera de soldado
 MEstoyRef_Sol    = WM_USER + 561;
 MEstasRef_Sol    = WM_USER + 95;    // pregunta si esta refugiado

 {MENSAJES DE BOMBER}
 MResCoo_Bom        = WM_USER + 409;
 MGiveMeCoo_Bom     = WM_USER + 559;
 MResAtacWood_Bom   = WM_USER + 499;
 MResAtacRock_Bom   = WM_USER + 436;
 MResAtacMetal_Bom  = WM_USER + 364;
 MEstoyRef_Bom      = WM_USER + 526;    // respuesta a la apregunta si esta ref 
 MEstasRef_Bom      = WM_USER + 516;    // pregunta si esta refugiado

 {MENSAJSE DE ESPIA}
 MResCoo_Esp        = WM_USER + 490;
 MGiveMeCoo_Esp     = WM_USER + 405;
 MResAtacWood_Esp   = WM_USER + 587;
 MResAtacRock_Esp   = WM_USER + 126;
 MResAtacMetal_Esp  = WM_USER + 427;
 MEstoyRef_Esp      = WM_USER + 475;
 MEstasRef_Esp      = WM_USER + 456;    // pregunta si esta refugiado

 {MENSAJES DE BASE ENEMIGA}
 MResCooBaseE        = WM_USER + 89;   // recibe coordenadas de base
 MResWoodGun         = WM_USER + 538;  // recibe arma de madera
 MResRockGun         = WM_USER + 591;  // recibe arma de Piedra
 MResMetalGun        = WM_USER + 580;  // recibe arma de Metal

 {MENSAJES DE BASE}
 MResCoo_Bas         = WM_USER + 378;   // recibe coordendas

 {MENSAJES DE REFUGIO}
 MResCoo_Ref         = WM_USER + 505;

 {MENSAJES DE REFUGIO ENEMIGO}
 MResCoo_RefE     = WM_USER + 471;
 MPuedesRef       = WM_USER + 424;
 MTodosFuera      = WM_USER + 271;



type
  TSoldadoEnemy = class(TGraphicControl)


  private
    FColor            : TColor;
    FBitmap           : TBitmap;
    FResistencia      : Integer;
    FVelocidad        : Integer;
    FAbilitado        : Boolean;
    FTimer            : TTimer;
    FEstado           : Array[1..6] of string;
    FOnToqueBase  : TNotifyEvent;

    function  GetEstado(indice: integer): string;
    procedure SetEstado(indice: integer; valor: string);
    procedure Atacando;
    procedure Refugiando;



    procedure ResCooWood1SE    (Var Msg : TMessage); message MResCooWood1SE;
    procedure ResCooWood2SE    (Var Msg : TMessage); message MResCooWood2SE;
    procedure ResCooMetal1SE   (Var Msg : TMessage); message MResCooMetal1SE;
    procedure ResCooMetal2SE   (Var Msg : TMessage); message MResCooMetal2SE;
    procedure ResCooRock1SE    (Var Msg : TMessage); message MResCooRock1SE;
    procedure ResCooRock2SE    (Var Msg : TMessage); message MResCooRock2SE;
    procedure DaCoorSold1      (Var Msg : TMessage); message MDaCoorSold1;
    procedure ResAtaqueMadera  (Var MSG : TMessage); message MResAtaqueMadera;
    procedure ResAtaquePiedra  (Var MSG : TMessage); message MResAtaquePiedra;
    procedure ResAtaqueMetal   (Var MSG : TMessage); message MResAtaqueMetal;
    procedure GiveMeCoo_Bom    (Var MSG : TMessage); message MGiveMeCoo_Bom;
    procedure ResAtacWood_Bom  (Var MSG : TMessage); message MResAtacWood_Bom;
    procedure ResAtacRock_Bom  (Var MSG : TMessage); message MResAtacRock_Bom;
    procedure ResAtacMetal_Bom (Var MSG : TMessage); message MResAtacMetal_Bom;
    procedure GiveMeCoo_Esp    (Var MSG : TMessage); message MGiveMeCoo_Esp;
    procedure ResAtacWood_Esp  (Var MSG : TMessage); message MResAtacWood_Esp;
    procedure ResAtacRock_Esp  (Var MSG : TMessage); message MResAtacRock_Esp;
    procedure ResAtacMetal_Esp (Var MSG : TMessage); message MResAtacMetal_Esp;
    procedure ResCooBaseE      (Var Msg : TMessage); message MResCooBaseE;
    procedure ResWoodGun       (Var Msg : TMessage); message MResWoodGun;
    procedure ResRockGun       (Var Msg : TMessage); message MResRockGun;
    procedure ResMetalGun      (Var Msg : TMessage); message MResMetalGun;
    procedure ResCoo_Sol       (Var Msg : TMessage); message MResCoo_Sol;
    procedure ResCoo_Bom       (Var Msg : TMessage); message MResCoo_Bom;
    procedure ResCoo_Esp       (Var Msg : TMessage); message MResCoo_Esp;
    procedure ResCoo_Bas       (Var Msg : TMessage); message MResCoo_Bas;
    procedure ResCoo_Ref       (Var Msg : TMessage); message MResCoo_Ref;
    procedure EstoyRef_Sol     (Var Msg : TMessage); message MEstoyRef_Sol;
    procedure ResCoo_RefE      (Var Msg : TMessage); message MResCoo_RefE;
    procedure PuedesRef        (Var Msg : TMessage); message MPuedesRef;
    procedure EstoyRef_Bom     (Var Msg : TMessage); message MEstoyRef_Bom;
    procedure EstoyRef_Esp     (Var Msg : TMessage); message MEstoyRef_Esp;
    procedure EstasRef_Sol     (Var Msg : TMessage); message MEstasRef_Sol;
    procedure EstasRef_Bom     (Var Msg : TMessage); message MEstasRef_Bom;
    procedure EstasRef_Esp     (Var Msg : TMessage); message MEstasRef_Esp;
    procedure TodosFuera           (Var Msg : TMessage); message MTodosFuera;


  protected
    procedure SetColor(AColor: TColor);
    procedure SetVelocidad(AVelocidad: Integer);
    procedure SetAbilitado(AAbilitado: Boolean);
    procedure paint; override;
    procedure DoToqueBase; virtual;
    procedure Trayectoria(xDest,yDest: LongInt);
    procedure OnTimer(Sender : TOBject); virtual;
    procedure camina;
    procedure cicloMat_Base;



  public
   constructor Create(AOwner : TComponent); override;
   destructor  destroy;                     override;
   property    Resistencia : Integer read FResistencia write FResistencia;
   procedure   IrMaterial(Material : String);
   procedure   desplazate(x,y: LongInt; Vel: Integer);
   procedure   Atacar(objetivo, con_que: string);
   procedure   Refugiarse;

   property    OnToqueBase : TNotifyEvent read FOnToqueBase write FOnToqueBase;
   property    haciendo    : string index 1 read GetEstado write SetEstado;
   property    armado_con  : string index 2 read GetEstado write SetEstado;
   property    resis       : string index 3 read GetEstado write SetEstado;
   property    cargado_con : string index 4 read GetEstado write SetEstado;
   property    otros       : string index 5 read GetEstado write SetEstado;
   property    objetivo    : string index 6 read GetEstado write SetEstado;
   property    Estado[indice: integer]: string read GetEstado write SetEstado;


  published
    property Color     : TColor     read FColor      write SetColor;
    property Velocidad : Integer    read FVelocidad  write SetVelocidad;
    property Abilitado : Boolean    read FAbilitado  write SetAbilitado;




  end;

procedure Register;

implementation
var
 xi, yi, xf, yf  : LongInt;
 FXDest, FYDest  : LongInt;
 Meta            : Boolean;
 Direccion       : string;
 xM,yM, xB, yB   : LongInt;
 Xr,Yr           : LongInt; // coordendas de Material,Base y Refugio
 Xs,Ys           : LongInt; // coordenadas de Soldado
 Xbe, Ybe        : LongInt; // coordenadas de Base
 Xee, Yee        : LongInt; // coordenadas de espia
 XBomE,YBomE     : LongInt; // coordenadas de Bomber
 Xre, Yre        : LongInt; // coordenadas de Refugio
 C               : Real;
 Mensaje         : TMessage;
 MatTransportado : string;
 TopAnt,TopSig   : integer;
 WoodGun         : integeR;
 RockGun         : integer;
 MetalGun        : integer;
 VictRef         : integer;
 RefugioSiNo     : integer;

{----------------------------------------------------------------- constructor}
constructor TSoldadoEnemy.Create(AOwner : TComponent);
begin
 inherited;
 FBitmap := TBitmap.Create;
 width  := 10;
 height := 15;
 FColor := clWhite;
 FResistencia := 20;

 FAbilitado := True;
 FVelocidad := 100;
 FTimer :=  TTimer.Create(self);
 FTimer.Interval := FVelocidad;
 FTimer.OnTimer := OnTimer;
end;

{----------------------------------------------------------------- destructor}
destructor TSoldadoEnemy.destroy;
begin
  FBitmap.Free;
  inherited;
end;

{------------------------------------------------------------------- color}
procedure TSoldadoEnemy.SetColor(AColor: TColor);
begin
  If FColor <> AColor then FColor := AColor;
end;

{----------------------------------------------------------------- paint}
procedure TSoldadoEnemy.paint;
 var
   rectangulo : TRect;
begin
 rectangulo := Rect(0,0,Width,Height);
 FBitmap.Width := width;
 FBitmap.Height := height;
 FBitmap.Canvas.Brush.Color := FColor;
 FBitmap.Canvas.FillRect(rectangulo);

 FBitmap.Canvas.Brush.Color := clBlack;
 FBitmap.Canvas.Pen.Color := clBlack;
 FBitmap.Canvas.Ellipse(4,1,8,5);

 Fbitmap.Canvas.Brush.Color := clRed;
 FBitmap.Canvas.Pen.Color := clRed;
 FBitmap.Canvas.Polygon([Point(6,5),Point(2,5),Point(2,11),Point(4,11),Point(4,15),Point(8,15),
                        Point(8,11),Point(10,11),Point(10,5)]);
 FBitmap.Canvas.Pen.Color := clYellow;
 FBitmap.Canvas.MoveTo(8,6);
 FBitmap.Canvas.LineTo(4,6);
 FBitmap.Canvas.LineTo(4,8);
 FBitmap.Canvas.LineTo(8,8);
 FBitmap.Canvas.LineTo(8,10);
 FBitmap.Canvas.LineTo(3,10);
 canvas.Draw(0,0,FBitmap);
end;

{--------------------------------------------------------  ACTUALIZA ESTADO}
function TSoldadoEnemy.GetEstado(indice: integer): string;
begin
  case indice of
    1: result := FEstado[1];
    2: result := FEstado[2];
    3: result := FEstado[3];
    4: result := FEstado[4];
    5: result := FEstado[5];
    6: result := FEstado[6];
  end;
end;

procedure TSoldadoEnemy.SetEstado(indice: integer; valor: string);
begin
  if FEstado[indice] <> valor then
    FEstado[indice] := valor;
end;

{--------------------------------------------------------  CUANDO TOQUE LA BASE}
procedure TSoldadoEnemy.DoToqueBase;
begin

  If (MatTransportado = 'Madera1') or (MatTransportado = 'Madera2') then
    begin
      Mensaje.Msg := WM_USER + 90;
      Mensaje.WParam := 0;
      Mensaje.LParam := 0;
      Mensaje.Result := 0;
      Application.MainForm.Broadcast(Mensaje);
    end;

  If (MatTransportado = 'Metal1') or (MatTransportado = 'Metal2') then
    begin
      Mensaje.Msg := WM_USER + 91;
      Mensaje.WParam := 0;
      Mensaje.LParam := 0;
      Mensaje.Result := 0;
      Application.MainForm.Broadcast(Mensaje);
    end;

  If (MatTransportado = 'Piedra1') or (MatTransportado = 'Piedra2') then
    begin
      Mensaje.Msg := WM_USER + 92;
      Mensaje.WParam := 0;
      Mensaje.LParam := 0;
      Mensaje.Result := 0;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;


{---------------------------------------------- Calcula  constante de TRAYECTORIA}
procedure TSoldadoEnemy.Trayectoria(xDest, yDest: LongInt);
begin
  xi := Left;
  yi := Top;
  xf := xDest;
  yf := yDest;
  if xi = xf then xi := xi + 3;
 C := (yi - yf) / (xi - xf);
end;

{---------------------------------------------------------- habilita}
procedure TSoldadoEnemy.SetAbilitado(AAbilitado: Boolean);
begin
  FAbilitado := AAbilitado;
  if csDesigning in ComponentState then Exit;
  FTimer.Enabled := FAbilitado;
end;

{---------------------------------------------------------- determina velocidad}
procedure TSoldadoEnemy.SetVelocidad(AVelocidad: Integer);
begin
  IF AVelocidad <> FVelocidad then FVelocidad := AVelocidad;
  FTimer.Interval := FVelocidad;
end;

////////////////////////////////////////////////////////////////////////////////
//////////////   ATACANDO    ///////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSoldadoEnemy.Atacando;
begin

 TopAnt := Top;
 VictRef := 0;
 {1. camina a la base por el arma}
 if (Direccion = 'Base') and (Meta = false) then Begin
     FEstado[5] := 'Voy por arma';
     FXDest := xB; FYdest := yB; Trayectoria(FXDest,FYDest);Velocidad := 10;
   end;


 {2. pide arma a la base}
 if (Direccion = 'Base') and (Meta = True) then begin
    if FEstado[2] = 'Madera' then Mensaje.Msg := WM_USER + 249; {pide madera}
    if FEstado[2] = 'Metal'  then Mensaje.Msg := WM_USER + 504; {pide metal}
    if FEstado[2] = 'Piedra' then Mensaje.Msg := WM_USER + 512; {pide Piedra}
    Application.MainForm.Broadcast(Mensaje);

    if (FEstado[2] = 'Madera') and (WoodGun = 0)  then exit;
    if (FEstado[2] = 'Piedra') and (RockGun = 0)  then exit;
    if (FEstado[2] = 'Metal')  and (MetalGun = 0) then exit;

    FEstado[5] := 'Voy por enemigo';
    direccion := 'Victima';
    Meta := false;
 end;


 {3. Una vez armado se dirige a la victima}
 if (Direccion = 'Victima') and (Meta = false) then begin

   if FEstado[2] = 'Madera' then Velocidad := 12;
   if FEstado[2] = 'Piedra' then Velocidad := 14;
   if FEstado[2] = 'Metal'  then Velocidad := 16;


   if FEstado[6] = 'SOLDADO' then Mensaje.Msg := WM_USER + 388;            {pide coo a Soldado }
   if FEstado[6] = 'BOMBER'  then Mensaje.Msg := WM_USER + 194 ;           {pide coo a Bomber }
   if FEstado[6] = 'ESPIA'   then Mensaje.Msg := WM_USER + 101 ;           {pide coo a Espia }
   if FEstado[6] = 'BASE'    then Mensaje.Msg := WM_USER + 468;            {pide coo a base }
   if FEstado[6] = 'REFUGIO' then Mensaje.Msg := WM_USER + 408;            {pide coo a refugio }

   Mensaje.WParam := 0;
   Mensaje.LParam := 0;
   Mensaje.Result := 0;
   Application.MainForm.Broadcast(Mensaje);

   if FEstado[6] = 'SOLDADO' then begin FXDest := xs;    FYDest := ys;    end;
   if FEstado[6] = 'BOMBER'  then begin FXDest := XBomE; FYDest := YBomE; end;
   if FEstado[6] = 'ESPIA'   then begin FXDest := Xee;   FYDest := Yee;   end;
   if FEstado[6] = 'BASE'    then begin FXDest := Xbe;   FYDest := Ybe;   end;
   if FEstado[6] = 'REFUGIO' then begin FXDest := Xre;   FYDest := Yre;   end;

    Trayectoria(FXDest,FYDest);
 end;


 {4. Una vez alacanzado lo ataca}
 if (Direccion = 'Victima') and (Meta = True) then begin

    {--------------------- VERIFICACION SI NO ESTAN REFUGIADOS}
    if (FEstado[6] = 'SOLDADO') Then Mensaje.Msg := WM_USER + 351;
    if (FEstado[6] = 'BOMBER')  Then Mensaje.Msg := WM_USER + 229;
    if (FEstado[6] = 'ESPIA')   Then Mensaje.Msg := WM_USER + 434;
    Application.MainForm.Broadcast(Mensaje);

    if VictRef = 1 then begin Left := Left - 40; Meta := false end;       {1 = refugiado; 0 = Libre}

if VictRef = 0 then
 begin
      {----------------- ataques a SOLDADO ENEMIGO}
   if (FEstado[6] = 'SOLDADO') and (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 478;
   if (FEstado[6] = 'SOLDADO') and (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 340;
   if (FEstado[6] = 'SOLDADO') and (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 545;

      {----------------- ataques a BOMBER ENEMIGO}
   if (FEstado[6] = 'BOMBER')  and (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 460;
   if (FEstado[6] = 'BOMBER')  and (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 535;
   if (FEstado[6] = 'BOMBER')  and (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 205;

      {----------------- ataques a ESPIA ENEMIGO}
   if (FEstado[6] = 'ESPIA')  and (FEstado[2] = 'Madera')  then Mensaje.Msg := WM_USER + 361;
   if (FEstado[6] = 'ESPIA')  and (FEstado[2] = 'Piedra')  then Mensaje.Msg := WM_USER + 383;
   if (FEstado[6] = 'ESPIA')  and (FEstado[2] = 'Metal')   then Mensaje.Msg := WM_USER + 254;

      {----------------- ataque a BASE ENEMIGA}
   if (FEstado[6] = 'BASE')    and  (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 489;
   if (FEstado[6] = 'BASE')    and  (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 242;
   if (FEstado[6] = 'BASE')    and  (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 227;

      {----------------- ataque a REFUGIO ENEMIGO}
   if (FEstado[6] = 'REFUGIO') and  (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 470;
   if (FEstado[6] = 'REFUGIO') and  (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 522;
   if (FEstado[6] = 'REFUGIO') and  (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 465;


   Application.MainForm.Broadcast(Mensaje);
   Direccion := 'Base';
   Meta := false;
 end;
end;


 {MOVIMIENTO -------------------------------------------}
 if (FXDest > Left) then
    begin
      Left := Left + 1;
      TopSig := Round((C * Left) - (C*xi ) + yi);
      if abs(TopSig - TopAnt) > 2 then
        begin
          if TopSig > TopAnt then Top := TopAnt + 1;
          if TopAnt > TopSig then Top := TopAnt - 1;
        end
      else Top := Round((C * Left) - (C*xi ) + yi);
      if (Left = FXDest) and (Top = FYDest) then Meta := true;
    end;

  if (FXDest < Left) then
    begin
      Left := Left - 1;
      TopSig := Round((C * Left) - (C*xi ) + yi);
      if abs(TopSig - TopAnt) > 2 then
        begin
          if TopSig > TopAnt then Top := TopAnt + 1;
          if TopAnt > TopSig then Top := TopAnt - 1;
        end
      else Top := Round((C * Left) - (C*xi ) + yi);
      if (Left = FXDest) and (Top = FYDest) then Meta := true;
    end;

  if (FXDest = Left) and (Meta = False) then Left := Left + 2;
  {------------------------------------------------------}
end;



procedure TSoldadoEnemy.Atacar(objetivo, con_que: string);
begin
 Direccion := 'Base';
 Meta := false;
 Mensaje.Msg := WM_USER + 163;    {pide a base enemiga }
 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);
 FEstado[1] := 'Atacando';        {activa el ataque con procedure "ATACANDO"}
 FEstado[2] := con_que;
 FEstado[6] := objetivo;
end;



{---------------------------------------------------------- desplazamiento}
procedure TSoldadoEnemy.camina;
begin
TopAnt := Top;
 if (FXDest > Left) then
    begin
      Left := Left + 1;
      TopSig := Round((C * Left) - (C*xi ) + yi);
      if abs(TopSig - TopAnt) > 2 then
        begin
          if TopSig > TopAnt then Top := TopAnt + 1;
          if TopAnt > TopSig then Top := TopAnt - 1;
        end
      else Top := Round((C * Left) - (C*xi ) + yi);
      if (Left = FXDest) and (Top = FYDest) then Meta := true;
    end;

  if (FXDest < Left) then
    begin
      Left := Left - 1;
      TopSig := Round((C * Left) - (C*xi ) + yi);
      if abs(TopSig - TopAnt) > 2 then
        begin
          if TopSig > TopAnt then Top := TopAnt + 1;
          if TopAnt > TopSig then Top := TopAnt - 1;
        end
      else Top := Round((C * Left) - (C*xi ) + yi);
      if (Left = FXDest) and (Top = FYDest) then Meta := true;
    end;

  if (FXDest = Left) and (Meta = False) then Left := Left + 2;
end;

{------------------------------------------------------- desplazarse a un lugar}
procedure TSoldadoEnemy.desplazate(x,y: LongInt; Vel: Integer);
begin
  FXDest := x;
  FYDest := y;
  Trayectoria(FXdest,FYDest); {calcula constante de ec.}
  Velocidad := Vel;
  Estado[1] := 'Desplazandose';
end;


////////////////////////////////////////////////////////////////////////////////
/////////////////////  IR POR MATERIAL  ////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSoldadoEnemy.cicloMat_Base;
begin
  TopAnt := Top;
  if FEstado[4] = 'Cargando_Madera' then Velocidad := 12;
  if FEstado[4] = 'Cargando_Piedra' then Velocidad := 14;
  if FEstado[4] = 'Cargando_Metal'  then Velocidad := 16;

  if (direccion = 'Material') and (Meta = false) then begin
    FXDest := xM; FYDest := yM;Trayectoria(FXDest,FYDest);Velocidad := 10;
  end;

  if (direccion = 'Material') and (Meta = true) then begin
    direccion := 'Base'; Meta := false;
  end;

 if (direccion = 'Base') and (Meta = false) then begin
    FXDest := xB; FYDest := yB;Trayectoria(FXDest,FYDest);
  end;

 if (Direccion = 'Base') and (Meta = true) then begin
   DoToqueBase;
   direccion := 'Material'; Meta := false;
 end;

 {MOVIMIENTO -------------------------------------------}
 if (FXDest > Left) then
    begin
      Left := Left + 1;
      TopSig := Round((C * Left) - (C*xi ) + yi);
      if abs(TopSig - TopAnt) > 2 then
        begin
          if TopSig > TopAnt then Top := TopAnt + 1;
          if TopAnt > TopSig then Top := TopAnt - 1;
        end
      else Top := Round((C * Left) - (C*xi ) + yi);
      if (Left = FXDest) and (Top = FYDest) then Meta := true;
    end;

  if (FXDest < Left) then
    begin
      Left := Left - 1;
      TopSig := Round((C * Left) - (C*xi ) + yi);
      if abs(TopSig - TopAnt) > 2 then
        begin
          if TopSig > TopAnt then Top := TopAnt + 1;
          if TopAnt > TopSig then Top := TopAnt - 1;
        end
      else Top := Round((C * Left) - (C*xi ) + yi);
      if (Left = FXDest) and (Top = FYDest) then Meta := true;
    end;

  if (FXDest = Left) and (Meta = False) then Left := Left + 2;
end;

{------------------------------------------------------------------------- IR POR MATERIAL}
procedure TSoldadoEnemy.IrMaterial(Material : String);
begin
 MatTransportado := Material;
 If Material = 'Madera1' then begin Mensaje.Msg := WM_USER + 76; FEstado[4] := 'Cargando_Madera' end;
 If Material = 'Madera2' then begin Mensaje.Msg := WM_USER + 77; FEstado[4] := 'Cargando_Madera' end;
 If Material = 'Metal1'  then begin Mensaje.Msg := WM_USER + 78; FEstado[4] := 'Cargando_Metal'  end;
 If Material = 'Metal2'  then begin Mensaje.Msg := WM_USER + 79; FEstado[4] := 'Cargando_Metal'  end;
 If Material = 'Piedra1' then begin Mensaje.Msg := WM_USER + 80; FEstado[4] := 'Cargando_Piedra' end;
 If Material = 'Piedra2' then begin Mensaje.Msg := WM_USER + 81; FEstado[4] := 'Cargando_Piedra' end;

 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 Mensaje.Msg := WM_USER + 163;                                 {pide coordenadas a BASE enemiga}
 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 FEstado[1] := 'Trayendo material';
 velocidad := 10;
 direccion := 'Material';
 meta      := false;
end;

////////////////////////////////////////////////////////////////////////////////
/////////////////////  REFUGIARSE    ///////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


procedure TSoldadoEnemy.Refugiando;
begin
 TopAnt := Top;

 velocidad := 10;

 if (Direccion = 'Refugio') and (Meta = false) then begin
 FXDest := Xr; FYDest := Yr; Trayectoria(FXDest,FYDest); end;    {TRAZO TRAYECTORIA}


 if (Direccion = 'Refugio') and (Meta = True) then               {PREGUNTO SI ME PUEDE REFUGIAR}
   begin
     Mensaje.Msg := WM_USER + 122;
     Mensaje.WParam := 0;
     Mensaje.LParam := 0;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);

     if RefugioSiNo = 1 then FEstado[1] := 'Refugiado'
      else begin FEstado[1] := 'Esperando orden'; Top := Top + 40; Left := Left + 40; end;
   end;



 {MOVIMIENTO -------------------------------------------}
 if (FXDest > Left) then
    begin
      Left := Left + 1;
      TopSig := Round((C * Left) - (C*xi ) + yi);
      if abs(TopSig - TopAnt) > 2 then
        begin
          if TopSig > TopAnt then Top := TopAnt + 1;
          if TopAnt > TopSig then Top := TopAnt - 1;
        end
      else Top := Round((C * Left) - (C*xi ) + yi);
      if (Left = FXDest) and (Top = FYDest) then Meta := true;
    end;

  if (FXDest < Left) then
    begin
      Left := Left - 1;
      TopSig := Round((C * Left) - (C*xi ) + yi);
      if abs(TopSig - TopAnt) > 2 then
        begin
          if TopSig > TopAnt then Top := TopAnt + 1;
          if TopAnt > TopSig then Top := TopAnt - 1;
        end
      else Top := Round((C * Left) - (C*xi ) + yi);
      if (Left = FXDest) and (Top = FYDest) then Meta := true;
    end;

  if (FXDest = Left) and (Meta = False) then Left := Left + 2;

end;
{-------------------------------------------------------------------------------}
procedure TSoldadoEnemy.Refugiarse;
begin
 Mensaje.Msg := WM_USER + 487;                               {PIDO COO DE REFUGIO enemigo}
 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 FEstado[1]:= 'Llendo a refugiarse';
 direccion := 'Refugio';
 meta      := false;
end;



{---------------------------------------------------------- EJECUCION DE TAREAS}
procedure TSoldadoEnemy.OnTimer(Sender: TObject);
begin
  if csDesigning in ComponentState then begin
    FTimer.Enabled := False;
    Exit;
  end;

 if FEstado[1] = 'Atacando'          then Atacando;
 If FEstado[1] = 'Desplazandose'     then camina;
 if FEstado[1] = 'Trayendo material' then CicloMat_Base;
 if FEstado[1] = 'Llendo a refugiarse' then Refugiando;
end;


{=========================================================================
==================== Procesamiento de Mensajes ===========================}

procedure TSoldadoEnemy.ResCooWood1SE(var Msg : TMessage);
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSoldadoEnemy.ResCooWood2SE(var Msg : TMessage);
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSoldadoEnemy.ResCooMetal1SE(var Msg : TMessage);
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSoldadoEnemy.ResCooMetal2SE(var Msg : TMessage);
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSoldadoEnemy.ResCooRock1SE(var Msg : TMessage);
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSoldadoEnemy.ResCooRock2SE(var Msg : TMessage);
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

////////////////////////////////////////////////////////////////////////////////
/////////////  mensajes de soldado  ////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSoldadoEnemy.EstoyRef_Sol(var Msg : TMessage);    {VERIFICA SI ESTA REFUGIADO}
begin
  VictRef := Msg.WParam;
end;


procedure TSoldadoEnemy.EstasRef_Sol(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 544;
  if FEstado[1] = 'Refugiado' then Mensaje.WParam := 1;
  if FEstado[1] <> 'Refugiado' then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TSoldadoEnemy.DaCoorSold1(var Msg: TMessage);       {PIDE COORDENADAS}
begin
 Mensaje.Msg := WM_USER + 151;
 Mensaje.WParam := Left;
 Mensaje.LParam := Top;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);
end;

procedure TSoldadoEnemy.ResCoo_Sol(var Msg: TMessage);      {COORDENADAS DE SOLDADO}
begin
 xS := Msg.WParam;
 yS := Msg.LParam;
end;

procedure TSoldadoEnemy.ResAtaqueMadera(var Msg: TMessage);    {ATAQUE CON MADERA}
begin
  if FResistencia > 0 Then  FResistencia := FResistencia - 1;
end;

procedure TSoldadoEnemy.ResAtaquePiedra(var Msg: TMessage);    {ATAQUE CON PIEDRA}
begin
  if FResistencia <= 2 then FResistencia := 0;
  if FResistencia > 0 Then  FResistencia := FResistencia - 2;
end;

procedure TSoldadoEnemy.ResAtaqueMetal(var Msg: TMessage);    {ATAQUE CON METAL}
begin
  if FResistencia <= 3 then FResistencia := 0;
  if FResistencia > 0 Then  FResistencia := FResistencia - 3;
end;

////////////////////////////////////////////////////////////////////////////////
/////////////  mensajes de BOMBER / ////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSoldadoEnemy.EstoyRef_Bom(var Msg : TMessage);    {VERIFICA SI ESTA REFUGIADO}
begin
  VictRef := Msg.WParam;
end;

procedure TSoldadoEnemy.EstasRef_Bom(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 595;
  if FEstado[1] = 'Refugiado' then Mensaje.WParam := 1;
  if FEstado[1] <> 'Refugiado' then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TSoldadoEnemy.GiveMeCoo_Bom(var Msg : TMessage);    {PIDE COORDENADAS}
begin
 Mensaje.Msg := WM_USER + 569;
 Mensaje.WParam := Left;
 Mensaje.LParam := Top;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);
end;

procedure TSoldadoEnemy.ResCoo_Bom(var Msg : TMessage);        {RECIBE COO DE BIMBER}
begin
  XBomE := Msg.WParam;
  YBomE := Msg.LParam;
end;


procedure TSoldadoEnemy.ResAtacWood_Bom(var Msg: TMessage);    {ATAQUE CON MADERA}
begin
  if FResistencia > 0 Then  FResistencia := FResistencia - 1;
end;

procedure TSoldadoEnemy.ResAtacRock_Bom(var Msg: TMessage);    {ATAQUE CON PIEDRA}
begin
  if FResistencia <= 2 then FResistencia := 0;
  if FResistencia > 0 Then  FResistencia := FResistencia - 2;
end;

procedure TSoldadoEnemy.ResAtacMetal_Bom(var Msg: TMessage);    {ATAQUE CON METAL}
begin
  if FResistencia <= 3 then FResistencia := 0;
  if FResistencia > 0 Then  FResistencia := FResistencia - 3;
end;

////////////////////////////////////////////////////////////////////////////////
/////////////  mensajes de  ESPIA  / ////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSoldadoEnemy.GiveMeCoo_Esp(var Msg : TMessage);   {SOLICITA COORDENDAS}
begin
 Mensaje.Msg := WM_USER + 542;
 Mensaje.WParam := Left;
 Mensaje.LParam := Top;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);
end;

procedure TSoldadoEnemy.EstasRef_Esp(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 474;
  if FEstado[1] = 'Refugiado' then Mensaje.WParam := 1;
  if FEstado[1] <> 'Refugiado' then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TSoldadoEnemy.EstoyRef_Esp(var Msg : TMessage);    {VERIFICA SI ESTA REFUGIADO}
begin
  VictRef := Msg.WParam;
end;

procedure TSoldadoEnemy.ResCoo_Esp(var Msg : TMessage);        {RECIBE COORDENADAS DE ESPIA}
begin
  Xee := Msg.WParam;
  Yee := Msg.LParam;
end;

procedure TSoldadoEnemy.ResAtacWood_Esp(var Msg: TMessage);    {ATAQUE CON MADERA}
begin
  if FResistencia > 0 Then  FResistencia := FResistencia - 1;
end;

procedure TSoldadoEnemy.ResAtacRock_Esp(var Msg: TMessage);    {ATAQUE CON PIEDRA}
begin
  if FResistencia <= 2 then FResistencia := 0;
  if FResistencia > 0 Then  FResistencia := FResistencia - 2;
end;

procedure TSoldadoEnemy.ResAtacMetal_Esp(var Msg: TMessage);    {ATAQUE CON METAL}
begin
  if FResistencia <= 3 then FResistencia := 0;
  if FResistencia > 0 Then  FResistencia := FResistencia - 3;
end;

////////////////////////////////////////////////////////////////////////////////
/////////////////////  MESAJES DE BASE ENEMIGA ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSoldadoEnemy.ResCooBaseE(var Msg : TMessage);   {COOREDEN}
begin
 xb := Msg.WParam;
 yb := Msg.LParam;
end;

procedure TSoldadoEnemy.ResWoodGun(var Msg : TMessage);    {RECIBE ARMA DE MADERA}
begin
  WoodGun  := Msg.WParam;
  RockGun  := 0;
  MetalGun := 0;
end;


procedure TSoldadoEnemy.ResMetalGun(var Msg : TMessage);    {RECIBE ARMA DE METAL}
begin
  WoodGun  := 0;
  RockGun  := 0;
  MetalGun := Msg.WParam;
end;

procedure TSoldadoEnemy.ResRockGun(var Msg : TMessage);    {RECIBE ARMA DE PIEDRA}
begin
  WoodGun  := 0;
  RockGun  := Msg.WParam;
  MetalGun := 0;
end;

////////////////////////////////////////////////////////////////////////////////
////////////////////  MENSAJES DE BASE   ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSoldadoEnemy.ResCoo_Bas(var Msg: TMessage);            {COORDENADAS DE BASE}
begin
  Xbe := Msg.WParam;
  Ybe := Msg.LParam;
end;

////////////////////////////////////////////////////////////////////////////////
////////////////////  MENSAJES DE REFUGIO //////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSoldadoEnemy.ResCoo_Ref(var Msg : TMessage);         {COORDENDAS DE REFUGIO}
begin
  Xre := Msg.WParam;
  Yre := Msg.LParam;
end;

////////////////////////////////////////////////////////////////////////////////
////////////////////  MENSAJES DE REFUGIO ENEMIGO //////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSoldadoEnemy.ResCoo_RefE(var Msg : TMessage);         {COORDENDAS DE REFUGIO}
begin
  Xr := Msg.WParam;
  Yr := Msg.LParam;
end;

procedure TSoldadoEnemy.TodosFuera(var  Msg : TMessage);
begin
  randomize;
  if FEstado[1] = 'Refugiado' then
  Desplazate(Random(400),Random(400),10);
end;

procedure TSoldadoEnemy.PuedesRef(var Msg : TMessage);
begin
  RefugioSiNo := Msg.WParam;
end;



procedure Register;
begin
  RegisterComponents('Juego', [TSoldadoEnemy]);
end;

end.
