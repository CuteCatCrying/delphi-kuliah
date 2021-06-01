object Form1: TForm1
  Left = 257
  Top = 148
  Width = 754
  Height = 528
  Caption = 'Form1'
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
    Left = 32
    Top = 88
    Width = 313
    Height = 281
    Stretch = True
  end
  object Image2: TImage
    Left = 376
    Top = 88
    Width = 297
    Height = 281
    Stretch = True
  end
  object Label1: TLabel
    Left = 672
    Top = 400
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label2: TLabel
    Left = 656
    Top = 376
    Width = 47
    Height = 13
    Caption = 'Threshold'
  end
  object TrackBar1: TTrackBar
    Left = 32
    Top = 384
    Width = 601
    Height = 41
    Max = 255
    TabOrder = 0
    OnChange = TrackBar1Change
  end
  object Button1: TButton
    Left = 48
    Top = 24
    Width = 89
    Height = 25
    Caption = 'Muat Citra'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 152
    Top = 24
    Width = 89
    Height = 25
    Caption = 'Keabuan Rerata'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 256
    Top = 24
    Width = 89
    Height = 25
    Caption = 'Binary'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 360
    Top = 24
    Width = 81
    Height = 25
    Caption = 'Save'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 456
    Top = 24
    Width = 89
    Height = 25
    Caption = 'Exit'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 560
    Top = 24
    Width = 89
    Height = 25
    Caption = 'Delete'
    TabOrder = 6
    OnClick = Button6Click
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 160
    Top = 152
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 112
    Top = 152
  end
  object SampleGrabber1: TSampleGrabber
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 216
    Top = 152
  end
end
