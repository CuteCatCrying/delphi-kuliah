object Form1: TForm1
  Left = 192
  Top = 124
  Width = 928
  Height = 480
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
    Left = 224
    Top = 8
    Width = 209
    Height = 217
    Stretch = True
  end
  object VideoWindow1: TVideoWindow
    Left = 8
    Top = 8
    Width = 201
    Height = 217
    FilterGraph = FilterGraph1
    VMROptions.Mode = vmrWindowed
    Color = clBlack
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 240
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    OnChange = ComboBox1Change
  end
  object Button1: TButton
    Left = 144
    Top = 240
    Width = 65
    Height = 25
    Caption = 'Mulai'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 224
    Top = 240
    Width = 57
    Height = 25
    Caption = 'Ambil'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 296
    Top = 240
    Width = 65
    Height = 25
    Caption = 'Exit'
    TabOrder = 4
    OnClick = Button3Click
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = True
    LinearVolume = True
    Left = 448
    Top = 8
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 496
    Top = 8
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 544
    Top = 8
  end
end
