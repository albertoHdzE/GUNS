unit Spy;

interface
 {$R Spy.res}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, stdCtrls,Types;

const
 {MENSAJES DE MATERIAL}
 MResCooWood1S  = WM_USER + 38; {Recive Coordenadas de Materiales de 1 - 6}
 MResCooWood2S  = WM_USER + 39;
 MResCooMetal1S = WM_USER + 40;
 MResCooMetal2S = WM_USER + 41;
 MResCooRock1S  = WM_USER + 42;
 MResCooRock2S  = WM_USER + 43;

 {MENSAJES DE BASE}
 MResCooBaseS   = WM_USER + 45; // recibe coo base
 MResWood       = WM_USER + 56; // recibe madera para construir
 MResMetal      = WM_USER + 60; // recibe METAL para construir
 MResRock       = WM_USER + 61; // recibe PIEDRA para construir

 MResArmaWood     = WM_USER + 452; // RECIBE ARMA DE MADERA
 MResArmaRock     = WM_USER + 574; // RECIBE ARMA DE PIEDRA
 MResArmaMetal    = WM_USER + 440; // RECIBE ARMA DE METAL

 {MENSAJES DE REFUGIO}
 MResCooRS      = WM_USER + 52; // recibe coo de Refugio
 MWoodResR      = WM_USER + 57; // madera aceptada o no por refugio
 MMetalResR     = WM_USER + 62; // madera aceptada o no por refugio
 MRockResR      = WM_USER + 63; // madera aceptada o no por refugio
 MPuedesRef     = WM_USER + 310;
 MTodosFuera    = WM_USER + 498;

 {MENSAJES DE SOLDADO ENEMIGO}
 MResCooSolEne      = WM_USER + 542;    // reecibe coordenadas de sol Ene
 MDameTusCoo_SolE   = WM_USER + 101;    // peticion de coordenadas
 MResAtacWood_SolE  = WM_USER + 361;    // recibe ataque con Madera
 MResAtacRock_SolE  = WM_USER + 383;    // recibe ataque con Piedra
 MResAtacMetal_SolE = WM_USER + 254;    // Recibe ataque con Metal
 MEstasRef          = WM_USER + 434;   // pregunta si esta refugiado
 MEstoyRef_SolE     = WM_USER + 474;

 {MENSAJES DE BOMBER ENEMIGO}
 MResCooBomEne      = WM_USER + 293;     // recibe coo de bomber enemigo
 MGiveMeCoo_BomE    = WM_USER + 541;     // solicita coordendas
 MResAtacWood_BomE  = WM_USER + 139;     // recibe ataque con madera
 MResAtacRock_BomE  = WM_USER + 217;     // recibe ataque con Piedra
 MResAtacMetal_BomE = WM_USER + 114;     // recibe ataque con Metal
 MEstasRef_BomE     = WM_USER + 577;   // pregunta si esta refugiado
 MEstoyRef_BomE     = WM_USER + 428;
 MEstoyRef_EspE     = WM_USER + 546;


 {MENSAJES DE ESPIA ENEMIGO}
 MResCooEspEne      = WM_USER + 524;
 MGiveMeCoo_EspE    = WM_USER + 277;     // solicita coordendas
 MResAtacWood_EspE  = WM_USER + 99;     // recibe ataque con madera
 MResAtacRock_EspE  = WM_USER + 162;     // recibe ataque con Piedra
 MResAtacMetal_EspE = WM_USER + 370;     // recibe ataque con Metal
 MEstasRef_EspE     = WM_USER + 342;   // pregunta si esta refugiado

 {MENSAJES DE BASE ENEMIGA}
 MResCooBasEne   = WM_USER + 329;

 {MENSAJES DE REFUGIO ENEMIGO}
 MResCooRefEne   = WM_USER + 219;




type
  TSpy = class(TGraphicControl)
  private
    FColor            : TColor;
    FBitmap           : TBitmap;
    FResistencia      : Integer;
    FVelocidad        : Integer;
    FAbilitado        : Boolean;
    FTimer            : TTimer;
    FCarWood          : Integer;
    FCarMetal,
    FCarRock          : Integer;
    FEstado           : Array[1..6] of string;

    FOnToqueBase      : TNotifyEvent;
    FOnToqueRefugio   : TNotifyEvent;

    procedure   Atacando;
    procedure   Refugiando;

    function  GetEstado         (Indice: Integer): string;
    procedure SetEstado         (indice: integer; valor: string);
    procedure ResCooWood1S      (Var Msg : TMessage); message MResCooWood1S;
    procedure ResCooWood2S      (Var Msg : TMessage); message MResCooWood2S;
    procedure ResCooMetal1S     (Var Msg : TMessage); message MResCooMetal1S;
    procedure ResCooMetal2S     (Var Msg : TMessage); message MResCooMetal2S;
    procedure ResCooRock1S      (Var Msg : TMessage); message MResCooRock1S;
    procedure ResCooRock2S      (Var Msg : TMessage); message MResCooRock2S;
    procedure ResCooBaseS       (Var Msg : TMessage); message MResCooBaseS;
    procedure ResCoorRS         (Var Msg : TMessage); message MResCooRS;
    procedure ResWood           (Var Msg: TMessage);  message MResWood;
    procedure ResMetal          (Var Msg: TMessage);  message MResMetal;
    procedure ResRock           (Var Msg: TMessage);  message MResRock;
    procedure WoodResR          (Var Msg: TMessage);  message MWoodResR;
    procedure MetalResR         (Var Msg: TMessage);  message MMetalResR;
    procedure RockResR          (Var Msg: TMessage);  message MRockResR;
    procedure ResArmaWood       (Var Msg: TMessage);  message MResArmaWood;
    procedure ResArmaRock       (Var Msg: TMessage);  message MResArmaRock;
    procedure ResArmaMetal      (Var Msg: TMessage);  message MResArmaMetal;
    procedure ResCooSolEne      (Var Msg: TMessage);  message MResCooSolEne;
    procedure ResCooBomEne      (Var Msg: TMessage);  message MResCooBomEne;
    procedure ResCooEspEne      (Var Msg: TMessage);  message MResCooEspEne;
    procedure ResCooBasEne      (Var Msg: TMessage);  message MResCooBasEne;
    procedure ResCooRefEne      (Var Msg: TMessage);  message MResCooRefEne;
    procedure DameTusCoo_SolE   (Var Msg: TMessage);  message MDameTusCoo_SolE;
    procedure ResAtacWood_SolE  (Var Msg: TMessage);  message MResAtacWood_SolE;
    procedure ResAtacRock_SolE  (Var Msg: TMessage);  message MResAtacRock_SolE;
    procedure ResAtacMetal_SolE (Var Msg: TMessage);  message MResAtacMetal_SolE;
    procedure GiveMeCoo_BomE    (Var Msg: TMessage);  message MGiveMeCoo_BomE;
    procedure ResAtacWood_BomE  (Var Msg: TMessage);  message MResAtacWood_BomE;
    procedure ResAtacRock_BomE  (Var Msg: TMessage);  message MResAtacRock_BomE;
    procedure ResAtacMetal_BomE (Var Msg: TMessage);  message MResAtacMetal_BomE;
    procedure GiveMeCoo_EspE    (Var Msg: TMessage);  message MGiveMeCoo_EspE;
    procedure ResAtacWood_EspE  (Var Msg: TMessage);  message MResAtacWood_EspE;
    procedure ResAtacRock_EspE  (Var Msg: TMessage);  message MResAtacRock_EspE;
    procedure ResAtacMetal_EspE (Var Msg: TMessage);  message MResAtacMetal_EspE;
    procedure PuedesRef         (Var Msg: TMessage);  message MPuedesRef;
    procedure EstasRef          (Var Msg: TMessage);  message MEstasRef;
    procedure EstasRef_BomE     (Var Msg: TMessage);  message MEstasRef_BomE;
    procedure EstasRef_EspE     (Var Msg: TMessage);  message MEstasRef_EspE;
    procedure EstoyRef_SolE     (Var Msg: TMessage);  message MEstoyRef_SolE;
    procedure EstoyRef_BomE     (Var Msg: TMessage);  message MEstoyRef_BomE;
    procedure EstoyRef_EspE     (Var Msg: TMessage);  message MEstoyRef_EspE;
    procedure TodosFuera           (Var Msg : TMessage); message MTodosFuera;



  protected
    procedure DoToqueBase;               virtual;
    procedure DoToqueRefugio;            virtual;
    procedure OnTimer(Sender : TOBject); virtual;

    procedure SetColor(AColor: TColor);
    procedure SetVelocidad(AVelocidad: Integer);
    procedure SetAbilitado(AAbilitado: Boolean);
    procedure paint; override;
    procedure Trayectoria(xDest,yDest: LongInt);
    procedure camina;
    procedure cicloMat_Base;
    procedure cicloBase_Ref;


  public
   constructor Create(AOwner : TComponent); override;
   destructor  destroy;                     override;
   property    Resistencia : Integer         read FResistencia    write FResistencia;
   property    OnToqueBase : TNotifyEvent    read FOnToqueBase    write FOnToqueBase;
   property    OnToqueRefugio : TNotifyEvent read FOnToqueRefugio write FOnToqueRefugio;
   procedure   IrMaterial(Material : String);
   procedure   Construir(Refugio, Material: String);
   procedure   Atacar(objetivo,con_que : string);
   procedure   desplazate(x,y: LongInt; Vel: Integer);
   procedure   Refugiarse;

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
 tarea           : string;
 FXDest, FYDest  : LongInt;
 Meta            : Boolean;
 Direccion       : string;
 xM,yM, xB, yB,
 xR,yR           : LongInt; // coordenadas de Material, Base y Refugio
 Xs,Ys           : LongInt; // coordenadas de Soldado Enemigo
 Xbe, Ybe        : LongInt; // coordenadas de Base Enemiga
 Xee, Yee        : LongInt; // coordenadas de espia enemigo
 XBomE,YBomE     : LongInt; // coordenadas de Bomber enemigo
 Xre, Yre        : LongInt; // coordenadas de Refugio Enemigo
 C               : Real;
 Mensaje         : TMessage;
 MatTransportado : string;
 TopAnt, TopSig  : Integer;
 WoodGun         : integer;
 RockGun         : integer;
 MetalGun        : integer;
 RefugioSiNo     : integer;
 VictRef         : integer;

{----------------------------------------------------------------- constructor}
constructor TSpy.Create(AOwner : TComponent);
begin
 inherited;
 FBitmap := TBitmap.Create;
 width  := 10;
 height := 15;
 FColor := clWhite;
 FResistencia := 30;

 FAbilitado := True;
 FVelocidad := 10;
 FTimer :=  TTimer.Create(self);
 FTimer.Interval := FVelocidad;
 FTimer.OnTimer := OnTimer;
end;

{----------------------------------------------------------------- destructor}
destructor TSpy.destroy;
begin
  FBitmap.Free;
  inherited;
end;

{------------------------------------------------------------------- color}
procedure TSpy.SetColor(AColor: TColor);
begin
  If FColor <> AColor then FColor := AColor;
end;

{----------------------------------------------------------------- paint}
procedure TSpy.paint;
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
 FBitmap.Canvas.MoveTo(4,5);
 FBitmap.Canvas.LineTo(7,5);
 FBitmap.Canvas.LineTo(8,6);
 FBitmap.Canvas.LineTo(7,7);
 FBitmap.Canvas.LineTo(4,7);
 FBitmap.Canvas.LineTo(4,5);
 FBitmap.Canvas.LineTo(4,10);
 canvas.Draw(0,0,FBitmap);
end;


{---------------------------------------------- ACTUALIZA EL ESTADO INTERNO}
function TSpy.GetEstado(indice: integer): string;
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

procedure TSpy.SetEstado(indice: integer; valor: string);
begin
  if FEstado[indice] <> valor then
    FEstado[indice] := valor;
end;

{---------------------------------------------- Calcula  constante de TRAYECTORIA}
procedure TSpy.Trayectoria(xDest, yDest: LongInt);
begin
  xi := Left;
  yi := Top;
  xf := xDest;
  yf := yDest;
  if xi = xf then xi := xi + 3;
 C := (yi - yf) / (xi - xf);
end;

{---------------------------------------------------------- habilita}
procedure TSpy.SetAbilitado(AAbilitado: Boolean);
begin
  FAbilitado := AAbilitado;
  if csDesigning in ComponentState then Exit;
  FTimer.Enabled := FAbilitado;
end;

{---------------------------------------------------------- determina velocidad}
procedure TSpy.SetVelocidad(AVelocidad: Integer);
begin
  FVelocidad := AVelocidad;
  FTimer.Interval := FVelocidad;
end;


{---------------------------------------------------------- desplazamiento}
procedure TSpy.camina;
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
procedure TSpy.desplazate(x,y: LongInt; Vel: Integer);
begin
  FXDest := x;
  FYDest := y;
  Trayectoria(FXdest,FYDest); {calcula constante de ec.}
  Velocidad := Vel;
  Estado[1] := 'Desplazandose';
end;


{--------------------------------------------------------  CUANDO TOQUE LA BASE}
procedure TSpy.DoToqueBase;
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


{--------------------------------------------------------  CUANDO TOQUE LA BASE}
procedure TSpy.DoToqueRefugio;
begin

  If (MatTransportado = 'Madera1') or (MatTransportado = 'Madera2') then
    begin
      Mensaje.Msg := WM_USER + 49; {--- "Recibe Madera de Spy' ---}
      Mensaje.WParam := 0;
      Mensaje.LParam := 0;
      Mensaje.Result := 0;
      Application.MainForm.Broadcast(Mensaje);
    end;

  If (MatTransportado = 'Metal1') or (MatTransportado = 'Metal2') then
    begin
      Mensaje.Msg := WM_USER + 50; {--- "Recibe Metal de Spy' ---}
      Mensaje.WParam := 0;
      Mensaje.LParam := 0;
      Mensaje.Result := 0;
      Application.MainForm.Broadcast(Mensaje);
    end;

  If (MatTransportado = 'Piedra1') or (MatTransportado = 'Piedra2') then
    begin
      Mensaje.Msg := WM_USER + 51; {--- "Recibe Piedra de Spy' ---}
      Mensaje.WParam := 0;
      Mensaje.LParam := 0;
      Mensaje.Result := 0;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;


////////////////////////////////////////////////////////////////////////////////
/////////////////////  IR POR MATERIAL//////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
procedure TSpy.cicloMat_Base;
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

{-------------------------------------------------------------}
procedure TSpy.IrMaterial(Material : String);
begin
 MatTransportado := Material;
 If Material = 'Madera1' then begin Mensaje.Msg := WM_USER + 32; FEstado[4] := 'Cargando_Madera'; end;
 If Material = 'Madera2' then begin Mensaje.Msg := WM_USER + 33; FEstado[4] := 'Cargando_Madera'; end;
 If Material = 'Metal1'  then begin Mensaje.Msg := WM_USER + 34; FEstado[4] := 'Cargando_Metal';  end;
 If Material = 'Metal2'  then begin Mensaje.Msg := WM_USER + 35; FEstado[4] := 'Cargando_Metal';  end;
 If Material = 'Piedra1' then begin Mensaje.Msg := WM_USER + 36; FEstado[4] := 'Cargando_Piedra'; end;
 If Material = 'Piedra2' then begin Mensaje.Msg := WM_USER + 37; FEstado[4] := 'Cargando_Piedra'; end;

 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 Mensaje.Msg := WM_USER + 44;
 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 Estado[1] := 'Trayendo material';
 velocidad := 10;
 direccion := 'Material';
 meta      := false;
end;

////////////////////////////////////////////////////////////////////////////////
//////////////////////   CONSTRUIR  ////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSpy.cicloBase_Ref;
begin
  TopAnt :=  Top;
  {1. SI VA HACIA LA BASE}
  if (direccion = 'Base') and (Meta = false) then
   begin
     FXDest := xB;
     FYDest := yB;
     Trayectoria(FXDest,FYDest);
     FVelocidad := 10;
   end;

  {2. UNA VEZ LLEGANDO A LA BASE}
  if (direccion = 'Base') and (Meta = true) then
   begin                                                             {-- enviados a base --}
     if MatTransportado = 'Madera' then begin
         Mensaje.Msg := WM_USER + 55; { 'Dame Madera'}
         Festado[4] := 'Cargando_Madera';
         Velocidad := 12;
       end;

     if MatTransportado = 'Metal'  then begin
         Mensaje.Msg := WM_USER + 58; { 'Dame Metal'}
         FEstado[4] := 'Cargando_Metal';
         Velocidad := 14;
       end;

     if MatTransportado = 'Piedra' then begin
         Mensaje.Msg := WM_USER + 59; { 'Dame Piedra'}
         FEstado[4] := 'Cargando_Piedra';
         Velocidad := 16;
       end;

        Mensaje.WParam := 0;
        Mensaje.LParam := 0;
        Mensaje.Result := 0;
        Application.MainForm.Broadcast(Mensaje);

     if (FEstado[1] = 'Construyendo') and (FEstado[4] = 'Cargando_Madera') then
       if FCarWood = 0 then begin direccion := 'Base'; meta := false; end
       else begin direccion := 'Refugio'; Meta := false; end;


     if (FEstado[1] = 'Construyendo') and (FEstado[4] = 'Cargando_Metal') then
       if FCarMetal = 0 then begin direccion := 'Base'; meta := false;end
       else begin direccion := 'Refugio'; Meta := false; end;


     if (FEstado[1] = 'Construyendo') and (FEstado[4] = 'Cargando_Piedra') then
       if FCarRock = 0 then begin direccion := 'Base'; meta := false; end
       else begin direccion := 'Refugio'; Meta := false; end;
  end;


 {SI VA HACIA EL REFUGIO}
 if (direccion = 'Refugio') and (Meta = false) then begin
    FXDest := xR; FYDest := yR;Trayectoria(FXDest,FYDest);Velocidad := 20;
  end;


 {CUANDO LLEGA AL REFUGIO}
 if (Direccion = 'Refugio') and (Meta = true) then begin          {--- enviados de SPy a Refugio ---}
   if FEstado[4] = 'Cargando_Madera' then Mensaje.Msg := WM_USER + 49; {'Recibe Madera'}
   if FEstado[4] = 'Cargando_Metal'  then Mensaje.Msg := WM_USER + 50; {'Recibe Metal'}
   if FEstado[4] = 'Cargando_Piedra' then Mensaje.Msg := WM_USER + 51; {'Recibe Piedra'}
       Mensaje.WParam := 0;
       Mensaje.LParam := 0;
       Mensaje.Result := 0;
       Application.MainForm.Broadcast(Mensaje);
   DoToqueRefugio;
   direccion := 'Base'; Meta := false;
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

{**************************************************** (2)}
procedure TSpy.Construir(Refugio, Material : String);
begin
 MatTransportado := Material;
 Mensaje.Msg := WM_USER + 48; //-- Pide coordenadas al refugio el Spia
 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 Mensaje.Msg := WM_USER + 44;//--- Pide coordenadas a la base
 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);
 If Material = 'Madera' then FEstado[4] := 'Cargando_Madera';
 If Material = 'Metal' then FEstado[4]  := 'Cargando_Metal';
 If Material = 'Piedra' then FEstado[4] := 'Cargando_Piedra';

 FEstado[1] := 'Construyendo';
 velocidad := 10;
 direccion := 'Base';
 meta      := false;
 tarea     := 'Construir';
end;

////////////////////////////////////////////////////////////////////////////////
//////////////   ATACANDO    ///////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSpy.Atacando;
begin

 TopAnt := Top;
 {1. camina a la base por el arma}
 if (Direccion = 'Base') and (Meta = false) then Begin
     FEstado[5] := 'Voy por arma';
     FXDest := xB; FYdest := yB; Trayectoria(FXDest,FYDest);Velocidad := 10;
   end;


 {2. pide arma a la base}
 if (Direccion = 'Base') and (Meta = True) then begin

    if FEstado[2] = 'Madera' then Mensaje.Msg := WM_USER + 138; {pide arma de madera}
    if FEstado[2] = 'Metal'  then Mensaje.Msg := WM_USER + 358; {pide arma de metal}
    if FEstado[2] = 'Piedra' then Mensaje.Msg := WM_USER + 380; {pide arma de Piedra}
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

   if FEstado[6] = 'Soldado' then Mensaje.Msg := WM_USER + 405;            {pide coo a Soldado Ene}
   if FEstado[6] = 'Bomber'  then Mensaje.Msg := WM_USER + 375 ;           {pide coo a Bomber Ene}
   if FEstado[6] = 'Espia'   then Mensaje.Msg := WM_USER + 543 ;           {pide coo a Espia Ene}
   if FEstado[6] = 'Base'    then Mensaje.Msg := WM_USER + 319;            {pide coo a base enemiga}
   if FEstado[6] = 'Refugio' then Mensaje.Msg := WM_USER + 566;            {pide coo a refugio enemy}

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

    if (FEstado[6] = 'Soldado') Then Mensaje.Msg := WM_USER + 456;
    if (FEstado[6] = 'Bomber')  Then Mensaje.Msg := WM_USER + 107;
    if (FEstado[6] = 'Espia')   Then Mensaje.Msg := WM_USER + 527;
    Application.MainForm.Broadcast(Mensaje);

    if VictRef = 1 then begin Left := Left - 40; Meta := false end;       {1 = refugiado; 0 = Libre}

if VictRef = 0 then
 begin
      {----------------- ataques a SOLDADO ENEMIGO}
   if (FEstado[6] = 'Soldado') and (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 587;
   if (FEstado[6] = 'Soldado') and (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 126;
   if (FEstado[6] = 'Soldado') and (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 427;

      {----------------- ataques a BOMBER ENEMIGO}
   if (FEstado[6] = 'Bomber')  and (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 306;
   if (FEstado[6] = 'Bomber')  and (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 419;
   if (FEstado[6] = 'Bomber')  and (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 299;

      {----------------- ataques a ESPIA ENEMIGO}
   if (FEstado[6] = 'Espia')  and (FEstado[2] = 'Madera')  then Mensaje.Msg := WM_USER + 324;
   if (FEstado[6] = 'Espia')  and (FEstado[2] = 'Piedra')  then Mensaje.Msg := WM_USER + 256;
   if (FEstado[6] = 'Espia')  and (FEstado[2] = 'Metal')   then Mensaje.Msg := WM_USER + 196;

      {----------------- ataque a BASE ENEMIGA}
   if (FEstado[6] = 'Base')    and  (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 201;
   if (FEstado[6] = 'Base')    and  (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 320;
   if (FEstado[6] = 'Base')    and  (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 532;

      {----------------- ataque a REFUGIO ENEMIGO}
   if (FEstado[6] = 'Refugio') and  (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 207;
   if (FEstado[6] = 'Refugio') and  (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 484;
   if (FEstado[6] = 'Refugio') and  (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 495;


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



procedure TSpy.Atacar(objetivo, con_que: string);
begin
 Direccion := 'Base';
 Meta := false;
 Mensaje.Msg := WM_USER + 44;    {pide a base sus coordenadas}
 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);
 FEstado[1] := 'Atacando';        {activa el ataque con procedure "ATACANDO"}
 FEstado[2] := con_que;
 FEstado[6] := objetivo;
end;

////////////////////////////////////////////////////////////////////////////////
/////////////////////  REFUGIARSE    ///////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


procedure TSpy.Refugiando;
begin
 TopAnt := Top;

 velocidad := 10;

 if (Direccion = 'Refugio') and (Meta = false) then begin
 FXDest := Xr; FYDest := Yr; Trayectoria(FXDest,FYDest); end;    {TRAZO TRAYECTORIA}


 if (Direccion = 'Refugio') and (Meta = True) then               {PREGUNTO SI ME PUEDE REFUGIAR}
   begin
     Mensaje.Msg := WM_USER + 127;
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
procedure TSpy.Refugiarse;
begin
 Mensaje.Msg := WM_USER + 48;                               {PIDO COO DE REFUGIO}
 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 FEstado[1]:= 'Llendo a refugiarse';
 direccion := 'Refugio';
 meta      := false;
end;


{---------------------------------------------------------- EJECUCION DE TAREAS}
procedure TSpy.OnTimer(Sender: TObject);
begin

  if csDesigning in ComponentState then begin
    FTimer.Enabled := False;
    Exit;
  end;

 Hint := FEstado[5];

 If FEstado[1] = 'Desplazandose'     then camina;
 If FEstado[1] = 'Atacando'          then Atacando;
 if FEstado[1] = 'Trayendo material' then CicloMat_Base;
 if FEstado[1] = 'Construyendo'      then CicloBase_Ref;
 if FEstado[1] = 'Llendo a refugiarse' then Refugiando;
end;


{=========================================================================
==================== Procesamiento de Mensajes ===========================}

procedure TSpy.ResCooWood1S(var Msg : TMessage); {--> Coo de madera1}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSpy.ResCooWood2S(var Msg : TMessage); {--> Coo de madera2}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSpy.ResCooMetal1S(var Msg : TMessage);{--> Coo de Metal1}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSpy.ResCooMetal2S(var Msg : TMessage);{--> Coo de Metal2}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSpy.ResCooRock1S(var Msg : TMessage); {--> Coo de Piedra 1}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSpy.ResCooRock2S(var Msg : TMessage);{--> Coo de Piedra 2}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSpy.ResCoorRS(var Msg : TMessage); {--> Coo de REFUGIO}
begin
 xR := Msg.WParam;
 yR := Msg.LParam;
end;


////////////////////////////////////////////////////////////////////////////////
//////////////////  MENSAJES  DE BASE DE CONTROL  //////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSpy.ResCooBaseS(var Msg : TMessage);{--> Coo de BASE}
begin
 xb := Msg.WParam;
 yb := Msg.LParam;
end;

procedure TSpy.ResWood(var Msg: TMessage); {--> Recibe la Madera para construir}
begin
 FCarWood := Msg.WParam;
end;

procedure TSpy.ResMetal(var Msg :TMessage); {--> Recibe Metal para construir}
begin
  FCarMetal := Msg.WParam;
end;

procedure TSpy.ResRock(var Msg : TMessage);{--> Recibe Piedra para construir}
begin
 FCarRock := Msg.WParam;
end;

procedure TSpy.ResArmaWood(var Msg : TMessage);   {RECIBE ARMA DE MADERA}
begin
  WoodGun := Msg.WParam;
  RockGun := 0;
  MetalGun:= 0;
end;

procedure TSpy.ResArmaRock(var Msg : TMessage);   {RECIBE ARMA DE PIEDRA}
begin
  WoodGun := 0;
  RockGun := Msg.WParam;
  MetalGun:= 0;
end;

procedure TSpy.ResArmaMetal(var Msg : TMessage);   {RECIBE ARMA DE METAL}
begin
  WoodGun := 0;
  RockGun := 0;
  MetalGun:= Msg.WParam;
end;


////////////////////////////////////////////////////////////////////////////////
//////////////////  MENSAJES  DE REFUGIO   /////  //////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSpy.TodosFuera(var  Msg : TMessage);
begin
  randomize;
  if FEstado[1] = 'Refugiado' then
  Desplazate(Random(400),Random(400),10);
end;

procedure TSpy.PuedesRef(var Msg : TMessage);
begin
   RefugioSiNo := Msg.WParam;
end;

procedure TSpy.WoodResR(var Msg: TMessage);
begin
  if Msg.WParam = 0 then
    begin
      FCarWood := 0;
      desplazate(xR + 25, yR + 25,10);
    end;
end;

procedure TSpy.MetalResR(var Msg : TMessage);
begin
 if Msg.WParam = 0 then
    begin
      FCarWood := 0;
      desplazate(xR + 25, yR + 25,10);
    end;
end;

procedure TSpy.RockResR(var Msg : TMessage);
begin
 if Msg.WParam = 0 then
    begin
      FCarWood := 0;
      desplazate(xR + 25, yR + 25,10);
    end;
end;

////////////////////////////////////////////////////////////////////////////////
//////////////////  mensajes de SOLDADO ENEMIGO   //////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSpy.ResCooSolEne(var  Msg : TMessage);     {RECIBE COORDENADAS}
begin
 Xs := Msg.WParam;
 Ys := Msg.LParam;
end;

procedure TSpy.EstoyRef_SolE(var Msg : TMessage);    {VERIFICA SI ESTA REFUGIADO}
begin
  VictRef := Msg.WParam;
end;

procedure TSpy.EstasRef(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 475;
  if FEstado[1] = 'Refugiado' then Mensaje.WParam := 1;
  if FEstado[1] <> 'Refugiado' then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TSpy.DameTusCoo_SolE(var Msg : TMessage);     {SOLICITA COORDENADAS}
begin
 Mensaje.Msg := WM_USER + 490;
 Mensaje.WParam := Left;
 Mensaje.LParam := Top;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);
end;

procedure TSpy.ResAtacWood_SolE(var Msg : TMessage);     {ATAQUE CON MADERA}
begin
  if Resistencia > 0 then Resistencia := Resistencia - 1;
end;

procedure TSpy.ResAtacRock_SolE(var Msg : TMessage);     {ATAQUE CON PIEDRA}
begin
  if FResistencia <= 2 then FResistencia := 0;
  if Resistencia > 1 then Resistencia := Resistencia - 2;
end;

procedure TSpy.ResAtacMetal_SolE(var Msg : TMessage);     {ATAQUE CON METAL}
begin
  if FResistencia <= 3 then FResistencia := 0;
  if Resistencia > 2 then Resistencia := Resistencia - 3;
end;
////////////////////////////////////////////////////////////////////////////////
//////////////////  mensajes de BOMBER ENEMIGO   //////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSpy.ResCooBomEne(var  Msg : TMessage);     {RECIBE COORDENDAS}
begin
 XBomE := Msg.WParam;
 YBomE := Msg.LParam;
end;

procedure TSpy.EstoyRef_BomE(var Msg : TMessage);    {VERIFICA SI ESTA REFUGIADO}
begin
  VictRef := Msg.WParam;
end;

procedure TSpy.EstasRef_BomE(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 214;
  if FEstado[1] = 'Refugiado' then Mensaje.WParam := 1;
  if FEstado[1] <> 'Refugiado' then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TSpy.GiveMeCoo_BomE(var Msg: TMessage);     {PIDE COORDENDAS}
begin
  Mensaje.Msg := WM_USER + 290;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TSpy.ResAtacWood_BomE(var Msg : TMessage);     {ATAQUE CON MADERA}
begin
  if Resistencia > 0 then Resistencia := Resistencia - 1;
end;

procedure TSpy.ResAtacRock_BomE(var Msg : TMessage);     {ATAQUE CON PIEDRA}
begin
  if FResistencia <= 2 then FResistencia := 0;
  if Resistencia > 1 then Resistencia := Resistencia - 2;
end;

procedure TSpy.ResAtacMetal_BomE(var Msg : TMessage);     {ATAQUE CON METAL}
begin
  if FResistencia <= 3 then FResistencia := 0;
  if Resistencia > 2 then Resistencia := Resistencia - 3;
end;

////////////////////////////////////////////////////////////////////////////////
//////////////////  mensajes de ESPIA ENEMIGO   //////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSpy.ResCooEspEne(var  Msg : TMessage);     {PIDE COORDENADAS}
begin
 Xee := Msg.WParam;
 Yee := Msg.LParam;
end;

procedure TSpy.EstoyRef_EspE(var Msg : TMessage);    {VERIFICA SI ESTA REFUGIADO}
begin
  VictRef := Msg.WParam;
end;

procedure TSpy.EstasRef_EspE(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 261;
  if FEstado[1] = 'Refugiado' then Mensaje.WParam := 1;
  if FEstado[1] <> 'Refugiado' then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TSpy.GiveMeCoo_EspE(var Msg: TMessage);     {PIDE COORDENDAS}
begin
  Mensaje.Msg := WM_USER + 277;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;



procedure TSpy.ResAtacWood_EspE(var Msg : TMessage);     {ATAQUE CON MADERA}
begin
  if Resistencia > 0 then Resistencia := Resistencia - 1;
end;

procedure TSpy.ResAtacRock_EspE(var Msg : TMessage);     {ATAQUE CON PIEDRA}
begin
  if FResistencia <= 2 then FResistencia := 0;
  if Resistencia > 1 then Resistencia := Resistencia - 2;
end;

procedure TSpy.ResAtacMetal_EspE(var Msg : TMessage);     {ATAQUE CON METAL}
begin
  if FResistencia <= 3 then FResistencia := 0;
  if Resistencia > 2 then Resistencia := Resistencia - 3;
end;

////////////////////////////////////////////////////////////////////////////////
//////////////////  mensajes de BASE ENEMIGA   //////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSpy.ResCooBasEne(var  Msg : TMessage);     {PIDE COORDENADAS}
begin
 Xbe := Msg.WParam;
 Ybe := Msg.LParam;
end;

////////////////////////////////////////////////////////////////////////////////
//////////////////  mensajes de REFUGIO ENEMIGO   //////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSpy.ResCooRefEne(var  Msg : TMessage);     {PIDE COORDENADAS}
begin
 Xre := Msg.WParam;
 Yre := Msg.LParam;
end;



procedure Register;
begin
  RegisterComponents('Juego', [TSpy]);
end;

end.
