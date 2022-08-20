program Guns;

uses
  Forms,
  UTablero in 'UTablero.pas' {TABLERO},
  BaseEnemiga in '..\BaseEnemiga.pas',
  Soldado in '..\Soldado.pas',
  Material in '..\Material.pas',
  BaseControl in '..\BaseControl.pas',
  RefugioEnemigo in '..\RefugioEnemigo.pas',
  Refugio in '..\Refugio.pas',
  SoldadoEnemy in '..\SoldadoEnemy.pas',
  BomberEnemigo in '..\BomberEnemigo.pas',
  Bomber in '..\Bomber.pas',
  Spy in '..\Spy.pas',
  SpyEnemigo in '..\SpyEnemigo.pas',
  ReadFiles in 'ReadFiles.pas',
  UContextos in 'UContextos.pas',
  UEjecutaInstrucciones in 'UEjecutaInstrucciones.pas',
  UEngagement in 'UEngagement.pas',
  UReflection in 'UReflection.pas',
  UAtomos in 'UAtomos.pas' {Atomos},
  Trampa in '..\Trampa.pas',
  Mercaderes in '..\Mercaderes.pas',
  UCompras in 'UCompras.pas' {Compras},
  Robot in '..\Robot.pas',
  Guardian in '..\Guardian.pas',
  GuardianEnemigo in '..\GuardianEnemigo.pas',
  Bomba in '..\Bomba.pas',
  AntiBombas in '..\AntiBombas.pas',
  Power in '..\Power.pas',
  Tornado in '..\Tornado.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTABLERO, TABLERO);
  Application.CreateForm(TAtomos, Atomos);
  Application.CreateForm(TCompras, Compras);
  Application.Run;
end.
