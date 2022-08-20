unit Soldado;

interface
 {$R Soldado.res}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, stdCtrls,Types;


const
 {MENSAHES DE MATERIAL}
 MResCooWood1     = WM_USER + 7;     // coordenadas
 MResCooWood2     = WM_USER + 8;
 MResCooMetal1    = WM_USER + 9;
 MResCooMetal2    = WM_USER + 10;
 MResCooRock1     = WM_USER + 11;
 MResCooRock2     = WM_USER + 12;

 {MENSAJES DE REFUGIO}
 MResCooRSo       = WM_USER + 54;    // recibe coordenadas
 MPuedesRef       = WM_USER + 339;
 MTodosFuera      = WM_USER + 498;

 {MENSAJES DE REFUGIO ENEMIGO}
 MResCooRefE      = WM_USER + 173;   // recibe coordenadas de refugio enemigo

 {MENSAJES DE SOLDADO ENEMIGO}
 MCooSoldadoEne   = WM_USER + 151;   // recibe coo de soldado enemigo
 MSendMeCoo_SolE  = WM_USER + 388;   // mandame tus coordenadas
 MResAtacMadera   = WM_USER + 478;   // recibe ataque con madera
 MResAtacPiedra   = WM_USER + 340;   // ataque con Piedra
 MResAtacMetal    = WM_USER + 545;   // ataque con metal
 MEstasRef        = WM_USER + 351;   // pregunta si esta refugiado
 MEstoyRef_SolE    = WM_USER + 544;


 {MENSAJES DE BOMBER ENEMIGO}
 MCooBomberEne      = WM_USER + 94;     // recibe coo de bomber enemigo
 MSendMeCoo_BomE    = WM_USER + 161;    // pide coordendas
 MResAtacWood_BomE  = WM_USER + 579;    // recibe ataque con madera
 MResAtacRock_BomE  = WM_USER + 197;    // recibe ataque con pidra
 MResAtacMetal_BomE = WM_USER + 153;    // recibe ataque con metal
 MEstasRef_BomE     = WM_USER + 223;   // pregunta si esta refugiado
 MEstoyRef_BomE    = WM_USER + 349;

 {MENSAJES DE ESPIA ENEMIGO}
 MCooEspiaE         = WM_USER + 109;     // recibe coo de espia enemigo
 MSendMeCoo_EspE    = WM_USER + 230;    // pide coordendas
 MResAtacWood_EspE  = WM_USER + 443;    // recibe ataque con madera
 MResAtacRock_EspE  = WM_USER + 508;    // recibe ataque con pidra
 MResAtacMetal_EspE = WM_USER + 459;    // recibe ataque con metal
 MEstasRef_EspE     = WM_USER + 432;   // pregunta si esta refugiado
 MEstoyRef_EspE     = WM_USER + 514;

 {MENSAJES DE BASE}
 MResCooBase      = WM_USER + 14;    // recibe coordenadas de base
 MResWood         = WM_USER + 155;   // recibe arma de madera
 MResMetal        = WM_USER + 203;   // recibe arma de Metal
 MResPiedra       = WM_USER + 263;   // recibe arma de Piedra

 {MENSAJES DE BASE ENEMIGA}
 MResCooBE        = WM_USER + 169;   // recibe coo de base enemiga

 {MENSAJES DE TARGETA}
 MMisCooTarget    = WM_USER + 333;



type
  TSoldado = class(TGraphicControl)

  private
    FColor            : TColor;
    FBitmap           : TBitmap;
    FResistencia      : Integer;
    FVelocidad        : Integer;
    FAbilitado        : Boolean;
    FTimer            : TTimer;
    FEstado           : array[1..6] of string;


    FOnToqueBase      : TNotifyEvent;

    function    GetEstado(indice: integer): string;
    procedure   SetEstado(indice: integer; valor: string);
    procedure   Atacando;
    procedure   Refugiando;

    {mensajes}
    procedure ResCooWood1          (Var Msg : TMessage); message MResCooWood1;
    procedure ResCooWood2          (Var Msg : TMessage); message MResCooWood2;
    procedure ResCooMetal1         (Var Msg : TMessage); message MResCooMetal1;
    procedure ResCooMetal2         (Var Msg : TMessage); message MResCooMetal2;
    procedure ResCooRock1          (Var Msg : TMessage); message MResCooRock1;
    procedure ResCooRock2          (Var Msg : TMessage); message MResCooRock2;
    procedure ResCooBase           (Var Msg : TMessage); message MResCooBase;
    procedure ResCooRSo            (Var Msg : TMessage); message MResCooRSo;
    procedure CoorSoldadoEne       (Var Msg : TMessage); message MCooSoldadoEne;
    procedure ResWood              (Var Msg : TMessage); message MResWood;
    procedure ResMetal             (Var Msg : TMessage); message MResMetal;
    procedure ResPiedra            (Var Msg : TMessage); message MResPiedra;
    procedure ResCooBE             (Var Msg : TMessage); message MResCooBE;
    procedure ResCooRefE           (Var Msg : TMessage); message MResCooRefE;
    procedure CooBomberE           (Var Msg : TMessage); message MCooBomberEne;
    procedure CooEspiaE            (Var Msg : TMessage); message MCooEspiaE;
    procedure SendMeCoo_SolE       (Var Msg : TMessage); message MSendMeCoo_SolE;
    procedure ResAtacMadera        (Var Msg : TMessage); message MResAtacMadera;
    procedure ResAtacPiedra        (Var Msg : TMessage); message MResAtacPiedra;
    procedure ResAtacMetal         (Var Msg : TMessage); message MResAtacMetal;
    procedure SendMeCoo_BomE       (Var Msg : TMessage); message MSendMeCoo_BomE;
    procedure ResAtacWood_BomE     (Var Msg : TMessage); message MResAtacWood_BomE;
    procedure ResAtacRock_BomE     (Var Msg : TMessage); message MResAtacRock_BomE;
    procedure ResAtacMetal_BomE    (Var Msg : TMessage); message MResAtacMetal_BomE;
    procedure SendMeCoo_EspE       (Var Msg : TMessage); message MSendMeCoo_EspE;
    procedure ResAtacWood_EspE     (Var Msg : TMessage); message MResAtacWood_EspE;
    procedure ResAtacRock_EspE     (Var Msg : TMessage); message MResAtacRock_EspE;
    procedure ResAtacMetal_EspE    (Var Msg : TMessage); message MResAtacMetal_EspE;
    procedure PuedesRef            (Var Msg : TMessage); message MPuedesRef;
    procedure EstasRef             (Var Msg : TMessage); message MEstasRef;
    procedure EstasRef_BomE        (Var Msg : TMessage); message MEstasRef_BomE;
    procedure EstasRef_EspE        (Var Msg : TMessage); message MEstasRef_EspE;
    procedure EstoyRef_SolE        (Var Msg : TMessage); message MEstoyRef_SolE;
    procedure EstoyRef_BomE        (Var Msg : TMessage); message MEstoyRef_BomE;
    procedure EstoyRef_EspE        (Var Msg : TMessage); message MEstoyRef_EspE;
    procedure TodosFuera           (Var Msg : TMessage); message MTodosFuera;
    procedure MisCooTarget         (var Msg : TMessage); message MMisCooTarget;



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
   procedure   desplazate(x,y: LongInt; Vel: Integer);
   procedure   IrMaterial(Material : String);
   procedure   Atacar(objetivo,con_que : string);
   procedure   Refugiarse;
   procedure   RecogerTargeta;

   property    Resistencia : Integer read FResistencia write FResistencia;
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
 xM,yM, xB, yB,
 Xr,Yr           : LongInt; // coordendas de Material,Base y Refugio
 Xs,Ys           : LongInt; // coordenadas de Soldado Enemigo
 Xbe, Ybe        : LongInt; // coordenadas de Base Enemiga
 Xee, Yee        : LongInt; // coordenadas de espia enemigo
 XBomE,YBomE     : LongInt; // coordenadas de Bomber enemigo
 Xre, Yre        : LongInt; // coordenadas de Refugio Enemigo
 C               : Real;
 Mensaje         : TMessage;
 MatTransportado : string;
 TopAnt,TopSig   : integer;
 WoodGun         : integeR;
 RockGun         : integer;
 MetalGun        : integer;
 RefugioSiNo     : integer;
 VictRef         : integer;

{----------------------------------------------------------------- constructor}
constructor TSoldado.Create(AOwner : TComponent);
begin
 inherited;
 FBitmap := TBitmap.Create;
 width  := 10;
 height := 15;
 FColor := clWhite;
 FResistencia := 40;

 FAbilitado := True;
 FVelocidad := 100;
 FTimer :=  TTimer.Create(self);
 FTimer.Interval := FVelocidad;
 FTimer.OnTimer := OnTimer;
end;

{----------------------------------------------------------------- destructor}
destructor TSoldado.destroy;
begin
  FBitmap.Free;
  inherited;
end;

{------------------------------------------------------------------- color}
procedure TSoldado.SetColor(AColor: TColor);
begin
  If FColor <> AColor then FColor := AColor;
end;

{----------------------------------------------------------------- paint}
procedure TSoldado.paint;
 var
   rectangulo : TRect;
begin
 rectangulo := Rect(0,0,Width,Height);
 FBitmap.Width := width;
 FBitmap.Height := height;
 FBitmap.Canvas.Brush.Color := FColor;
 FBitmap.Canvas.FillRect(rectangulo);

 FBitmap.Canvas.Pen.Color := clBlack;
 FBitmap.Canvas.Brush.Color := clBlack;
 FBitmap.Canvas.Ellipse(4,1,8,5);

 Fbitmap.Canvas.Brush.Color := clBlue;
 FBitmap.Canvas.Pen.Color := clBlue;
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

{---------------------------------------------------------- ACTUALIZA ESTADO}
function TSoldado.GetEstado(indice: integer): string;
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

procedure TSoldado.SetEstado(indice: integer; valor: string);
begin
  if FEstado[indice] <> valor then
    FEstado[indice] := valor;
end;


{--------------------------------------------------------  CUANDO TOQUE LA BASE}
procedure TSoldado.DoToqueBase;
begin
  If (MatTransportado = 'Madera1') or (MatTransportado = 'Madera2') then
    begin
      Mensaje.Msg := WM_USER + 15;
      Mensaje.WParam := 0;
      Mensaje.LParam := 0;
      Mensaje.Result := 0;
      Application.MainForm.Broadcast(Mensaje);
    end;

  If (MatTransportado = 'Metal1') or (MatTransportado = 'Metal2') then
    begin
      Mensaje.Msg := WM_USER + 16;
      Mensaje.WParam := 0;
      Mensaje.LParam := 0;
      Mensaje.Result := 0;
      Application.MainForm.Broadcast(Mensaje);
    end;

  If (MatTransportado = 'Piedra1') or (MatTransportado = 'Piedra2') then
    begin
      Mensaje.Msg := WM_USER + 17;
      Mensaje.WParam := 0;
      Mensaje.LParam := 0;
      Mensaje.Result := 0;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;


{---------------------------------------------- Calcula  constante de TRAYECTORIA}
procedure TSoldado.Trayectoria(xDest, yDest: LongInt);
begin
  xi := Left;
  yi := Top;
  xf := xDest;
  yf := yDest;
  if xi = xf then xi := xi + 3;
  C := (yi - yf) / (xi - xf);
end;

{---------------------------------------------------------- habilita}
procedure TSoldado.SetAbilitado(AAbilitado: Boolean);
begin
  FAbilitado := AAbilitado;
  if csDesigning in ComponentState then Exit;
  FTimer.Enabled := FAbilitado;
end;

{---------------------------------------------------------- determina velocidad}
procedure TSoldado.SetVelocidad(AVelocidad: Integer);
begin
  IF AVelocidad <> FVelocidad then FVelocidad := AVelocidad;
  FTimer.Interval := FVelocidad;
end;


////////////////////////////////////////////////////////////////////////////////
//////////////   ATACANDO    ///////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSoldado.Atacando;
begin

 TopAnt := Top;
 {1. camina a la base por el arma}
 if (Direccion = 'Base') and (Meta = false) then Begin
     FEstado[5] := 'Voy por arma';
     FXDest := xB; FYdest := yB; Trayectoria(FXDest,FYDest);Velocidad := 10;
   end;


 {2. pide arma a la base}
 if (Direccion = 'Base') and (Meta = True) then begin
    if FEstado[2] = 'Madera' then Mensaje.Msg := WM_USER + 152; {pide madera}
    if FEstado[2] = 'Metal'  then Mensaje.Msg := WM_USER + 298; {pide metal}
    if FEstado[2] = 'Piedra' then Mensaje.Msg := WM_USER + 314; {pide Piedra}
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


   if FEstado[6] = 'Soldado' then Mensaje.Msg := WM_USER + 150;            {pide coo a Soldado Ene}
   if FEstado[6] = 'Bomber'  then Mensaje.Msg := WM_USER + 165 ;           {pide coo a Bomber Ene}
   if FEstado[6] = 'Espia'   then Mensaje.Msg := WM_USER + 496 ;           {pide coo a Espia Ene}
   if FEstado[6] = 'Base'    then Mensaje.Msg := WM_USER + 88;             {pide coo a base enemiga}
   if FEstado[6] = 'Refugio' then Mensaje.Msg := WM_USER + 172;            {pide coo a refugio enemy}

   Mensaje.WParam := 0;
   Mensaje.LParam := 0;
   Mensaje.Result := 0;
   Application.MainForm.Broadcast(Mensaje);

   if FEstado[6] = 'Soldado' then begin FXDest := xs;    FYDest := ys;    end;
   if FEstado[6] = 'Bomber'  then begin FXDest := XBomE; FYDest := YBomE; end;
   if FEstado[6] = 'Espia'   then begin FXDest := Xee;   FYDest := Yee;   end;
   if FEstado[6] = 'Base'    then begin FXDest := Xbe;   FYDest := Ybe;   end;
   if FEstado[6] = 'Refugio' then begin FXDest := Xre;   FYDest := Yre;   end;

    Trayectoria(FXDest,FYDest);
 end;


 {4. Una vez alacanzado lo ataca}
 if (Direccion = 'Victima') and (Meta = True) then begin

    {--------------------- VERIFICACION SI NO ESTAN REFUGIADOS}
    if (FEstado[6] = 'Soldado') Then Mensaje.Msg := WM_USER + 95;
    if (FEstado[6] = 'Bomber')  Then Mensaje.Msg := WM_USER + 147;
    if (FEstado[6] = 'Espia')   Then Mensaje.Msg := WM_USER + 530;
    Application.MainForm.Broadcast(Mensaje);

    if VictRef = 1 then begin Left := Left - 40; Meta := false end;       {1 = refugiado; 0 = Libre}

if VictRef = 0 then
begin
      {----------------- ataques a SOLDADO ENEMIGO}
   if (FEstado[6] = 'Soldado') and (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 158;
   if (FEstado[6] = 'Soldado') and (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 451;
   if (FEstado[6] = 'Soldado') and (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 412;

      {----------------- ataques a BOMBER ENEMIGO}
   if (FEstado[6] = 'Bomber')  and (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 241;
   if (FEstado[6] = 'Bomber')  and (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 295;
   if (FEstado[6] = 'Bomber')  and (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 590;

      {----------------- ataques a ESPIA ENEMIGO}
   if (FEstado[6] = 'Espia')  and (FEstado[2] = 'Madera')  then Mensaje.Msg := WM_USER + 269;
   if (FEstado[6] = 'Espia')  and (FEstado[2] = 'Piedra')  then Mensaje.Msg := WM_USER + 159;
   if (FEstado[6] = 'Espia')  and (FEstado[2] = 'Metal')   then Mensaje.Msg := WM_USER + 341;

      {----------------- ataque a BASE ENEMIGA}
   if (FEstado[6] = 'Base')    and  (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 171;
   if (FEstado[6] = 'Base')    and  (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 446;
   if (FEstado[6] = 'Base')    and  (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 297;

      {----------------- ataque a REFUGIO ENEMIGO}
   if (FEstado[6] = 'Refugio') and  (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 174;
   if (FEstado[6] = 'Refugio') and  (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 134;
   if (FEstado[6] = 'Refugio') and  (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 425;


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



procedure TSoldado.Atacar(objetivo, con_que: string);
begin
 Direccion := 'Base';
 Meta := false;
 Mensaje.Msg := WM_USER + 13;    {pide a base sus coordenadas}
 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);
 FEstado[1] := 'Atacando';        {activa el ataque con procedure "ATACANDO"}
 FEstado[2] := con_que;
 FEstado[6] := objetivo;
end;


{---------------------------------------------------------- desplazamiento}
procedure TSoldado.camina;
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
procedure TSoldado.desplazate(x,y: LongInt; Vel: Integer);
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

procedure TSoldado.cicloMat_Base;
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


{--------------------------------------------------------  IR POR MATERIAL}
procedure TSoldado.IrMaterial(Material : String);
begin
 MatTransportado := Material;
 If Material = 'Madera1' then begin Mensaje.Msg := WM_USER + 1;  FEstado[4] := 'Cargando_Madera'; end;
 If Material = 'Madera2' then begin Mensaje.Msg := WM_USER + 2;  FEstado[4] := 'Cargando_Madera'; end;
 If Material = 'Metal1'  then begin Mensaje.Msg := WM_USER + 3;  FEstado[4] := 'Cargando_Metal'; end;
 If Material = 'Metal2'  then begin Mensaje.Msg := WM_USER + 4;  FEstado[4] := 'Cargando_Metal'; end;
 If Material = 'Piedra1' then begin Mensaje.Msg := WM_USER + 5;  FEstado[4] := 'Cargando_Piedra'; end;
 If Material = 'Piedra2' then begin Mensaje.Msg := WM_USER + 6;  FEstado[4] := 'Cargando_Piedra'; end;

 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 Mensaje.Msg := WM_USER + 13;
 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 FEstado[1] := 'Trayendo material';
 velocidad := 10;
 direccion := 'Material';
 meta      := false;
end;


{------------------------------------------------------------------  yendo por la targeta}
procedure TSoldado.RecogerTargeta;
begin
  FEstado[1] := 'Trayendo targeta';
  velocidad  := 10;
  mensaje.Msg := WM_USER + 325;
  Application.MainForm.Broadcast(Mensaje);
end;

////////////////////////////////////////////////////////////////////////////////
/////////////////////  REFUGIARSE    ///////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


procedure TSoldado.Refugiando;
begin
 TopAnt := Top;

 velocidad := 10;

 if (Direccion = 'Refugio') and (Meta = false) then begin
 FXDest := Xr; FYDest := Yr; Trayectoria(FXDest,FYDest); end;    {TRAZO TRAYECTORIA}


 if (Direccion = 'Refugio') and (Meta = True) then               {PREGUNTO SI ME PUEDE REFUGIAR}
   begin
     Mensaje.Msg := WM_USER + 554;
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
procedure TSoldado.Refugiarse;
begin
 Mensaje.Msg := WM_USER + 46;                               {PIDO COO DE REFUGIO}
 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 FEstado[1]:= 'Llendo a refugiarse';
 direccion := 'Refugio';
 meta      := false;
end;


////////////////////////////////////////////////////////////////////////////////
//==============================================================================
//                         timer
//==============================================================================
////////////////////////////////////////////////////////////////////////////////


procedure TSoldado.OnTimer(Sender: TObject);
begin
  if csDesigning in ComponentState then begin
    FTimer.Enabled := False;
    Exit;
  end;

 If FEstado[1] = 'Desplazandose'       then camina;
 if FEstado[1] = 'Atacando'            then Atacando;
 if FEstado[1] = 'Trayendo material'   then CicloMat_Base;
 if FEstado[1] = 'Llendo a refugiarse' then Refugiando;

end;


////////////////////////////////////////////////////////////////////////////////
//==============================================================================
//                         procesamiento de mensajes
//==============================================================================
////////////////////////////////////////////////////////////////////////////////

procedure TSoldado.ResCooWood1(var Msg : TMessage);
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSoldado.ResCooWood2(var Msg : TMessage);
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSoldado.ResCooMetal1(var Msg : TMessage);
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSoldado.ResCooMetal2(var Msg : TMessage);
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSoldado.ResCooRock1(var Msg : TMessage);
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSoldado.ResCooRock2(var Msg : TMessage);
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

////////////////////////////////////////////////////////////////////////////////
/////////////////////  MESAJES DE BASE   ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSoldado.ResCooBase(var Msg : TMessage); {COORDENADAS}
begin
 xb := Msg.WParam;
 yb := Msg.LParam;
end;


procedure TSoldado.ResWood(var Msg : TMessage);    {RECIBE ARMA DE MADERA}
begin
  WoodGun  := Msg.WParam;
  RockGun  := 0;
  MetalGun := 0;
end;


procedure TSoldado.ResMetal(var Msg : TMessage);    {RECIBE ARMA DE METAL}
begin
  WoodGun  := 0;
  RockGun  := 0;
  MetalGun := Msg.WParam;
end;

procedure TSoldado.ResPiedra(var Msg : TMessage);    {RECIBE ARMA DE PIEDRA}
begin
  WoodGun  := 0;
  RockGun  := Msg.WParam;
  MetalGun := 0;
end;

////////////////////////////////////////////////////////////////////////////////
////////////////////  mensajes recibidos de refugio   //////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSoldado.ResCooRSo(var Msg : TMessage);          {COORDENADAS DE REFUGIO}
begin
 xR := Msg.WParam;
 yR := Msg.LParam;
end;

procedure TSoldado.PuedesRef(var Msg : TMessage);
begin
   RefugioSiNo := Msg.WParam;
end;

procedure TSoldado.TodosFuera(var  Msg : TMessage);
begin
  randomize;
  if FEstado[1] = 'Refugiado' then
  Desplazate(Random(400),Random(400),10);
end;

////////////////////////////////////////////////////////////////////////////////
////////////////////  MENSAJES DE SOLDADO ENEMIGO /// //////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSoldado.CoorSoldadoEne(var Msg: TMessage);      {RECIBE COO DESOLDADO ENEMIGO}
begin
 xS := Msg.WParam;
 yS := Msg.LParam;
end;

procedure TSoldado.EstoyRef_SolE(var Msg : TMessage);    {VERIFICA SI ESTA REFUGIADO}
begin
  VictRef := Msg.WParam;
end;

procedure TSoldado.EstasRef(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 561;
  if FEstado[1] = 'Refugiado' then Mensaje.WParam := 1;
  if FEstado[1] <> 'Refugiado' then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TSoldado.SendMeCoo_SolE(var Msg: TMessage);       {PIDE COORDENADAS}
begin
 Mensaje.Msg := WM_USER + 534;
 Mensaje.WParam := Left;
 Mensaje.LParam := Top;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);
end;

procedure TSoldado.ResAtacMadera(var Msg: TMessage);    {ATAQUE CON MADERA}
begin
  if FResistencia > 0 Then  FResistencia := FResistencia - 1;
end;

procedure TSoldado.ResAtacPiedra(var Msg: TMessage);    {ATAQUE CON PIEDRA}
begin
  if FResistencia <= 2 then FResistencia := 0;
  if FResistencia > 0 Then  FResistencia := FResistencia - 2;
end;

procedure TSoldado.ResAtacMetal(var Msg: TMessage);    {ATAQUE CON METAL}
begin
  if FResistencia <= 3 then FResistencia := 0;
  if FResistencia > 0 Then  FResistencia := FResistencia - 3;
end;


////////////////////////////////////////////////////////////////////////////////
////////////////////  MENSAJES DE BASE ENEMIGA  ////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSoldado.ResCooBE(var Msg: TMessage);            {COORDENADAS DE BASE ENEMIGA}
begin
  Xbe := Msg.WParam;
  Ybe := Msg.LParam;
end;

////////////////////////////////////////////////////////////////////////////////
////////////////////  MENSAJES DE REFUGIO ENEMIGO /// //////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSoldado.ResCooRefE(var Msg : TMessage);         {COORDENDAS DE REFUGIO ENEMIGO}
begin
  Xre := Msg.WParam;
  Yre := Msg.LParam;
end;


////////////////////////////////////////////////////////////////////////////////
////////////////////  MENSAJES DE BOMBER  ENEMIGO /// //////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSoldado.CooBomberE(var Msg : TMessage);          { recibe COORDENADAS DE BOMBER ENEMIGO}
begin
  XBomE := Msg.WParam;
  YBomE := Msg.LParam;
end;


procedure TSoldado.EstoyRef_BomE(var Msg : TMessage);    {VERIFICA SI ESTA REFUGIADO}
begin
  VictRef := Msg.WParam;
end;

procedure TSoldado.EstasRef_BomE(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 350;
  if FEstado[1] = 'Refugiado' then Mensaje.WParam := 1;
  if FEstado[1] <> 'Refugiado' then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;


procedure TSoldado.SendMeCoo_BomE(var Msg : TMessage);    {PIDE COORDENADAS}
begin
 Mensaje.Msg := WM_USER + 525;
 Mensaje.WParam := Left;
 Mensaje.LParam := Top;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);
end;

procedure TSoldado.ResAtacWood_BomE(var Msg: TMessage);    {ATAQUE CON MADERA}
begin
  if FResistencia > 0 Then  FResistencia := FResistencia - 1;
end;

procedure TSoldado.ResAtacRock_BomE(var Msg: TMessage);    {ATAQUE CON PIEDRA}
begin
  if FResistencia <= 2 then FResistencia := 0;
  if FResistencia > 0 Then  FResistencia := FResistencia - 2;
end;

procedure TSoldado.ResAtacMetal_BomE(var Msg: TMessage);    {ATAQUE CON METAL}
begin
  if FResistencia <= 3 then FResistencia := 0;
  if FResistencia > 0 Then  FResistencia := FResistencia - 3;
end;


////////////////////////////////////////////////////////////////////////////////
////////////////////  MENSAJES DE ESPIA   ENEMIGO /// //////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSoldado.CooEspiaE(var Msg : TMessage);          {RECIBE COORDENDAS}
begin
  Xee := Msg.WParam;
  Yee := Msg.LParam;
end;

procedure TSoldado.EstoyRef_EspE(var Msg : TMessage);    {VERIFICA SI ESTA REFUGIADO}
begin
  VictRef := Msg.WParam;
end;

procedure TSoldado.EstasRef_EspE(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 597;
  if FEstado[1] = 'Refugiado' then Mensaje.WParam := 1;
  if FEstado[1] <> 'Refugiado' then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TSoldado.SendMeCoo_EspE(var Msg : TMessage);    {PIDE COORDENADAS}
begin
 Mensaje.Msg := WM_USER + 379;
 Mensaje.WParam := Left;
 Mensaje.LParam := Top;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);
end;

procedure TSoldado.ResAtacWood_EspE(var Msg: TMessage);    {ATAQUE CON MADERA}
begin
  if FResistencia > 0 Then  FResistencia := FResistencia - 1;
end;

procedure TSoldado.ResAtacRock_EspE(var Msg: TMessage);    {ATAQUE CON PIEDRA}
begin
  if FResistencia <= 2 then FResistencia := 0;
  if FResistencia > 0 Then  FResistencia := FResistencia - 2;
end;

procedure TSoldado.ResAtacMetal_EspE(var Msg: TMessage);    {ATAQUE CON METAL}
begin
  if FResistencia <= 3 then FResistencia := 0;
  if FResistencia > 0 Then  FResistencia := FResistencia - 3;
end;

////////////////////////////////////////////////////////////////////////////////
/////////////////////  MENSAHES DE TARGETA  ////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSoldado.MisCooTarget(var Msg : TMessage);
begin
 FXDest := Msg.WParam;
 FYDest := Msg.LParam;
end;

procedure Register;
begin
  RegisterComponents('Juego', [TSoldado]);
end;

end.
