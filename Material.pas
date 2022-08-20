unit Material;

interface
   {$R Material.res}
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, stdCtrls;

const
 {mensajes de soldado}
 MSendCooWood1_Soldier  = WM_USER + 1;
 MSendCooWood2_Soldier  = WM_USER + 2;
 MSendCooMetal1_Soldier = WM_USER + 3;
 MSendCooMetal2_Soldier = WM_USER + 4;
 MSendCooRock1_Soldier  = WM_USER + 5;
 MSendCooRock2_Soldier  = WM_USER + 6;

 {mensajes de soldado enemigo}
 MSendCooWood1_SEnemy  = WM_USER + 76;
 MSendCooWood2_SEnemy  = WM_USER + 77;
 MSendCooMetal1_SEnemy = WM_USER + 78;
 MSendCooMetal2_SEnemy = WM_USER + 79;
 MSendCooRock1_SEnemy  = WM_USER + 80;
 MSendCooRock2_SEnemy  = WM_USER + 81;

 {mensajes de Bomber}
 MSendCooWood1_Bomber  = WM_USER + 24;
 MSendCooWood2_Bomber  = WM_USER + 25;
 MSendCooMetal1_Bomber = WM_USER + 26;
 MSendCooMetal2_Bomber = WM_USER + 27;
 MSendCooRock1_Bomber  = WM_USER + 28;
 MSendCooRock2_Bomber  = WM_USER + 29;

 {mensajes de Bomber enemigo}
 MSendCooWood1_BomE  = WM_USER + 547;
 MSendCooWood2_BomE  = WM_USER + 113;
 MSendCooMetal1_BomE = WM_USER + 292;
 MSendCooMetal2_BomE = WM_USER + 116;
 MSendCooRock1_BomE  = WM_USER + 420;
 MSendCooRock2_BomE  = WM_USER + 426;

 {mensajes de espia}
 MSendCooWood1_Spy  = WM_USER + 32;
 MSendCooWood2_Spy  = WM_USER + 33;
 MSendCooMetal1_Spy = WM_USER + 34;
 MSendCooMetal2_Spy = WM_USER + 35;
 MSendCooRock1_Spy  = WM_USER + 36;
 MSendCooRock2_Spy  = WM_USER + 37;

 {mensajes de Espia Enemigo}
 MSendCooWood1_SpyEne  = WM_USER + 531;
 MSendCooWood2_SpyEne  = WM_USER + 209;
 MSendCooMetal1_SpyEne = WM_USER + 493;
 MSendCooMetal2_SpyEne = WM_USER + 123;
 MSendCooRock1_SpyEne  = WM_USER + 286;
 MSendCooRock2_SpyEne  = WM_USER + 239;




type
  TMaterial = class(TGraphicControl)
  private
    { Private declarations }
    Fposicion     : String;
    FBitmap       : TBitmap;
    FColor        : TColor;

    procedure SetColor(Color: TColor);

    procedure SendCooWood1_Soldier (Var Msg : TMessage); message MSendCooWood1_Soldier;
    procedure SendCooWood2_Soldier (Var Msg : TMessage); message MSendCooWood2_Soldier;
    procedure SendCooMetal1_Soldier(Var Msg : TMessage); message MSendCooMetal1_Soldier;
    procedure SendCooMetal2_Soldier(Var Msg : TMessage); message MSendCooMetal2_Soldier;
    procedure SendCooRock1_Soldier (Var Msg : TMessage); message MSendCooRock1_Soldier;
    procedure SendCooRock2_Soldier (Var Msg : TMessage); message MSendCooRock2_Soldier;

    procedure SendCooWood1_SEnemy (Var Msg : TMessage); message MSendCooWood1_SEnemy;
    procedure SendCooWood2_SEnemy (Var Msg : TMessage); message MSendCooWood2_SEnemy;
    procedure SendCooMetal1_SEnemy(Var Msg : TMessage); message MSendCooMetal1_SEnemy;
    procedure SendCooMetal2_SEnemy(Var Msg : TMessage); message MSendCooMetal2_SEnemy;
    procedure SendCooRock1_SEnemy (Var Msg : TMessage); message MSendCooRock1_SEnemy;
    procedure SendCooRock2_SEnemy (Var Msg : TMessage); message MSendCooRock2_SEnemy;

    procedure SendCooWood1_Bomber (Var Msg : TMessage); message MSendCooWood1_Bomber;
    procedure SendCooWood2_Bomber (Var Msg : TMessage); message MSendCooWood2_Bomber;
    procedure SendCooMetal1_Bomber(Var Msg : TMessage); message MSendCooMetal1_Bomber;
    procedure SendCooMetal2_Bomber(Var Msg : TMessage); message MSendCooMetal2_Bomber;
    procedure SendCooRock1_Bomber (Var Msg : TMessage); message MSendCooRock1_Bomber;
    procedure SendCooRock2_Bomber (Var Msg : TMessage); message MSendCooRock2_Bomber;

    procedure SendCooWood1_BomE (Var Msg : TMessage); message MSendCooWood1_BomE;
    procedure SendCooWood2_BomE (Var Msg : TMessage); message MSendCooWood2_BomE;
    procedure SendCooMetal1_BomE (Var Msg : TMessage); message MSendCooMetal1_BomE;
    procedure SendCooMetal2_BomE (Var Msg : TMessage); message MSendCooMetal2_BomE;
    procedure SendCooRock1_BomE (Var Msg : TMessage); message MSendCooRock1_BomE;
    procedure SendCooRock2_BomE (Var Msg : TMessage); message MSendCooRock2_BomE;

    procedure SendCooWood1_Spy (Var Msg : TMessage); message MSendCooWood1_Spy;
    procedure SendCooWood2_Spy (Var Msg : TMessage); message MSendCooWood2_Spy;
    procedure SendCooMetal1_Spy(Var Msg : TMessage); message MSendCooMetal1_Spy;
    procedure SendCooMetal2_Spy(Var Msg : TMessage); message MSendCooMetal2_Spy;
    procedure SendCooRock1_Spy (Var Msg : TMessage); message MSendCooRock1_Spy;
    procedure SendCooRock2_Spy (Var Msg : TMessage); message MSendCooRock2_Spy;

    procedure SendCooWood1_SpyEne (Var Msg : TMessage); message MSendCooWood1_SpyEne;
    procedure SendCooWood2_SpyEne (Var Msg : TMessage); message MSendCooWood2_SpyEne;
    procedure SendCooMetal1_SpyEne(Var Msg : TMessage); message MSendCooMetal1_SpyEne;
    procedure SendCooMetal2_SpyEne(Var Msg : TMessage); message MSendCooMetal2_SpyEne;
    procedure SendCooRock1_SpyEne (Var Msg : TMessage); message MSendCooRock1_SpyEne;
    procedure SendCooRock2_SpyEne (Var Msg : TMessage); message MSendCooRock2_SpyEne;




  protected
    { Protected declarations }
    procedure paint; override;
    Function GetPosicion:String;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor destroy; override;
  published
    { Published declarations }
    property Posicion : String   read GetPosicion;
    property Color: TColor read FColor write SetColor;
    property Name;

  end;

procedure Register;

implementation
var
  Mensaje : TMessage;

{----------------------------------------------------------------- constructor}
constructor TMaterial.Create(AOwner : TComponent);
begin
  inherited;
  ControlStyle := ControlStyle + [csOpaque];
  FBitmap := TBitmap.Create;
  FColor := clBtnFace;
  Width := 30;
  Height := 30;
end;
{----------------------------------------------------------------- destructor}
destructor TMaterial.destroy;
begin
  FBitmap.Free;
  inherited destroy;
end;

{----------------------------------------------------------------- color}
procedure TMaterial.SetColor(Color: TColor);
begin
  FColor := Color;
end;
{----------------------------------------------------------------- pinta}
procedure TMaterial.paint;
var
 rectangulo : TRect;
 i,x1,y1,x2,y2: integer;
begin
  rectangulo := Rect(0,0,Width,Height);
  FBitmap.Canvas.Brush.Color := FColor;
  FBitmap.Width := Width;
  FBitmap.Height := Height;
  FBitmap.Canvas.FillRect(rectangulo);
  FBitmap.Canvas.Pen.Width := 2;
  FBitmap.Canvas.Pen.Color := clBlack;
  FBitmap.Canvas.Rectangle(1,1,Width,Height);
  FBitmap.Canvas.Pen.Color := clRed;

  if (Name = 'Piedra1') or (Name = 'Piedra2') then
    begin
      Width := 40;
      FBitmap.Canvas.Pen.Width := 0;
      FBitmap.Canvas.Pen.Color := clBlack;
      FBitmap.Canvas.Brush.Color := clSilver;
      For i := 1 To 30 Do
        begin
          randomize;
          Repeat
            x1 := Random(FBitmap.Width);
            y1 := Random(FBitmap.Height);
            x2 := x1 + 7;
            y2 := y1 + 7;
            FBitmap.Canvas.Ellipse(x1,y1,x2,y2);
          until (x1 > 4) and (x2 < Width - 2) and (y1 > 4) and (y2 < Height - 4);
        end;
    end;

  if (Name = 'Madera1') or (Name = 'Madera2') then
    begin
      Width := 45;
      FBitmap.Canvas.Pen.Width := 0;
      FBitmap.Canvas.Pen.Color := clLime;
      FBitmap.Canvas.Brush.Color := clMaroon;
      For i := 1 To 30 Do
        begin
          randomize;
          Repeat
            x1 := Random(FBitmap.Width);
            y1 := Random(FBitmap.Height);
            x2 := x1 + 7;
            y2 := y1 + 7;
            FBitmap.Canvas.Rectangle(x1,y1,x2,y2);
          until (x1 > 4) and (x2 < Width - 2) and (y1 > 4) and (y2 < Height - 4);
        end;
    end;

  if (Name = 'Metal1') or (Name = 'Metal2') then
    begin
      Width := 35;
      FBitmap.Canvas.Pen.Width := 0;
      FBitmap.Canvas.Pen.Color := clRed;
      FBitmap.Canvas.Brush.Color := clYellow;
      For i := 1 To 30 Do
        begin
          randomize;
          Repeat
            x1 := Random(FBitmap.Width);
            y1 := Random(FBitmap.Height);
            x2 := x1 + 7;
            y2 := y1 + 7;
            FBitmap.Canvas.Rectangle(x1,y1,x2,y2);
          until (x1 > 4) and (x2 < Width - 2) and (y1 > 4) and (y2 < Height - 4);
        end;
    end;




  FBitmap.Canvas.Brush.Color := clBtnFace;
  FBitmap.Canvas.TextOut(2,7,Name);

  Canvas.Draw(0,0,FBitmap);
end;

{----------------------------------------------------------------- posición}
Function TMaterial.GetPosicion: String;
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


procedure TMaterial.SendCooWood1_Soldier(Var Msg: TMessage);
begin
  if  Name = 'Madera1' then
    begin
     Mensaje.Msg := WM_USER + 7; //--> "Soldier" Recibe mis coordenadas de madera 1
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooWood2_Soldier(Var Msg: TMessage);
begin
  if  Name = 'Madera2' then
    begin
     Mensaje.Msg := WM_USER + 8; //--> "Soldier" Recibe mis coordenadas de madera 2
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooMetal1_Soldier(Var Msg: TMessage);
begin
  if  Name = 'Metal1' then
    begin
     Mensaje.Msg := WM_USER + 9; //--> "Soldier" Recibe mis coordenadas de metal 1
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooMetal2_Soldier(Var Msg: TMessage);
begin
  if Name = 'Metal2' then
    begin
     Mensaje.Msg := WM_USER +10; //--> "Soldier" Recibe mis coordenadas de metal 2
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooRock1_Soldier(Var Msg: TMessage);
begin
  if Name = 'Piedra1' then
    begin
     Mensaje.Msg := WM_USER + 11; //--> "Soldier" Recibe mis coordenadas de Piedra 1
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooRock2_Soldier(Var Msg: TMessage);
begin
  if Name = 'Piedra2' then
    begin
     Mensaje.Msg := WM_USER + 12; //--> "Soldier" Recibe mis coordenadas de Piedra 2
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

procedure TMaterial.SendCooWood1_BomE(Var Msg : TMessage);  {BE SOLICITA COOR DE MADERA 1}
begin
  if  Name = 'Madera1' then
    begin
     Mensaje.Msg := WM_USER + 186;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooWood2_BomE(Var Msg: TMessage);  {BOMBER ENE PIDE COO DE MADERA 2}
begin
  if  Name = 'Madera2' then
    begin
     Mensaje.Msg := WM_USER + 488;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooMetal1_BomE(Var Msg: TMessage);  {BOMBER ENE PIDE COO DE METAL 1}
begin
  if  Name = 'Metal1' then
    begin
     Mensaje.Msg := WM_USER + 160;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooMetal2_BomE(Var Msg: TMessage);  {BOMBER ENE PIDE COO DE METAL 2}
begin
  if  Name = 'Metal2' then
    begin
     Mensaje.Msg := WM_USER + 176;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooRock1_BomE(Var Msg: TMessage);  {BOMBER ENE PIDE COO DE PIEDRA 1}
begin
  if  Name = 'Piedra1' then
    begin
     Mensaje.Msg := WM_USER + 598;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooRock2_BomE(Var Msg: TMessage);  {BOMBER ENE PIDE COO DE PIEDRA 1}
begin
  if  Name = 'Piedra2' then
    begin
     Mensaje.Msg := WM_USER + 281;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;



procedure TMaterial.SendCooWood1_Bomber(Var Msg: TMessage);     {BOMBER SOLICITA COO DE MADERA 1}
begin
  if  Name = 'Madera1' then
    begin
     Mensaje.Msg := WM_USER + 18;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;



procedure TMaterial.SendCooWood2_Bomber(Var Msg: TMessage);
begin
  if  Name = 'Madera2' then
    begin
     Mensaje.Msg := WM_USER + 19; //--> "Bomber" Recibe mis coordenadas de madera 2
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooMetal1_Bomber(Var Msg: TMessage);
begin
  if  Name = 'Metal1' then
    begin
     Mensaje.Msg := WM_USER + 20; //--> "Bomber" Recibe mis coordenadas de metal 1
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooMetal2_Bomber(Var Msg: TMessage);
begin
  if Name = 'Metal2' then
    begin
     Mensaje.Msg := WM_USER + 21; //--> "Bomber" Recibe mis coordenadas de metal 2
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooRock1_Bomber(Var Msg: TMessage);
begin
  if Name = 'Piedra1' then
    begin
     Mensaje.Msg := WM_USER + 22; //--> "Bomber" Recibe mis coordenadas de Piedra 1
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooRock2_Bomber(Var Msg: TMessage);
begin
  if Name = 'Piedra2' then
    begin
     Mensaje.Msg := WM_USER + 23; //--> "Bomber" Recibe mis coordenadas de Piedra 2
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;


////////////////////////////////////////////////////////////////////////////////
/////////////////   ESPIA SOLICITA COORDENADAS  ////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TMaterial.SendCooWood1_Spy(Var Msg: TMessage);      {ESPIA SOLICITA COORDENADAS MADERA 1}
begin
  if  Name = 'Madera1' then
    begin
     Mensaje.Msg := WM_USER + 38;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooWood2_Spy(Var Msg: TMessage);       {ESPIA SOLICITA COORDENADAS MADERA 2}
begin
  if  Name = 'Madera2' then
    begin
     Mensaje.Msg := WM_USER + 39;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooMetal1_Spy(Var Msg: TMessage);    {ESPIA SOLICITA COO DE METAL1}
begin
  if  Name = 'Metal1' then
    begin
     Mensaje.Msg := WM_USER + 40;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooMetal2_Spy(Var Msg: TMessage);   {ESPIA SOLICTA COO DE METAL 2}
begin
  if Name = 'Metal2' then
    begin
     Mensaje.Msg := WM_USER + 41;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooRock1_Spy(Var Msg: TMessage);    {ESPIA SOLICITA COO DE PIEDRA 1}
begin
  if Name = 'Piedra1' then
    begin
     Mensaje.Msg := WM_USER + 42;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooRock2_Spy(Var Msg: TMessage);    {ESPIA SOLICITA COO DE PIEDRA 2}
begin
  if Name = 'Piedra2' then
    begin
     Mensaje.Msg := WM_USER + 43;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;


////////////////////////////////////////////////////////////////////////////////
/////////////   ESPIA ENEMIGO SOLICITA COORDENADAS  ////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TMaterial.SendCooWood1_SpyEne(Var Msg: TMessage);      {ESPIA SOLICITA COORDENADAS MADERA 1}
begin
  if  Name = 'Madera1' then
    begin
     Mensaje.Msg := WM_USER + 389;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooWood2_SpyEne(Var Msg: TMessage);       {ESPIA SOLICITA COORDENADAS MADERA 2}
begin
  if  Name = 'Madera2' then
    begin
     Mensaje.Msg := WM_USER + 250;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooMetal1_SpyEne(Var Msg: TMessage);    {ESPIA SOLICITA COO DE METAL1}
begin
  if  Name = 'Metal1' then
    begin
     Mensaje.Msg := WM_USER + 276;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooMetal2_SpyEne(Var Msg: TMessage);   {ESPIA SOLICTA COO DE METAL 2}
begin
  if Name = 'Metal2' then
    begin
     Mensaje.Msg := WM_USER + 435;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooRock1_SpyEne(Var Msg: TMessage);    {ESPIA SOLICITA COO DE PIEDRA 1}
begin
  if Name = 'Piedra1' then
    begin
     Mensaje.Msg := WM_USER + 248;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooRock2_SpyEne(Var Msg: TMessage);    {ESPIA SOLICITA COO DE PIEDRA 2}
begin
  if Name = 'Piedra2' then
    begin
     Mensaje.Msg := WM_USER + 467;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

////////////////////////////////////////////////////////////////////////////////
///////////   soldado Enemigo SOLICITA COORDENADAS  ////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TMaterial.SendCooWood1_SEnemy(Var Msg : TMessage);
begin
  if Name = 'Madera1' then
    begin
     Mensaje.Msg := WM_USER + 82;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooWood2_SEnemy(Var Msg: TMessage);
begin
  if  Name = 'Madera2' then
    begin
     Mensaje.Msg := WM_USER + 83;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooMetal1_SEnemy(Var Msg: TMessage);
begin
  if  Name = 'Metal1' then
    begin
     Mensaje.Msg := WM_USER + 84;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooMetal2_SEnemy(Var Msg: TMessage);
begin
  if Name = 'Metal2' then
    begin
     Mensaje.Msg := WM_USER + 85;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooRock1_SEnemy(Var Msg: TMessage);
begin
  if Name = 'Piedra1' then
    begin
     Mensaje.Msg := WM_USER + 86;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;

procedure TMaterial.SendCooRock2_SEnemy(Var Msg: TMessage);
begin
  if Name = 'Piedra2' then
    begin
     Mensaje.Msg := WM_USER + 87;
     Mensaje.WParam := Left;
     Mensaje.LParam := Top;
     Mensaje.Result := 0;
     Application.MainForm.Broadcast(Mensaje);
    end;
end;


procedure Register;
begin
  RegisterComponents('Juego', [TMaterial]);
end;

end.
