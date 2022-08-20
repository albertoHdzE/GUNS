unit UCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Spin;

type
  TCompras = class(TForm)
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Button1: TButton;
    BitBtn1: TBitBtn;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    OpcionCompra: TSpinEdit;
    Label1: TLabel;
    Label19: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Compras: TCompras;

implementation

uses UTablero;

{$R *.dfm}

procedure TCompras.Button1Click(Sender: TObject);
begin

 if (pos('ENEMIGO',Label11.Caption) = 0) and
    (OpcionCompra.Value = 1)             and
    (UTablero.MaderaTotalEqu >= 20)      and
    (UTablero.MetalTotalEqu  >= 20)      and
    (UTablero.PiedraTotalEqu >= 20 )     then
      begin
         SendMessage(Tablero.Handle,WM_USER + 600,0,0); {compraron un ROBOT}
         close;
      end;





 if (pos('ENEMIGO',Label11.Caption) = 0) and
    (OpcionCompra.Value = 5)             and
    (UTablero.MaderaTotalEqu >= 5)       and
    (UTablero.MetalTotalEqu  >= 5)       and
    (UTablero.PiedraTotalEqu >= 5)       then
      begin
         SendMessage(Tablero.Handle,WM_USER + 265,0,0); {compraron una ANTI-BOMBAS}
         close;
      end;


 if (pos('ENEMIGO',Label11.Caption) = 0) and
    (pos('BOMBER', Label11.Caption) > 0) and
    (OpcionCompra.Value = 7)             and
    (UTablero.MaderaTotalEqu >= 1)       and
    (UTablero.MetalTotalEqu  >= 1)       and
    (UTablero.PiedraTotalEqu >= 1 )      then
      begin
         SendMessage(Tablero.Handle,WM_USER + 607,0,0); {bomber compró sangre}
         close;
      end;

 if (pos('ENEMIGO',Label11.Caption) = 0) and
    (pos('ESPIA', Label11.Caption) > 0) and
    (OpcionCompra.Value = 7)             and
    (UTablero.MaderaTotalEqu >= 1)       and
    (UTablero.MetalTotalEqu  >= 1)       and
    (UTablero.PiedraTotalEqu >= 1 )      then
      begin
         SendMessage(Tablero.Handle,WM_USER + 680,0,0); {espia compró sangre}
         close;
      end;



end;

procedure TCompras.FormShow(Sender: TObject);
begin
 OpcionCompra.Value := 0;
end;

end.
