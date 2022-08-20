unit UEjecutaInstrucciones;

interface
  procedure ATACAR_CON_MADERA(quien,a_quien: string);
  procedure ATACAR_CON_PIEDRA(quien,a_quien: string);
  procedure ATACAR_CON_METAL(quien,a_quien: string);
  procedure CONSTRUIR_CON_MADERA(quien : string);
  procedure CONSTRUIR_CON_PIEDRA(quien : string);
  procedure CONSTRUIR_CON_METAL(quien : string);
  procedure IR_POR_MADERA1(QuienEjecuta: String);
  procedure IR_POR_MADERA2(QuienEjecuta: String);
  procedure IR_POR_METAL1(QuienEjecuta: String);
  procedure IR_POR_METAL2(QuienEjecuta: String);
  procedure IR_POR_PIEDRA1(QuienEjecuta: String);
  procedure IR_POR_PIEDRA2(QuienEjecuta: String);
  procedure REFUGIARSE(quien : string);

implementation

uses UContextos, UTablero;
{================================================================== IR POR MADERA 1}
procedure IR_POR_MADERA1(QuienEjecuta: String);
begin
  if (QuienEjecuta = 'SOLDADO') then
    begin
       CONTEXT_SOL.Haciendo             := 'IR_POR_MADERA1';
       CONTEXT_SOL.SegInRisk            := 1;
       CONTEXT_SOL.Odio_Ene             := 0;
       CONTEXT_SOL.P_Equipo             := 3;
       CONTEXT_BOM.P_ToSoldado          := 3;
       CONTEXT_ESP.P_ToSoldado          := 3;
       CONTEXT_SOLE.Od_ToSolEne         := 3;
       CONTEXT_BOME.Od_ToSolEne         := 3;
       context_espe.Od_ToSolEne         := 3;
    end;

  if (QuienEjecuta = 'BOMBER') then
    begin
       CONTEXT_BOM.Haciendo             := 'IR_POR_MADERA1';
       CONTEXT_BOM.SegInRisk            := 1;
       CONTEXT_BOM.Odio_Ene             := 0;
       CONTEXT_BOM.P_Equipo             := 3;
       CONTEXT_SOL.P_ToBomber           := 3;
       CONTEXT_ESP.P_ToBomber           := 3;
       CONTEXT_SOLE.Od_ToBomEne         := 3;
       CONTEXT_BOME.Od_ToBomEne         := 3;
       context_espe.Od_ToBomEne         := 3;
    end;

  if (QuienEjecuta = 'ESPIA') then
    begin
       CONTEXT_ESP.Haciendo             := 'IR_POR_MADERA1';
       CONTEXT_ESP.SegInRisk            := 1;
       CONTEXT_ESP.Odio_Ene             := 0;
       CONTEXT_ESP.P_Equipo             := 3;
       CONTEXT_SOL.P_ToEsp              := 3;
       CONTEXT_BOM.P_ToEsp              := 3;
       CONTEXT_SOLE.Od_ToEspEne         := 3;
       CONTEXT_BOME.Od_ToEspEne         := 3;
       context_espe.Od_ToEspEne         := 3;
    end;

  if (QuienEjecuta = 'SOLDADO_ENEMIGO') then
    begin
       CONTEXT_SOLE.Haciendo             := 'IR_POR_MADERA1';
       CONTEXT_SOLE.SegInRisk            := 1;
       CONTEXT_SOLE.Odio_Ene             := 0;
       CONTEXT_SOLE.P_Equipo             := 3;
       CONTEXT_BOME.P_ToSoldado          := 3;
       CONTEXT_ESPE.P_ToSoldado          := 3;
       CONTEXT_SOL.Od_ToSolEne           := 3;
       CONTEXT_BOM.Od_ToSolEne           := 3;
       context_esp.Od_ToSolEne           := 3;
    end;

  if (QuienEjecuta = 'BOMBER_ENEMIGO') then
    begin
       CONTEXT_BOME.Haciendo           := 'IR_POR_MADERA1';
       CONTEXT_BOME.SegInRisk          := 1;
       CONTEXT_BOME.Odio_Ene           := 0;
       CONTEXT_BOME.P_Equipo           := 3;
       CONTEXT_SOLE.P_ToBomber         := 3;
       CONTEXT_ESPE.P_ToBomber         := 3;
       CONTEXT_SOL.Od_ToBomEne         := 3;
       CONTEXT_BOM.Od_ToBomEne         := 3;
       context_esp.Od_ToBomEne         := 3;
    end;

  if (QuienEjecuta = 'ESPIA_ENEMIGO') then
    begin
       CONTEXT_ESPE.Haciendo             := 'IR_POR_MADERA1';
       CONTEXT_ESPE.SegInRisk            := 1;
       CONTEXT_ESPE.Odio_Ene             := 0;
       CONTEXT_ESPE.P_Equipo             := 3;
       CONTEXT_SOLE.P_ToEsp              := 3;
       CONTEXT_BOME.P_ToEsp              := 3;
       CONTEXT_SOL.Od_ToEspEne           := 3;
       CONTEXT_BOM.Od_ToEspEne           := 3;
       context_esp.Od_ToEspEne           := 3;
    end;
end;

{================================================================== IR POR MADERA 2}
procedure IR_POR_MADERA2(QuienEjecuta: String);
begin
  if (QuienEjecuta = 'SOLDADO') then
    begin
       CONTEXT_SOL.Haciendo             := 'IR_POR_MADERA2';
       CONTEXT_SOL.SegInRisk            := 1;
       CONTEXT_SOL.Odio_Ene             := 0;
       CONTEXT_SOL.P_Equipo             := 6;
       CONTEXT_BOM.P_ToSoldado          := 6;
       CONTEXT_ESP.P_ToSoldado          := 6;
       CONTEXT_SOLE.Od_ToSolEne         := 6;
       CONTEXT_BOME.Od_ToSolEne         := 6;
       context_espe.Od_ToSolEne         := 6;
    end;

  if (QuienEjecuta = 'BOMBER') then
    begin
       CONTEXT_BOM.Haciendo             := 'IR_POR_MADERA2';
       CONTEXT_BOM.SegInRisk            := 1;
       CONTEXT_BOM.Odio_Ene             := 0;
       CONTEXT_BOM.P_Equipo             := 6;
       CONTEXT_SOL.P_ToBomber           := 6;
       CONTEXT_ESP.P_ToBomber           := 6;
       CONTEXT_SOLE.Od_ToBomEne         := 6;
       CONTEXT_BOME.Od_ToBomEne         := 6;
       context_espe.Od_ToBomEne         := 6;
    end;

  if (QuienEjecuta = 'ESPIA') then
    begin
       CONTEXT_ESP.Haciendo             := 'IR_POR_MADERA2';
       CONTEXT_ESP.SegInRisk            := 1;
       CONTEXT_ESP.Odio_Ene             := 0;
       CONTEXT_ESP.P_Equipo             := 6;
       CONTEXT_SOL.P_ToEsp              := 6;
       CONTEXT_BOM.P_ToEsp              := 6;
       CONTEXT_SOLE.Od_ToEspEne         := 6;
       CONTEXT_BOME.Od_ToEspEne         := 6;
       context_espe.Od_ToEspEne         := 6;
    end;

  if (QuienEjecuta = 'SOLDADO_ENEMIGO') then
    begin
       CONTEXT_SOLE.Haciendo             := 'IR_POR_MADERA2';
       CONTEXT_SOLE.SegInRisk            := 1;
       CONTEXT_SOLE.Odio_Ene             := 0;
       CONTEXT_SOLE.P_Equipo             := 6;
       CONTEXT_BOME.P_ToSoldado          := 6;
       CONTEXT_ESPE.P_ToSoldado          := 6;
       CONTEXT_SOL.Od_ToSolEne           := 6;
       CONTEXT_BOM.Od_ToSolEne           := 6;
       context_esp.Od_ToSolEne           := 6;
    end;

  if (QuienEjecuta = 'BOMBER_ENEMIGO') then
    begin
       CONTEXT_BOME.Haciendo             := 'IR_POR_MADERA2';
       CONTEXT_BOME.SegInRisk            := 1;
       CONTEXT_BOME.Odio_Ene             := 0;
       CONTEXT_BOME.P_Equipo             := 6;
       CONTEXT_SOLE.P_ToBomber           := 6;
       CONTEXT_ESPE.P_ToBomber           := 6;
       CONTEXT_SOL.Od_ToBomEne           := 6;
       CONTEXT_BOM.Od_ToBomEne           := 6;
       context_esp.Od_ToBomEne           := 6;
    end;

  if (QuienEjecuta = 'ESPIA_ENEMIGO') then
    begin
       CONTEXT_ESPE.Haciendo             := 'IR_POR_MADERA2';
       CONTEXT_ESPE.SegInRisk            := 1;
       CONTEXT_ESPE.Odio_Ene             := 0;
       CONTEXT_ESPE.P_Equipo             := 6;
       CONTEXT_SOLE.P_ToEsp              := 6;
       CONTEXT_BOME.P_ToEsp              := 6;
       CONTEXT_SOL.Od_ToEspEne           := 6;
       CONTEXT_BOM.Od_ToEspEne           := 6;
       context_esp.Od_ToEspEne           := 6;
    end;
end;

{================================================================== IR POR PIEDRA 1}
procedure IR_POR_PIEDRA1(QuienEjecuta: String);
begin
  if (QuienEjecuta = 'SOLDADO') then
    begin
       CONTEXT_SOL.Haciendo             := 'IR_POR_PIEDRA1';
       CONTEXT_SOL.SegInRisk            := 1;
       CONTEXT_SOL.Odio_Ene             := 0;
       CONTEXT_SOL.P_Equipo             := 5;
       CONTEXT_BOM.P_ToSoldado          := 5;
       CONTEXT_ESP.P_ToSoldado          := 5;
       CONTEXT_SOLE.Od_ToSolEne         := 5;
       CONTEXT_BOME.Od_ToSolEne         := 5;
       context_espe.Od_ToSolEne         := 5;
    end;

  if (QuienEjecuta = 'BOMBER') then
    begin
       CONTEXT_BOM.Haciendo             := 'IR_POR_PIEDRA1';
       CONTEXT_BOM.SegInRisk            := 1;
       CONTEXT_BOM.Odio_Ene             := 0;
       CONTEXT_BOM.P_Equipo             := 5;
       CONTEXT_SOL.P_ToBomber           := 5;
       CONTEXT_ESP.P_ToBomber           := 5;
       CONTEXT_SOLE.Od_ToBomEne         := 5;
       CONTEXT_BOME.Od_ToBomEne         := 5;
       context_espe.Od_ToBomEne         := 5;
    end;

  if (QuienEjecuta = 'ESPIA') then
    begin
       CONTEXT_ESP.Haciendo             := 'IR_POR_PIEDRA1';
       CONTEXT_ESP.SegInRisk            := 1;
       CONTEXT_ESP.Odio_Ene             := 0;
       CONTEXT_ESP.P_Equipo             := 5;
       CONTEXT_SOL.P_ToEsp              := 5;
       CONTEXT_BOM.P_ToEsp              := 5;
       CONTEXT_SOLE.Od_ToEspEne         := 5;
       CONTEXT_BOME.Od_ToEspEne         := 5;
       context_espe.Od_ToEspEne         := 5;
    end;

  if (QuienEjecuta = 'SOLDADO_ENEMIGO') then
    begin
       CONTEXT_SOLE.Haciendo             := 'IR_POR_PIEDRA1';
       CONTEXT_SOLE.SegInRisk            := 1;
       CONTEXT_SOLE.Odio_Ene             := 0;
       CONTEXT_SOLE.P_Equipo             := 5;
       CONTEXT_BOME.P_ToSoldado          := 5;
       CONTEXT_ESPE.P_ToSoldado          := 5;
       CONTEXT_SOL.Od_ToSolEne           := 5;
       CONTEXT_BOM.Od_ToSolEne           := 5;
       context_esp.Od_ToSolEne           := 5;
    end;

  if (QuienEjecuta = 'BOMBER_ENEMIGO') then
    begin
       CONTEXT_BOME.Haciendo             := 'IR_POR_PIEDRA1';
       CONTEXT_BOME.SegInRisk            := 1;
       CONTEXT_BOME.Odio_Ene             := 0;
       CONTEXT_BOME.P_Equipo             := 5;
       CONTEXT_SOLE.P_ToBomber           := 5;
       CONTEXT_ESPE.P_ToBomber           := 5;
       CONTEXT_SOL.Od_ToBomEne           := 5;
       CONTEXT_BOM.Od_ToBomEne           := 5;
       context_esp.Od_ToBomEne           := 5;
    end;

  if (QuienEjecuta = 'ESPIA_ENEMIGO') then
    begin
       CONTEXT_ESPE.Haciendo             := 'IR_POR_PIEDRA1';
       CONTEXT_ESPE.SegInRisk            := 1;
       CONTEXT_ESPE.Odio_Ene             := 0;
       CONTEXT_ESPE.P_Equipo             := 5;
       CONTEXT_SOLE.P_ToEsp              := 5;
       CONTEXT_BOME.P_ToEsp              := 5;
       CONTEXT_SOL.Od_ToEspEne           := 5;
       CONTEXT_BOM.Od_ToEspEne           := 5;
       context_esp.Od_ToEspEne           := 5;
    end;
end;


{================================================================== IR POR PIEDRA 2}
procedure IR_POR_PIEDRA2(QuienEjecuta: String);
begin
  if (QuienEjecuta = 'SOLDADO') then
    begin
       CONTEXT_SOL.Haciendo             := 'IR_POR_PIEDRA2';
       CONTEXT_SOL.SegInRisk            := 1;
       CONTEXT_SOL.Odio_Ene             := 0;
       CONTEXT_SOL.P_Equipo             := 2;
       CONTEXT_BOM.P_ToSoldado          := 2;
       CONTEXT_ESP.P_ToSoldado          := 2;
       CONTEXT_SOLE.Od_ToSolEne         := 2;
       CONTEXT_BOME.Od_ToSolEne         := 2;
       context_espe.Od_ToSolEne         := 2;
    end;

  if (QuienEjecuta = 'BOMBER') then
    begin
       CONTEXT_BOM.Haciendo             := 'IR_POR_PIEDRA2';
       CONTEXT_BOM.SegInRisk            := 1;
       CONTEXT_BOM.Odio_Ene             := 0;
       CONTEXT_BOM.P_Equipo             := 2;
       CONTEXT_SOL.P_ToBomber           := 2;
       CONTEXT_ESP.P_ToBomber           := 2;
       CONTEXT_SOLE.Od_ToBomEne         := 2;
       CONTEXT_BOME.Od_ToBomEne         := 2;
       context_espe.Od_ToBomEne         := 2;
    end;

  if (QuienEjecuta = 'ESPIA') then
    begin
       CONTEXT_ESP.Haciendo             := 'IR_POR_PIEDRA2';
       CONTEXT_ESP.SegInRisk            := 1;
       CONTEXT_ESP.Odio_Ene             := 0;
       CONTEXT_ESP.P_Equipo             := 2;
       CONTEXT_SOL.P_ToEsp              := 2;
       CONTEXT_BOM.P_ToEsp              := 2;
       CONTEXT_SOLE.Od_ToEspEne         := 2;
       CONTEXT_BOME.Od_ToEspEne         := 2;
       context_espe.Od_ToEspEne         := 2;
    end;

  if (QuienEjecuta = 'SOLDADO_ENEMIGO') then
    begin
       CONTEXT_SOLE.Haciendo             := 'IR_POR_PIEDRA2';
       CONTEXT_SOLE.SegInRisk            := 1;
       CONTEXT_SOLE.Odio_Ene             := 0;
       CONTEXT_SOLE.P_Equipo             := 2;
       CONTEXT_BOME.P_ToSoldado          := 2;
       CONTEXT_ESPE.P_ToSoldado          := 2;
       CONTEXT_SOL.Od_ToSolEne           := 2;
       CONTEXT_BOM.Od_ToSolEne           := 2;
       context_esp.Od_ToSolEne           := 2;
    end;

  if (QuienEjecuta = 'BOMBER_ENEMIGO') then
    begin
       CONTEXT_BOME.Haciendo             := 'IR_POR_PIEDRA2';
       CONTEXT_BOME.SegInRisk            := 1;
       CONTEXT_BOME.Odio_Ene             := 0;
       CONTEXT_BOME.P_Equipo             := 2;
       CONTEXT_SOLE.P_ToBomber           := 2;
       CONTEXT_ESPE.P_ToBomber           := 2;
       CONTEXT_SOL.Od_ToBomEne           := 2;
       CONTEXT_BOM.Od_ToBomEne           := 2;
       context_esp.Od_ToBomEne           := 2;
    end;

  if (QuienEjecuta = 'ESPIA_ENEMIGO') then
    begin
       CONTEXT_ESPE.Haciendo             := 'IR_POR_PIEDRA2';
       CONTEXT_ESPE.SegInRisk            := 1;
       CONTEXT_ESPE.Odio_Ene             := 0;
       CONTEXT_ESPE.P_Equipo             := 2;
       CONTEXT_SOLE.P_ToEsp              := 2;
       CONTEXT_BOME.P_ToEsp              := 2;
       CONTEXT_SOL.Od_ToEspEne           := 2;
       CONTEXT_BOM.Od_ToEspEne           := 2;
       context_esp.Od_ToEspEne           := 2;
    end;
end;

{================================================================== IR POR METAL 1}
procedure IR_POR_METAL1(QuienEjecuta: String);
begin
  if (QuienEjecuta = 'SOLDADO') then
    begin
       CONTEXT_SOL.Haciendo             := 'IR_POR_METAL1';
       CONTEXT_SOL.SegInRisk            := 1;
       CONTEXT_SOL.Odio_Ene             := 0;
       CONTEXT_SOL.P_Equipo             := 1;
       CONTEXT_BOM.P_ToSoldado          := 1;
       CONTEXT_ESP.P_ToSoldado          := 1;
       CONTEXT_SOLE.Od_ToSolEne         := 1;
       CONTEXT_BOME.Od_ToSolEne         := 1;
       context_espe.Od_ToSolEne         := 1;
    end;

  if (QuienEjecuta = 'BOMBER') then
    begin
       CONTEXT_BOM.Haciendo             := 'IR_POR_METAL1';
       CONTEXT_BOM.SegInRisk            := 1;
       CONTEXT_BOM.Odio_Ene             := 0;
       CONTEXT_BOM.P_Equipo             := 1;
       CONTEXT_SOL.P_ToBomber           := 1;
       CONTEXT_ESP.P_ToBomber           := 1;
       CONTEXT_SOLE.Od_ToBomEne         := 1;
       CONTEXT_BOME.Od_ToBomEne         := 1;
       context_espe.Od_ToBomEne         := 1;
    end;

  if (QuienEjecuta = 'ESPIA') then
    begin
       CONTEXT_ESP.Haciendo             := 'IR_POR_METAL1';
       CONTEXT_ESP.SegInRisk            := 1;
       CONTEXT_ESP.Odio_Ene             := 0;
       CONTEXT_ESP.P_Equipo             := 1;
       CONTEXT_SOL.P_ToEsp              := 1;
       CONTEXT_BOM.P_ToEsp              := 1;
       CONTEXT_SOLE.Od_ToEspEne         := 1;
       CONTEXT_BOME.Od_ToEspEne         := 1;
       context_espe.Od_ToEspEne         := 1;
    end;

  if (QuienEjecuta = 'SOLDADO_ENEMIGO') then
    begin
       CONTEXT_SOLE.Haciendo             := 'IR_POR_METAL1';
       CONTEXT_SOLE.SegInRisk            := 1;
       CONTEXT_SOLE.Odio_Ene             := 0;
       CONTEXT_SOLE.P_Equipo             := 1;
       CONTEXT_BOME.P_ToSoldado          := 1;
       CONTEXT_ESPE.P_ToSoldado          := 1;
       CONTEXT_SOL.Od_ToSolEne           := 1;
       CONTEXT_BOM.Od_ToSolEne           := 1;
       context_esp.Od_ToSolEne           := 1;
    end;

  if (QuienEjecuta = 'BOMBER_ENEMIGO') then
    begin
       CONTEXT_BOME.Haciendo             := 'IR_POR_METAL1';
       CONTEXT_BOME.SegInRisk            := 1;
       CONTEXT_BOME.Odio_Ene             := 0;
       CONTEXT_BOME.P_Equipo             := 1;
       CONTEXT_SOLE.P_ToBomber           := 1;
       CONTEXT_ESPE.P_ToBomber           := 1;
       CONTEXT_SOL.Od_ToBomEne           := 1;
       CONTEXT_BOM.Od_ToBomEne           := 1;
       context_esp.Od_ToBomEne           := 1;
    end;

  if (QuienEjecuta = 'ESPIA_ENEMIGO') then
    begin
       CONTEXT_ESPE.Haciendo             := 'IR_POR_METAL1';
       CONTEXT_ESPE.SegInRisk            := 1;
       CONTEXT_ESPE.Odio_Ene             := 0;
       CONTEXT_ESPE.P_Equipo             := 1;
       CONTEXT_SOLE.P_ToEsp              := 1;
       CONTEXT_BOME.P_ToEsp              := 1;
       CONTEXT_SOL.Od_ToEspEne           := 1;
       CONTEXT_BOM.Od_ToEspEne           := 1;
       context_esp.Od_ToEspEne           := 1;
    end;
end;


{================================================================== IR POR METAL 2}
procedure IR_POR_METAL2(QuienEjecuta: String);
begin
  if (QuienEjecuta = 'SOLDADO') then
    begin
       CONTEXT_SOL.Haciendo             := 'IR_POR_METAL2';
       CONTEXT_SOL.SegInRisk            := 1;
       CONTEXT_SOL.Odio_Ene             := 0;
       CONTEXT_SOL.P_Equipo             := 4;
       CONTEXT_BOM.P_ToSoldado          := 4;
       CONTEXT_ESP.P_ToSoldado          := 4;
       CONTEXT_SOLE.Od_ToSolEne         := 4;
       CONTEXT_BOME.Od_ToSolEne         := 4;
       context_espe.Od_ToSolEne         := 4;
    end;

  if (QuienEjecuta = 'BOMBER') then
    begin
       CONTEXT_BOM.Haciendo             := 'IR_POR_METAL2';
       CONTEXT_BOM.SegInRisk            := 1;
       CONTEXT_BOM.Odio_Ene             := 0;
       CONTEXT_BOM.P_Equipo             := 4;
       CONTEXT_SOL.P_ToBomber           := 4;
       CONTEXT_ESP.P_ToBomber           := 4;
       CONTEXT_SOLE.Od_ToBomEne         := 4;
       CONTEXT_BOME.Od_ToBomEne         := 4;
       context_espe.Od_ToBomEne         := 4;
    end;

  if (QuienEjecuta = 'ESPIA') then
    begin
       CONTEXT_ESP.Haciendo             := 'IR_POR_METAL2';
       CONTEXT_ESP.SegInRisk            := 1;
       CONTEXT_ESP.Odio_Ene             := 0;
       CONTEXT_ESP.P_Equipo             := 4;
       CONTEXT_SOL.P_ToEsp              := 4;
       CONTEXT_BOM.P_ToEsp              := 4;
       CONTEXT_SOLE.Od_ToEspEne         := 4;
       CONTEXT_BOME.Od_ToEspEne         := 4;
       context_espe.Od_ToEspEne         := 4;
    end;

  if (QuienEjecuta = 'SOLDADO_ENEMIGO') then
    begin
       CONTEXT_SOLE.Haciendo             := 'IR_POR_METAL2';
       CONTEXT_SOLE.SegInRisk            := 1;
       CONTEXT_SOLE.Odio_Ene             := 0;
       CONTEXT_SOLE.P_Equipo             := 4;
       CONTEXT_BOME.P_ToSoldado          := 4;
       CONTEXT_ESPE.P_ToSoldado          := 4;
       CONTEXT_SOL.Od_ToSolEne           := 4;
       CONTEXT_BOM.Od_ToSolEne           := 4;
       context_esp.Od_ToSolEne           := 4;
    end;

  if (QuienEjecuta = 'BOMBER_ENEMIGO') then
    begin
       CONTEXT_BOME.Haciendo             := 'IR_POR_METAL2';
       CONTEXT_BOME.SegInRisk            := 1;
       CONTEXT_BOME.Odio_Ene             := 0;
       CONTEXT_BOME.P_Equipo             := 4;
       CONTEXT_SOLE.P_ToBomber           := 4;
       CONTEXT_ESPE.P_ToBomber           := 4;
       CONTEXT_SOL.Od_ToBomEne           := 4;
       CONTEXT_BOM.Od_ToBomEne           := 4;
       context_esp.Od_ToBomEne           := 4;
    end;

  if (QuienEjecuta = 'ESPIA_ENEMIGO') then
    begin
       CONTEXT_ESPE.Haciendo             := 'IR_POR_METAL2';
       CONTEXT_ESPE.SegInRisk            := 1;
       CONTEXT_ESPE.Odio_Ene             := 0;
       CONTEXT_ESPE.P_Equipo             := 4;
       CONTEXT_SOLE.P_ToEsp              := 4;
       CONTEXT_BOME.P_ToEsp              := 4;
       CONTEXT_SOL.Od_ToEspEne           := 4;
       CONTEXT_BOM.Od_ToEspEne           := 4;
       context_esp.Od_ToEspEne           := 4;
    end;
end;

{====================================================================== refugiandose}
procedure REFUGIARSE(quien : string);
begin
  if quien = 'SOLDADO' then
    begin
     CONTEXT_SOL.SegInRisk := 0;
     CONTEXT_SOL.Odio_Ene  := 0;
    end;
  if quien = 'SOLDADO_ENEMIGO' then
    begin
      CONTEXT_SOLE.SegInRisk := 0;
      CONTEXT_SOLE.Odio_Ene  := 0;
    end;
  if quien = 'BOMBER'  then
    begin
      CONTEXT_BOM.SegInRisk := 0;
      CONTEXT_BOM.Odio_Ene  := 0;
    end;
  if quien = 'BOMBER_ENEMIGO'  then
    begin
      CONTEXT_BOME.SegInRisk := 0;
      CONTEXT_BOME.Odio_Ene  := 0;
    end;
  if quien = 'ESPIA'   then
    begin
      CONTEXT_ESP.SegInRisk := 0;
      CONTEXT_ESP.Odio_Ene  := 0;
    end;
  if quien = 'ESPIA_ENEMIGO'   then
    begin
      CONTEXT_ESPE.SegInRisk := 0;
      CONTEXT_ESPE.Odio_Ene  := 0;
    end;
end;

{=============================================================== actualiza el estado de amenazado}
procedure verifica_amenazas;
var
  victima: string;
begin
 CONTEXT_SOL.Amenazado := 'no';
 CONTEXT_SOLE.Amenazado := 'no';
 CONTEXT_BOM.Amenazado := 'no';
 CONTEXT_BOME.Amenazado := 'no';
 CONTEXT_ESP.Amenazado := 'no';
 CONTEXT_ESPE.Amenazado := 'no';
 {SOLDADO}
 if (CONTEXT_SOL.Haciendo = 'ATACANDO_CON_MADERA') or
    (CONTEXT_SOL.Haciendo = 'ATACANDO_CON_PIEDRA') or
    (CONTEXT_SOL.Haciendo = 'ATACANDO_CON_METAL')  then
      begin
        victima := CONTEXT_SOL.Victima;
        if VICTIMA = 'SOLDADO_ENEMIGO' then CONTEXT_SOLE.Amenazado := 'si';
        if VICTIMA = 'BOMBER_ENEMIGO'  then CONTEXT_BOME.Amenazado := 'si';
        if VICTIMA = 'ESPIA_ENEMIGO'   then CONTEXT_ESPE.Amenazado := 'si';
      end;
 {BOMBER}
 if (CONTEXT_BOM.Haciendo = 'ATACANDO_CON_MADERA') or
    (CONTEXT_BOM.Haciendo = 'ATACANDO_CON_PIEDRA') or
    (CONTEXT_BOM.Haciendo = 'ATACANDO_CON_METAL')  then
      begin
        victima := CONTEXT_BOM.Victima;
        if VICTIMA = 'SOLDADO_ENEMIGO' then CONTEXT_SOLE.Amenazado := 'si';
        if VICTIMA = 'BOMBER_ENEMIGO'  then CONTEXT_BOME.Amenazado := 'si';
        if VICTIMA = 'ESPIA_ENEMIGO'   then CONTEXT_ESPE.Amenazado := 'si';
      end;
 {ESPIA}
 if (CONTEXT_ESP.Haciendo = 'ATACANDO_CON_MADERA') or
    (CONTEXT_ESP.Haciendo = 'ATACANDO_CON_PIEDRA') or
    (CONTEXT_ESP.Haciendo = 'ATACANDO_CON_METAL')  then
      begin
        victima := CONTEXT_ESP.Victima;
        if VICTIMA = 'SOLDADO_ENEMIGO' then CONTEXT_SOLE.Amenazado := 'si';
        if VICTIMA = 'BOMBER_ENEMIGO'  then CONTEXT_BOME.Amenazado := 'si';
        if VICTIMA = 'ESPIA_ENEMIGO'   then CONTEXT_ESPE.Amenazado := 'si';
      end;
 {SOLADOD ENEMIGO}
 if (CONTEXT_SOLE.Haciendo = 'ATACANDO_CON_MADERA') or
    (CONTEXT_SOLE.Haciendo = 'ATACANDO_CON_PIEDRA') or
    (CONTEXT_SOLE.Haciendo = 'ATACANDO_CON_METAL')  then
      begin
        victima := CONTEXT_SOLE.Victima;
        if VICTIMA = 'SOLDADO' then CONTEXT_SOL.Amenazado := 'si';
        if VICTIMA = 'BOMBER'  then CONTEXT_BOM.Amenazado := 'si';
        if VICTIMA = 'ESPIA'   then CONTEXT_ESP.Amenazado := 'si';
      end;
 {BOMBER ENEMIGO}
 if (CONTEXT_BOME.Haciendo = 'ATACANDO_CON_MADERA') or
    (CONTEXT_BOME.Haciendo = 'ATACANDO_CON_PIEDRA') or
    (CONTEXT_BOME.Haciendo = 'ATACANDO_CON_METAL')  then
      begin
        victima := CONTEXT_BOME.Victima;
        if VICTIMA = 'SOLDADO' then CONTEXT_SOL.Amenazado := 'si';
        if VICTIMA = 'BOMBER'  then CONTEXT_BOM.Amenazado := 'si';
        if VICTIMA = 'ESPIA'   then CONTEXT_ESP.Amenazado := 'si';
      end;
 {ESPIA ENEMIGO}
 if (CONTEXT_ESPE.Haciendo = 'ATACANDO_CON_MADERA') or
    (CONTEXT_ESPE.Haciendo = 'ATACANDO_CON_PIEDRA') or
    (CONTEXT_ESPE.Haciendo = 'ATACANDO_CON_METAL')  then
      begin
        victima := CONTEXT_ESPE.Victima;
        if VICTIMA = 'SOLDADO' then CONTEXT_SOL.Amenazado := 'si';
        if VICTIMA = 'BOMBER'  then CONTEXT_BOM.Amenazado := 'si';
        if VICTIMA = 'ESPIA'   then CONTEXT_ESP.Amenazado := 'si';
      end;

end;

procedure establece_victima(quien,a_quien : string);
begin
 if quien = 'SOLDADO' then
   begin
     if  (a_quien = 'SOLDADO_ENEMIGO')   then  CONTEXT_SOL.Victima  := 'SOLDADO_ENEMIGO';
     if  (a_quien = 'BOMBER_ENEMIGO')    then  CONTEXT_SOL.Victima  := 'BOMBER_ENEMIGO';
     if  (a_quien = 'ESPIA_ENEMIGO')     then  CONTEXT_SOL.Victima  := 'ESPIA_ENEMIGO';
     if  (a_quien = 'BASE_ENEMIGO')      then  CONTEXT_SOL.Victima  := 'BASE_ENEMIGO';
     if  (a_quien = 'REFUGIO_ENEMIGO')   then  CONTEXT_SOL.Victima  := 'REFUGIO_ENEMIGO';
   end;
 if (quien = 'BOMBER') then
    begin
       if  (a_quien = 'SOLDADO_ENEMIGO') then  CONTEXT_BOM.Victima  := 'SOLDADO_ENEMIGO';
       if  (a_quien = 'BOMBER_ENEMIGO')  then  CONTEXT_BOM.Victima  := 'BOMBER_ENEMIGO';
       if  (a_quien = 'ESPIA_ENEMIGO')   then  CONTEXT_BOM.Victima  := 'ESPIA_ENEMIGO';
       if  (a_quien = 'BASE_ENEMIGO')    then  CONTEXT_BOM.Victima  := 'BASE_ENEMIGO';
       if  (a_quien = 'REFUGIO_ENEMIGO') then  CONTEXT_BOM.Victima  := 'REFUGIO_ENEMIGO';
    end;

 if (quien = 'ESPIA') then
    begin
       if  (a_quien = 'SOLDADO_ENEMIGO') then  CONTEXT_ESP.Victima  := 'SOLDADO_ENEMIGO';
       if  (a_quien = 'BOMBER_ENEMIGO')  then  CONTEXT_ESP.Victima  := 'BOMBER_ENEMIGO';
       if  (a_quien = 'ESPIA_ENEMIGO')   then  CONTEXT_ESP.Victima  := 'ESPIA_ENEMIGO';
       if  (a_quien = 'BASE_ENEMIGO')    then  CONTEXT_ESP.Victima  := 'BASE_ENEMIGO';
       if  (a_quien = 'REFUGIO_ENEMIGO') then  CONTEXT_ESP.Victima  := 'REFUGIO_ENEMIGO';
    end;

 if quien = 'SOLDADO_ENEMIGO' then
   begin
     if  (a_quien = 'SOLDADO_ENEMIGO')   then  CONTEXT_SOLE.Victima  := 'SOLDADO_ENEMIGO';
     if  (a_quien = 'BOMBER_ENEMIGO')    then  CONTEXT_SOLE.Victima  := 'BOMBER_ENEMIGO';
     if  (a_quien = 'ESPIA_ENEMIGO')     then  CONTEXT_SOLE.Victima  := 'ESPIA_ENEMIGO';
     if  (a_quien = 'BASE_ENEMIGO')      then  CONTEXT_SOLE.Victima  := 'BASE_ENEMIGO';
     if  (a_quien = 'REFUGIO_ENEMIGO')   then  CONTEXT_SOLE.Victima  := 'REFUGIO_ENEMIGO';
   end;
 if (quien = 'BOMBER_ENEMIGO') then
    begin
       if  (a_quien = 'SOLDADO_ENEMIGO') then  CONTEXT_BOME.Victima  := 'SOLDADO_ENEMIGO';
       if  (a_quien = 'BOMBER_ENEMIGO')  then  CONTEXT_BOME.Victima  := 'BOMBER_ENEMIGO';
       if  (a_quien = 'ESPIA_ENEMIGO')   then  CONTEXT_BOME.Victima  := 'ESPIA_ENEMIGO';
       if  (a_quien = 'BASE_ENEMIGO')    then  CONTEXT_BOME.Victima  := 'BASE_ENEMIGO';
       if  (a_quien = 'REFUGIO_ENEMIGO') then  CONTEXT_BOME.Victima  := 'REFUGIO_ENEMIGO';
    end;

 if (quien = 'ESPIA_ENEMIGO') then
    begin
       if  (a_quien = 'SOLDADO_ENEMIGO') then  CONTEXT_ESPE.Victima  := 'SOLDADO_ENEMIGO';
       if  (a_quien = 'BOMBER_ENEMIGO')  then  CONTEXT_ESPE.Victima  := 'BOMBER_ENEMIGO';
       if  (a_quien = 'ESPIA_ENEMIGO')   then  CONTEXT_ESPE.Victima  := 'ESPIA_ENEMIGO';
       if  (a_quien = 'BASE_ENEMIGO')    then  CONTEXT_ESPE.Victima  := 'BASE_ENEMIGO';
       if  (a_quien = 'REFUGIO_ENEMIGO') then  CONTEXT_ESPE.Victima  := 'REFUGIO_ENEMIGO';
    end;
end;

{====================================================================== ATACAR CON MADERA}
procedure ATACAR_CON_MADERA(quien,a_quien: string);
begin
  establece_victima(quien,a_quien);
   if (quien = 'SOLDADO') then
    begin
      CONTEXT_SOL.Haciendo    := 'ATACANDO_CON_MADERA';
      CONTEXT_SOL.SegInRisk   := 0; {}
      CONTEXT_SOL.Odio_Ene    := 1; {}
    end;

   if (quien = 'BOMBER') then
    begin
      CONTEXT_BOM.Haciendo    := 'ATACANDO_CON_MADERA';
      CONTEXT_BOM.SegInRisk   := 0; {}
      CONTEXT_BOM.Odio_Ene    := 1; {}
    end;

   if (quien = 'ESPIA') then
    begin
      CONTEXT_ESP.Haciendo    := 'ATACANDO_CON_MADERA';
      CONTEXT_ESP.SegInRisk   := 0; {}
      CONTEXT_ESP.Odio_Ene    := 1; {}
    end;

   if (quien = 'SOLDADO_ENEMIGO') then
    begin
      CONTEXT_SOLE.Haciendo    := 'ATACANDO_CON_MADERA';
      CONTEXT_SOLE.SegInRisk   := 0; {}
      CONTEXT_SOLE.Odio_Ene    := 1; {}
    end;

   if (quien = 'BOMBER_ENEMIGO') then
    begin
      CONTEXT_BOME.Haciendo    := 'ATACANDO_CON_MADERA';
      CONTEXT_BOME.SegInRisk   := 0; {}
      CONTEXT_BOME.Odio_Ene    := 1; {}
    end;

   if (quien = 'ESPIA_ENEMIGO') then
    begin
      CONTEXT_ESPE.Haciendo    := 'ATACANDO_CON_MADERA';
      CONTEXT_ESPE.SegInRisk   := 0; {}
      CONTEXT_ESPE.Odio_Ene    := 1; {}
    end;
   verifica_amenazas;
end;

{====================================================================== ATACAR CON PIEDRA}
procedure ATACAR_CON_PIEDRA(quien,a_quien: string);
begin
  establece_victima(quien,a_quien);
   if (quien = 'SOLDADO') then
    begin
      CONTEXT_SOL.Haciendo    := 'ATACANDO_CON_PIEDRA';
      CONTEXT_SOL.SegInRisk   := 0; {}
      CONTEXT_SOL.Odio_Ene    := 1; {}
    end;

   if (quien = 'BOMBER') then
    begin
      CONTEXT_BOM.Haciendo    := 'ATACANDO_CON_PIEDRA';
      CONTEXT_BOM.SegInRisk   := 0; {}
      CONTEXT_BOM.Odio_Ene    := 1; {}
    end;

   if (quien = 'ESPIA') then
    begin
      CONTEXT_ESP.Haciendo    := 'ATACANDO_CON_PIEDRA';
      CONTEXT_ESP.SegInRisk   := 0; {}
      CONTEXT_ESP.Odio_Ene    := 1; {}
    end;

   if (quien = 'SOLDADO_ENEMIGO') then
    begin
      CONTEXT_SOLE.Haciendo    := 'ATACANDO_CON_PIEDRA';
      CONTEXT_SOLE.SegInRisk   := 0; {}
      CONTEXT_SOLE.Odio_Ene    := 1; {}
    end;

   if (quien = 'BOMBER_ENEMIGO') then
    begin
      CONTEXT_BOME.Haciendo    := 'ATACANDO_CON_PIEDRA';
      CONTEXT_BOME.SegInRisk   := 0; {}
      CONTEXT_BOME.Odio_Ene    := 1; {}
    end;

   if (quien = 'ESPIA_ENEMIGO') then
    begin
      CONTEXT_ESPE.Haciendo    := 'ATACANDO_CON_PIEDRA';
      CONTEXT_ESPE.SegInRisk   := 0; {}
      CONTEXT_ESPE.Odio_Ene    := 1; {}
    end;
   verifica_amenazas;
end;

{====================================================================== ATACAR CON METAL}
procedure ATACAR_CON_METAL(quien,a_quien: string);
begin
  establece_victima(quien,a_quien);
   if (quien = 'SOLDADO') then
    begin
      CONTEXT_SOL.Haciendo    := 'ATACANDO_CON_METAL';
      CONTEXT_SOL.SegInRisk   := 0; {}
      CONTEXT_SOL.Odio_Ene    := 1; {}
    end;

   if (quien = 'BOMBER') then
    begin
      CONTEXT_BOM.Haciendo    := 'ATACANDO_CON_METAL';
      CONTEXT_BOM.SegInRisk   := 0; {}
      CONTEXT_BOM.Odio_Ene    := 1; {}
    end;

   if (quien = 'ESPIA') then
    begin
      CONTEXT_ESP.Haciendo    := 'ATACANDO_CON_METAL';
      CONTEXT_ESP.SegInRisk   := 0; {}
      CONTEXT_ESP.Odio_Ene    := 1; {}
    end;

   if (quien = 'SOLDADO_ENEMIGO') then
    begin
      CONTEXT_SOLE.Haciendo    := 'ATACANDO_CON_METAL';
      CONTEXT_SOLE.SegInRisk   := 0; {}
      CONTEXT_SOLE.Odio_Ene    := 1; {}
    end;

   if (quien = 'BOMBER_ENEMIGO') then
    begin
      CONTEXT_BOME.Haciendo    := 'ATACANDO_CON_METAL';
      CONTEXT_BOME.SegInRisk   := 0; {}
      CONTEXT_BOME.Odio_Ene    := 1; {}
    end;

   if (quien = 'ESPIA_ENEMIGO') then
    begin
      CONTEXT_ESPE.Haciendo    := 'ATACANDO_CON_METAL';
      CONTEXT_ESPE.SegInRisk   := 0; {}
      CONTEXT_ESPE.Odio_Ene    := 1; {}
    end;
   verifica_amenazas;
end;

{=================================================================== construir con madera}
procedure CONSTRUIR_CON_MADERA(quien: string);
begin
 if (quien = 'BOMBER') then
   begin
     CONTEXT_BOM.Haciendo     := 'CONSTRUYENDO_CON_MADERA';
     CONTEXT_BOM.SegInRisk    := 1;
     CONTEXT_BOM.Odio_Ene     := 1;
   end;

 if (quien = 'ESPIA') then
   begin
     CONTEXT_ESP.Haciendo     := 'CONSTRUYENDO_CON_MADERA';
     CONTEXT_ESP.SegInRisk    := 1;
     CONTEXT_ESP.Odio_Ene     := 1;
   end;

 if (quien = 'BOMBER_ENEMIGO') then
   begin
     CONTEXT_BOME.Haciendo     := 'CONSTRUYENDO_CON_MADERA';
     CONTEXT_BOME.SegInRisk    := 1;
     CONTEXT_BOME.Odio_Ene     := 1;
   end;

 if (quien = 'ESPIA_ENEMIGO') then
   begin
     CONTEXT_ESPE.Haciendo     := 'CONSTRUYENDO_CON_MADERA';
     CONTEXT_ESPE.SegInRisk    := 1;
     CONTEXT_ESPE.Odio_Ene     := 1;
   end;
end;

{=================================================================== construir con PIEDRA}
procedure CONSTRUIR_CON_PIEDRA(quien: string);
begin
 if (quien = 'BOMBER') then
   begin
     CONTEXT_BOM.Haciendo     := 'CONSTRUYENDO_CON_PIEDRA';
     CONTEXT_BOM.SegInRisk    := 1;
     CONTEXT_BOM.Odio_Ene     := 1;
   end;

 if (quien = 'ESPIA') then
   begin
     CONTEXT_ESP.Haciendo     := 'CONSTRUYENDO_CON_PIEDRA';
     CONTEXT_ESP.SegInRisk    := 1;
     CONTEXT_ESP.Odio_Ene     := 1;
   end;

 if (quien = 'BOMBER_ENEMIGO') then
   begin
     CONTEXT_BOME.Haciendo     := 'CONSTRUYENDO_CON_PIEDRA';
     CONTEXT_BOME.SegInRisk    := 1;
     CONTEXT_BOME.Odio_Ene     := 1;
   end;

 if (quien = 'ESPIA_ENEMIGO') then
   begin
     CONTEXT_ESPE.Haciendo     := 'CONSTRUYENDO_CON_PIEDRA';
     CONTEXT_ESPE.SegInRisk    := 1;
     CONTEXT_ESPE.Odio_Ene     := 1;
   end;
end;

{=================================================================== construir con PIEDRA}
procedure CONSTRUIR_CON_METAL(quien: string);
begin
 if (quien = 'BOMBER') then
   begin
     CONTEXT_BOM.Haciendo     := 'CONSTRUYENDO_CON_METAL';
     CONTEXT_BOM.SegInRisk    := 1;
     CONTEXT_BOM.Odio_Ene     := 1;
   end;

 if (quien = 'ESPIA') then
   begin
     CONTEXT_ESP.Haciendo     := 'CONSTRUYENDO_CON_METAL';
     CONTEXT_ESP.SegInRisk    := 1;
     CONTEXT_ESP.Odio_Ene     := 1;
   end;

 if (quien = 'BOMBER_ENEMIGO') then
   begin
     CONTEXT_BOME.Haciendo     := 'CONSTRUYENDO_CON_METAL';
     CONTEXT_BOME.SegInRisk    := 1;
     CONTEXT_BOME.Odio_Ene     := 1;
   end;

 if (quien = 'ESPIA_ENEMIGO') then
   begin
     CONTEXT_ESPE.Haciendo     := 'CONSTRUYENDO_CON_METAL';
     CONTEXT_ESPE.SegInRisk    := 1;
     CONTEXT_ESPE.Odio_Ene     := 1;
   end;
end;




end.
