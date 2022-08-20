unit UContextos;

interface
 procedure crea_atomos;
Type


  CONTEXTO_BAS_REF = record
    Resistencia      : integer;
    MaderaAlmacenada : integer;
    PiedraAlmacenada : integer;
    MetalAlmacenado  : integeR;
    LifeInRisk       : integer;
    SegInRisk        : integer;
    Nece_Madera      : integer;
    Nece_Piedra      : integer;
    Nece_Metal       : integer;
  end;


  CONTEXTO_SOLDADO = record
    Haciendo    : string;
    Victima     : string;
    Resistencia : integer;
    Amenazado   : string;
    P_Equipo    : integer;
    P_ToBomber  : integer;
    P_ToEsp     : integer;
    Odio_Ene    : integer;
    Od_ToSolEne : integer;
    Od_ToBomEne : integer;
    Od_ToEspEne : integer;
    SegInRisk   : integer;
    LifeInRisk  : integer;
  end;

  CONTEXTO_BOMBER = record
    Haciendo    : string;
    victima     : string;
    Resistencia : integer;
    Amenazado   : string;
    P_Equipo    : integer;
    P_ToSoldado : integer;
    P_ToEsp     : integer;
    Odio_Ene    : integer;
    Od_ToSolEne : integer;
    Od_ToBomEne : integer;
    Od_ToEspEne : integer;
    SegInRisk   : integer;
    LifeInRisk  : integer;
  end;

  CONTEXTO_ESPIA = record
    Haciendo    : string;
    victima     : string;
    Resistencia : integer;
    Amenazado   : string;
    P_Equipo    : integer;
    P_ToBomber  : integer;
    P_ToSoldado : integer;
    Odio_Ene    : integer;
    Od_ToSolEne : integer;
    Od_ToBomEne : integer;
    Od_ToEspEne : integer;
    SegInRisk   : integer;
    LifeInRisk  : integer;
  end;

  ATOMO = record
    No          : integer;
    Amenaza     : string[5];
    SR          : integer;
    OD          : integer;
    VR          : integer;
    Plantilla   : string;
  end;


Var
 ATOMOS : array[1..50] of ATOMO;
 ACCIONES_POSIBLES : Array[1..60,1..2] of string;
 Buen_Desem   : ATOMO;
 Estar_Cerca  : ATOMO;
 Atacando     : ATOMO;
 Estar_Ocupado: ATOMO;
 Refugiado    : ATOMO;
 CONTEXT_BASE : CONTEXTO_BAS_REF;
 CONTEXT_BASEE: CONTEXTO_BAS_REF;
 CONTEXT_REF  : CONTEXTO_BAS_REF;
 CONTEXT_REFE : CONTEXTO_BAS_REF;
 CONTEXT_SOL  : CONTEXTO_SOLDADO;
 CONTEXT_SOLE : CONTEXTO_SOLDADO;
 CONTEXT_BOM  : CONTEXTO_BOMBER;
 CONTEXT_BOME : CONTEXTO_BOMBER;
 CONTEXT_ESP  : CONTEXTO_ESPIA;
 CONTEXT_ESPE : CONTEXTO_ESPIA;


implementation

uses
  SysUtils, UEjecutaInstrucciones;

var
 cad        : string;
 p1,p2      : integer;
 quien      : string;
 a_quien    : string;
 Archivo    : TextFile;
 NoAtomos   : integer;
 Direct     : string;
 Instruccion: string;
 num_asoc   : integer;
 NoAccion   : integer;
 formados   : array[1..60] of string;


{================================================================ establece las plantillas}
procedure llena_plantillas;
begin
  with Buen_Desem do
   begin
     AmenAza := '2';  // 2 o '2' = no importa
     SR      := 2;
     OD      := 1;
     VR      := 2;
   end;
  with Estar_Cerca do
   begin
     AmenAza := '2';
     SR      := 1;
     OD      := 2;
     VR      := 2;
   end;
  with Atacando do
   begin
     AmenAza := '2';
     SR      := 0;
     OD      := 1;
     VR      := 2;
   end;
  with Estar_Ocupado do
   begin
     AmenAza := '2';
     SR      := 1;
     OD      := 2;
     VR      := 2;
   end;
   with Refugiado do
   begin
     AmenAza := '2';
     SR      := 0;
     OD      := 0;
     VR      := 2;
   end;
end;
{========================================================= EJECUTA ir_por_madera1}
procedure exe_IR_POR_MADERA1(cadena : string);
begin
  cad := cadena;
  p1 := pos('(',cad);
  p2 := pos(')',cad);
  quien := copy(cadena,p1 + 1,p2-p1-1);
  IR_POR_MADERA1(QUIEN);
end;
{========================================================= EJECUTA ir_por_madera2}
procedure exe_IR_POR_MADERA2(cadena : string);
begin
  cad := cadena;
  p1 := pos('(',cad);
  p2 := pos(')',cad);
  quien := copy(cadena,p1 + 1,p2-p1-1);
  IR_POR_MADERA2(QUIEN);
end;
{========================================================= EJECUTA ir_por_piedra1}
procedure exe_IR_POR_PIEDRA1(cadena : string);
begin
  cad := cadena;
  p1 := pos('(',cad);
  p2 := pos(')',cad);
  quien := copy(cadena,p1 + 1,p2-p1-1);
  IR_POR_PIEDRA1(QUIEN);
end;
{========================================================= EJECUTA ir_por_piedra2}
procedure exe_IR_POR_PIEDRA2(cadena : string);
begin
  cad := cadena;
  p1 := pos('(',cad);
  p2 := pos(')',cad);
  quien := copy(cadena,p1 + 1,p2-p1-1);
  IR_POR_PIEDRA2(QUIEN);
end;
{========================================================= EJECUTA ir_por_metal1}
procedure exe_IR_POR_METAL1(cadena : string);
begin
  cad := cadena;
  p1 := pos('(',cad);
  p2 := pos(')',cad);
  quien := copy(cadena,p1 + 1,p2-p1-1);
  IR_POR_METAL1(QUIEN);
end;
{========================================================= EJECUTA ir_por_metal2}
procedure exe_IR_POR_METAL2(cadena : string);
begin
  cad := cadena;
  p1 := pos('(',cad);
  p2 := pos(')',cad);
  quien := copy(cadena,p1 + 1,p2-p1-1);
  IR_POR_METAL2(QUIEN);
end;

{========================================================= EJECUTA atacar}
procedure exe_ATACAR_CON_MADERA(cadena : string);
begin
 cad := cadena;
 p1 := pos('(',cad);
 p2 := pos(',',cad);
 quien := Copy(cad,p1+1,p2-p1-1);
 cad := copy(cad,p2+1,length(cad)-1); // quita el parentesis final
 a_quien := cad;
 ATACAR_CON_MADERA(quien,a_quien);
end;

{========================================================= EJECUTA atacar}
procedure exe_ATACAR_CON_PIEDRA(cadena : string);
begin
 cad := cadena;
 p1 := pos('(',cad);
 p2 := pos(',',cad);
 quien := Copy(cad,p1+1,p2-p1-1);
 cad := copy(cad,p2+1,length(cad)-1); // quita el parentesis final
 a_quien := cad;
 ATACAR_CON_PIEDRA(quien,a_quien);
end;

{========================================================= EJECUTA atacar}
procedure exe_ATACAR_CON_METAL(cadena : string);
begin
 cad := cadena;
 p1 := pos('(',cad);
 p2 := pos(',',cad);
 quien := Copy(cad,p1+1,p2-p1-1);
 cad := copy(cad,p2+1,length(cad)-1); // quita el parentesis final
 a_quien := cad;
 ATACAR_CON_METAL(quien,a_quien);
end;

{========================================================= EJECUTA CONSTRUIR}
procedure exe_CONSTRUIR_CON_MADERA(cadena : string);
begin
 cad := cadena;
 p1 := pos('(',cad);
 p2 := pos(')',cad);
 quien := Copy(cad,p1+1,p2-p1-1);
 CONSTRUIR_CON_MADERA(quien);
end;

{========================================================= EJECUTA CONSTRUIR}
procedure exe_CONSTRUIR_CON_PIEDRA(cadena : string);
begin
 cad := cadena;
 p1 := pos('(',cad);
 p2 := pos(')',cad);
 quien := Copy(cad,p1+1,p2-p1-1);
 CONSTRUIR_CON_PIEDRA(quien);
end;

{========================================================= EJECUTA CONSTRUIR}
procedure exe_CONSTRUIR_CON_METAL(cadena : string);
begin
 cad := cadena;
 p1 := pos('(',cad);
 p2 := pos(')',cad);
 quien := Copy(cad,p1+1,p2-p1-1);
 CONSTRUIR_CON_METAL(quien);
end;

{========================================================= EJECUTA refugiarse}
procedure exe_REFUGIARSE(cadena : string);
begin
  cad := cadena;
  p1 := pos('(',cad);
  p2 := pos(')',cad);
  quien := copy(cadena,p1 + 1,p2-p1-1);
  REFUGIARSE(quien);
end;

{========================================================= CREANDO atomos}
procedure separa_numero_asociado(linea : string);
var
  num : string;
begin
  num := linea[3];
  num_asoc := strToInt(num);
  instruccion := copy(linea,5,length(linea)-4);
end;
{========================================================= AJECUTA LA ACCION CORRECTA}
procedure ejecutaAccCorrecta(linea : string);
begin
   if pos('IR_POR_MADERA1',instruccion)       > 0 then exe_IR_POR_MADERA1(instruccion);
   if pos('IR_POR_MADERA2',instruccion)       > 0 then exe_IR_POR_MADERA2(instruccion);
   if pos('IR_POR_PIEDRA1',instruccion)       > 0 then exe_IR_POR_PIEDRA1(instruccion);
   if pos('IR_POR_PIEDRA2',instruccion)       > 0 then exe_IR_POR_PIEDRA2(instruccion);
   if pos('IR_POR_METAL1' ,instruccion)       > 0 then exe_IR_POR_METAL1(instruccion);
   if pos('IR_POR_METAL2' ,instruccion)       > 0 then exe_IR_POR_METAL2(instruccion);
   if pos('ATACAR_CON_MADERA',instruccion)    > 0 then exe_ATACAR_CON_MADERA(instruccion);
   if pos('ATACAR_CON_PIEDRA',instruccion)    > 0 then exe_ATACAR_CON_PIEDRA(instruccion);
   if pos('ATACAR_CON_METAL',instruccion)     > 0 then exe_ATACAR_CON_METAL(instruccion);
   if pos('REFUGIARSE',instruccion)           > 0 then exe_REFUGIARSE(instruccion);
   if pos('CONSTRUIR_CON_MADERA',instruccion) > 0 then exe_CONSTRUIR_CON_MADERA(instruccion);
   if pos('CONSTRUIR_CON_PIEDRA',instruccion) > 0 then exe_CONSTRUIR_CON_PIEDRA(instruccion);
   if pos('CONSTRUIR_CON_METAL',instruccion)  > 0 then exe_CONSTRUIR_CON_METAL(instruccion);
end;

{========================================================= DEFINE LA PLANTILLA}
function plantilla(Ame : string; SR,OD,VR: integer):string;
begin
  if SR = 1 then plantilla                := 'Estar_Ocupado';
  if OD = 1 then plantilla                := 'Buen_Desem';
  if (SR = 0) and (OD = 1) then plantilla := 'Atacando';
  if (SR = 0) and (OD = 0) THEN plantilla := 'Refugiado'
end;

{========================================================= AJECUTA LA ACCION CORRECTA}
procedure LlenaAtomo(QUIEN : string);
begin
 if quien = 'SOLDADO' then
  begin
               ATOMOS[NoAtomos].No              := num_asoc;
               ATOMOS[NoAtomos].Amenaza         := Context_Sol.Amenazado;
               ATOMOS[NoAtomos].SR              := Context_Sol.SegInRisk;
               ATOMOS[NoAtomos].OD              := Context_Sol.Odio_Ene;
               ATOMOS[NoAtomos].VR              := Context_Sol.LifeInRisk;
               ATOMOS[NoAtomos].Plantilla       := plantilla(Context_Sol.Amenazado,Context_sol.SegInRisk,Context_sol.Odio_Ene,Context_sol.LifeInRisk)
  end;
          if quien = 'SOLDADO_ENEMIGO' then
            begin
               ATOMOS[NoAtomos].No              := num_asoc;
               ATOMOS[NoAtomos].Amenaza         := Context_SolE.Amenazado;
               ATOMOS[NoAtomos].SR              := Context_SolE.SegInRisk;
               ATOMOS[NoAtomos].OD              := Context_SolE.Odio_Ene;
               ATOMOS[NoAtomos].VR              := Context_SolE.LifeInRisk;
               ATOMOS[NoAtomos].Plantilla       := plantilla(Context_SolE.Amenazado,Context_solE.SegInRisk,Context_solE.Odio_Ene,Context_solE.LifeInRisk);
            end;
          if quien = 'BOMBER' then
            begin
               ATOMOS[NoAtomos].No              := num_asoc;
               ATOMOS[NoAtomos].Amenaza         := Context_Bom.Amenazado;
               ATOMOS[NoAtomos].SR              := Context_Bom.SegInRisk;
               ATOMOS[NoAtomos].OD              := Context_Bom.Odio_Ene;
               ATOMOS[NoAtomos].VR              := Context_Bom.LifeInRisk;
               ATOMOS[NoAtomos].Plantilla       := plantilla(Context_Bom.Amenazado,Context_Bom.SegInRisk,Context_Bom.Odio_Ene,Context_Bom.LifeInRisk);
            end;
          if quien = 'BOMBER_ENEMIGO' then
            begin
               ATOMOS[NoAtomos].No              := num_asoc;
               ATOMOS[NoAtomos].Amenaza         := Context_BomE.Amenazado;
               ATOMOS[NoAtomos].SR              := Context_BomE.SegInRisk;
               ATOMOS[NoAtomos].OD              := Context_BomE.Odio_Ene;
               ATOMOS[NoAtomos].VR              := Context_BomE.LifeInRisk;
               ATOMOS[NoAtomos].Plantilla       := plantilla(Context_BomE.Amenazado,Context_BomE.SegInRisk,Context_BomE.Odio_Ene,Context_BomE.LifeInRisk);
            end;
          if quien = 'ESPIA' then
            begin
               ATOMOS[NoAtomos].No              := num_asoc;
               ATOMOS[NoAtomos].Amenaza         := Context_Esp.Amenazado;
               ATOMOS[NoAtomos].SR              := Context_Esp.SegInRisk;
               ATOMOS[NoAtomos].OD              := Context_Esp.Odio_Ene;
               ATOMOS[NoAtomos].VR              := Context_Esp.LifeInRisk;
               ATOMOS[NoAtomos].Plantilla       := plantilla(Context_Esp.Amenazado,Context_Esp.SegInRisk,Context_Esp.Odio_Ene,Context_Esp.LifeInRisk);
            end;
          if quien = 'ESPIA_ENEMIGO' then
            begin
               ATOMOS[NoAtomos].No              := num_asoc;
               ATOMOS[NoAtomos].Amenaza         := Context_EspE.Amenazado;
               ATOMOS[NoAtomos].SR              := Context_EspE.SegInRisk;
               ATOMOS[NoAtomos].OD              := Context_EspE.Odio_Ene;
               ATOMOS[NoAtomos].VR              := Context_EspE.LifeInRisk;
               ATOMOS[NoAtomos].Plantilla       := plantilla(Context_EspE.Amenazado,Context_EspE.SegInRisk,Context_EspE.Odio_Ene,Context_EspE.LifeInRisk);
            end;
end;
{========================================================= borra atomos y Siguientes_Acciones}
procedure borraAtomosAcciones;
var
 i: integer;
begin
  for i := 1 to 50 do
    begin
      ATOMOS[i].No        := 0;
      ATOMOS[i].Amenaza   := '';
      ATOMOS[i].SR        := 0;
      ATOMOS[i].OD        := 0;
      ATOMOS[i].VR        := 0;
      ATOMOS[i].Plantilla := '';
    end;

  for i := 1 to 60 do
    begin
      ACCIONES_POSIBLES[i,1] := '';
      ACCIONES_POSIBLES[i,2] := '';
    end;
end;
{========================================================= quito átomos repetidos}
procedure actualizaAtomos;
var
 i,j,n,p,sr,od,vr,h         : integer;
 c,c2,ame,pl,acc,nc,enc     : string;
 existe                     : boolean;
begin
  i := 0;
  c := 'vacia';
  repeat
    i := i + 1;
    c2 := formados[i];
    if c2 <> '' then
      begin
        c := c2;
        p := pos('&',c);
        nc := copy(c,1,p-1);
        n := strToInt(nc);                   //numero (int)
        c := copy(c,p+1,length(c)-p);
        p := pos('&',c);
        ame := copy(c,1,p-1);                //amenaza
        c := copy(c,p+1,length(c)-p);
        p := pos('&',c);
        sr := StrToInt(copy(c,1,p-1));       //SR
        c := copy(c,p+1,length(c)-p);
        p := pos('&',c);
        od := StrToInt(copy(c,1,p-1));       //OD
        c := copy(c,p+1,length(c)-p);
        p := pos('&',c);
        vr := StrToInt(copy(c,1,p-1));       //VR
        c := copy(c,p+1,length(c)-p);
        p := pos('&',c);
        pl := copy(c,1,p-1);                //plantilla
        c := copy(c,p+1,length(c)-p);
        ATOMOS[i].No          := n;
        ATOMOS[i].Amenaza     := ame;
        ATOMOS[i].SR          := sr;
        ATOMOS[i].OD          := od;
        ATOMOS[i].VR          := vr;
        ATOMOS[i].Plantilla   := pl;
        j                     := 0;
        enc                   := 'vacia';
        existe                := false;

        repeat
          p := pos('&',c);
          if p > 0 then
            begin

              repeat
                j := j + 1;
                enc := ACCIONES_POSIBLES[j,2];
                if enc = '' then break;
              until enc = '';

              acc := copy(c,1,p-1);
              c := copy(c,p+1,length(c)-p);
              for h := 1 to j do
                begin
                  if acc = ACCIONES_POSIBLES[h,2] then existe := true;
                end;
              if existe = false then
                begin
                   ACCIONES_POSIBLES[j,1] := nc;
                   ACCIONES_POSIBLES[j,2] := acc;
                end;
            end;
        until p = 0;
      end;
  until c2 = '';
end;

{========================================================= quito átomos repetidos}
procedure filtro_atomos;
var
 nu,i,j,z      : integer;
 nuc           : string[10];
 cadena,c      : string;
 accion        : string;
 existe        : boolean;
begin
 nuc         := 'uno';
 instruccion := 'vacia';
 i           := 0;
 c           := 'vacia';


 while nuc <> '0' do
   begin
     i      := i + 1;
     nu     := ATOMOS[i].No;
     nuc    := intToStr(nu);
     if nuc = '0' then break;

     cadena := nuc + '&' + ATOMOS[i].Amenaza + '&' + IntToStr(ATOMOS[i].SR)+ '&' +
               IntToStr(ATOMOS[i].OD) + '&'+ IntToStr(ATOMOS[i].VR)+ '&'+ ATOMOS[i].Plantilla;
     j      := 0;

     repeat
        j := j + 1;
        accion := ACCIONES_POSIBLES[j,2];
        if ACCIONES_POSIBLES[j,1] = nuc then cadena := cadena + '&'+ accion;
     until accion = '';

     cadena   := cadena + '&';
     z        := 0;
     existe   := false;

     repeat
       z   := z + 1;
       c   := formados[z];
       if c = cadena then
         begin
            existe := true;
            break;
         end;
     until c = '';

     if existe = false then formados[z] := cadena;
   end;

 borraAtomosAcciones;
 actualizaAtomos;

end;

{========================================================= crea archivo de ATOMOS}
procedure ArchivoAtomos(nombre : string; cuantos : integer);
var
 i,j             : integer;
 cuentaAtomos  : integer;
 AtomosFile    : TextFile;
 nu            : string;
 accion        : string;
begin
 cuentaAtomos := 0;

 AssignFile(AtomosFile,Direct + '\DEF\' + nombre);
 rewrite(AtomosFile);

 For i := 1 To cuantos Do
   begin
     cuentaAtomos := cuentaAtomos + 1;
     writeln(AtomosFile,'*** ATOMO #' + IntToStr(cuentaAtomos) + ' ***');
     writeln(AtomosFile,'SR       : '+ intToStr(ATOMOS[i].SR));
     writeln(AtomosFile,'VR       : '+ intToStr(ATOMOS[i].VR));
     writeln(AtomosFile,'OD       : '+ intToStr(ATOMOS[i].OD));
     writeln(AtomosFile,'PLANTILLA: '+ ATOMOS[i].plantilla);
     writeln(AtomosFile,' -------------------------');
     writeln(AtomosFile,' --ACCIONES RELACIONADAS--');
     writeln(AtomosFile,' -------------------------');
     nu := IntToStr(ATOMOS[i].No);
     accion := 'vacia';
     j := 0;

     repeat
        j := j + 1;
        accion := ACCIONES_POSIBLES[j,2];
        if ACCIONES_POSIBLES[j,1] = nu then writeln(AtomosFile,accion);
     until accion = '';
     writeln(AtomosFile,'');
     writeln(AtomosFile,'');
   end;

 closefile(AtomosFile);
end;


{========================================================= CREANDO atomos}
procedure crea_atomos;
var
 linea          : string;
 i,nuAtomos,nu  : integer;
begin
 NoAtomos := 0;
 NoAccion := 0;
 Direct :=  GetCurrentDir;
 AssignFile(archivo, Direct + '\DEF\ESTRATEGIAS.txt');
 reset(archivo);

 for i := 1 to 60 do                         // vacia ACCIONES_POSIBLES
   begin
     ACCIONES_POSIBLES[i,1] := '';
     ACCIONES_POSIBLES[i,2] := '';
     formados[i] := '';
   end;


 While not EOF(archivo) do
   begin
    readln(archivo,linea);
    if length(linea)> 0 then
     begin
      if linea[1] = 'd' then // lee descripción y ejecuta la accion llenando los contextos
        begin
          separa_numero_asociado(linea);    {--> obtiene "num" e "instruccion"}
          EjecutaAccCorrecta(linea);        {--> obtiene "quien"}
          NoAtomos := NoAtomos + 1;
          LlenaAtomo(quien);
        end;

      if linea[1] = 'e' then  // carga las acciones posibles.
        begin
          NoAccion := NoAccion + 1;
          separa_numero_asociado(linea);
          ACCIONES_POSIBLES[NoAccion,1] := IntToStr(num_asoc);
          ACCIONES_POSIBLES[NoAccion,2] := instruccion;
        end;
      end;
   end;
 closefile(archivo);
 // crea el archivo de átomos
 nuAtomos := 0;
// nu       := 1;
 repeat
   nuAtomos := nuAtomos + 1;
   nu := ATOMOS[nuAtomos].No;
   if nu = 0 then
     begin
       nuAtomos := nuAtomos - 1;
       break;
     end;
 until nu = 0;

 ArchivoAtomos('ATOMOS.txt',nuAtomos);

 filtro_atomos;

 nuAtomos := 0;
// nu       := 1;
 repeat
   nuAtomos := nuAtomos + 1;
   nu := ATOMOS[nuAtomos].No;
   if nu = 0 then
     begin
       nuAtomos := nuAtomos - 1;
       break;
     end;
 until nu = 0;

 ArchivoAtomos('ATOMOSFINALES.txt',nuAtomos);

end;



end.
