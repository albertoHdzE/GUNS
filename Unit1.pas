unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,BaseEnemiga,Soldado,Material,BaseControl, RefugioEnemigo,SoldadoEnemy,
  BomberEnemigo,Bomber,Refugio,Spy,SpyEnemigo, StdCtrls, Gauges, ExtCtrls, Qt,
  ExcelXP, OleServer;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BloodSol: TGauge;
    BloodBom: TGauge;
    BloodEsp: TGauge;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BloodSolE: TGauge;
    BloodBomE: TGauge;
    BloodEspE: TGauge;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    BloodBase: TGauge;
    BloodBaseE: TGauge;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    BloodRef: TGauge;
    BloodRefE: TGauge;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Timer1: TTimer;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Panel2: TPanel;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelApplication1: TExcelApplication;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    BaseE   : TBaseEnemiga;
    Soldado : TSoldado;
    SolEne  : TSoldadoEnemy;
    BomEne  : TBomberEnemigo;
    Bom     : TBomber;
    Mad1    : TMaterial;
    Mad2    : TMaterial;
    Met1    : TMaterial;
    Met2    : TMaterial;
    Pie1    : TMaterial;
    Pie2    : TMaterial;
    Base    : TBaseControl;
    RefE    : TRefugioEnemigo;
    Ref     : TRefugio;
    Spy     : TSpy;
    SpyEne  : TSpyEnemigo;
  public
    { Public declarations }
  end;

type
  Hold_Tensiones = Array[1..10,1..4] of string;
  Hold_Relaciones= Array[1..10,1..4] of string;
  Control_Precon = Array[1..1,1..2]  of integer;
  Control_Postcon= Array[1..1,1..2]  of integer;
  Hold_Particip  = Array[1..1,1..3]  of string;

  ACCION = record
    Nombre         : string;
    NoParticipantes: integer;
    Participantes  : Hold_Particip;
    Precondiciones : Control_Precon;
    Tensiones_Pre  : Hold_Tensiones;
    Relaciones_Pre : Hold_Relaciones;
    Postcondiciones: Control_PostCon;
    Tensiones_Post : Hold_Tensiones;
    Relaciones_Post: Hold_Relaciones;
  end;

var
  Form1: TForm1;
  ACCIONES_PRIMITIVAS: Array[1..50] of ACCION;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  KeyPreview := True;

  {-------------------------------------- EQUIPO}
  Base := TBaseControl.Create(Self);
  Base.Parent := Self;
  Base.Left := 40;
  Base.Top := 55;

  Soldado := TSoldado.Create(Self);
  Soldado.Parent  := Self;
  Soldado.Left := 40;
  Soldado.Top := 35;

  Bom := TBomber.Create(Self);
  Bom.Parent := Self;
  Bom.Left := 55;
  Bom.Top := 35;


  Spy := TSpy.Create(Self);
  SPy.Parent := Self;
  SPy.Left := 70;
  SPy.Top := 35;


  REF := trEFUGIO.Create(Self);
  Ref.Parent := Self;
  Ref.Left := 580;
  Ref.Top := 175;


  {-------------------------------------- EQUIPO ENEMIGO}
  BaseE := TBaseEnemiga.Create(Self);
  BaseE.Parent := Self;
  BaseE.Left := 650;
  BaseE.Top := 500;

  SolEne := TSoldadoEnemy.Create(Self);
  SolEne.Parent := Self;
  SolEne.Left := 650;
  SolEne.Top := 475;


  BomEne := TBomberEnemigo.Create(Self);
  BomEne.Parent := Self;
  BomEne.Left := 665;
  BomEne.Top := 475;


  SpyEne := TSpyEnemigo.Create(Self);
  SpyEne.Parent := Self;
  SpyEne.Left := 680;
  SpyEne.Top := 475;



  RefE := TRefugioEnemigo.Create(Self);
  RefE.Parent := Self;
  RefE.Left := 185;
  RefE.Top := 450;


  Mad1 := TMaterial.Create(Self);;
  Mad1.Parent := Self;
  Mad1.Name := 'Madera1';
  Mad1.Left := 740;
  Mad1.Top := 110;


  Mad2 := TMaterial.Create(Self);;
  Mad2.Parent := Self;
  Mad2.Name := 'Madera2';
  Mad2.Left := 100;
  Mad2.Top := 270;


  Met1 := TMaterial.Create(Self);;
  Met1.Parent := Self;
  Met1.Name := 'Metal1';
  Met1.Left := 730;
  Met1.Top := 310;


  Met2 := TMaterial.Create(Self);;
  Met2.Parent := Self;
  Met2.Name := 'Metal2';
  Met2.Left := 65;
  Met2.Top := 430;


  Pie1 := TMaterial.Create(Self);;
  Pie1.Parent := Self;
  Pie1.Name := 'Piedra1';
  Pie1.Left := 460;
  Pie1.Top := 55;


  Pie2 := TMaterial.Create(Self);;
  Pie2.Parent := Self;
  Pie2.Name := 'Piedra2';
  Pie2.Left := 335;
  Pie2.Top  := 415;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Soldado.Atacar('Base enemiga','Madera');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 Soldado.IrMaterial('Madera1');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 BloodSol.MaxValue := Soldado.Resistencia;
 BloodSol.Progress := Soldado.Resistencia;
 BloodBom.MaxValue := Bom.Resistencia;
 BloodBom.Progress := Bom.Resistencia;
 BloodEsp.MaxValue := Spy.Resistencia;
 BloodEsp.Progress := Spy.Resistencia;
 BloodBase.MaxValue := Base.Resistencia;
 BloodBase.Progress := Base.Resistencia;
 BloodREF.MaxValue := 40;
 BloodRef.Progress := Ref.Resistencia;

 BloodSolE.MaxValue := SolEne.Resistencia;
 BloodSolE.Progress := SolEne.Resistencia;
 BloodBomE.MaxValue := BomEne.Resistencia;
 BloodBomE.Progress := BomEne.Resistencia;
 BloodEspE.MaxValue := SpyEne.Resistencia;
 BloodEspE.Progress := SpyEne.Resistencia;
 BloodBaseE.MaxValue := BaseE.Resistencia;
 BloodBaseE.Progress := BaseE.Resistencia;
 BloodRefE.MaxValue  := 40;
 BloodRefE.Progress := RefE.Resistencia;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 BloodSol.Progress := Soldado.Resistencia;
 BloodBom.Progress := Bom.Resistencia;
 BloodEsp.Progress := Spy.Resistencia;
 BloodBase.Progress := Base.Resistencia;
 BloodRef.Progress  := Ref.Resistencia;

 BloodSolE.Progress := SolEne.Resistencia;
 BloodBomE.Progress := BomEne.Resistencia;
 BloodEspE.Progress := SpyEne.Resistencia;
 BloodBaseE.Progress := BaseE.Resistencia;
 BloodRefE.Progress  := RefE.Resistencia;

 Label17.Caption := IntToStr(Base.MaderaAlmacenada);
 Label18.Caption := IntToStr(Base.MetalAlmacenado);
 Label19.Caption := IntToStr(Base.PiedraAlmacenada);
 Label20.Caption := IntToStr(BaseE.MaderaAlmacenada);
 Label21.Caption := IntToStr(BaseE.MetalAlmacenado);
 Label22.Caption := IntToStr(BaseE.PiedraAlmacenada);

 Label31.Caption := INtToStr(Ref.MaderaAlmacenada);
 Label32.Caption := INtToStr(Ref.MetalAlmacenado);
 Label33.Caption := INtToStr(Ref.PiedraAlmacenada);
 Label34.Caption := IntToStr(RefE.MaderaAlmacenada);
 Label35.Caption := INtToStr(RefE.MetalAlmacenado);
 Label36.Caption := INtToStr(RefE.PiedraAlmacenada);

 Label37.Caption := IntToStr(Soldado.Left);
 Label38.Caption := IntToStr(Soldado.Top);
 Label39.Caption := IntToStr(Bom.Left);
 Label40.Caption := IntToStr(Bom.Top);
 Label41.Caption := IntToStr(Spy.Left);
 Label42.Caption := IntToStr(Spy.Top);

 Label43.Caption := IntToStr(SolEne.Left);
 Label44.Caption := IntToStr(SolEne.Top);
 Label45.Caption := IntToStr(BomEne.Left);
 Label46.Caption := IntToStr(BomEne.Top);
 Label47.Caption := IntToStr(SpyEne.Left);
 Label48.Caption := IntToStr(SpyEne.Top);

end;


procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Begin
  KeyPreview := True;
  if (shift = ([]))  then if  KEY = VK_NUMPAD1    then  Soldado.IrMaterial('Madera1');
  if (shift = ([]))  then if  KEY = VK_NUMPAD2    then  Soldado.IrMaterial('Madera2');
  if (shift = ([]))  then if  KEY = VK_NUMPAD4    then  Soldado.IrMaterial('Piedra1');
  if (shift = ([]))  then if  KEY = VK_NUMPAD5    then  Soldado.IrMaterial('Piedra2');
  if (shift = ([]))  then if  KEY = VK_NUMPAD7    then  Soldado.IrMaterial('Metal1');
  if (shift = ([]))  then if  KEY = VK_NUMPAD8    then  Soldado.IrMaterial('Metal2');
  if (shift = ([]))  then if  KEY = VK_NUMPAD0    then  Soldado.Refugiarse;
  if (shift = ([]))  then if  KEY = Ord('Z')      then  Soldado.Atacar('Soldado','Madera');
  if (shift = ([]))  then if  KEY = Ord('X')      then  Soldado.Atacar('Soldado','Piedra');
  if (shift = ([]))  then if  KEY = Ord('C')      then  Soldado.Atacar('Soldado','Metal');
  if (shift = ([]))  then if  KEY = Ord('A')      then  Soldado.Atacar('Bomber','Madera');
  if (shift = ([]))  then if  KEY = Ord('S')      then  Soldado.Atacar('Bomber','Piedra');
  if (shift = ([]))  then if  KEY = Ord('D')      then  Soldado.Atacar('Bomber','Metal');
  if (shift = ([]))  then if  KEY = Ord('Q')      then  Soldado.Atacar('Espia','Madera');
  if (shift = ([]))  then if  KEY = Ord('W')      then  Soldado.Atacar('Espia','Piedra');
  if (shift = ([]))  then if  KEY = Ord('E')      then  Soldado.Atacar('Espia','Metal');


end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (shift = ([ssCtrl]))  then if Key = VK_NUMPAD1 then Bom.IrMaterial('Madera1');
 if (shift = ([ssCtrl]))  then if Key = VK_NUMPAD2 then Bom.IrMaterial('Madera2');
 if (shift = ([ssCtrl]))  then if Key = VK_NUMPAD4 then Bom.IrMaterial('Piedra1');
 if (shift = ([ssCtrl]))  then if Key = VK_NUMPAD5 then Bom.IrMaterial('Piedra2');
 if (shift = ([ssCtrl]))  then if Key = VK_NUMPAD7 then Bom.IrMaterial('Metal1');
 if (shift = ([ssCtrl]))  then if Key = VK_NUMPAD8 then Bom.IrMaterial('Metal2');
 if (shift = ([ssCtrl]))  then if Key = VK_NUMPAD0 then Bom.Refugiarse;
 if (shift = ([ssCtrl]))  then if Key = Ord('Z')   then Bom.Atacar('Soldado','Madera');
 if (shift = ([ssCtrl]))  then if Key = Ord('X')   then Bom.Atacar('Soldado','Piedra');
 if (shift = ([ssCtrl]))  then if Key = Ord('C')   then Bom.Atacar('Soldado','Metal');
 if (shift = ([ssCtrl]))  then if Key = Ord('A')   then Bom.Atacar('Bomber','Madera');
 if (shift = ([ssCtrl]))  then if Key = Ord('S')   then Bom.Atacar('Bomber','Piedra');
 if (shift = ([ssCtrl]))  then if Key = Ord('D')   then Bom.Atacar('Bomber','Metal');
 if (shift = ([ssCtrl]))  then if Key = Ord('Q')   then Bom.Atacar('Espia','Madera');
 if (shift = ([ssCtrl]))  then if Key = Ord('W')   then Bom.Atacar('Espia','Piedra');
 if (shift = ([ssCtrl]))  then if Key = Ord('E')   then Bom.Atacar('Espia','Metal');

 if (shift = ([ssAlt]))  then if Key = VK_NUMPAD1 then Spy.IrMaterial('Madera1');
 if (shift = ([ssAlt]))  then if Key = VK_NUMPAD2 then Spy.IrMaterial('Madera2');
 if (shift = ([ssAlt]))  then if Key = VK_NUMPAD4 then Spy.IrMaterial('Piedra1');
 if (shift = ([ssAlt]))  then if Key = VK_NUMPAD5 then Spy.IrMaterial('Piedra2');
 if (shift = ([ssAlt]))  then if Key = VK_NUMPAD7 then Spy.IrMaterial('Metal1');
 if (shift = ([ssAlt]))  then if Key = VK_NUMPAD8 then Spy.IrMaterial('Metal2');
 if (shift = ([ssAlt]))  then if Key = VK_NUMPAD0 then Spy.Refugiarse;
 if (shift = ([ssAlt]))  then if Key = Ord('Z')   then Spy.Atacar('Soldado','Madera');
 if (shift = ([ssAlt]))  then if Key = Ord('X')   then Spy.Atacar('Soldado','Piedra');
 if (shift = ([ssAlt]))  then if Key = Ord('C')   then Spy.Atacar('Soldado','Metal');
 if (shift = ([ssAlt]))  then if Key = Ord('A')   then Spy.Atacar('Bomber','Madera');
 if (shift = ([ssAlt]))  then if Key = Ord('S')   then Spy.Atacar('Bomber','Piedra');
 if (shift = ([ssAlt]))  then if Key = Ord('D')   then Spy.Atacar('Bomber','Metal');
 if (shift = ([ssAlt]))  then if Key = Ord('Q')   then Spy.Atacar('Espia','Madera');
 if (shift = ([ssAlt]))  then if Key = Ord('W')   then Spy.Atacar('Espia','Piedra');
 if (shift = ([ssAlt]))  then if Key = Ord('E')   then Spy.Atacar('Espia','Metal');
end;

end.
