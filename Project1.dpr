program Project1;

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
  UReflection in 'UReflection.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTABLERO, TABLERO);
  Application.Run;
end.
