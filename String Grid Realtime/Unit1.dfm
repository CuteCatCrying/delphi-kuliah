object Form1: TForm1
  Left = 194
  Top = 128
  Width = 583
  Height = 557
  Caption = 'Zukron Alviandy - 1811081030'
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
  object MainImage: TImage
    Left = 344
    Top = 16
    Width = 209
    Height = 169
    Stretch = True
  end
  object Label2: TLabel
    Left = 232
    Top = 16
    Width = 97
    Height = 13
    Caption = 'Realtime Conversion'
  end
  object Label5: TLabel
    Left = 248
    Top = 80
    Width = 69
    Height = 13
    Caption = 'Convert Image'
  end
  object Label1: TLabel
    Left = 16
    Top = 208
    Width = 73
    Height = 13
    Caption = 'Domain Spasial'
  end
  object MainVideo: TVideoWindow
    Left = 16
    Top = 16
    Width = 209
    Height = 169
    FilterGraph = FilterGraph1
    VMROptions.Mode = vmrWindowed
    Color = clBlack
  end
  object ComboBox1: TComboBox
    Left = 232
    Top = 32
    Width = 105
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    OnChange = ComboBox1Change
  end
  object GrayscaleButton: TButton
    Left = 232
    Top = 128
    Width = 105
    Height = 25
    Caption = 'Grayscale'
    TabOrder = 2
    OnClick = GrayscaleButtonClick
  end
  object OriginalButton: TButton
    Left = 232
    Top = 96
    Width = 105
    Height = 25
    Caption = 'Original'
    TabOrder = 3
    OnClick = OriginalButtonClick
  end
  object BinaryButton: TButton
    Left = 232
    Top = 160
    Width = 105
    Height = 25
    Caption = 'Binary'
    TabOrder = 4
    OnClick = BinaryButtonClick
  end
  object StringGrid: TStringGrid
    Left = 16
    Top = 224
    Width = 537
    Height = 281
    FixedCols = 0
    FixedRows = 0
    TabOrder = 5
  end
  object Button1: TButton
    Left = 232
    Top = 192
    Width = 105
    Height = 25
    Caption = 'Capture'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 344
    Top = 192
    Width = 209
    Height = 25
    Caption = 'Save Image'
    TabOrder = 7
    OnClick = Button2Click
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = False
    LinearVolume = True
    Left = 192
    Top = 24
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 192
    Top = 56
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 192
    Top = 88
  end
  object OriginalTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = OriginalTimerTimer
    Left = 24
    Top = 152
  end
  object GrayscaleTimer: TTimer
    Enabled = False
    OnTimer = GrayscaleTimerTimer
    Left = 56
    Top = 152
  end
  object BinaryTimer: TTimer
    Enabled = False
    OnTimer = BinaryTimerTimer
    Left = 88
    Top = 152
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = '.bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 192
    Top = 152
  end
end
