unit UReflection;

interface
  var
  ESTADO_ACTUAL        : array[1..6,1..3] of string;
  PLAN_ESTRATEGIA      : array[1..3,1..3] of string;
  ACCIONES_CANDIDATAS  : array[1..100,1..3] of string;
  arch                 : TextFile;
  direct               : string;
  procedure REFLECTION;

implementation

uses UContextos, UEngagement, SysUtils;



{================================================================= almacena el estado actual}
procedure Edo_Actual;
begin
  ESTADO_ACTUAL[1,1] := 'SOLDADO';
  ESTADO_ACTUAL[2,1] := 'BOMBER';
  ESTADO_ACTUAL[3,1] := 'ESPIA';
  ESTADO_ACTUAL[1,2] := context_Sol.Haciendo;
  ESTADO_ACTUAL[2,2] := context_Bom.Haciendo;
  ESTADO_ACTUAL[3,2] := context_Esp.Haciendo;
  ESTADO_ACTUAL[1,3] := context_Sol.Victima;
  ESTADO_ACTUAL[2,3] := context_Bom.Victima;
  ESTADO_ACTUAL[3,3] := context_Esp.Victima;
  ESTADO_ACTUAL[4,1] := 'SOLDADO_ENEMIGO';
  ESTADO_ACTUAL[5,1] := 'BOMBER_ENEMIGO';
  ESTADO_ACTUAL[6,1] := 'ESPIA_ENEMIGO';
  ESTADO_ACTUAL[4,2] := context_SolE.Haciendo;
  ESTADO_ACTUAL[5,2] := context_BomE.Haciendo;
  ESTADO_ACTUAL[6,2] := context_EspE.Haciendo;
  ESTADO_ACTUAL[4,3] := context_SolE.Victima;
  ESTADO_ACTUAL[5,3] := context_BomE.Victima;
  ESTADO_ACTUAL[3,3] := context_EspE.Victima;

  writeln(arch,'--- SOLDADO ---');
  writeln(arch,'ACCION : '+ context_sol.Haciendo);
  writeln(arch,'VICTIMA: '+ context_sol.Victima);
  writeln(arch,'');
   writeln(arch,'--- BOMBARDERO ---');
  writeln(arch,'ACCION : '+ context_bom.Haciendo);
  writeln(arch,'VICTIMA: '+ context_bom.Victima);
  writeln(arch,'');
   writeln(arch,'--- ESPIA ---');
  writeln(arch,'ACCION : '+ context_esp.Haciendo);
  writeln(arch,'VICTIMA: '+ context_esp.Victima);
  writeln(arch,'');
   writeln(arch,'--- SOLDADO ENEMIGO ---');
  writeln(arch,'ACCION : '+ context_solE.Haciendo);
  writeln(arch,'VICTIMA: '+ context_solE.Victima);
  writeln(arch,'');
   writeln(arch,'--- BOMBARDERO ENEMIGO ---');
  writeln(arch,'ACCION : '+ context_bomE.Haciendo);
  writeln(arch,'VICTIMA: '+ context_bomE.Victima);
  writeln(arch,'');
   writeln(arch,'--- ESPIA ENEMIGO ---');
  writeln(arch,'ACCION : '+ context_EspE.Haciendo);
  writeln(arch,'VICTIMA: '+ context_espE.Victima);
  writeln(arch,'----------------------------------');
end;

{================================================================== prepara planeación}
procedure Inicia_Estrategia;
begin
  PLAN_ESTRATEGIA[1,1] := 'SOLDADO_ENEMIGO';  {soldado enemigo}
  PLAN_ESTRATEGIA[1,2] := '';
  PLAN_ESTRATEGIA[1,3] := '';
  PLAN_ESTRATEGIA[2,1] := 'BOMBER_ENEMIGO';  {bomber_enemigo}
  PLAN_ESTRATEGIA[2,2] := '';
  PLAN_ESTRATEGIA[2,3] := '';
  PLAN_ESTRATEGIA[3,1] := 'ESPIA_ENEMIGO';  {espia_enemigo}
  PLAN_ESTRATEGIA[3,2] := '';
  PLAN_ESTRATEGIA[3,3] := '';
end;

{=================================================================== filtro "ORDEN YA EXISTE"}
function ya_esta(who,accion,at_who : string): boolean;
var
 i             : integer;
 alma          : string;
 res           : boolean;
 quien,a_quien : string;
begin                                      {la accion entra con (x,y) o con (x)}
  res := false;
  {busca ir por madera}
  if pos('IR_POR_MADERA1',accion)> 0 then
    for i := 4 to 6 do
      begin
        alma   := ESTADO_ACTUAL[i,2];
        quien  := ESTADO_ACTUAL[i,1];
        if (pos('IR_POR_MADERA1',alma) > 0) and (quien = who) then res:= true;
      end;
  if pos('IR_POR_MADERA2',accion)> 0 then
    for i := 1 to 3 do
      begin
        alma := ESTADO_ACTUAL[i,2];
        quien  := ESTADO_ACTUAL[i,1];
        if (pos('IR_POR_MADERA2',alma) > 0) and (quien = who) then res:= true;
      end;
  {busca ir por piedra}
  if pos('IR_POR_PIEDRA1',accion)> 0 then
    for i := 1 to 3 do
      begin
        alma := ESTADO_ACTUAL[i,2];
        quien  := ESTADO_ACTUAL[i,1];
        if (pos('IR_POR_PIEDRA1',alma) > 0) and (quien = who) then res:= true;
      end;
  if pos('IR_POR_PIEDRA2',accion)> 0 then
    for i := 1 to 3 do
      begin
        alma := ESTADO_ACTUAL[i,2];
        quien  := ESTADO_ACTUAL[i,1];
        if (pos('IR_POR_PIEDRA2',alma) > 0) and (quien = who) then res:= true;
      end;
  {busca ir por metal}
  if pos('IR_POR_METAL1',accion)> 0 then
    for i := 1 to 3 do
      begin
        alma := ESTADO_ACTUAL[i,2];
        quien  := ESTADO_ACTUAL[i,1];
        if (pos('IR_POR_METAL1',alma) > 0) and (quien = who) then res:= true;
      end;
  if pos('IR_POR_METAL2',accion)> 0 then
    for i := 1 to 3 do
      begin
        alma := ESTADO_ACTUAL[i,2];
        quien  := ESTADO_ACTUAL[i,1];
        if (pos('IR_POR_METAL2',alma) > 0) and (quien = who) then res:= true;
      end;
  {busca cosntruir}
  if pos('CONSTRUIR_CON_MADERA',accion) > 0 then
    for i := 1 to 3 do
      begin
        alma    := ESTADO_ACTUAL[i,2];
        quien   := ESTADO_ACTUAL[i,1];
        a_quien := ESTADO_ACTUAL[i,3];
        if (pos('CONSTRUIR_CON_MADERA',alma) > 0) and (quien = who) and (a_quien = at_who) then
          res := true;
      end;
  if pos('CONSTRUIR_CON_PIEDRA',accion) > 0 then
    for i := 1 to 3 do
      begin
        alma    := ESTADO_ACTUAL[i,2];
        quien   := ESTADO_ACTUAL[i,1];
        a_quien := ESTADO_ACTUAL[i,3];
        if (pos('CONSTRUIR_CON_PIEDRA',alma) > 0) and (quien = who) and (a_quien = at_who) then
          res := true;
      end;
  if pos('CONSTRUIR_CON_METAL',accion) > 0 then
    for i := 1 to 3 do
      begin
        alma    := ESTADO_ACTUAL[i,2];
        quien   := ESTADO_ACTUAL[i,1];
        a_quien := ESTADO_ACTUAL[i,3];
        if (pos('CONSTRUIR_CON_METAL',alma) > 0) and (quien = who) and (a_quien = at_who) then
          res := true;
      end;
  {buscar atacar}
  if pos('ATACAR_CON_MADERA',accion) > 0 then
    for i := 1 to 3 do
      begin
        alma    := ESTADO_ACTUAL[i,2];
        quien   := ESTADO_ACTUAL[i,1];
        a_quien := ESTADO_ACTUAL[i,3];
        if (pos('ATACAR_CON_MADERA',alma) > 0) and (quien = who) and (a_quien = at_who) then
          res := true;
      end;
  if pos('ATACAR_CON_PIEDRA',accion) > 0 then
    for i := 1 to 3 do
      begin
        alma    := ESTADO_ACTUAL[i,2];
        quien   := ESTADO_ACTUAL[i,1];
        a_quien := ESTADO_ACTUAL[i,3];
        if (pos('ATACAR_CON_PIEDRA',alma) > 0) and (quien = who) and (a_quien = at_who) then
          res := true;
      end;
   if pos('ATACAR_CON_METAL',accion) > 0 then
    for i := 1 to 3 do
      begin
        alma    := ESTADO_ACTUAL[i,2];
        quien   := ESTADO_ACTUAL[i,1];
        a_quien := ESTADO_ACTUAL[i,3];
        if (pos('ATACAR_CON_METAL',alma) > 0) and (quien = who) and (a_quien = at_who) then
          res := true;
      end;
   {refugiarse}
   if pos('REFUGIARSE',accion)> 0 then
    for i := 1 to 3 do
      begin
        alma := ESTADO_ACTUAL[i,2];
        quien  := ESTADO_ACTUAL[i,1];
        if (pos('REFUGIARSE',alma) > 0) and (quien = who) then res:= true;
      end;

  ya_esta := res;
end;
{===================================================================== borra las que ya existan}
procedure filtro_ya_esta;
var
 i,j      : integer;
 existe : boolean;
 action,w,a : string;
begin
  writeln(arch,'');
  writeln(arch,'FILTRO en acción...');
  writeln(arch,'');
  {borra}
  for i := 1 to 100 do
    begin
      action := SIGUIENTES_ACCIONES[i,1];
      w      := SIGUIENTES_ACCIONES[i,2];
      a      := SIGUIENTES_ACCIONES[i,3];
      existe := ya_esta(w,action,a);
      if existe = true then
        begin
          SIGUIENTES_ACCIONES[i,1] := '';
          SIGUIENTES_ACCIONES[i,2] := '';
          SIGUIENTES_ACCIONES[i,3] := '';
        end;
    end;
  {ordena}
  j := 0;
  for i := 1 to 100 do
    begin
      action := SIGUIENTES_ACCIONES[i,1];
      if action <> '' then
        begin
          j := j + 1;
          ACCIONES_CANDIDATAS[j,1] := SIGUIENTES_ACCIONES[i,1];
          ACCIONES_CANDIDATAS[j,2] := SIGUIENTES_ACCIONES[i,2];
          ACCIONES_CANDIDATAS[j,3] := SIGUIENTES_ACCIONES[i,3];
        end;
    end;
  {borra siguientes_acciones}
  for i := 1 to 100 do
    begin
      SIGUIENTES_ACCIONES[i,1] := '';
      SIGUIENTES_ACCIONES[i,2] := '';
      SIGUIENTES_ACCIONES[i,3] := '';
    end;
  {carga}
  For i := 1 to 100 do
    begin
      SIGUIENTES_ACCIONES[i,1] := ACCIONES_CANDIDATAS[i,1];
      SIGUIENTES_ACCIONES[i,2] := ACCIONES_CANDIDATAS[i,2];
      SIGUIENTES_ACCIONES[i,3] := ACCIONES_CANDIDATAS[i,3];
    end;

  i := 0;
  action := 'vacia';
  repeat
    i := i + 1;
    action := SIGUIENTES_ACCIONES[i,1];
    if action <> '' then writeln(arch,action);
  until action = '';

end;
{====================================================================== carga una accion}
procedure carga_accion(quien,accion,a_quien: string);
begin

 if (accion = 'IR_POR_MADERA1(x)') then                                   {ir por madera 1}
   begin
     if quien = 'SOLDADO_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[1,2] := 'IR_POR_MADERA1(SOLDADO_ENEMIGO)';
         PLAN_ESTRATEGIA[1,3] := '';
       end;
     if quien = 'BOMBER_ENEMIGO'  then
       begin
         PLAN_ESTRATEGIA[2,2] := 'IR_POR_MADERA1(BOMBER_ENEMIGO)';
         PLAN_ESTRATEGIA[2,3] := '';
       end;
     if quien = 'ESPIA_ENEMIGO'   then
       begin
         PLAN_ESTRATEGIA[3,2] := 'IR_POR_MADERA1(ESPIA_ENEMIGO)';
         PLAN_ESTRATEGIA[3,3] := '';
       end;
   end;

 if (accion = 'IR_POR_MADERA2(x)') then                                   {ir por madera 2}
   begin
     if quien = 'SOLDADO_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[1,2] := 'IR_POR_MADERA2(SOLDADO_ENEMIGO)';
         PLAN_ESTRATEGIA[1,3] := '';
       end;
     if quien = 'BOMBER_ENEMIGO'  then
       begin
         PLAN_ESTRATEGIA[2,2] := 'IR_POR_MADERA2(BOMBER_ENEMIGO)';
         PLAN_ESTRATEGIA[2,3] := '';
       end;
     if quien = 'ESPIA_ENEMIGO'   then
       begin
         PLAN_ESTRATEGIA[3,2] := 'IR_POR_MADERA2(ESPIA_ENEMIGO)';
         PLAN_ESTRATEGIA[3,3] := '';
       end;
   end;

 if (accion = 'IR_POR_PIEDRA1(x)') then                                    {ir por piedra 1}
   begin
     if quien = 'SOLDADO_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[1,2] := 'IR_POR_PIEDRA1(SOLDADO_ENEMIGO)';
         PLAN_ESTRATEGIA[1,3] := '';
       end;
     if quien = 'BOMBER_ENEMIGO'  then
       begin
         PLAN_ESTRATEGIA[2,2] := 'IR_POR_PIEDRA1(BOMBER_ENEMIGO)';
         PLAN_ESTRATEGIA[2,3] := '';
       end;
     if quien = 'ESPIA_ENEMIGO'   then
       begin
         PLAN_ESTRATEGIA[3,2] := 'IR_POR_PIEDRA1(ESPIA_ENEMIGO)';
         PLAN_ESTRATEGIA[3,3] := '';
       end;
   end;

 if (accion = 'IR_POR_PIEDRA2(x)') then                                    {ir por piedra2}
   begin
     if quien = 'SOLDADO_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[1,2] := 'IR_POR_PIEDRA2(SOLDADO_ENEMIGO)';
         PLAN_ESTRATEGIA[1,3] := '';
       end;
     if quien = 'BOMBER_ENEMIGO'  then
       begin
         PLAN_ESTRATEGIA[2,2] := 'IR_POR_PIEDRA2(BOMBER_ENEMIGO)';
         PLAN_ESTRATEGIA[2,3] := '';
       end;
     if quien = 'ESPIA_ENEMIGO'   then
       begin
         PLAN_ESTRATEGIA[3,2] := 'IR_POR_PIEDRA2(ESPIA_ENEMIGO)';
         PLAN_ESTRATEGIA[3,3] := '';
       end;
   end;

  if (accion = 'IR_POR_METAL1(x)') then                                     {ir por metal 1}
   begin
     if quien = 'SOLDADO_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[1,2] := 'IR_POR_METAL1(SOLDADO_ENEMIGO)';
         PLAN_ESTRATEGIA[1,3] := '';
       end;
     if quien = 'BOMBER_ENEMIGO'  then
       begin
         PLAN_ESTRATEGIA[2,2] := 'IR_POR_METAL1(BOMBER_ENEMIGO)';
         PLAN_ESTRATEGIA[2,3] := '';
       end;
     if quien = 'ESPIA_ENEMIGO'   then
       begin
         PLAN_ESTRATEGIA[3,2] := 'IR_POR_METAL1(ESPIA_ENEMIGO)';
         PLAN_ESTRATEGIA[3,3] := '';
       end;
   end;

 if (accion = 'IR_POR_METAL2(x)') then                                     {ir por metal 2}
   begin
     if quien = 'SOLDADO_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[1,2] := 'IR_POR_METAL2(SOLDADO_ENEMIGO)';
         PLAN_ESTRATEGIA[1,3] := '';
       end;
     if quien = 'BOMBER_ENEMIGO'  then
       begin
         PLAN_ESTRATEGIA[2,2] := 'IR_POR_METAL2(BOMBER_ENEMIGO)';
         PLAN_ESTRATEGIA[2,3] := '';
       end;
     if quien = 'ESPIA_ENEMIGO'   then
       begin
         PLAN_ESTRATEGIA[3,2] := 'IR_POR_METAL2(ESPIA_ENEMIGO)';
         PLAN_ESTRATEGIA[3,3] := '';
       end;
   end;

 if accion = 'CONSTRUIR_CON_MADERA(x)' then                                {construir con madera}
   begin
     if quien = 'SOLDADO_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[1,2] := 'CONSTRUIR_CON_MADERA(SOLDADO_ENEMIGO)';
         PLAN_ESTRATEGIA[1,3] := '';
       end;
     if quien = 'BOMBER_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[2,2] := 'CONSTRUIR_CON_MADERA(BOMBER_ENEMIGO)';
         PLAN_ESTRATEGIA[2,3] := '';
       end;
     if quien = 'ESPIA_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[3,2] := 'CONSTRUIR_CON_MADERA(ESPIA_ENEMIGO)';
         PLAN_ESTRATEGIA[3,3] := '';
       end;
   end;

 if accion = 'CONSTRUIR_CON_PIEDRA(x)' then                                  {construir con piedra}
   begin
     if quien = 'SOLDADO_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[1,2] := 'CONSTRUIR_CON_PIEDRA(SOLDADO_ENEMIGO)';
         PLAN_ESTRATEGIA[1,3] := '';
       end;
     if quien = 'BOMBER_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[2,2] := 'CONSTRUIR_CON_PIEDRA(BOMBER_ENEMIGO)';
         PLAN_ESTRATEGIA[2,3] := '';
       end;
     if quien = 'ESPIA_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[3,2] := 'CONSTRUIR_CON_PIEDRA(ESPIA_ENEMIGO)';
         PLAN_ESTRATEGIA[3,3] := '';
       end;
   end;

 if accion = 'CONSTRUIR_CON_METAL(x)' then                                   {constuiri con metal}
   begin
     if quien = 'SOLDADO_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[1,2] := 'CONSTRUIR_CON_METAL(SOLDADO_ENEMIGO)';
         PLAN_ESTRATEGIA[1,3] := '';
       end;
     if quien = 'BOMBER_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[2,2] := 'CONSTRUIR_CON_METAL(BOMBER_ENEMIGO)';
         PLAN_ESTRATEGIA[2,3] := '';
       end;
     if quien = 'ESPIA_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[3,2] := 'CONSTRUIR_CON_METAL(ESPIA_ENEMIGO)';
         PLAN_ESTRATEGIA[3,3] := '';
       end;
   end;

 if accion = 'ATACAR_CON_MADERA(x,y)' then                                   {atacar con madera}
   begin
     if quien = 'SOLDADO_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[1,2] := 'ATACAR_CON_MADERA(SOLDADO_ENEMIGO,' + a_quien + ')';
         PLAN_ESTRATEGIA[1,3] := a_quien;
       end;
     if quien = 'BOMBER_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[2,2] := 'ATACAR_CON_MADERA(BOMBER_ENEMIGO,' + a_quien + ')';
         PLAN_ESTRATEGIA[2,3] := a_quien;
       end;
     if quien = 'ESPIA_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[3,2] := 'ATACAR_CON_MADERA(ESPIA_ENEMIGO,' + a_quien + ')';
         PLAN_ESTRATEGIA[3,3] := a_quien;
       end;
   end;

 if accion = 'ATACAR_CON_PIEDRA(x,y)' then                                    {atacar con piedra}
   begin
     if quien = 'SOLDADO_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[1,2] := 'ATACAR_CON_PIEDRA(SOLDADO_ENEMIGO,' + a_quien + ')';
         PLAN_ESTRATEGIA[1,3] := a_quien;
       end;
     if quien = 'BOMBER_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[2,2] := 'ATACAR_CON_PIEDRA(BOMBER_ENEMIGO,' + a_quien + ')';
         PLAN_ESTRATEGIA[2,3] := a_quien;
       end;
     if quien = 'ESPIA_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[3,2] := 'ATACAR_CON_PIEDRA(ESPIA_ENEMIGO,' + a_quien + ')';
         PLAN_ESTRATEGIA[3,3] := a_quien;
       end;
   end;

 if accion = 'ATACAR_CON_METAL(x,y)' then                                     {atacar con metal}
   begin
     if quien = 'SOLDADO_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[1,2] := 'ATACAR_CON_METAL(SOLDADO_ENEMIGO,' + a_quien + ')';
         PLAN_ESTRATEGIA[1,3] := a_quien;
       end;
     if quien = 'BOMBER_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[2,2] := 'ATACAR_CON_METAL(BOMBER_ENEMIGO,' + a_quien + ')';
         PLAN_ESTRATEGIA[2,3] := a_quien;
       end;
     if quien = 'ESPIA_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[3,2] := 'ATACAR_CON_METAL(ESPIA_ENEMIGO,' + a_quien + ')';
         PLAN_ESTRATEGIA[3,3] := a_quien;
       end;
   end;

 if accion = 'REFUGUARSE(x)' then                                     {atacar con metal}
   begin
     if quien = 'SOLDADO_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[1,2] := 'REFUGIARSE(SOLDADO_ENEMIGO)';
         PLAN_ESTRATEGIA[1,3] := a_quien;
       end;
     if quien = 'BOMBER_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[2,2] := 'REFUGIARSE(BOMBER_ENEMIGO)';
         PLAN_ESTRATEGIA[2,3] := a_quien;
       end;
     if quien = 'ESPIA_ENEMIGO' then
       begin
         PLAN_ESTRATEGIA[3,2] := 'REFUGIARSE(ESPIA_ENEMIGO)';
         PLAN_ESTRATEGIA[3,3] := a_quien;
       end;
   end;
end;

{==================================================================== determina el espacio libre}
function encuentra_vacio:string;
begin
  if PLAN_ESTRATEGIA[1,2] = '' then encuentra_vacio := 'SOLDADO_ENEMIGO';
  if PLAN_ESTRATEGIA[2,2] = '' then encuentra_vacio := 'BOMBER_ENEMIGO';
  if PLAN_ESTRATEGIA[3,2] = '' then encuentra_vacio := 'ESPIA_ENEMIGO';
end;

{====================================================================== revisa precondiciones}
procedure revisa_precondiciones(accion : string);
var
 vacio : string;
 op_mat  : integer;
begin
  randomize;
  writeln(arch,'');
  writeln(arch,'------  Revisando precondiciones...');

  repeat
    op_mat := random(2);
  until op_mat > 0;

  if pos('IR_POR',accion) > 0 then writeln(arch,'Sin precondiciones');

  {revisa precondiciones de atacar c on madera}
  if (pos('ATACAR_CON_MADERA',accion) > 0) and (context_baseE.MaderaAlmacenada < 1) then
  begin
    vacio := encuentra_vacio;
    writeln(arch,'Precondiciones: Madera_Almacenada > 0');
    writeln(arch,'                Sin cumplirse');

    if vacio = 'SOLDADO_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[1,2] := 'IR_POR_MADERA1(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[1,2] := 'IR_POR_MADERA2(x)';
       end;
    if vacio = 'BOMBER_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[2,2] := 'IR_POR_MADERA1(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[2,2] := 'IR_POR_MADERA2(x)';
       end;
    if vacio = 'ESPIA_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[3,2] := 'IR_POR_MADERA1(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[3,2] := 'IR_POR_MADERA2(x)';
       end;

    if op_mat = 1 then writeln(arch,'Acción insertada: IR_POR_MADERA1(x)');
    if op_mat = 2 then writeln(arch,'Acción insertada: IR_POR_MADERA2(x)');
    writeln(arch,'EJECUTOR: ' + vacio);
  end;
  {precondiocnes de atacar con piedra}
  if (pos('ATACAR_CON_PIEDRA',accion) > 0) and (context_baseE.PiedraAlmacenada < 2) then
  begin
    vacio := encuentra_vacio;
    writeln(arch,'Precondiciones: Piedra_Almacenada > 0');
    writeln(arch,'                Sin cumplirse');

    if vacio = 'SOLDADO_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[1,2] := 'IR_POR_PIEDRA1(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[1,2] := 'IR_POR_PIEDRA2(x)';
       end;
    if vacio = 'BOMBER_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[2,2] := 'IR_POR_PIEDRA1(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[2,2] := 'IR_POR_PIEDRA2(x)';
       end;
    if vacio = 'ESPIA_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[3,2] := 'IR_POR_PIEDRA1(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[3,2] := 'IR_POR_PIEDRA2(x)';
       end;
    if op_mat = 1 then writeln(arch,'Acción insertada: IR_POR_PIEDRA1(x)');
    if op_mat = 2 then writeln(arch,'Acción insertada: IR_POR_PIEDRA2(x)');
    writeln(arch,'EJECUTOR: ' + vacio);
  end;
  {precondiciones de atacar con metal}
  if (pos('ATACAR_CON_METAL',accion) > 0) and (context_baseE.MetalAlmacenado < 3) then
  begin
    vacio := encuentra_vacio;
    writeln(arch,'Precondiciones: Metal_Almacenado > 0');
    writeln(arch,'                Sin cumplirse');
    if vacio = 'SOLDADO_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[1,2] := 'IR_POR_METAL1(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[1,2] := 'IR_POR_METAL2(x)';
       end;
    if vacio = 'BOMBER_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[2,2] := 'IR_POR_METAL1(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[2,2] := 'IR_POR_METAL2(x)';
       end;
    if vacio = 'ESPIA_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[3,2] := 'IR_POR_METAL1(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[3,2] := 'IR_POR_METAL2(x)';
       end;
    if op_mat = 1 then writeln(arch,'Acción insertada: IR_POR_METAL1(x)');
    if op_mat = 2 then writeln(arch,'Acción insertada: IR_POR_METAL2(x)');
    writeln(arch,'EJECUTOR: ' + vacio);
  end;
  {revisa precondiciones de construir con madera}
  if (pos('CONSTRUIR_CON_MADERA',accion) > 0) and (context_baseE.MaderaAlmacenada = 0) then
  begin
    vacio := encuentra_vacio;
    writeln(arch,'Precondiciones: Madera_Almacenada > 0');
    writeln(arch,'                Sin cumplirse');
    if vacio = 'SOLDADO_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[1,2] := 'IR_POR_MADERA1(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[1,2] := 'IR_POR_MADERA2(x)';
       end;
    if vacio = 'BOMBER_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[2,2] := 'IR_POR_MADERA1(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[2,2] := 'IR_POR_MADERA2(x)';
       end;
    if vacio = 'ESPIA_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[3,2] := 'IR_POR_MADERA1(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[3,2] := 'IR_POR_MADERA2(x)';
       end;
    if op_mat = 1 then writeln(arch,'Acción insertada: IR_POR_MADERA1(x)');
    if op_mat = 2 then writeln(arch,'Acción insertada: IR_POR_MADERA2(x)');
    writeln(arch,'EJECUTOR: ' + vacio);
  end;
  {precondiocnes de atacar con piedra}
  if (pos('CONSTRUIR_CON_PIEDRA',accion) > 0) and (context_baseE.PiedraAlmacenada = 0) then
  begin
    vacio := encuentra_vacio;
    writeln(arch,'Precondiciones: Piedra_Almacenada > 0');
    writeln(arch,'                Sin cumplirse');
    if vacio = 'SOLDADO_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[1,2] := 'IR_POR_PIEDRA1(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[1,2] := 'IR_POR_PIEDRA2(x)';
       end;
    if vacio = 'BOMBER_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[2,2] := 'IR_POR_PIEDRA1(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[2,2] := 'IR_POR_PIEDRA2(x)';
       end;
    if vacio = 'ESPIA_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[3,2] := 'IR_POR_PIEDRA1(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[3,2] := 'IR_POR_PIEDRA2(x)';
       end;
    if op_mat = 1 then writeln(arch,'Acción insertada: IR_POR_PIEDRA1(x)');
    if op_mat = 2 then writeln(arch,'Acción insertada: IR_POR_PIEDRA2(x)');
    writeln(arch,'EJECUTOR: ' + vacio);
  end;
  {precondiciones de atacar con metal}
  if (pos('CONSTRUIR_CON_METAL',accion) > 0) and (context_baseE.MetalAlmacenado = 0) then
  begin
    vacio := encuentra_vacio;
    writeln(arch,'Precondiciones: Metal_Almacenado > 0');
    writeln(arch,'                Sin cumplirse');
    if vacio = 'SOLDADO_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[1,2] := 'IR_POR_METAL1(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[1,2] := 'IR_POR_METAL2(x)';
       end;
    if vacio = 'BOMBER_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[2,2] := 'IR_POR_METAL1(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[2,2] := 'IR_POR_METAL2(x)';
       end;
    if vacio = 'ESPIA_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[3,2] := 'IR_POR_METAL1(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[3,2] := 'IR_POR_METAL2(x)';
       end;
    if op_mat = 1 then writeln(arch,'Acción insertada: IR_POR_METAL1(x)');
    if op_mat = 2 then writeln(arch,'Acción insertada: IR_POR_METAL2(x)');
    writeln(arch,'EJECUTOR: ' + vacio);
  end;

  {refugiarse}
  if (pos('REFUGIARSE',accion) > 0) and (context_ref.Resistencia = 0) then
  begin
    randomize;
    repeat
      op_mat := random(3);
    until op_mat > 0;

    repeat
        vacio := encuentra_vacio;
    until vacio <> 'SOLDADO_ENEMIGO';

    writeln(arch,'Precondiciones: Resistencia_Refugio > 0');
    writeln(arch,'                Sin cumplirse');

    if vacio = 'BOMBER_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[2,2] := 'CONSTRUIR_CON_MADERA(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[2,2] := 'CONSTRUIR_CON_PIEDRA(x)';
         if op_mat = 3 then PLAN_ESTRATEGIA[2,2] := 'CONSTRUIR_CON_METAL(x)';
       end;
    if vacio = 'ESPIA_ENEMIGO' then
       begin
         if op_mat = 1 then PLAN_ESTRATEGIA[3,2] := 'CONSTRUIR_CON_MADERA(x)';
         if op_mat = 2 then PLAN_ESTRATEGIA[3,2] := 'CONSTRUIR_CON_PIEDRA(x)';
         if op_mat = 3 then PLAN_ESTRATEGIA[3,2] := 'CONSTRUIR_CON_METAL(x)'
       end;
    if op_mat = 1 then writeln(arch,'Acción insertada: CONSTRUIR_CON_MADERA(x)');
    if op_mat = 2 then writeln(arch,'Acción insertada: CONSTRUIR_CON_PIEDRA(x)');
    if op_mat = 3 then writeln(arch,'Acción insertada: CONSTRUIR_CON_METAL(x)');
    writeln(arch,'EJECUTOR: ' + vacio);

  end;
end;

////////////////////////////////////////////////////////////////////////////////
/////////////////////// REFLECTION /////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
procedure REFLECTION;
var
 ejecuta      : string;
 i,ordi,exe   : integer;
begin
  i :=  0;
  direct := GetCurrentDir;
  assignfile(arch,Direct + '\DEF\REFLECT.txt');
  rewrite(arch);

  Edo_Actual;
  Inicia_Estrategia;
  filtro_ya_esta;              {borra de las acc posibles las que esten ya en el estado actual}

  writeln(arch,'');
  writeln(arch,'.............');
  writeln(arch,'  REFLEXIÓN  ');
  writeln(arch,'.............');

  repeat
    i := i + 1;                 {i es el numero de acciones disponibles}
    ejecuta := SIGUIENTES_ACCIONES[i,1];
    if ejecuta = '' then i := i - 1;
  until ejecuta = '';

  repeat
  randomize;
  ordi := random(i);           {selecciona una orden al alzar de las disponibles}
  until ordi > 0;

  repeat                       {selecciona el ejecutor de la orden}
  randomize;
  exe := random(3);
  until exe > 0;
                                     {identifica al seleccionada y quienes faltan de asignación}
  if exe = 1 then ejecuta := 'SOLDADO_ENEMIGO';
  if exe = 2 then ejecuta := 'BOMBER_ENEMIGO';
  if exe = 3 then ejecuta := 'ESPIA_ENEMIGO';

  if ejecuta = 'SOLDADO_ENEMIGO' then
    begin
      PLAN_ESTRATEGIA[1,2] := SIGUIENTES_ACCIONES[ordi,1]; {carga la accion}
      PLAN_ESTRATEGIA[1,3] := SIGUIENTES_ACCIONES[ordi,3]; {carga a quien}
      writeln(arch,'SIGUIENTE ACCION: ' + SIGUIENTES_ACCIONES[ordi,1]);
      writeln(arch,'EJECUTOR        : ' + 'SOLDADO ENEMIGO');
      revisa_precondiciones(PLAN_ESTRATEGIA[1,2]);
    end;

  if ejecuta = 'BOMBER_ENEMIGO' then
    begin
      PLAN_ESTRATEGIA[2,2] := SIGUIENTES_ACCIONES[ordi,1]; {carga la accion}
      PLAN_ESTRATEGIA[2,3] := SIGUIENTES_ACCIONES[ordi,3]; {carga a quien}
      writeln(arch,'SIGUIENTE ACCION: ' + SIGUIENTES_ACCIONES[ordi,1]);
      writeln(arch,'EJECUTOR        : ' + 'BOMBER ENEMIGO');
      revisa_precondiciones(PLAN_ESTRATEGIA[2,2]);
    end;

  if ejecuta = 'ESPIA_ENEMIGO' then
    begin
      PLAN_ESTRATEGIA[3,2] := SIGUIENTES_ACCIONES[ordi,1]; {carga la accion}
      PLAN_ESTRATEGIA[3,3] := SIGUIENTES_ACCIONES[ordi,3]; {carga a quien}
      writeln(arch,'SIGUIENTE ACCION: ' + SIGUIENTES_ACCIONES[ordi,1]);
      writeln(arch,'EJECUTOR        : ' + 'ESPIA ENEMIGO');
      revisa_precondiciones(PLAN_ESTRATEGIA[3,2]);
    end;

  closefile(arch);
end;
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////






end.
