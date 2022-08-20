unit UEngagement;

interface
 procedure ENGAGEMENT;

type
 EA = record
   amenaza  : string[5];
   SR       : integer;
   OD       : integer;
   VR       : integer;
 end;

var
   SIGUIENTES_ACCIONES    : array[1..100,1..3] of string;
   ESTRUCTURA_ASOCIATIVA  : array[1..5] of EA;

implementation

uses UContextos, UTablero, SysUtils;

var
   quien,a_quien          : string;
   Arch                   : TextFile;
   Direct                 : string;

{================================================================= identifica la plantilla}
function adquiere_plantilla(SR,OD,VR: integer): string;
begin
  if SR = 1 then result                := 'Estar_Ocupado';
  if OD = 1 then result                := 'Buen_Desem';
  if (SR = 0) and (OD = 1) then result := 'Atacando';
  if (SR = 0) and (OD = 0) THEN result := 'Refugiado'
end;

{================================================================== carga una posile accion}
{ENTRA UNA ACCION Y LA CARGA EN SIGUIENTES_ACCIONES SI ES QUE NO EXISTE EN ELLA}
procedure carga_accion(accion : string);
var
 i            : integer;
 almacenada   : string;
 entrada      : string;
 existe       : boolean;
begin
  i := 0;
  entrada := accion;
  existe := false;
  repeat
    i := i + 1;
    almacenada := SIGUIENTES_ACCIONES[i,1];
    if entrada = almacenada then
      begin
        writeln(arch,'Cargada...');
        existe := true;
      end;
  until almacenada = '';

  if existe = false then
    begin
      SIGUIENTES_ACCIONES[i,1] := entrada;
      writeln(arch,entrada);
    end;
end;

{======================================================= identifica y carga las sig acciones}
procedure found_ChargeAction(search : string);
 var
  i,j : integer;
  Plantilla_Almacenada : string;
  Plantilla_Buscada    : string;
  numero_asociado      : integer;
  accion_almacenada    : string;
begin
   i := 0;
   Plantilla_Buscada := search;

   repeat
     i := i + 1;
     Plantilla_Almacenada := ATOMOS[i].Plantilla;

     if Plantilla_Almacenada = Plantilla_Buscada then
       begin
         numero_asociado := ATOMOS[i].No;
         j := 0;

         repeat
            j := j + 1;
            accion_almacenada := ACCIONES_POSIBLES[j,2];
            if ACCIONES_POSIBLES[j,1] = IntToStr(numero_Asociado) then carga_accion(accion_almacenada);
         Until accion_almacenada = '';

       end;
       
   Until Plantilla_Almacenada = '';

end;

{===================================================================== crea la estructura asociativa}
procedure crea_EstructuraAsociativa;
begin
  {soldado}
     ESTRUCTURA_ASOCIATIVA[1].amenaza := context_sol.Amenazado;
     ESTRUCTURA_ASOCIATIVA[1].SR      := context_sol.SegInRisk;
     ESTRUCTURA_ASOCIATIVA[1].OD      := context_sol.Odio_Ene;
     ESTRUCTURA_ASOCIATIVA[1].VR      := context_sol.LifeInRisk;
     {bomber}
     ESTRUCTURA_ASOCIATIVA[2].amenaza := context_bom.Amenazado;
     ESTRUCTURA_ASOCIATIVA[2].SR      := context_bom.SegInRisk;
     ESTRUCTURA_ASOCIATIVA[2].OD      := context_bom.Odio_Ene;
     ESTRUCTURA_ASOCIATIVA[2].VR      := context_bom.LifeInRisk;
     {espia}
     ESTRUCTURA_ASOCIATIVA[3].amenaza := context_esp.Amenazado;
     ESTRUCTURA_ASOCIATIVA[3].SR      := context_esp.SegInRisk;
     ESTRUCTURA_ASOCIATIVA[3].OD      := context_esp.Odio_Ene;
     ESTRUCTURA_ASOCIATIVA[3].VR      := context_esp.LifeInRisk;
     {base}
     ESTRUCTURA_ASOCIATIVA[4].SR      := context_base.SegInRisk;
     ESTRUCTURA_ASOCIATIVA[4].VR      := context_base.LifeInRisk;
     {refugio}
     ESTRUCTURA_ASOCIATIVA[5].SR      := context_Ref.SegInRisk;
     ESTRUCTURA_ASOCIATIVA[5].VR      := context_Ref.LifeInRisk;
end;


{===================================================================== separa quien y a_quien}
procedure SeparaQuienA_Quien(linea: string);
var
 cad     : string;
 p1,p2   : integer;

begin
  if (pos('IR_POR',linea) > 0) OR (pos('CONSTRUIR',linea) > 0) or (pos('REFUGIARSE',linea) > 0) then
       begin
          cad := linea;
          p1 := pos('(',cad);
          p2 := pos(')',cad);
          quien := copy(cad,p1 + 1,p2-p1-1);
       end;

   if (pos('ATACAR',linea) > 0) then
     begin
        cad := linea;
        p1 := pos('(',cad);
        p2 := pos(',',cad);
        quien := Copy(cad,p1+1,p2-p1-1);
        cad := copy(cad,p2+1,length(cad)-p2-1); // quita el parentesis final
        a_quien := cad;
     end;
end;

{====================================================================== CARGA LA GENERALIZACIÓN}
procedure SustituyeGeneralizacion(linea,quien,a_quien : string;i: integer);
begin
  if pos('IR_POR_MADERA1',linea) > 0 then
      begin
        SIGUIENTES_ACCIONES[i,1] := 'IR_POR_MADERA1(' + quien + ')';
        SIGUIENTES_ACCIONES[i,2] := quien;
      end;

  if pos('IR_POR_MADERA2',linea) > 0 then
      begin
        SIGUIENTES_ACCIONES[i,1] := 'IR_POR_MADERA2(' + quien + ')';
        SIGUIENTES_ACCIONES[i,2] := quien;
      end;

  if pos('IR_POR_PIEDRA1',linea) > 0 then
      begin
        SIGUIENTES_ACCIONES[i,1] := 'IR_POR_PIEDRA1(' + quien + ')';
        SIGUIENTES_ACCIONES[i,2] := quien;
      end;

  if pos('IR_POR_PIEDRA2',linea) > 0 then
      begin
        SIGUIENTES_ACCIONES[i,1] := 'IR_POR_PIEDRA2(' + quien + ')';
        SIGUIENTES_ACCIONES[i,2] := quien;
      end;

  if pos('IR_POR_METAL1',linea) > 0 then
      begin
        SIGUIENTES_ACCIONES[i,1] := 'IR_POR_METAL1(' + quien + ')';
        SIGUIENTES_ACCIONES[i,2] := quien;
      end;

  if pos('IR_POR_METAL2',linea) > 0 then
      begin
        SIGUIENTES_ACCIONES[i,1] := 'IR_POR_METAL2(' + quien + ')';
        SIGUIENTES_ACCIONES[i,2] := quien;
      end;

  if pos('CONSTUIR_CON_MADERA',linea) > 0 then
      begin
        SIGUIENTES_ACCIONES[i,1] := 'CONSTRUIR_CON_MADERA(' + quien + ')';
        SIGUIENTES_ACCIONES[i,2] := quien;
      end;

  if pos('CONSTUIR_CON_PIEDRA',linea) > 0 then
      begin
        SIGUIENTES_ACCIONES[i,1] := 'CONSTRUIR_CON_PIEDRA(' + quien + ')';
        SIGUIENTES_ACCIONES[i,2] := quien;
      end;

  if pos('CONSTUIR_CON_METAL',linea) > 0 then
      begin
        SIGUIENTES_ACCIONES[i,1] := 'CONSTRUIR_CON_METAL(' + quien + ')';
        SIGUIENTES_ACCIONES[i,2] := quien;
      end;

  if pos('REFUGIARSE',linea) > 0 then
      begin
        SIGUIENTES_ACCIONES[i,1] := 'REFUGIARSE(' + quien + ')';
        SIGUIENTES_ACCIONES[i,2] := quien;
      end;

  if pos('ATACAR_CON_MADERA',linea) > 0 then
      begin
        SIGUIENTES_ACCIONES[i,1] := 'ATACAR_CON_MADERA(' + quien + ',' + a_quien + ')';
        SIGUIENTES_ACCIONES[i,2] := quien;
        SIGUIENTES_ACCIONES[i,3] := a_quien;
      end;

  if pos('ATACAR_CON_PIEDRA',linea) > 0 then
      begin
        SIGUIENTES_ACCIONES[i,1] := 'ATACAR_CON_PIEDRA(' + quien + ',' + a_quien + ')';
        SIGUIENTES_ACCIONES[i,2] := quien;
        SIGUIENTES_ACCIONES[i,3] := a_quien;
      end;

  if pos('ATACAR_CON_METAL',linea) > 0 then
      begin
        SIGUIENTES_ACCIONES[i,1] := 'ATACAR_CON_METAL(' + quien + ',' + a_quien + ')';
        SIGUIENTES_ACCIONES[i,2] := quien;
        SIGUIENTES_ACCIONES[i,3] := a_quien;
      end;
end;

{===================================================================== generaliza}
procedure generaliza_acciones;
var
 enco           : string;
 i              : integer;
begin
  i       := 0;
  a_quien := '';
  quien   := '';
  Repeat
    i := i + 1;
    enco := SIGUIENTES_ACCIONES[i,1];
    SeparaQuienA_Quien(enco);
    SustituyeGeneralizacion(enco,quien,a_quien,i);
  Until enco = '';
end;


{================================================================== guarda estructura asociativa}
procedure SaveAsociativeEstructure;
var
 sr,od,vr : integer;
begin
  assignFile(arch,Direct + '\DEF\EST_ASOC.txt');
  rewrite(arch);
  writeln(arch,'***  DESCRIPCIÓN GENERAL DEL ESTADO GENERAL DEL JUEGO  ***');
  writeln(arch,'============================================================');
  writeln(arch,'-- ESTADO DEL SOLDADO --');
  sr := context_sol.SegInRisk;
  od := context_sol.Odio_Ene;
  vr := context_sol.LifeInRisk;
  writeln(arch,'SR       : ' + intToStr(sr));
  writeln(arch,'OD       : ' + intToStr(od));
  writeln(arch,'VR       : ' + intToStr(vr));
  writeln(arch,'PLANTILLA: ' + adquiere_plantilla(sr,od,vr));
  writeln(arch,'----------------------------------------------');

  writeln(arch,'-- ESTADO DEL BOMBARDERO --');
  sr := context_bom.SegInRisk;
  od := context_bom.Odio_Ene;
  vr := context_bom.LifeInRisk;
  writeln(arch,'SR       : ' + intToStr(sr));
  writeln(arch,'OD       : ' + intToStr(od));
  writeln(arch,'VR       : ' + intToStr(vr));
  writeln(arch,'PLANTILLA: ' + adquiere_plantilla(sr,od,vr));
  writeln(arch,'----------------------------------------------');

  writeln(arch,'-- ESTADO DEL ESPIA --');
  sr := context_esp.SegInRisk;
  od := context_esp.Odio_Ene;
  vr := context_esp.LifeInRisk;
  writeln(arch,'SR       : ' + intToStr(sr));
  writeln(arch,'OD       : ' + intToStr(od));
  writeln(arch,'VR       : ' + intToStr(vr));
  writeln(arch,'PLANTILLA: ' + adquiere_plantilla(sr,od,vr));
  writeln(arch,'----------------------------------------------');

  writeln(arch,'-- ESTADO DEL BASE --');
  sr := context_base.SegInRisk;
  vr := context_base.LifeInRisk;
  writeln(arch,'SR       : ' + intToStr(sr));
  writeln(arch,'VR       : ' + intToStr(vr));
  writeln(arch,'----------------------------------------------');

  writeln(arch,'-- ESTADO DEL REFUGIO --');
  sr := context_ref.SegInRisk;
  vr := context_ref.LifeInRisk;
  writeln(arch,'SR       : ' + intToStr(sr));
  writeln(arch,'VR       : ' + intToStr(vr));

  closefile(arch);
end;


////////////////////////////////////////////////////////////////////////////////
////////////////////   ENGAGEMENT   ////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure ENGAGEMENT;
var
 i: integer;
 acc_por_buscar : string;
begin
 for i := 1 to 100 do
   begin
     SIGUIENTES_ACCIONES[i,1] := '';
     SIGUIENTES_ACCIONES[i,2] := '';
     SIGUIENTES_ACCIONES[i,3] := '';
   end;

 Direct := GetCurrentDir;
 if (sol_cambio = true) or (bom_cambio = true) or (esp_cambio = true) then
   Crea_EstructuraAsociativa;
 SaveAsociativeEstructure;

 assignFile(arch,Direct + '\DEF\POS_ACC.txt');
 rewrite(arch);
   for i := 1 to 3 Do
     begin
       if i = 1 then writeln(arch,'De acuerdo al estado de SOLDADO...');
       if i = 2 then begin writeln(arch,'');writeln(arch,'De acuerdo al estado de BOMBARDERO...');end;
       if i = 3 then begin writeln(arch,'');writeln(arch,'De acuerdo al estado de ESPIA...')     ;end;
       if i = 4 then writeln(arch,'De acuerdo al estado de BASE...');
       if i = 5 then writeln(arch,'De acuerdo al estado de REFUGIO...');

       acc_por_buscar :=  adquiere_plantilla(Estructura_asociativa[i].SR,
                                             Estructura_asociativa[i].OD,
                                             Estructura_asociativa[i].VR);
       writeln(arch,'**********   ACCIONES RELACIONADAS CON ' + acc_por_buscar+ '**********');

       found_ChargeAction(acc_por_buscar);
     end;
 closefile(arch);
   generaliza_Acciones;
   sol_cambio := false;
   bom_cambio := false;
   esp_cambio := false;
end;
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

end.
