object Compras: TCompras
  Left = 565
  Top = 82
  BorderStyle = bsDialog
  Caption = 'Compras'
  ClientHeight = 239
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 55
    Width = 144
    Height = 13
    Caption = '2. Invisibilidad      (5,5,5)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 74
    Width = 145
    Height = 13
    Caption = '3. Sangre             (1,1,1)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 4
    Top = 97
    Width = 139
    Height = 13
    Caption = '4. Bomba            (5,5,5)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 8
    Top = 121
    Width = 138
    Height = 13
    Caption = '5. Antibombas     (5,5,5)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 8
    Top = 140
    Width = 150
    Height = 13
    Caption = '6. Puente         (30,30,30)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 4
    Top = 164
    Width = 149
    Height = 13
    Caption = '7. Guardian.     (20,20,20)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 48
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Label11'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 204
    Top = 28
    Width = 36
    Height = 13
    Caption = 'Madera'
  end
  object Label13: TLabel
    Left = 204
    Top = 50
    Width = 26
    Height = 13
    Caption = 'Metal'
  end
  object Label14: TLabel
    Left = 204
    Top = 72
    Width = 30
    Height = 13
    Caption = 'Piedra'
  end
  object Label15: TLabel
    Left = 256
    Top = 28
    Width = 38
    Height = 13
    Caption = 'Label15'
  end
  object Label16: TLabel
    Left = 256
    Top = 50
    Width = 38
    Height = 13
    Caption = 'Label16'
  end
  object Label17: TLabel
    Left = 256
    Top = 72
    Width = 38
    Height = 13
    Caption = 'Label17'
  end
  object Label18: TLabel
    Left = 208
    Top = 116
    Width = 34
    Height = 13
    Caption = 'Opci'#243'n'
  end
  object Label1: TLabel
    Left = 8
    Top = 36
    Width = 156
    Height = 13
    Caption = '1. Robot            (20,20,20)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label19: TLabel
    Left = 108
    Top = 24
    Width = 51
    Height = 13
    Caption = 'Ma  Pi  Me'
  end
  object Button1: TButton
    Left = 180
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Comprar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 268
    Top = 200
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object OpcionCompra: TSpinEdit
    Left = 256
    Top = 108
    Width = 41
    Height = 22
    MaxValue = 7
    MinValue = 0
    TabOrder = 2
    Value = 0
  end
end
