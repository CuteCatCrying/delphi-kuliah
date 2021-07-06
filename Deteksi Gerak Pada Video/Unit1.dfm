object Form1: TForm1
  Left = 269
  Top = 0
  Width = 497
  Height = 599
  Caption = 'Motion Detect'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 371
    Width = 481
    Height = 189
    Align = alBottom
    TabOrder = 0
    object Label1: TLabel
      Left = 208
      Top = 10
      Width = 70
      Height = 13
      Caption = 'More Sensitive'
    end
    object Label2: TLabel
      Left = 208
      Top = 148
      Width = 68
      Height = 13
      Caption = 'Less Sensitive'
    end
    object Shape1: TShape
      Left = 302
      Top = 114
      Width = 23
      Height = 20
    end
    object Label3: TLabel
      Left = 16
      Top = 4
      Width = 63
      Height = 13
      Caption = 'Area Detect :'
    end
    object Label4: TLabel
      Left = 293
      Top = 11
      Width = 64
      Height = 13
      Caption = 'Pilih Kamera :'
    end
    object Label5: TLabel
      Left = 328
      Top = 117
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 293
      Top = 33
      Width = 177
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox1Change
    end
    object BitBtn1: TBitBtn
      Left = 297
      Top = 83
      Width = 165
      Height = 25
      Caption = 'Nyalakan Kamera'
      Enabled = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object TrackBar1: TTrackBar
      Left = 224
      Top = 24
      Width = 33
      Height = 121
      Max = 255
      Min = 25
      Orientation = trVertical
      Position = 50
      TabOrder = 2
    end
    object Panel1: TPanel
      Left = 16
      Top = 24
      Width = 185
      Height = 135
      TabOrder = 3
      object Image1: TImage
        Left = 1
        Top = 1
        Width = 183
        Height = 133
        Hint = 'Klik dan Drag untuk menentukan deteksi area'
        Align = alClient
        ParentShowHint = False
        ShowHint = True
        Stretch = True
        OnMouseDown = Image1MouseDown
        OnMouseMove = Image1MouseMove
        OnMouseUp = Image1MouseUp
      end
    end
    object ComboBox2: TComboBox
      Left = 293
      Top = 56
      Width = 177
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 481
    Height = 371
    Align = alClient
    TabOrder = 1
    object VideoWindow1: TVideoWindow
      Left = 0
      Top = 0
      Width = 477
      Height = 361
      FilterGraph = FilterGraph1
      VMROptions.Mode = vmrWindowed
      Color = clBlack
      TabStop = False
    end
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = True
    LinearVolume = True
    Left = 352
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 384
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 416
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 250
    OnTimer = Timer1Timer
    Left = 448
  end
end
