object Form1: TForm1
  Left = -35
  Top = 182
  Width = 528
  Height = 420
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 216
    Top = 16
    Width = 200
    Height = 200
    Stretch = True
  end
  object LabelHMin: TLabel
    Left = 8
    Top = 272
    Width = 30
    Height = 13
    Caption = '_____'
  end
  object LabelSMin: TLabel
    Left = 8
    Top = 312
    Width = 30
    Height = 13
    Caption = '_____'
  end
  object LabelVMin: TLabel
    Left = 8
    Top = 352
    Width = 30
    Height = 13
    Caption = '_____'
  end
  object LabelHMax: TLabel
    Left = 232
    Top = 272
    Width = 30
    Height = 13
    Caption = '_____'
  end
  object LabelSMax: TLabel
    Left = 232
    Top = 312
    Width = 30
    Height = 13
    Caption = '_____'
  end
  object LabelVMax: TLabel
    Left = 232
    Top = 352
    Width = 30
    Height = 13
    Caption = '_____'
  end
  object Label7: TLabel
    Left = 128
    Top = 256
    Width = 24
    Height = 13
    Caption = 'Hmin'
  end
  object Label8: TLabel
    Left = 352
    Top = 256
    Width = 27
    Height = 13
    Caption = 'Hmax'
  end
  object Label9: TLabel
    Left = 128
    Top = 296
    Width = 23
    Height = 13
    Caption = 'Smin'
  end
  object Label10: TLabel
    Left = 352
    Top = 296
    Width = 26
    Height = 13
    Caption = 'Smax'
  end
  object Label11: TLabel
    Left = 128
    Top = 336
    Width = 23
    Height = 13
    Caption = 'Vmin'
  end
  object Label12: TLabel
    Left = 352
    Top = 336
    Width = 26
    Height = 13
    Caption = 'Vmax'
  end
  object VideoWindow1: TVideoWindow
    Left = 8
    Top = 16
    Width = 200
    Height = 200
    FilterGraph = FilterGraph1
    VMROptions.Mode = vmrWindowed
    Color = clBlack
  end
  object ButtonBlue: TButton
    Left = 424
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Biru'
    TabOrder = 1
    OnClick = ButtonBlueClick
  end
  object ButtonOrange: TButton
    Left = 424
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Orange'
    TabOrder = 2
    OnClick = ButtonOrangeClick
  end
  object ButtonToBiner: TButton
    Left = 424
    Top = 192
    Width = 75
    Height = 25
    Caption = 'ToBiner'
    TabOrder = 3
    OnClick = ButtonToBinerClick
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 224
    Width = 201
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    OnChange = ComboBox1Change
  end
  object ScrollBarSMin: TScrollBar
    Left = 48
    Top = 312
    Width = 177
    Height = 17
    PageSize = 0
    TabOrder = 5
    OnChange = ScrollBarSMinChange
  end
  object ScrollBarVMin: TScrollBar
    Left = 48
    Top = 352
    Width = 177
    Height = 17
    PageSize = 0
    TabOrder = 6
    OnChange = ScrollBarVMinChange
  end
  object ScrollBarSMax: TScrollBar
    Left = 272
    Top = 312
    Width = 177
    Height = 17
    PageSize = 0
    Position = 100
    TabOrder = 7
  end
  object ScrollBarVMax: TScrollBar
    Left = 272
    Top = 352
    Width = 177
    Height = 17
    PageSize = 0
    Position = 100
    TabOrder = 8
    OnChange = ScrollBarVMaxChange
  end
  object ButtonYellow: TButton
    Left = 424
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Yellow'
    TabOrder = 9
    OnClick = ButtonYellowClick
  end
  object ButtonGreen: TButton
    Left = 424
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Green'
    TabOrder = 10
    OnClick = ButtonGreenClick
  end
  object ButtonRed: TButton
    Left = 424
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Red'
    TabOrder = 11
    OnClick = ButtonRedClick
  end
  object ScrollBarHMin: TScrollBar
    Left = 48
    Top = 272
    Width = 177
    Height = 17
    Max = 360
    PageSize = 0
    TabOrder = 12
    OnChange = ScrollBarHMinChange
  end
  object ScrollBarHMax: TScrollBar
    Left = 272
    Top = 272
    Width = 177
    Height = 17
    Max = 360
    PageSize = 0
    Position = 360
    TabOrder = 13
    OnChange = ScrollBarHMaxChange
  end
  object ButtonToRGB: TButton
    Left = 424
    Top = 224
    Width = 75
    Height = 25
    Caption = 'ToRGB'
    TabOrder = 14
    OnClick = ButtonToRGBClick
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = False
    LinearVolume = True
    Left = 176
    Top = 24
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 176
    Top = 56
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 176
    Top = 88
  end
  object TimerConvert: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerConvertTimer
    Left = 16
    Top = 184
  end
  object TimerBiner: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerBinerTimer
    Left = 48
    Top = 184
  end
end
