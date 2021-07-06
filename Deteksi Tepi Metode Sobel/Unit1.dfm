object Form1: TForm1
  Left = 338
  Top = 23
  Width = 910
  Height = 616
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
    Left = 8
    Top = 8
    Width = 193
    Height = 201
    Stretch = True
    OnMouseMove = Image1MouseMove
  end
  object SobelImage: TImage
    Left = 216
    Top = 8
    Width = 641
    Height = 537
    AutoSize = True
    Stretch = True
  end
  object Label7: TLabel
    Left = 472
    Top = 560
    Width = 3
    Height = 13
    Caption = ' '
  end
  object Label8: TLabel
    Left = 24
    Top = 216
    Width = 8
    Height = 13
    Caption = 'H'
  end
  object Label9: TLabel
    Left = 40
    Top = 216
    Width = 12
    Height = 13
    Caption = '__'
  end
  object Label10: TLabel
    Left = 72
    Top = 216
    Width = 7
    Height = 13
    Caption = 'S'
  end
  object Label11: TLabel
    Left = 88
    Top = 216
    Width = 12
    Height = 13
    Caption = '__'
  end
  object Label12: TLabel
    Left = 120
    Top = 216
    Width = 7
    Height = 13
    Caption = 'V'
  end
  object Label13: TLabel
    Left = 136
    Top = 216
    Width = 12
    Height = 13
    Caption = '__'
  end
  object Label1: TLabel
    Left = 24
    Top = 232
    Width = 8
    Height = 13
    Caption = 'R'
  end
  object Label2: TLabel
    Left = 40
    Top = 232
    Width = 12
    Height = 13
    Caption = '__'
  end
  object Label3: TLabel
    Left = 72
    Top = 232
    Width = 8
    Height = 13
    Caption = 'G'
  end
  object Label4: TLabel
    Left = 88
    Top = 232
    Width = 12
    Height = 13
    Caption = '__'
  end
  object Label5: TLabel
    Left = 120
    Top = 232
    Width = 7
    Height = 13
    Caption = 'B'
  end
  object Label6: TLabel
    Left = 136
    Top = 232
    Width = 12
    Height = 13
    Caption = '__'
  end
  object OpenButton: TButton
    Left = 8
    Top = 248
    Width = 57
    Height = 25
    Caption = 'Open'
    TabOrder = 0
    OnClick = OpenButtonClick
  end
  object Detect2Button: TButton
    Left = 72
    Top = 248
    Width = 57
    Height = 25
    Caption = 'Detect'
    TabOrder = 1
    OnClick = Detect2ButtonClick
  end
  object ExitButton: TButton
    Left = 136
    Top = 248
    Width = 57
    Height = 25
    Caption = 'Exit'
    TabOrder = 2
    OnClick = ExitButtonClick
  end
  object VideoWindow1: TVideoWindow
    Left = 8
    Top = 280
    Width = 193
    Height = 201
    FilterGraph = FilterGraph1
    VMROptions.Mode = vmrWindowed
    Color = clBlack
  end
  object StartButton: TButton
    Left = 8
    Top = 520
    Width = 57
    Height = 25
    Caption = 'Mulai'
    TabOrder = 4
  end
  object DetectButton: TButton
    Left = 72
    Top = 520
    Width = 57
    Height = 25
    Caption = 'Detect'
    TabOrder = 5
    OnClick = DetectButtonClick
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 488
    Width = 193
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    OnChange = ComboBox1Change
  end
  object StopButton: TButton
    Left = 136
    Top = 520
    Width = 65
    Height = 25
    Caption = 'Stop'
    TabOrder = 7
    OnClick = StopButtonClick
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 168
    Top = 16
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = False
    LinearVolume = True
    Left = 168
    Top = 296
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 168
    Top = 328
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 168
    Top = 360
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 168
    Top = 392
  end
end
