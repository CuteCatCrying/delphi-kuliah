object Form1: TForm1
  Left = 282
  Top = 198
  Width = 643
  Height = 402
  Caption = 'Konversi True Color ke Citra Biner'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 90
    Width = 305
    Height = 262
    Stretch = True
  end
  object Image2: TImage
    Left = 320
    Top = 91
    Width = 305
    Height = 262
    Stretch = True
  end
  object ButtonMuatCitra: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Muat citra'
    TabOrder = 0
    OnClick = ButtonMuatCitraClick
  end
  object ButtonRerata: TButton
    Left = 88
    Top = 8
    Width = 89
    Height = 25
    Caption = 'Keabuan rerata'
    TabOrder = 1
    OnClick = ButtonRerataClick
  end
  object ButtonNTSC: TButton
    Left = 184
    Top = 8
    Width = 89
    Height = 25
    Caption = 'Binary'
    TabOrder = 2
    OnClick = ButtonNTSCClick
  end
  object Button1: TButton
    Left = 8
    Top = 48
    Width = 73
    Height = 25
    Caption = 'EXIT'
    TabOrder = 3
    OnClick = Button1Click
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    InitialDir = '.'
    Left = 152
    Top = 48
  end
  object Timer1: TTimer
    Left = 648
    Top = 208
  end
end
