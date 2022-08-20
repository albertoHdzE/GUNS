unit UAtomos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TAtomos = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Memo3: TMemo;
    Memo4: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    Memo5: TMemo;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Atomos: TAtomos;
  direct: string;

implementation

uses UContextos, UTablero;

{$R *.dfm}

procedure TAtomos.FormShow(Sender: TObject);
var
 arch     : TextFile;
 linea    : string;
begin
 direct := GetCurrentDir;
 Memo1.Clear;
 Memo2.Clear;
 Memo3.Clear;
 Memo4.Clear;
 Memo5.Clear;

 AssignFile(arch,Direct + '\DEF\ATOMOS.txt');
 reset(arch);
 while not EOF(arch) do
   begin
     readln(arch,linea);
     Memo1.Lines.Add(linea);
   end;
 closeFile(arch);

 AssignFile(arch,Direct + '\DEF\ATOMOSFINALES.txt');
 reset(arch);
 while not EOF(arch) do
   begin
     readln(arch,linea);
     Memo2.Lines.Add(linea);
   end;
 closeFile(arch);

 AssignFile(arch,Direct + '\DEF\EST_ASOC.txt');
 reset(arch);
 while not EOF(arch) do
   begin
     readln(arch,linea);
     Memo3.Lines.Add(linea);
   end;
 closeFile(arch);

 AssignFile(arch,Direct + '\DEF\POS_ACC.txt');
 reset(arch);
 while not EOF(arch) do
   begin
     readln(arch,linea);
     Memo4.Lines.Add(linea);
   end;
 closeFile(arch);

 AssignFile(arch,Direct + '\DEF\REFLECT.txt');
 reset(arch);
 while not EOF(arch) do
   begin
     readln(arch,linea);
     Memo5.Lines.Add(linea);
   end;
 closeFile(arch);

end;


end.
