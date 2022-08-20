unit Bomber;

interface
 {$R Bomber.res}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, stdCtrls,Types;

const
 {MENSAJES DE MATERIAL}
 MResCooWood1b  = WM_USER + 18;    // coordenadas
 MResCooWood2b  = WM_USER + 19;
 MResCooMetal1b = WM_USER + 20;
 MResCooMetal2b = WM_USER + 21;
 MResCooRock1b  = WM_USER + 22;
 MResCooRock2b  = WM_USER + 23;

 {mensajes de BASE}
 MResCooBaseb    = WM_USER + 31;  // recibe coo base
 MResWoodB       = WM_USER + 64; // recibe madera para construir
 MResMetalB      = WM_USER + 65; //        metal  para construir
 MResRockB       = WM_USER + 66; //        piedra para construir

 MResArmaWood     = WM_USER + 224; // RECIBE ARMA DE MADERA
 MResArmaRock     = WM_USER + 386; // RECIBE ARMA DE PIEDRA
 MResArmaMetal    = WM_USER + 212; // RECIBE ARMA DE METAL


 {MENSAJES DE REFUGIO}
 MResCooRB       = WM_USER + 53; // recibe coo de Refugio
 MWoodResRB      = WM_USER + 67; // madera aceptada
 MMetalResRB     = WM_USER + 68; // metal aceptada
 MRockResRB      = WM_USER + 69; // piedra aceptada
 MPuedesRef       = WM_USER + 572;
 MTodosFuera      = WM_USER + 498;

 {MENSAJES DE SOLDADO ENEMIGO}
 MResCooSolEne      = WM_USER + 569;
 MGiveMeCoo_SolE    = WM_USER + 194;
 MResAtacWood_SolE  = WM_USER + 460;
 MResAtacRock_SolE  = WM_USER + 535;
 MResAtacMetal_SolE = WM_USER + 205;
 MEstasRef          = WM_USER + 229;   // pregunta si esta refugiado
 MEstoyRef_SolE     = WM_USER + 595;


 {MENSADES DE BOMBER ENEMIGO}
 MResCooBomEne     = WM_USER + 399;  // recibe coo de bomber ene
 MGiveMeCoo_BomE   = WM_USER + 464;  // pide coordendas
 MResAtacWood_BomE = WM_USER + 592;  //recibe ataque con madera
 MResAtacRock_BomE = WM_USER + 149;  //recibe ataque con madera
 MResAtacMetal_BomE= WM_USER + 455;  //recibe ataque con madera
 MEstasRef_BomE    = WM_USER + 360;   // pregunta si esta refugiado
 MEstoyRef_BomE    = WM_USER + 439;



 {MENSAJES DE ESPIA ENEMIGO}
 MResCooSpyEne     = WM_USER + 195;
 MGiveMeCoo_EspE   = WM_USER + 548;  // pide coordendas
 MResAtacWood_EspE = WM_USER + 448;  //recibe ataque con madera
 MResAtacRock_EspE = WM_USER + 438;  //recibe ataque con madera
 MResAtacMetal_EspE= WM_USER + 334;  //recibe ataque con madera
 MEstasRef_EspE    = WM_USER + 356;   // pregunta si esta refugiado
 MEstoyRef_EspE    = WM_USER + 444;

 {MENSAJES DE BASE ENEMIGA}
 MResCooBasEne  = WM_USER + 445;

 {MENSAJES DE REFUGIO ENEMIGA}
 MResCooRefEne  = WM_USER + 454;




type
  TBomber = class(TGraphicControl)
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

    function  GetEstado(indice: integer): string;
    procedure SetEstado(indice : integer; valor: string);
    procedure Atacando;
    procedure Refugiando;

    procedure ResCooWood1b         (Var Msg : TMessage); message MResCooWood1b;
    procedure ResCooWood2b         (Var Msg : TMessage); message MResCooWood2b;
    procedure ResCooMetal1b        (Var Msg : TMessage); message MResCooMetal1b;
    procedure ResCooMetal2b        (Var Msg : TMessage); message MResCooMetal2b;
    procedure ResCooRock1b         (Var Msg : TMessage); message MResCooRock1b;
    procedure ResCooRock2b         (Var Msg : TMessage); message MResCooRock2b;
    procedure ResCooBaseb          (Var Msg : TMessage); message MResCooBaseb;
    procedure ResCooRB             (Var Msg : TMessage); message MResCooRB;
    procedure ResWoodB             (Var Msg: TMessage);  message MResWoodB;
    procedure ResMetalB            (Var Msg: TMessage);  message MResMetalB;
    procedure ResRockB             (Var Msg: TMessage);  message MResRockB;
    procedure WoodResRB            (Var Msg: TMessage);  message MWoodResRB;
    procedure MetalResRB           (Var Msg: TMessage);  message MMetalResRB;
    procedure RockResRB            (Var Msg: TMessage);  message MRockResRB;
    procedure ResArmaWood          (Var Msg: TMessage);  message MResArmaWood;
    procedure ResArmaRock          (Var Msg: TMessage);  message MResArmaRock;
    procedure ResArmaMetal         (Var Msg: TMessage);  message MResArmaMetal;
    procedure ResCooSolEne         (Var Msg: TMessage);  message MResCooSolEne;
    procedure ResCooBomEne         (Var Msg: TMessage);  message MResCooBomEne;
    procedure ResCooSpyEne         (Var Msg: TMessage);  message MResCooSpyEne;
    procedure ResCooBasEne         (Var Msg: TMessage);  message MResCooBasEne;
    procedure ResCooRefEne         (Var Msg: TMessage);  message MResCooRefEne;
    procedure GiveMeCoo_SolE       (Var Msg: TMessage);  message MGiveMeCoo_SolE;
    procedure ResAtacWood_SolE     (Var Msg: TMessage);  message MResAtacWood_SolE;
    procedure ResAtacRock_SolE     (Var Msg: TMessage);  message MResAtacRock_SolE;
    procedure ResAtacMetal_SolE    (Var Msg: TMessage);  message MResAtacMetal_SolE;
    procedure GiveMeCoo_BomE       (Var Msg: TMessage);  message MGiveMeCoo_BomE;
    procedure ResAtacWood_BomE     (Var Msg: TMessage);  message MResAtacWood_BomE;
    procedure ResAtacRock_BomE     (Var Msg: TMessage);  message MResAtacRock_BomE;
    procedure ResAtacMetal_BomE    (Var Msg: TMessage);  message MResAtacMetal_BomE;
    procedure GiveMeCoo_EspE       (Var Msg: TMessage);  message MGiveMeCoo_EspE;
    procedure ResAtacWood_EspE     (Var Msg: TMessage);  message MResAtacWood_EspE;
    procedure ResAtacRock_EspE     (Var Msg: TMessage);  message MResAtacRock_EspE;
    procedure ResAtacMetal_EspE    (Var Msg: TMessage);  message MResAtacMetal_EspE;
    procedure PuedesREF            (Var Msg: TMessage);  message MPuedesRef;
    procedure EstasRef             (Var Msg: TMessage);  message MEstasRef;
    procedure EstasRef_BomE        (Var Msg: TMessage);  message MEstasRef_BomE;
    procedure EstasRef_EspE        (Var Msg: TMessage);  message MEstasRef_EspE;
    procedure EstoyRef_SolE        (Var Msg: TMessage);  message MEstoyRef_SolE;
    procedure EstoyRef_BomE        (Var Msg: TMessage);  message MEstoyRef_BomE;
    procedure EstoyRef_EspE        (Var Msg: TMessage);  message MEstoyRef_EspE;
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
constructor TBomber.Create(AOwner : TComponent);
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
destructor TBomber.destroy;
begin
  FBitmap.Free;
  inherited;
end;

{------------------------------------------------------------------- color}
procedure TBomber.SetColor(AColor: TColor);
begin
  If FColor <> AColor then FColor := AColor;
end;

{----------------------------------------------------------------- paint}
procedure TBomber.paint;
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

 Fbitmap.Canvas.Brush.Color := clBlue;
 FBitmap.Canvas.Pen.Color := clBlue;
 FBitmap.Canvas.Polygon([Point(6,5),Point(2,5),Point(2,11),Point(4,11),Point(4,15),Point(8,15),
                        Point(8,11),Point(10,11),Point(10,5)]);
 FBitmap.Canvas.Pen.Color := clYellow;
 FBitmap.Canvas.Brush.Color := clYellow;
 FBitmap.Canvas.Ellipse(4,5,9,11);
 canvas.Draw(0,0,FBitmap);
end;

{---------------------------------------------- ACTUALIZA EL ESTADO INTERNO}
function TBomber.GetEstado(indice: integer): string;
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

procedure TBomber.SetEstado(indice: integer; valor: string);
begin
  if FEstado[indice] <> valor then
    FEstado[indice] := valor;
end;

{---------------------------------------------- Calcula  constante de TRAYECTORIA}
procedure TBomber.Trayectoria(xDest, yDest: LongInt);
begin
  xi := Left;
  yi := Top;
  xf := xDest;
  yf := yDest;
  if xi = xf then xi := xi + 3;
  C := (yi - yf) / (xi - xf);
end;

{---------------------------------------------------------- habilita}
procedure TBomber.SetAbilitado(AAbilitado: Boolean);
begin
  FAbilitado := AAbilitado;
  if csDesigning in ComponentState then Exit;
  FTimer.Enabled := FAbilitado;
end;

{---------------------------------------------------------- determina velocidad}
procedure TBomber.SetVelocidad(AVelocidad: Integer);
begin
  FVelocidad := AVelocidad;
  FTimer.Interval := FVelocidad;
end;


{---------------------------------------------------------- desplazamiento}
procedure TBomber.camina;
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
procedure TBomber.DoToqueBase;
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
procedure TBomber.DoToqueRefugio;
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
procedure TBomber.desplazate(x,y: LongInt; Vel: Integer);
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
procedure TBomber.cicloMat_Base;
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


procedure TBomber.IrMaterial(Material : String);
begin
 MatTransportado := Material;
 If Material = 'Madera1'then begin Mensaje.Msg := WM_USER + 24; FEstado[4] := 'Cargando_Madera'; end;
 If Material = 'Madera2'then begin Mensaje.Msg := WM_USER + 25; FEstado[4] := 'Cargando_Madera'; end;
 If Material = 'Metal1' then begin Mensaje.Msg := WM_USER + 26; FEstado[4] := 'Cargando_Metal'; end;
 If Material = 'Metal2' then begin Mensaje.Msg := WM_USER + 27; FEstado[4] := 'Cargando_Metal'; end;
 If Material = 'Piedra1'then begin Mensaje.Msg := WM_USER + 28; FEstado[4] := 'Cargando_Piedra'; end;
 If Material = 'Piedra2'then begin Mensaje.Msg := WM_USER + 29; FEstado[4] := 'Cargando_Piedra'; end;

 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 Mensaje.Msg := WM_USER + 30;
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

procedure TBomber.cicloBase_Ref;
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
   begin
     if MatTransportado = 'Madera' then begin
         Mensaje.Msg := WM_USER + 73; { 'Dame Madera'}
         FEstado[4] := 'Cargando_Madera';
         Velocidad := 12;
       end;

     if MatTransportado = 'Metal'  then begin
          Mensaje.Msg := WM_USER + 74; { 'Dame Metal'}
          FEstado[4] := 'Cargando_Metal';
          Velocidad := 14;
       end;

     if MatTransportado = 'Piedra' then begin
         Mensaje.Msg := WM_USER + 75; { 'Dame Piedra'}
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
       if FCarMetal = 0 then begin direccion := 'Base'; meta := false; end
       else begin direccion := 'Refugio'; Meta := false; end;


     if (FEstado[1] = 'Construyendo') and (FEstado[4] = 'Cargando_Piedra') then
       if FCarRock = 0 then begin direccion := 'Base'; meta := false;end
       else begin direccion := 'Refugio';Meta := false; end;
  end;


 {SI VA HACIA EL REFUGIO}
 if (direccion = 'Refugio') and (Meta = false) then begin
    FXDest := xR; FYDest := yR;Trayectoria(FXDest,FYDest); Velocidad := 20;
  end;


 {CUANDO LLEGA AL REFUGIO}
 if (Direccion = 'Refugio') and (Meta = true) then begin          {---  Bomber a Refugio ---}
   if FEstado[4] = 'Cargando_Madera' then Mensaje.Msg := WM_USER + 70;{'Recibe Madera'}
   if FEstado[4] = 'Cargando_Metal'  then Mensaje.Msg := WM_USER + 71;{'Recibe Metal'}
   if FEstado[4] = 'Cargando_Piedra' then Mensaje.Msg := WM_USER + 72;{'Recibe Piedra'}
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



procedure TBomber.Construir(Refugio, Material : String);
begin
 MatTransportado := Material;
 Mensaje.Msg := WM_USER + 47; //-- Pide coordenadas al refugio el Spia
 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 Mensaje.Msg := WM_USER + 30;//--- Pide coordenadas a la base
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

procedure TBomber.Atacando;
begin

 TopAnt := Top;
 {1. camina a la base por el arma}
 if (Direccion = 'Base') and (Meta = false) then Begin
     FEstado[5] := 'Voy por arma';
     FXDest := xB; FYdest := yB; Trayectoria(FXDest,FYDest);Velocidad := 10;
   end;


 {2. pide arma a la base}
 if (Direccion = 'Base') and (Meta = True) then begin

    if FEstado[2] = 'Madera' then Mensaje.Msg := WM_USER + 225; {pide arma de madera}
    if FEstado[2] = 'Metal'  then Mensaje.Msg := WM_USER + 485; {pide arma de metal}
    if FEstado[2] = 'Piedra' then Mensaje.Msg := WM_USER + 330; {pide arma de Piedra}
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

   if FEstado[6] = 'Soldado' then Mensaje.Msg := WM_USER + 559;            {pide coo a Soldado Ene}
   if FEstado[6] = 'Bomber'  then Mensaje.Msg := WM_USER + 332 ;           {pide coo a Bomber Ene}
   if FEstado[6] = 'Espia'   then Mensaje.Msg := WM_USER + 156 ;           {pide coo a Espia Ene}
   if FEstado[6] = 'Base'    then Mensaje.Msg := WM_USER + 395;             {pide coo a base enemiga}
   if FEstado[6] = 'Refugio' then Mensaje.Msg := WM_USER + 200;            {pide coo a refugio enemy}

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

    if (FEstado[6] = 'Soldado') Then Mensaje.Msg := WM_USER + 516;
    if (FEstado[6] = 'Bomber')  Then Mensaje.Msg := WM_USER + 513;
    if (FEstado[6] = 'Espia')   Then Mensaje.Msg := WM_USER + 354;
    Application.MainForm.Broadcast(Mensaje);

    if VictRef = 1 then begin Left := Left - 40; Meta := false end;       {1 = refugiado; 0 = Libre}

if VictRef = 0 then
 begin
      {----------------- ataques a SOLDADO ENEMIGO}
   if (FEstado[6] = 'Soldado') and (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 499;
   if (FEstado[6] = 'Soldado') and (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 436;
   if (FEstado[6] = 'Soldado') and (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 364;

      {----------------- ataques a BOMBER ENEMIGO}
   if (FEstado[6] = 'Bomber')  and (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 306;
   if (FEstado[6] = 'Bomber')  and (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 419;
   if (FEstado[6] = 'Bomber')  and (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 299;

      {----------------- ataques a ESPIA ENEMIGO}
   if (FEstado[6] = 'Espia')  and (FEstado[2] = 'Madera')  then Mensaje.Msg := WM_USER + 410;
   if (FEstado[6] = 'Espia')  and (FEstado[2] = 'Piedra')  then Mensaje.Msg := WM_USER + 507;
   if (FEstado[6] = 'Espia')  and (FEstado[2] = 'Metal')   then Mensaje.Msg := WM_USER + 511;

      {----------------- ataque a BASE ENEMIGA}
   if (FEstado[6] = 'Base')    and  (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 234;
   if (FEstado[6] = 'Base')    and  (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 338;
   if (FEstado[6] = 'Base')    and  (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 222;

      {----------------- ataque a REFUGIO ENEMIGO}
   if (FEstado[6] = 'Refugio') and  (FEstado[2] = 'Madera') then Mensaje.Msg := WM_USER + 193;
   if (FEstado[6] = 'Refugio') and  (FEstado[2] = 'Piedra') then Mensaje.Msg := WM_USER + 331;
   if (FEstado[6] = 'Refugio') and  (FEstado[2] = 'Metal')  then Mensaje.Msg := WM_USER + 413;


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



procedure TBomber.Atacar(objetivo, con_que: string);
begin
 Direccion := 'Base';
 Meta := false;
 Mensaje.Msg := WM_USER + 30;    {pide a base sus coordenadas}
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


procedure TBomber.Refugiando;
begin
 TopAnt := Top;

 velocidad := 10;

 if (Direccion = 'Refugio') and (Meta = false) then begin
 FXDest := Xr; FYDest := Yr; Trayectoria(FXDest,FYDest); end;    {TRAZO TRAYECTORIA}


 if (Direccion = 'Refugio') and (Meta = True) then               {PREGUNTO SI ME PUEDE REFUGIAR}
   begin
     Mensaje.Msg := WM_USER + 396;
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
procedure TBomber.Refugiarse;
begin
 Mensaje.Msg := WM_USER + 47;                               {PIDO COO DE REFUGIO}
 Mensaje.WParam := 0;
 Mensaje.LParam := 0;
 Mensaje.Result := 0;
 Application.MainForm.Broadcast(Mensaje);

 FEstado[1]:= 'Llendo a refugiarse';
 direccion := 'Refugio';
 meta      := false;
end;



{---------------------------------------------------------- EJECUCION DE TAREAS}
procedure TBomber.OnTimer(Sender: TObject);
begin

  if csDesigning in ComponentState then begin
    FTimer.Enabled := False;
    Exit;
  end;

 If FEstado[1] = 'Desplazandose'       then camina;
 If FEstado[1] = 'Atacando'            then Atacando;
 if FEstado[1] = 'Trayendo material'   then CicloMat_Base;
 if FEstado[1] = 'Construyendo'        then CicloBase_Ref;
 if FEstado[1] = 'Llendo a refugiarse' then Refugiando;
end;


////////////////////////////////////////////////////////////////////////////////
//////////////////  MENSAJES  DE MATERIAL  /////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


procedure TBomber.ResCooWood1b(var Msg : TMessage);    {COO DE MADERA 1}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TBomber.ResCooWood2b(var Msg : TMessage);    {COO DE MADERA 2}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TBomber.ResCooMetal1b(var Msg : TMessage);   {COO DE METAL 1}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TBomber.ResCooMetal2b(var Msg : TMessage);   {COO DE METAL 2}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TBomber.ResCooRock1b(var Msg : TMessage);    {COO DE PIEDRA 1}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

procedure TBomber.ResCooRock2b(var Msg : TMessage);    {COO DE PIEDRA 2}
begin
  xm := Msg.WParam;
  ym := Msg.LParam;
end;

////////////////////////////////////////////////////////////////////////////////
//////////////////  MENSAJES  DE BASE DE CONTROL  //////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBomber.ResCooBaseb(var Msg : TMessage);    {RECIBE COORDENADAS}
begin
 xb := Msg.WParam;
 yb := Msg.LParam;
end;

procedure TBomber.ResWoodB(var Msg: TMessage); {--> Recibe la Madera PARA CONSTRUIR}
begin
 FCarWood := Msg.WParam;
end;

procedure TBomber.ResMetalB(var Msg :TMessage); {--> Recibe Metal PARA CONSTRUIR}
begin
  FCarMetal := Msg.WParam;
end;

procedure TBomber.ResRockB(var Msg : TMessage);{--> Recibe Piedra PARA CONSTRUIR}
begin
 FCarRock := Msg.WParam;
end;

procedure TBomber.ResArmaWood(var Msg : TMessage);   {RECIBE ARMA DE MADERA}
begin
  WoodGun := Msg.WParam;
  RockGun := 0;
  MetalGun:= 0;
end;

procedure TBomber.ResArmaRock(var Msg : TMessage);   {RECIBE ARMA DE PIEDRA}
begin
  WoodGun := 0;
  RockGun := Msg.WParam;
  MetalGun:= 0;
end;

procedure TBomber.ResArmaMetal(var Msg : TMessage);   {RECIBE ARMA DE METAL}
begin
  WoodGun := 0;
  RockGun := 0;
  MetalGun:= Msg.WParam;
end;



////////////////////////////////////////////////////////////////////////////////
//////////////////  MENSAJES  DE REFUGIO   /////  //////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBomber.TodosFuera(var  Msg : TMessage);
begin
  randomize;
  if FEstado[1] = 'Refugiado' then
  Desplazate(Random(400),Random(400),10);
end;

procedure TBomber.ResCooRB(var Msg : TMessage);        {RECIBE COORDENADAS}
begin
 xR := Msg.WParam;
 yR := Msg.LParam;
end;

procedure TBomber.PuedesRef(var Msg : TMessage);
begin
   RefugioSiNo := Msg.WParam;
end;

procedure TBomber.WoodResRB(var Msg: TMessage);        {MADERA RECIBIDA}
begin
  if Msg.WParam = 0 then
    begin
      FCarWood := 0;
      desplazate(xR + 25, yR + 25,10);
    end;
end;

procedure TBomber.MetalResRB(var Msg : TMessage);      {METAL RECIBIDO}
begin
 if Msg.WParam = 0 then
    begin
      FCarWood := 0;
      desplazate(xR + 25, yR + 25,10);
    end;
end;

procedure TBomber.RockResRB(var Msg : TMessage);        {PIEDRA RECIBIDA}
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

procedure TBomber.ResCooSolEne(var  Msg : TMessage);              {RECIBE COORDENADAS}
begin
 Xs := Msg.WParam;
 Ys := Msg.LParam;
end;

procedure TBomber.EstoyRef_SolE(var Msg : TMessage);    {VERIFICA SI ESTA REFUGIADO}
begin
  VictRef := Msg.WParam;
end;

procedure TBomber.EstasRef(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 526;
  if FEstado[1] = 'Refugiado' then Mensaje.WParam := 1;
  if FEstado[1] <> 'Refugiado' then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBomber.GiveMeCoo_SolE(var Msg : TMessage);       {SOLICITA COORDENADAS}
begin
  Mensaje.Msg := WM_USER + 409;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBomber.ResAtacWood_SolE(var Msg : TMessage);     {ATAQUE CON MADERA}
begin
  if FResistencia > 0 then FResistencia := FResistencia - 1;
end;

procedure TBomber.ResAtacRock_SolE(var Msg : TMessage);     {ATAQUE CON PIEDRA}
begin
  if FResistencia <= 2 then FResistencia := 0;
  if FResistencia > 2 then FResistencia := FResistencia - 2;
end;

procedure TBomber.ResAtacMetal_SolE(var Msg : TMessage);     {ATAQUE CON METAL}
begin
  if FResistencia <= 3 then FResistencia := 0;
  if FResistencia > 3 then FResistencia := FResistencia - 3;
end;



////////////////////////////////////////////////////////////////////////////////
//////////////////  mensajes de BOMBER ENEMIGO   //////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBomber.ResCooBomEne(var  Msg : TMessage);             {RECIBE COO DE BOMBER}
begin
 XBomE := Msg.WParam;
 YBomE := Msg.LParam;
end;


procedure TBomber.EstoyRef_BomE(var Msg : TMessage);    {VERIFICA SI ESTA REFUGIADO}
begin
  VictRef := Msg.WParam;
end;

procedure TBomber.EstasRef_BomE(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 584;
  if FEstado[1] = 'Refugiado' then Mensaje.WParam := 1;
  if FEstado[1] <> 'Refugiado' then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBomber.GiveMeCoo_BomE(var Msg : TMessage);      {PIDE COORDENDAS}
begin
  Mensaje.Msg := WM_USER + 407;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBomber.ResAtacWood_BomE(var Msg : TMessage);     {ATAQUE CON MADERA}
begin
  if FResistencia > 0 then FResistencia := FResistencia - 1;
end;

procedure TBomber.ResAtacRock_BomE(var Msg : TMessage);     {ATAQUE CON PIEDRA}
begin
  if FResistencia <= 2 then FResistencia := 0;
  if FResistencia > 2 then FResistencia := FResistencia - 2;
end;

procedure TBomber.ResAtacMetal_BomE(var Msg : TMessage);     {ATAQUE CON METAL}
begin
  if FResistencia <= 3 then FResistencia := 0;
  if FResistencia > 3 then FResistencia := FResistencia - 3;
end;

////////////////////////////////////////////////////////////////////////////////
//////////////////  mensajes de ESPIA ENEMIGO   //////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBomber.ResCooSpyEne(var  Msg : TMessage);     {PIDE COORDENADAS}
begin
 Xee := Msg.WParam;
 Yee := Msg.LParam;
end;

procedure TBomber.EstoyRef_EspE(var Msg : TMessage);    {VERIFICA SI ESTA REFUGIADO}
begin
  VictRef := Msg.WParam;
end;

procedure TBomber.EstasRef_EspE(var Msg : TMessage);
begin
  Mensaje.Msg := WM_USER + 568;
  if FEstado[1] = 'Refugiado' then Mensaje.WParam := 1;
  if FEstado[1] <> 'Refugiado' then Mensaje.WParam := 0;
  Mensaje.LParam := 0;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBomber.GiveMeCoo_EspE(var Msg : TMessage);      {PIDE COORDENDAS}
begin
  Mensaje.Msg := WM_USER + 391;
  Mensaje.WParam := Left;
  Mensaje.LParam := Top;
  Mensaje.Result := 0;
  Application.MainForm.Broadcast(Mensaje);
end;

procedure TBomber.ResAtacWood_EspE(var Msg : TMessage);     {ATAQUE CON MADERA}
begin
  if FResistencia > 0 then FResistencia := FResistencia - 1;
end;

procedure TBomber.ResAtacRock_EspE(var Msg : TMessage);     {ATAQUE CON PIEDRA}
begin
  if FResistencia <= 2 then FResistencia := 0;
  if FResistencia > 2 then FResistencia := FResistencia - 2;
end;

procedure TBomber.ResAtacMetal_EspE(var Msg : TMessage);     {ATAQUE CON METAL}
begin
  if FResistencia <= 3 then FResistencia := 0;
  if FResistencia > 3 then FResistencia := FResistencia - 3;
end;

////////////////////////////////////////////////////////////////////////////////
//////////////////  mensajes de BASE ENEMIGA   //////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBomber.ResCooBasEne(var  Msg : TMessage);     {PIDE COORDENADAS}
begin
 Xbe := Msg.WParam;
 Ybe := Msg.LParam;
end;

////////////////////////////////////////////////////////////////////////////////
//////////////////  mensajes de REFUGIO ENEMIGA   //////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TBomber.ResCooRefEne(var  Msg : TMessage);     {PIDE COORDENADAS}
begin
 Xre := Msg.WParam;
 Yre := Msg.LParam;
end;

procedure Register;
begin
  RegisterComponents('Juego', [TBomber]);
end;

end.
