unit BomberEnemigo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, stdCtrls,Types;

const
 {MENSAJES DE MATERIAL}
 MResCooWood1     = WM_USER + 186;    // coordenadas
 MResCooWood2     = WM_USER + 488;
 MResCooMetal1    = WM_USER + 160;
 MResCooMetal2    = WM_USER + 176;
 MResCooRock1     = WM_USER + 598;
 MResCooRock2     = WM_USER + 281;

 {MENSAJES DE BASE ENEMIGA}
 MResCooBasE     = WM_USER + 273; // recibe coor de base enemiga
 MResWoodBas     = WM_USER + 313; // recibe madera para construir
 MResMetalBas    = WM_USER + 266; //        metal  para construir
 MResRockBas     = WM_USER + 593; //        piedra para construir

 MResGunWood     = WM_USER + 357; // recive arma de madera
 MResGunMetal    = WM_USER + 190; // recibe arma de metal
 MResGunRock     = WM_USER + 262; // recibe arma de piedra

 {MENSAJES DE REFUGIO}
 MResCoo_Ref      = WM_USER + 157; // recibe coo de Refugio

 {MENSAJES DE BASE}
 MResCoo_Bas    = WM_USER + 429;  // recibe coo de base


 {MENSAJES DE REFUGIO ENEMIGO}
 MPuedesRef      = WM_USER + 345;
 MResCoorRE      = WM_USER + 589; // coordenadas de REfugio Enemigo
 MWoodResRefE    = WM_USER + 300; // madera aceptada
 MMetalResRefE   = WM_USER + 520; // metal aceptada
 MRockResRefE    = WM_USER + 120; // piedra aceptada
 MTodosFuera      = WM_USER + 271;

 {mensajes de SOLDADO}
 MResCoo_Sol      = WM_USER + 525;   // recibe coor de soldado
 MSendMeCoo_sol   = WM_USER + 165;   // recibe coordenadas
 MResAtacWood_sol = WM_USER + 241;   // recibe ataque con madera
 MResAtacRock_sol = WM_USER + 295;   // recibe ataque con Piedra
 MResAtacMetal_sol= WM_USER + 590;   // recibe ataque con Metal
 MEstoyRef_Sol    = WM_USER + 350;
 MEstasRef_Sol    = WM_USER + 147;

 {MENSAJES DE BOMBER}
 MResCoo_Bom      = WM_USER + 407;   // coo de bomber
 MSendMeCoo_Bom   = WM_USER + 332;   // solicita coordendas
 MResAtacWood_Bom = WM_USER + 306;   // recibe ataque con madera
 MResAtacRock_Bom = WM_USER + 419;   // recibe ataque con piedra
 MResAtacMetal_Bom= WM_USER + 299;   // recibe ataque con Metal
 MEstoyRef_Bom    = WM_USER + 584;
 MEstasRef_Bom    = WM_USER + 513;

 {MENSAJES DE ESPIA}
 MResCoo_Esp      = WM_USER + 290;   // recibe coordendas de espia
 MSendMeCoo_Esp   = WM_USER + 375;   // solicitud de coordendas
 MResAtacWood_Esp = WM_USER + 108;   // recibe ataque con madera
 MResAtacRock_Esp = WM_USER + 231;   // recibe ataque con Piedra
 MResAtacMetal_Esp= WM_USER + 103;   // recibe ataque con Metal
 MEstoyRef_Esp    = WM_USER + 214;
 MEstasRef_Esp    = WM_USER + 107;


type
  TBomberEnemigo = class(TGraphicControl)
  private
    FColor            : TColor;
    FBitmap           : TBitmap;
    FResistencia      : Integer;
    FVelocidad        : Integer;
    FAbilitado        : Boolean;
    FTimer            : TTimer;
    FEstado           : Array[1..6] of string;
    FCarWood          : Integer;  {material recibido de Base ene}
    FCarMetal,
    FCarRock          : Integer;


    FOnToqueBase      : TNotifyEvent;
    FOnToqueRefugio   : TNotifyEvent;

    function  GetEstado(indice: integer): string;
    procedure SetEstado(indice : integer; valor: string);
    procedure Atacando;
    procedure Refugiando;

    procedure ResCooWood1     (Var Msg : TMessage); message MResCooWood1;
    procedure ResCooWood2     (Var Msg : TMessage); message MResCooWood2;
    procedure ResCooMetal1    (Var Msg : TMessage); message MResCooMetal1;
    procedure ResCooMetal2    (Var Msg : TMessage); message MResCooMetal2;
    procedure ResCooRock1     (Var Msg : TMessage); message MResCooRock1;
    procedure ResCooRock2     (Var Msg : TMessage); message MResCooRock2;
//    procedure ResCooBaseb   (Var Msg : TMessage); message MResCooBaseb;
    procedure ResWoodBas      (Var Msg : TMessage);  message MResWoodBas;
    procedure ResMetalBas     (Var Msg : TMessage);  message MResMetalBas;
    procedure ResRockBas      (Var Msg : TMessage);  message MResRockBas;
    procedure WoodResRefE     (Var Msg : TMessage);  message MWoodResRefE;
    procedure MetalResRefE    (Var Msg : TMessage);  message MMetalResRefE;
    procedure RockResRefE     (Var Msg : TMessage);  message MRockResRefE;
    procedure ResCoorRE       (Var Msg : TMessage);  message MResCoorRE;
    procedure ResCooBasE      (Var Msg : TMessage);  message MResCooBasE;
    procedure SendMeCoo_sol   (Var Msg : TMessage);  message MSendMeCoo_sol;
    procedure ResAtacWood_sol (Var Msg : TMessage);  message MResAtacWood_sol;
    procedure ResAtacRock_sol (Var Msg : TMessage);  message MResAtacRock_sol;
    procedure ResAtacMetal_sol(Var Msg : TMessage);  message MResAtacMetal_sol;
    procedure SendMeCoo_Bom   (Var Msg : TMessage);  message MSendMeCoo_Bom;
    procedure ResAtacWood_Bom (Var Msg : TMessage);  message MResAtacWood_Bom;
    procedure ResAtacRock_Bom (Var Msg : TMessage);  message MResAtacRock_Bom;
    procedure ResAtacMetal_Bom(Var Msg : TMessage);  message MResAtacMetal_Bom;
    procedure SendMeCoo_Esp   (Var Msg : TMessage);  message MSendMeCoo_Esp;
    procedure ResAtacWood_Esp (Var Msg : TMessage);  message MResAtacWood_Esp;
    procedure ResAtacRock_Esp (Var Msg : TMessage);  message MResAtacRock_Esp;
    procedure ResAtacMetal_Esp(Var Msg : TMessage);  message MResAtacMetal_Esp;
    procedure ResGunWood      (Var Msg : TMessage);  message MResGunWood;
    procedure ResGunMetal     (Var Msg : TMessage);  message MResGunMetal;
    procedure ResGunRock      (Var Msg : TMessage);  message MResGunRock;
    procedure ResCoo_Sol      (Var Msg : TMessage);  message MResCoo_Sol;
    procedure ResCoo_Bom      (Var Msg : TMessage);  message MResCoo_Bom;
    procedure ResCoo_Esp      (Var Msg : TMessage);  message MResCoo_Esp;
    procedure ResCoo_Bas      (Var Msg : TMessage);  message MResCoo_Bas;
    procedure ResCoo_Ref      (Var Msg : TMessage);  message MResCoo_Ref;
    procedure PuedesRef       (Var Msg : TMessage);  message MPuedesRef;
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
 xR,yR           : LongInt; // Coordenadas de Matgerial, Base Y Refugio
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
constructor TBomberEnemigo.Create(AOwner : TComponent);
begin
 inherited;
 FBitmap := TBitmap.Create;
 width  := 10;
 height := 15;
 FColor := clBtnFace;
 FResistencia := 40;

 FAbilitado := True;
 FVelocidad := 100;
 FTimer :=  TTimer.Create(self);
 FTimer.Interval := FVelocidad;
 FTimer.OnTimer := OnTimer;
end;

{----------------------------------------------------------------- destructor}
destructor TBomberEnemigo.destroy;
begin
  FBitmap.Free;
  inherited;
end;

{------------------------------------------------------------------- color}
procedure TBomberEnemigo.SetColor(AColor: TColor);
begin
  If FColor <> AColor then FColor := AColor;
end;

{----------------------------------------------------------------- paint}
procedure TBomberEnemigo.paint;
 var
   rectangulo : TRect;
begin
  rectangulo := Rect(0,0,Width,Height);
 FBitmap.Width := width;
 FBitmap.Height := height;
 FBitmap.Canvas.Brush.Color := clWhite;
 FBitmap.Canvas.FillRect(rectangulo);

 FBitmap.Canvas.Brush.Color := clBlack;
 FBitmap.Canvas.Pen.Color := clBlack;
 FBitmap.Canvas.Ellipse(4,1,8,5);

 Fbitmap.Canvas.Brush.Color := clRed;
 FBitmap.Canvas.Pen.Color := clRed;
 FBitmap.Canvas.Polygon([Point(6,5),Point(2,5),Point(2,11),Point(4,11),Point(4,15),Point(8,15),
                        Point(8,11),Point(10,11),Point(10,5)]);
 FBitmap.Canvas.Pen.Color := clYellow;
 FBitmap.Canvas.Brush.Color := clYellow;
 FBitmap.Canvas.Ellipse(4,5,9,11);
 canvas.Draw(0,0,FBitmap);
end;

{---------------------------------------------- Calcula  constante de TRAYECTORIA}
function TBomberEnemigo.GetEstado(indice: integer): string;
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

procedure TBomberEnemigo.SetEstado(indice: integer; valor: string);
begin
  if FEstado[indice] <> valor then
    FEstado[indice] := valor;
end;


{---------------------------------------------- Calcula  constante de TRAYECTORIA}
procedure TBomberEnemigo.Trayectoria(xDest, yDest: LongInt);
begin
  xi := Left;
  yi := Top;
  xf := xDest;
  yf := yDest;
  if xi = xf then xi := xi + 3;
  C := (yi - yf) / (xi - xf);
end;

{---------------------------------------------------------- habilita}
procedure TBomberEnemigo.SetAbilitado(AAbilitado: Boolean);
begin
  FAbilitado := AAbilitado;
  if csDesigning in ComponentState then Exit;
  FTimer.Enabled := FAbilitado;
end;

{---------------------------------------------------------- determina velocidad}
procedure TBomberEnemigo.SetVelocidad(AVelocidad: Integer);
begin
  FVelocidad := AVelocidad;
  FTimer.Interval := FVelocidad;
end;


{---------------------------------------------------------- desplazamiento}
procedure TBomberEnemigo.camina;
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

{--------------------------------------------------------  CUANDO TOQUE LA BASE}
procedure TBomberEnemigo.DoToqueBase;
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



{--------------------------------------------------------  CUANDO TOQUE LA BASE}
procedure TBomberEnemigo.DoToqueRefugio;

begin
   If (MatTransportado = 'Madera1') or (MatTransportado = 'Madera2') then
    begin
      Mensaje.Msg := WM_USER + 70; {--- "Recibe Madera de Bomber' ---}
      Mensaje.WParam := 0;
      Mensaje.LParam := 0;
      Mensaje.Result := 0;
      Application.MainForm.Broadcast(Mensaje);
    end;

  If (MatTransportado = 'Metal1') or (MatTransportado = 'Metal2') then
    begin
      Mensaje.Msg := WM_USER + 71; {--- "Recibe Madera de Bomber' ---}
      Mensaje.WParam := 0;
      Mensaje.LParam := 0;
      Mensaje.Result := 0;
      Application.MainForm.Broadcast(Mensaje);
    end;

  If (MatTransportado = 'Piedra1') or (MatTransportado = 'Piedra2') then
    begin
      Mensaje.Msg := WM_USER + 72;{--- "Recibe Madera de Bomber' ---}
      Mensaje.WParam := 0;
      Mensaje.LParam := 0;
      Mensaje.Result := 0;
      Application.MainForm.Broadcast(Mensaje);
    end;
end;

{------------------------------------------------------- desplazarse a un lugar}
procedure TBomberEnemigo.desplazate(x,y: LongInt; Vel: Integer);
begin
  FXDest := x;
  FYDest := y;
  Trayectoria(FXdest,FYDest); {calcula constante de ec.}
  Velocidad := Vel;
  Estado[1] := 'Desplazandose';
end;


////////////////////////////////////////////////////////////////////////////////
/////////////////////  IR POR MATERIAL//////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
procedure TBomberEnemigo.cicloMat_Base;
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

procedure TBomberEnemigo.IrMaterial(Material : String);
begin
 MatTransportado := Material;
 If Material = 'Madera1'then begin Mensaje.Msg := WM_USER + 547; FEstado[4] := 'Cargando_Madera'; end;
 If Material = 'Madera2'then begin Mensaje.Msg := WM_USER + 113; FEstado[4] := 'Cargando_Madera'; end;
 If Material = 'Metal1' then begin Mensaje.Msg := WM_USER + 292; FEstado[4] := 'Cargando_Metal'; end;
 If Material = 'Metal2' then begin Mensaje.Msg := WM_USER + 116; FEstado[4] := 'Cargando_Metal'; end;
 If Material = 'Piedra1'then begin Mensaje.Msg := WM_USER + 420; FEstado[4] := 'Cargando_Piedra'; end;
 If Material = 'Piedra2'then begin Mensaje.Msg := WM_USER + 426; FEstado[4] := 'Cargando_Piedra'; end;

 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 Mensaje.Msg := WM_USER + 233;                                {PIDE COORD A BASE ENEMIGA}
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

procedure TBomberEnemigo.cicloBase_Ref;
begin
  TopAnt := Top;
  {1. SI VA HACIA LA BASE}
  if (direccion = 'Base') and (Meta = false) then
   begin
     FXDest := xB;
     FYDest := yB;
     Trayectoria(FXDest,FYDest);
     Velocidad := 10;
   end;

  {2. UNA VEZ LLEGANDO A LA BASE}
  if (direccion = 'Base') and (Meta = true) then
   begin                                                             {-- enviados a base enemiga --}
     if MatTransportado = 'Madera' then begin
         Mensaje.Msg := WM_USER + 365; {Dame madera}
         FEstado[4] := 'Cargando_Madera';
         Velocidad := 12;
       end;

     if MatTransportado = 'Metal'  then  begin
         Mensaje.Msg := WM_USER + 144; {Dame Metal}
         FEstado[4] := 'Cargando_Metal';
         Velocidad := 14;
       end;

     if MatTransportado = 'Piedra' then begin
         Mensaje.Msg := WM_USER + 359; { 'Dame Piedra'}
         FEstado[4] := 'Cargando_Piedra';
         Velocidad := 16;
       end;

        Mensaje.WParam := 0;
        Mensaje.LParam := 0;
        Mensaje.Result := 0;
        Application.MainForm.Broadcast(Mensaje);

     if (FEstado[1] = 'Construyendo') and (FEstado[4] = 'Cargando_Madera') then
       if FCarWood = 0 then begin direccion := 'Base'; meta := false;end
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
    FXDest := xRe; FYDest := yRe;Trayectoria(FXDest,FYDest);Velocidad := 20;
  end;


 {CUANDO LLEGA AL REFUGIO}
 if (Direccion = 'Refugio') and (Meta = true) then begin          {---  Bomber Enemigo a Refugio Ene}
   if FEstado[4] = 'Cargando_Madera' then Mensaje.Msg := WM_USER + 302;{'Recibe Madera'}
   if FEstado[4] = 'Cargando_Metal'  then Mensaje.Msg := WM_USER + 586;{'Recibe Metal'}
   if FEstado[4] = 'Cargando_Piedra' then Mensaje.Msg := WM_USER + 476;{'Recibe Piedra'}
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



procedure TBomberEnemigo.Construir(Refugio, Material : String);
begin
 MatTransportado := Material;
 Mensaje.Msg := WM_USER + 362; //-- Pide coordenadas a refugio enemigo
 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 Mensaje.Msg := WM_USER + 233;//--- Pide coordenadas a la base enemiga
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

procedure TBomberEnemigo.Atacando;
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

    if FEstado[2] = 'Madera' then Mensaje.Msg := WM_USER + 557; {pide arma de madera}
    if FEstado[2] = 'Metal'  then Mensaje.Msg := WM_USER + 581; {pide arma de metal}
    if FEstado[2] = 'Piedra' then Mensaje.Msg := WM_USER + 376; {pide arma de Piedra}
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

   if FEstado[6] = 'SOLDADO' then Mensaje.Msg := WM_USER + 161;            {pide coo a Soldado Ene}
   if FEstado[6] = 'BOMBER'  then Mensaje.Msg := WM_USER + 464 ;           {pide coo a Bomber Ene}
   if FEstado[6] = 'ESPIA'   then Mensaje.Msg := WM_USER + 541 ;           {pide coo a Espia Ene}
   if FEstado[6] = 'BASE'    then Mensaje.Msg := WM_USER + 189;            {pide coo a base enemiga}
   if FEstado[6] = 'REFUGIO' then Mensaje.Msg := WM_USER + 270;            {pide coo a refugio enemy}

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

    if (FEstado[6] = 'SOLDADO') Then Mensaje.Msg := WM_USER + 223;
    if (FEstado[6] = 'BOMBER')  Then Mensaje.Msg := WM_USER + 360;
    if (FEstado[6] = 'ESPIA')   Then Mensaje.Msg := WM_USER + 577;
    Application.MainForm.Broadcast(Mensaje);

    if VictRef = 1 then begin Left := Left - 40; Meta := false end;       {1 = refugiado; 0 = Libre}

if VictRef = 0 then
 begin
      {----------------- ataques a SOLDADO}
   if (FEstado[6] = 'SOLDADO') and (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 579;
   if (FEstado[6] = 'SOLDADO') and (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 197;
   if (FEstado[6] = 'SOLDADO') and (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 153;

      {----------------- ataques a BOMBER }
   if (FEstado[6] = 'BOMBER')  and (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 592;
   if (FEstado[6] = 'BOMBER')  and (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 149;
   if (FEstado[6] = 'BOMBER')  and (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 455;

      {----------------- ataques a ESPIA }
   if (FEstado[6] = 'ESPIA')  and (FEstado[2] = 'Madera')  then Mensaje.Msg := WM_USER + 139;
   if (FEstado[6] = 'ESPIA')  and (FEstado[2] = 'Piedra')  then Mensaje.Msg := WM_USER + 217;
   if (FEstado[6] = 'ESPIA')  and (FEstado[2] = 'Metal')   then Mensaje.Msg := WM_USER + 114;

      {----------------- ataque a BASE}
   if (FEstado[6] = 'BASE')    and  (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 119;
   if (FEstado[6] = 'BASE')    and  (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 321;
   if (FEstado[6] = 'BASE')    and  (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 463;

      {----------------- ataque a REFUGIO}
   if (FEstado[6] = 'REFUGIO') and  (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 247;
   if (FEstado[6] = 'REFUGIO') and  (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 96;
   if (FEstado[6] = 'REFUGIO') and  (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 515;


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



procedure TBomberEnemigo.Atacar(objetivo, con_que: string);
begin
 Direccion := 'Base';
 Meta := false;
 Mensaje.Msg := WM_USER + 233;    {pide a base enemiga sus coordenadas}
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


procedure TBomberEnemigo.Refugiando;
begin
 TopAnt := Top;

 velocidad := 10;

 if (Direccion = 'Refugio') and (Meta = false) then begin
 FXDest := Xre; FYDest := Yre; Trayectoria(FXDest,FYDest); end;    {TRAZO TRAYECTORIA}


 if (Direccion = 'Refugio') and (Meta = True) then               {PREGUNTO SI ME PUEDE REFUGIAR}
   begin
     Mensaje.Msg := WM_USER + 228;
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
procedure TBomberEnemigo.Refugiarse;
begin
 Mensaje.Msg := WM_USER + 362;                               {PIDO COO DE REFUGIO}
 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 FEstado[1]:= 'Llendo a refugiarse';
 direccion := 'Refugio';
 meta      := false;
end;



{---------------------------------------------------------- EJECUCION DE TAREAS}
procedure TBomberEnemigo.OnTimer(Sender: TObject);
begin

  if csDesigning in ComponentState then begin
    FTimer.Enabled := False;
    Exit;
  end;

 If FEstado[1] = 'Desplazandose'     then camina;
 If FEstado[1] = 'Atacando'          then Atacando;
 if FEstado[1] = 'Trayendo material' then CicloMat_Base;
 if FEstado[1] = 'Construyendo'      then CicloBase_Ref;
 if FEstado[1] = 'Llendo a refugiarse' then Refugiando;
end;


{=========================================================================
==================== Procesamiento de Mensajes ===========================}


////////////////////////////////////////////////////////////////////////////////
////////////////  MENSAJES DE MATERIALES ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBomberEnemigo.ResCooWood1(var Msg : TMessage);     {RECIBE COOR DE MADERA 1}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TBomberEnemigo.ResCooWood2(var Msg : TMessage);
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TBomberEnemigo.ResCooMetal1(var Msg : TMessage);
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TBomberEnemigo.ResCooMetal2(var Msg : TMessage);
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TBomberEnemigo.ResCooRock1(var Msg : TMessage);
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TBomberEnemigo.ResCooRock2(var Msg : TMessage);
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

////////////////////////////////////////////////////////////////////////////////
////////////////  MENSAJES DE BASE ENEMIGA /////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBomberEnemigo.ResCooBasE(var Msg : TMessage);   {RECIBE COOR DE BASE ENEMIGA}
begin
  Xb := Msg.WParam;
  Yb := Msg.LParam;
end;

procedure TBomberEnemigo.ResWoodBas(var Msg: TMessage);      {Recibe la Madera DE BASE ENEMIGA}
begin
 FCarWood := Msg.WParam;
end;

procedure TBomberEnemigo.ResMetalBas(var Msg :TMessage);     {Recibe Metal DE BASE ENEMIGA}
begin
  FCarMetal := Msg.WParam;
end;

procedure TBomberEnemigo.ResRockBas(var Msg : TMessage);     {Recibe Piedra DE BASE ENEMIGA}
begin
 FCarRock := Msg.WParam;
end;

procedure TBomberEnemigo.ResGunWood(var Msg : TMessage);   {RECIBE ARMA DE MADERA}
begin
  WoodGun := Msg.WParam;
  RockGun := 0;
  MetalGun:= 0;
end;

procedure TBomberEnemigo.ResGunRock(var Msg : TMessage);   {RECIBE ARMA DE PIEDRA}
begin
  WoodGun := 0;
  RockGun := Msg.WParam;
  MetalGun:= 0;
end;

procedure TBomberEnemigo.ResGunMetal(var Msg : TMessage);   {RECIBE ARMA DE METAL}
begin
  WoodGun := 0;
  RockGun := 0;
  MetalGun:= Msg.WParam;
end;

////////////////////////////////////////////////////////////////////////////////
////////////////  MENSAJES DE  REFUGIO ENEMIGO //////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBomberEnemigo.TodosFuera(var  Msg : TMessage);
begin
  randomize;
  if FEstado[1] = 'Refugiado' then
  Desplazate(Random(400),Random(400),10);
end;


procedure TBomberEnemigo.PuedesRef(var Msg : TMessage);
begin
   RefugioSiNo := Msg.WParam;
end;


procedure TBomberEnemigo.ResCoorRE(var Msg : TMessage);         {RECIBE COOR DE REFUGIO ENEMIGO}
begin
 Xre := Msg.WParam;
 Yre := Msg.LParam;
end;

procedure TBomberEnemigo.WoodResRefE(var Msg: TMessage);         {MADERA RECIBIDA POR REFUGIO E}
begin
  if Msg.WParam = 0 then
    begin
      FCarWood := 0;
      desplazate(xR + 25, yR + 25,10);
    end;
end;

procedure TBomberEnemigo.MetalResRefE(var Msg : TMessage);        {METAL RECIBIDO POR REFUGIO E}
begin
 if Msg.WParam = 0 then
    begin
      FCarWood := 0;
      desplazate(xR + 25, yR + 25,10);
    end;
end;

procedure TBomberEnemigo.RockResRefE(var Msg : TMessage);          {PIEDRA RECIBIDA POR REFUGIO E}
begin
 if Msg.WParam = 0 then
    begin
      FCarWood := 0;
      desplazate(xR + 25, yR + 25,10);
    end;
end;

////////////////////////////////////////////////////////////////////////////////
////////////////  MENSAJES DE  SOLDADO  ///// //////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBomberEnemigo.SendMeCoo_sol(var Msg : TMessage);       {SOLDADO SOLICITA COORDENADAS}
begin
  Mensaje.Msg := WM_USER + 94;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBomberEnemigo.EstasRef_Sol(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 349;
  if FEstado[1] = 'Refugiado' then Mensaje.WParam := 1;
  if FEstado[1] <> 'Refugiado' then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBomberEnemigo.EstoyRef_Sol(var Msg : TMessage);    {VERIFICA SI ESTA REFUGIADO}
begin
  VictRef := Msg.WParam;
end;


procedure TBomberEnemigo.ResCoo_Sol(var Msg : TMessage);          {RECIBE COO DE SOLADO}
begin
 Xs := Msg.WParam;
 Ys := Msg.LParam;
end;

procedure TBomberEnemigo.ResAtacWood_sol(var Msg : TMessage);     {ATAQUE CON MADERA}
begin
  if FResistencia > 0 then FResistencia := FResistencia - 1;
end;

procedure TBomberEnemigo.ResAtacRock_sol(var Msg : TMessage);     {ATAQUE CON PIEDRA}
begin
  if FResistencia <= 2 then FResistencia := 0;
  if FResistencia > 2 then FResistencia := FResistencia - 2;
end;

procedure TBomberEnemigo.ResAtacMetal_sol(var Msg : TMessage);     {ATAQUE CON METAL}
begin
  if FResistencia <= 3 then FResistencia := 0;
  if FResistencia > 3 then FResistencia := FResistencia - 3;
end;

////////////////////////////////////////////////////////////////////////////////
////////////////  MENSAJES DE  BOMBER  ///// //////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBomberEnemigo.ResCoo_Bom(var  Msg : TMessage);             {RECIBE COO DE BOMBER}
begin
 XBomE := Msg.WParam;
 YBomE := Msg.LParam;
end;

procedure TBomberEnemigo.EstasRef_Bom(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 439;
  if FEstado[1] = 'Refugiado' then Mensaje.WParam := 1;
  if FEstado[1] <> 'Refugiado' then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBomberEnemigo.EstoyRef_Bom(var Msg : TMessage);    {VERIFICA SI ESTA REFUGIADO}
begin
  VictRef := Msg.WParam;
end;


procedure TBomberEnemigo.SendMeCoo_Bom(var Msg : TMessage);      {PIDE COORDENDAS}
begin
  Mensaje.Msg := WM_USER + 399;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBomberEnemigo.ResAtacWood_Bom(var Msg : TMessage);     {ATAQUE CON MADERA}
begin
  if FResistencia > 0 then FResistencia := FResistencia - 1;
end;

procedure TBomberEnemigo.ResAtacRock_Bom(var Msg : TMessage);     {ATAQUE CON PIEDRA}
begin
  if FResistencia <= 2 then FResistencia := 0;
  if FResistencia > 2 then FResistencia := FResistencia - 2;
end;

procedure TBomberEnemigo.ResAtacMetal_Bom(var Msg : TMessage);     {ATAQUE CON METAL}
begin
  if FResistencia <= 3 then FResistencia := 0;
  if FResistencia > 3 then FResistencia := FResistencia - 3;
end;

////////////////////////////////////////////////////////////////////////////////
////////////////  MENSAJES DE  ESPIA    ///// //////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBomberEnemigo.ResCoo_Esp(var  Msg : TMessage);     {RECIBE COO DE ESPIA}
begin
 Xee := Msg.WParam;
 Yee := Msg.LParam;
end;

procedure TBomberEnemigo.EstasRef_Esp(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 428;
  if FEstado[1] = 'Refugiado' then Mensaje.WParam := 1;
  if FEstado[1] <> 'Refugiado' then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBomberEnemigo.EstoyRef_Esp(var Msg : TMessage);    {VERIFICA SI ESTA REFUGIADO}
begin
  VictRef := Msg.WParam;
end;

procedure TBomberEnemigo.SendMeCoo_Esp(var Msg : TMessage);    {ESPIA SOLICITA COORDENDAS}
begin
  Mensaje.Msg := WM_USER + 293;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBomberEnemigo.ResAtacWood_Esp(var Msg : TMessage);     {ATAQUE CON MADERA}
begin
  if FResistencia > 0 then FResistencia := FResistencia - 1;
end;

procedure TBomberEnemigo.ResAtacRock_Esp(var Msg : TMessage);     {ATAQUE CON PIEDRA}
begin
  if FResistencia <= 2 then FResistencia := 0;
  if FResistencia > 2 then FResistencia := FResistencia - 2;
end;

procedure TBomberEnemigo.ResAtacMetal_Esp(var Msg : TMessage);     {ATAQUE CON METAL}
begin
  if FResistencia <= 3 then FResistencia := 0;
  if FResistencia > 3 then FResistencia := FResistencia - 3;
end;

////////////////////////////////////////////////////////////////////////////////
//////////////////  mensajes de BASE     ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBomberEnemigo.ResCoo_Bas(var  Msg : TMessage);     {RECIBE COORDENADAS}
begin
 Xbe := Msg.WParam;
 Ybe := Msg.LParam;
end;

////////////////////////////////////////////////////////////////////////////////
//////////////////  mensajes de REFUGIO   //////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBomberEnemigo.ResCoo_Ref(var  Msg : TMessage);     {RECIBE COORDENADAS}
begin
 Xre := Msg.WParam;
 Yre := Msg.LParam;
end;


procedure Register;
begin
  RegisterComponents('Juego', [TBomberEnemigo]);
end;

end.
