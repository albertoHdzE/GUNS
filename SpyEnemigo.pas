unit SpyEnemigo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, stdCtrls,Types;

const
 {MENSAJES DE MATERIAL}
 MResCooWood1  = WM_USER + 389; {Recive Coordenadas de Materiales de 1 - 6}
 MResCooWood2  = WM_USER + 250;
 MResCooMetal1 = WM_USER + 276;
 MResCooMetal2 = WM_USER + 435;
 MResCooRock1  = WM_USER + 248;
 MResCooRock2  = WM_USER + 467;

 {MENSAJES DE BASE ENEMIGA}
 MResCooBase   = WM_USER + 539;    // recibe coo base enemiga
 MResWood      = WM_USER + 472;    // recibe madera para construir
 MResMetal     = WM_USER + 501;    // recibe metal  para construir
 MResRock      = WM_USER + 199;    // recibe piedra para constuir

 MResWoodGun   = WM_USER + 432;    // recibe arma de madera
 MResMetalGun  = WM_USER + 251;    // recibe arma de Metal
 MResRockGun   = WM_USER + 238;    // recibe arma de Piedra

 {MENSAJES DE REFUGIO}
 MResCooR          = WM_USER + 433; // recibe coo de Refugio
 MWoodResRefE      = WM_USER + 551; // madera aceptada o no por refugio
 MMetalResRefE     = WM_USER + 502; // madera aceptada o no por refugio
 MRockResRefE      = WM_USER + 272; // madera aceptada o no por refugio

 {MENSAJES DE SOLDADO}
 MResCoo_Sol       = WM_USER + 379; // recibe coordendas de soldado
 MGiveCoo          = WM_USER + 496; // solicita coordendas
 MResAtacWood_sol  = WM_USER + 269; // ataque con madera
 MResAtacRock_sol  = WM_USER + 159; // ataque con piedra
 MResAtacMetal_sol = WM_USER + 341; // ataque con metal
 MEstoyRef_Sol     = WM_USER + 597;
 MEstasRef_Sol     = WM_USER + 530;

 {MENSAJES DE BOMBER}
 MResCoo_Bom        = WM_USER + 391;
 MSendMeCoo_Bom     = WM_USER + 156;
 MResAtacWood_Bom   = WM_USER + 410;
 MResAtacRock_Bom   = WM_USER + 507;
 MResAtacMetal_Bom  = WM_USER + 511;
 MEstoyRef_Bom      = WM_USER + 568;
 MEstasRef_Bom      = WM_USER + 354;

 {MENSAJES DE ESPIA}
 MResCoo_Esp        = WM_USER + 117;
 MSendMeCoo_Esp     = WM_USER + 543;
 MResAtacWood_Esp   = WM_USER + 324;
 MResAtacRock_Esp   = WM_USER + 256;
 MResAtacMetal_Esp  = WM_USER + 196;
 MEstoyRef_Esp      = WM_USER + 261;
 MEstasRef_Esp      = WM_USER + 527;

 {MENSAJES DE BASE}
 MResCoo_Bas        = WM_USER + 175;

 {MENSAJES DE BASE}
 MResCoo_Ref        = WM_USER + 268;

 {MENSAJES DE REFUGIO ENEMIGO}
 MPuedesRef          = WM_USER + 497;
 MTodosFuera      = WM_USER + 271;


type
  TSpyEnemigo = class(TGraphicControl)
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

    function  GetEstado (Indice: Integer): string;
    procedure SetEstado(indice: integer; valor: string);
    procedure Atacando;
    procedure Refugiando;

    procedure ResCooWood1      (Var Msg : TMessage); message MResCooWood1;
    procedure ResCooWood2      (Var Msg : TMessage); message MResCooWood2;
    procedure ResCooMetal1     (Var Msg : TMessage); message MResCooMetal1;
    procedure ResCooMetal2     (Var Msg : TMessage); message MResCooMetal2;
    procedure ResCooRock1      (Var Msg : TMessage); message MResCooRock1;
    procedure ResCooRock2      (Var Msg : TMessage); message MResCooRock2;
    procedure ResCooBase       (Var Msg : TMessage); message MResCooBase;
    procedure ResCoorR         (Var Msg : TMessage); message MResCooR;
    procedure ResWood          (Var Msg: TMessage);  message MResWood;
    procedure ResMetal         (Var Msg: TMessage);  message MResMetal;
    procedure ResRock          (Var Msg: TMessage);  message MResRock;
    procedure WoodResRefE      (Var Msg: TMessage);  message MWoodResRefE;
    procedure MetalResRefE     (Var Msg: TMessage);  message MMetalResRefE;
    procedure RockResRefE      (Var Msg: TMessage);  message MRockResRefE;
    procedure GiveCoo          (Var Msg: TMessage); message MGiveCoo;
    procedure ResAtacWood_sol  (Var Msg : TMessage); message MResAtacWood_sol;
    procedure ResAtacRock_sol  (Var Msg : TMessage); message MResAtacRock_sol;
    procedure ResAtacMetal_sol (Var Msg : TMessage); message MResAtacMetal_sol;
    procedure SendMeCoo_Bom    (Var Msg : TMessage); message MSendMeCoo_Bom;
    procedure ResAtacWood_Bom  (Var Msg : TMessage); message MResAtacWood_Bom;
    procedure ResAtacRock_Bom  (Var Msg : TMessage); message MResAtacRock_Bom;
    procedure ResAtacMetal_Bom (Var Msg : TMessage); message MResAtacMetal_Bom;
    procedure SendMeCoo_Esp    (Var Msg : TMessage); message MSendMeCoo_Esp;
    procedure ResAtacWood_Esp  (Var Msg : TMessage); message MResAtacWood_Esp;
    procedure ResAtacRock_Esp  (Var Msg : TMessage); message MResAtacRock_Esp;
    procedure ResAtacMetal_Esp (Var Msg : TMessage); message MResAtacMetal_Esp;
    procedure ResWoodGun       (Var Msg: TMessage);  message MResWoodGun;
    procedure ResMetalGun      (Var Msg: TMessage);  message MResMetalGun;
    procedure ResRockGun       (Var Msg: TMessage);  message MResRockGun;
    procedure ResCoo_Sol       (Var Msg: TMessage);  message MResCoo_Sol;
    procedure ResCoo_Bom       (Var Msg: TMessage);  message MResCoo_Bom;
    procedure ResCoo_Esp       (Var Msg: TMessage);  message MResCoo_Esp;
    procedure ResCoo_Bas       (Var Msg: TMessage);  message MResCoo_Bas;
    procedure ResCoo_Ref       (Var Msg: TMessage);  message MResCoo_Ref;
    procedure PuedesRef       (Var Msg: TMessage);  message MPuedesRef;
    procedure EstoyRef_Sol     (Var Msg : TMessage); message MEstoyRef_Sol;
    procedure EstoyRef_Bom     (Var Msg : TMessage); message MEstoyRef_Bom;
    procedure EstoyRef_Esp     (Var Msg : TMessage); message MEstoyRef_Esp;
    procedure EstasRef_Sol     (Var Msg : TMessage); message MEstasRef_Sol;
    procedure EstasRef_Bom     (Var Msg : TMessage); message MEstasRef_Bom;
    procedure EstasRef_Esp     (Var Msg : TMessage); message MEstasRef_Esp;
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
 xR,yR           : LongInt; // coordenadas de Material, Base Ene y Refugio Ene
 Xs,Ys           : LongInt; // coordenadas de Soldado
 Xbe, Ybe        : LongInt; // coordenadas de Base
 Xee, Yee        : LongInt; // coordenadas de espia
 XBomE,YBomE     : LongInt; // coordenadas de Bomber
 Xre, Yre        : LongInt; // coordenadas de Refugio
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
constructor TSpyEnemigo.Create(AOwner : TComponent);
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
destructor TSpyEnemigo.destroy;
begin
  FBitmap.Free;
  inherited;
end;

{------------------------------------------------------------------- color}
procedure TSpyEnemigo.SetColor(AColor: TColor);
begin
  If FColor <> AColor then FColor := AColor;
end;

{----------------------------------------------------------------- paint}
procedure TSpyEnemigo.paint;
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

 Fbitmap.Canvas.Brush.Color := clRed;
 FBitmap.Canvas.Pen.Color := clRed;
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
function TSpyEnemigo.GetEstado(indice: integer): string;
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

procedure TSpyEnemigo.SetEstado(indice: integer; valor: string);
begin
  if FEstado[indice] <> valor then
    FEstado[indice] := valor;
end;

{---------------------------------------------- Calcula  constante de TRAYECTORIA}
procedure TSpyEnemigo.Trayectoria(xDest, yDest: LongInt);
begin
  xi := Left;
  yi := Top;
  xf := xDest;
  yf := yDest;
  if xi = xf then xi := xi + 3;
 C := (yi - yf) / (xi - xf);
end;

{---------------------------------------------------------- habilita}
procedure TSpyEnemigo.SetAbilitado(AAbilitado: Boolean);
begin
  FAbilitado := AAbilitado;
  if csDesigning in ComponentState then Exit;
  FTimer.Enabled := FAbilitado;
end;

{---------------------------------------------------------- determina velocidad}
procedure TSpyEnemigo.SetVelocidad(AVelocidad: Integer);
begin
  FVelocidad := AVelocidad;
  FTimer.Interval := FVelocidad;
end;


{---------------------------------------------------------- desplazamiento}
procedure TSpyEnemigo.camina;
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
procedure TSpyEnemigo.desplazate(x,y: LongInt; Vel: Integer);
begin
  FXDest := x;
  FYDest := y;
  Trayectoria(FXdest,FYDest); {calcula constante de ec.}
  Velocidad := Vel;
  Estado[1] := 'Desplazandose';
end;

{--------------------------------------------------------  CUANDO TOQUE LA BASE}
procedure TSpyEnemigo.DoToqueBase;
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


{--------------------------------------------------------  CUANDO TOQUE EL REFUGIO}
procedure TSpyEnemigo.DoToqueRefugio;
begin

  If (MatTransportado = 'Madera1') or (MatTransportado = 'Madera2') then
    begin
      Mensaje.Msg := WM_USER + 560; {--- "Recibe Madera de Spy' ---}
      Mensaje.WParam := 0;
      Mensaje.LParam := 0;
      Mensaje.Result := 0;
      Application.MainForm.Broadcast(Mensaje);
    end;

  If (MatTransportado = 'Metal1') or (MatTransportado = 'Metal2') then
    begin
      Mensaje.Msg := WM_USER + 390; {--- "Recibe Metal de Spy' ---}
      Mensaje.WParam := 0;
      Mensaje.LParam := 0;
      Mensaje.Result := 0;
      Application.MainForm.Broadcast(Mensaje);
    end;

  If (MatTransportado = 'Piedra1') or (MatTransportado = 'Piedra2') then
    begin
      Mensaje.Msg := WM_USER + 521; {--- "Recibe Piedra de Spy' ---}
      Mensaje.WParam := 0;
      Mensaje.LParam := 0;
      Mensaje.Result := 0;
      Application.MainForm.Broadcast(Mensaje);
    end;


end;


////////////////////////////////////////////////////////////////////////////////
/////////////////////  IR POR MATERIAL//////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
procedure TSpyEnemigo.cicloMat_Base;
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
procedure TSpyEnemigo.IrMaterial(Material : String);
begin
 MatTransportado := Material;
 If Material = 'Madera1' then begin Mensaje.Msg := WM_USER + 531;FEstado[4] := 'Cargando_Madera'; end;
 If Material = 'Madera2' then begin Mensaje.Msg := WM_USER + 209;FEstado[4] := 'Cargando_Madera'; end;
 If Material = 'Metal1'  then begin Mensaje.Msg := WM_USER + 493;FEstado[4] := 'Cargando_Metal';  end;
 If Material = 'Metal2'  then begin Mensaje.Msg := WM_USER + 123;FEstado[4] := 'Cargando_Metal';  end;
 If Material = 'Piedra1' then begin Mensaje.Msg := WM_USER + 286;FEstado[4] := 'Cargando_Piedra'; end;
 If Material = 'Piedra2' then begin Mensaje.Msg := WM_USER + 239;FEstado[4] := 'Cargando_Piedra'; end;

 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 Mensaje.Msg := WM_USER + 583;
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

procedure TSpyEnemigo.cicloBase_Ref;
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
         Mensaje.Msg := WM_USER + 246; { 'Dame Madera'}
         Festado[4] := 'Cargando_Madera';
         Velocidad := 12;
       end;

     if MatTransportado = 'Metal'  then begin
         Mensaje.Msg := WM_USER + 368; { 'Dame Metal'}
         FEstado[4] := 'Cargando_Metal';
         Velocidad := 14;
       end;

     if MatTransportado = 'Piedra' then begin
         Mensaje.Msg := WM_USER + 213; { 'Dame Piedra'}
         FEstado[4] := 'Cargando_Piedra';
         Velocidad := 16;
       end;

        Mensaje.WParam := 0;
        Mensaje.LParam := 0;
        Mensaje.Result := 0;
        Application.MainForm.Broadcast(Mensaje);

     if (FEstado[1] = 'Construyendo') and (FEstado[4] = 'Cargando_Madera') then
       if FCarWood = 0 then begin direccion := 'Base';meta := false; end
       else begin direccion := 'Refugio'; Meta := false; end;


     if (FEstado[1] = 'Construyendo') and (FEstado[4] = 'Cargando_Metal') then
       if FCarMetal = 0 then begin direccion := 'Base'; meta := false; end
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
   if FEstado[4] = 'Cargando_Madera' then Mensaje.Msg := WM_USER + 560; {'Recibe Madera'}
   if FEstado[4] = 'Cargando_Metal'  then Mensaje.Msg := WM_USER + 390; {'Recibe Metal'}
   if FEstado[4] = 'Cargando_Piedra' then Mensaje.Msg := WM_USER + 521; {'Recibe Piedra'}
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
procedure TSpyEnemigo.Construir(Refugio, Material : String);
begin
 MatTransportado := Material;
 Mensaje.Msg := WM_USER + 243; //-- Pide coordenadas al refugio
 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 Mensaje.Msg := WM_USER + 583;//--- Pide coordenadas a la base
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

procedure TSpyEnemigo.Atacando;
begin
 VictRef := 0;
 TopAnt := Top;
 {1. camina a la base por el arma}
 if (Direccion = 'Base') and (Meta = false) then Begin
     FEstado[5] := 'Voy por arma';
     FXDest := xB; FYdest := yB; Trayectoria(FXDest,FYDest);Velocidad := 10;
   end;


 {2. pide arma a la base}
 if (Direccion = 'Base') and (Meta = True) then begin

    if FEstado[2] = 'Madera' then Mensaje.Msg := WM_USER + 519; {pide arma de madera}
    if FEstado[2] = 'Metal'  then Mensaje.Msg := WM_USER + 537; {pide arma de metal}
    if FEstado[2] = 'Piedra' then Mensaje.Msg := WM_USER + 369; {pide arma de Piedra}
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

   if FEstado[6] = 'SOLDADO' then Mensaje.Msg := WM_USER + 230;            {pide coo a Soldado}
   if FEstado[6] = 'BOMBER'  then Mensaje.Msg := WM_USER + 548 ;           {pide coo a Bomber }
   if FEstado[6] = 'ESPIA'   then Mensaje.Msg := WM_USER + 277 ;           {pide coo a Espia }
   if FEstado[6] = 'BASE'    then Mensaje.Msg := WM_USER + 264;            {pide coo a base }
   if FEstado[6] = 'REFUGIO' then Mensaje.Msg := WM_USER + 567;            {pide coo a refugio}

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

    if (FEstado[6] = 'SOLDADO') Then Mensaje.Msg := WM_USER + 432;
    if (FEstado[6] = 'BOMBER')  Then Mensaje.Msg := WM_USER + 356;
    if (FEstado[6] = 'ESPIA')   Then Mensaje.Msg := WM_USER + 342;
    Application.MainForm.Broadcast(Mensaje);

    if VictRef = 1 then begin Left := Left - 40; Meta := false end;       {1 = refugiado; 0 = Libre}

if VictRef = 0 then
 begin
      {----------------- ataques a SOLDADO}
   if (FEstado[6] = 'SOLDADO') and (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 443;
   if (FEstado[6] = 'SOLDADO') and (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 508;
   if (FEstado[6] = 'SOLDADO') and (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 459;

      {----------------- ataques a BOMBER}
   if (FEstado[6] = 'BOMBER')  and (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 448;
   if (FEstado[6] = 'BOMBER')  and (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 438;
   if (FEstado[6] = 'BOMBER')  and (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 334;

      {----------------- ataques a ESPIA}
   if (FEstado[6] = 'ESPIA')  and (FEstado[2] = 'Madera')  then Mensaje.Msg := WM_USER + 99;
   if (FEstado[6] = 'ESPIA')  and (FEstado[2] = 'Piedra')  then Mensaje.Msg := WM_USER + 162;
   if (FEstado[6] = 'ESPIA')  and (FEstado[2] = 'Metal')   then Mensaje.Msg := WM_USER + 370;

      {----------------- ataque a BASE}
   if (FEstado[6] = 'BASE')    and  (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 558;
   if (FEstado[6] = 'BASE')    and  (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 529;
   if (FEstado[6] = 'BASE')    and  (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 148;

      {----------------- ataque a REFUGIO}
   if (FEstado[6] = 'REFUGIO') and  (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 294;
   if (FEstado[6] = 'REFUGIO') and  (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 491;
   if (FEstado[6] = 'REFUGIO') and  (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 447;


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


procedure TSpyEnemigo.Atacar(objetivo, con_que: string);
begin
 Direccion := 'Base';
 Meta := false;
 Mensaje.Msg := WM_USER + 583;    {pide a base enemiga sus coordenadas}
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


procedure TSpyEnemigo.Refugiando;
begin
 TopAnt := Top;

 velocidad := 10;

 if (Direccion = 'Refugio') and (Meta = false) then begin
 FXDest := Xr; FYDest := Yr; Trayectoria(FXDest,FYDest); end;    {TRAZO TRAYECTORIA}


 if (Direccion = 'Refugio') and (Meta = True) then               {PREGUNTO SI ME PUEDE REFUGIAR}
   begin
     Mensaje.Msg := WM_USER + 352;
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
procedure TSpyEnemigo.Refugiarse;
begin
 Mensaje.Msg := WM_USER + 243;                               {PIDO COO DE REFUGIO}
 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 FEstado[1]:= 'Llendo a refugiarse';
 direccion := 'Refugio';
 meta      := false;
end;



{---------------------------------------------------------- EJECUCION DE TAREAS}
procedure TSpyEnemigo.OnTimer(Sender: TObject);
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


////////////////////////////////////////////////////////////////////////////////
///////////  RECIBE COORDENADAS DE MATERIAL  ///////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSpyEnemigo.ResCooWood1(var Msg : TMessage); {--> Coo de madera1}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSpyEnemigo.ResCooWood2(var Msg : TMessage); {--> Coo de madera2}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSpyEnemigo.ResCooMetal1(var Msg : TMessage);{--> Coo de Metal1}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSpyEnemigo.ResCooMetal2(var Msg : TMessage);{--> Coo de Metal2}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSpyEnemigo.ResCooRock1(var Msg : TMessage); {--> Coo de Piedra 1}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TSpyEnemigo.ResCooRock2(var Msg : TMessage);{--> Coo de Piedra 2}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

////////////////////////////////////////////////////////////////////////////////
///////////  RECIBE COORDENADAS   //////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


procedure TSpyEnemigo.ResCooBase(var Msg : TMessage);{--> Coo de BASE}
begin
 xb := Msg.WParam;
 yb := Msg.LParam;
end;

procedure TSpyEnemigo.ResCoorR(var Msg : TMessage); {--> Coo de REFUGIO}
begin
 xR := Msg.WParam;
 yR := Msg.LParam;
end;

////////////////////////////////////////////////////////////////////////////////
///////////  RECIBE materiales de BASE ENEMIGA  ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSpyEnemigo.ResWood(var Msg: TMessage); {--> Recibe la Madera}
begin
 FCarWood := Msg.WParam;
end;

procedure TSpyEnemigo.ResMetal(var Msg :TMessage); {--> Recibe Metal}
begin
  FCarMetal := Msg.WParam;
end;

procedure TSpyEnemigo.ResRock(var Msg : TMessage);{--> Recibe Piedra}
begin
 FCarRock := Msg.WParam;
end;

procedure TSpyEnemigo.ResWoodGun(var Msg : TMessage);   {RECIBE ARMA DE MADERA}
begin
  WoodGun := Msg.WParam;
  RockGun := 0;
  MetalGun:= 0;
end;

procedure TSpyEnemigo.ResRockGun(var Msg : TMessage);   {RECIBE ARMA DE PIEDRA}
begin
  WoodGun := 0;
  RockGun := Msg.WParam;
  MetalGun:= 0;
end;

procedure TSpyEnemigo.ResMetalGun(var Msg : TMessage);   {RECIBE ARMA DE METAL}
begin
  WoodGun := 0;
  RockGun := 0;
  MetalGun:= Msg.WParam;
end;


////////////////////////////////////////////////////////////////////////////////
///////////  MENSAJES DE REFUGIO   //////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSpyEnemigo.WoodResRefE(var Msg: TMessage);     {MADERA RECIBIDA}
begin
  if Msg.WParam = 0 then
    begin
      FCarWood := 0;
      desplazate(xR + 25, yR + 25,10);
    end;
end;

procedure TSpyEnemigo.MetalResRefE(var Msg : TMessage);   {METAL RECIBIDO}
begin
 if Msg.WParam = 0 then
    begin
      FCarWood := 0;
      desplazate(xR + 25, yR + 25,10);
    end;
end;

procedure TSpyEnemigo.RockResRefE(var Msg : TMessage);   {PIEDRA RECIBIDA}
begin
 if Msg.WParam = 0 then
    begin
      FCarWood := 0;
      desplazate(xR + 25, yR + 25,10);
    end;
end;

////////////////////////////////////////////////////////////////////////////////
///////////  MENSAJES DE SOLDADO   //////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSpyEnemigo.GiveCoo(var Msg : TMessage);             {SOLICITA COORDENADAS}
begin
 Mensaje.Msg := WM_USER + 109;
 Mensaje.WParam := Left;
 Mensaje.LParam := Top;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);
end;

procedure TSpyEnemigo.EstasRef_Sol(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 514;
  if FEstado[1] = 'Refugiado' then Mensaje.WParam := 1;
  if FEstado[1] <> 'Refugiado' then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TSpyEnemigo.EstoyRef_Sol(var Msg : TMessage);    {VERIFICA SI ESTA REFUGIADO}
begin
  VictRef := Msg.WParam;
end;

procedure TSpyEnemigo.ResCoo_Sol(var  Msg : TMessage);     {RECIBE COORDENADAS}
begin
 Xs := Msg.WParam;
 Ys := Msg.LParam;
end;

procedure TSpyEnemigo.ResAtacWood_sol(var Msg : TMessage);     {ATAQUE CON MADERA}
begin
  if Resistencia > 0 then Resistencia := Resistencia - 1;
end;

procedure TSpyEnemigo.ResAtacRock_sol(var Msg : TMessage);     {ATAQUE CON PIEDRA}
begin
  if FResistencia <= 2 then FResistencia := 0;
  if Resistencia > 1 then Resistencia := Resistencia - 2;
end;

procedure TSpyEnemigo.ResAtacMetal_sol(var Msg : TMessage);     {ATAQUE CON METAL}
begin
  if FResistencia <= 3 then FResistencia := 0;
  if Resistencia > 2 then Resistencia := Resistencia - 3;
end;

////////////////////////////////////////////////////////////////////////////////
///////////  MENSAJES DE BOMBER   //////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSpyEnemigo.SendMeCoo_Bom(var Msg: TMessage);
begin
  Mensaje.Msg := WM_USER + 195;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;


procedure TSpyEnemigo.EstasRef_Bom(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 444;
  if FEstado[1] = 'Refugiado' then Mensaje.WParam := 1;
  if FEstado[1] <> 'Refugiado' then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TSpyEnemigo.EstoyRef_Bom(var Msg : TMessage);    {VERIFICA SI ESTA REFUGIADO}
begin
  VictRef := Msg.WParam;
end;

procedure TSpyEnemigo.ResCoo_Bom(var Msg : TMessage);
begin
  XBomE := Msg.WParam;
  YBomE := Msg.LParam;
end;

procedure TSpyEnemigo.ResAtacWood_Bom(var Msg : TMessage);     {ATAQUE CON MADERA}
begin
  if Resistencia > 0 then Resistencia := Resistencia - 1;
end;

procedure TSpyEnemigo.ResAtacRock_Bom(var Msg : TMessage);     {ATAQUE CON PIEDRA}
begin
  if FResistencia <= 2 then FResistencia := 0;
  if Resistencia > 1 then Resistencia := Resistencia - 2;
end;

procedure TSpyEnemigo.ResAtacMetal_Bom(var Msg : TMessage);     {ATAQUE CON METAL}
begin
  if FResistencia <= 3 then FResistencia := 0;
  if Resistencia > 2 then Resistencia := Resistencia - 3;
end;

////////////////////////////////////////////////////////////////////////////////
///////////  MENSAJES DE ESPIA    //////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSpyEnemigo.SendMeCoo_Esp(var Msg: TMessage);
begin
  Mensaje.Msg := WM_USER + 524;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TSpyEnemigo.EstasRef_Esp(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 546;
  if FEstado[1] = 'Refugiado' then Mensaje.WParam := 1;
  if FEstado[1] <> 'Refugiado' then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TSpyEnemigo.EstoyRef_Esp(var Msg : TMessage);    {VERIFICA SI ESTA REFUGIADO}
begin
  VictRef := Msg.WParam;
end;

procedure TSpyEnemigo.ResCoo_Esp(var Msg : TMessage);
begin
 Xee := Msg.WParam;
 Yee := Msg.LParam;
end;

procedure TSpyEnemigo.ResAtacWood_Esp(var Msg : TMessage);     {ATAQUE CON MADERA}
begin
  if Resistencia > 0 then Resistencia := Resistencia - 1;
end;

procedure TSpyEnemigo.ResAtacRock_Esp(var Msg : TMessage);     {ATAQUE CON PIEDRA}
begin
  if FResistencia <= 2 then FResistencia := 0;
  if Resistencia > 1 then Resistencia := Resistencia - 2;
end;

procedure TSpyEnemigo.ResAtacMetal_Esp(var Msg : TMessage);     {ATAQUE CON METAL}
begin
  if FResistencia <= 3 then FResistencia := 0;
  if Resistencia > 2 then Resistencia := Resistencia - 3;
end;

////////////////////////////////////////////////////////////////////////////////
//////////////////  mensajes de BASE      //////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSpyEnemigo.ResCoo_Bas(var  Msg : TMessage);     {RECIBE COORDNDAS}
begin
 Xbe := Msg.WParam;
 Ybe := Msg.LParam;
end;

////////////////////////////////////////////////////////////////////////////////
//////////////////  mensajes de REFUGIO   //////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSpyEnemigo.ResCoo_Ref(var  Msg : TMessage);     {PIDE COORDENADAS}
begin
 Xre := Msg.WParam;
 Yre := Msg.LParam;
end;

////////////////////////////////////////////////////////////////////////////////
//////////////////  mensajes de REFUGIO  ENEMIGO ///////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TSpyEnemigo.PuedesRef(var  Msg : TMessage);     {PIDE COORDENADAS}
begin
 RefugioSiNo := Msg.WParam;
end;

procedure TSpyEnemigo.TodosFuera(var  Msg : TMessage);
begin
  randomize;
  if FEstado[1] = 'Refugiado' then
  Desplazate(Random(400),Random(400),10);
end;

procedure Register;
begin
  RegisterComponents('Juego', [TSpyEnemigo]);
end;

end.
