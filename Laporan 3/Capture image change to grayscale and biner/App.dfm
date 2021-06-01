object Form1: TForm1
  Left = 223
  Top = 117
  Width = 737
  Height = 308
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
    Left = 352
    Top = 48
    Width = 169
    Height = 177
    Stretch = True
  end
  object Image2: TImage
    Left = 536
    Top = 48
    Width = 169
    Height = 177
    Stretch = True
  end
  object Button1: TButton
    Left = 232
    Top = 16
    Width = 105
    Height = 25
    Caption = 'Choose Camera'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 232
    Top = 48
    Width = 105
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    OnChange = ComboBox1Change
  end
  object Button2: TButton
    Left = 232
    Top = 72
    Width = 105
    Height = 25
    Caption = 'Capture Image'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 232
    Top = 200
    Width = 105
    Height = 25
    Caption = 'Exit'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 352
    Top = 16
    Width = 169
    Height = 25
    Caption = 'Load Image'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 536
    Top = 16
    Width = 81
    Height = 25
    Caption = 'Grayscale'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 624
    Top = 16
    Width = 83
    Height = 25
    Caption = 'Binary'
    TabOrder = 6
    OnClick = Button6Click
  end
  object VideoWindow1: TVideoWindow
    Left = 8
    Top = 16
    Width = 216
    Height = 209
    FilterGraph = FilterGraph1
    VMROptions.Mode = vmrWindowed
    Color = clBlack
  end
  object Button7: TButton
    Left = 352
    Top = 232
    Width = 169
    Height = 25
    Caption = 'Save Image'
    TabOrder = 8
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 536
    Top = 232
    Width = 169
    Height = 25
    Caption = 'Save Image'
    TabOrder = 9
    OnClick = Button8Click
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 232
    Top = 136
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 264
    Top = 136
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = True
    LinearVolume = True
    Left = 296
    Top = 136
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = 'bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 232
    Top = 168
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 264
    Top = 168
  end
end
