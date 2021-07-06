object Form1: TForm1
  Left = 202
  Top = 110
  Width = 1136
  Height = 619
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
  object Label1: TLabel
    Left = 32
    Top = 64
    Width = 30
    Height = 13
    Caption = 'KODE'
  end
  object Label2: TLabel
    Left = 32
    Top = 104
    Width = 31
    Height = 13
    Caption = 'NAMA'
  end
  object Label3: TLabel
    Left = 32
    Top = 144
    Width = 80
    Height = 13
    Caption = 'JENIS KELAMIN'
  end
  object Label4: TLabel
    Left = 32
    Top = 184
    Width = 43
    Height = 13
    Caption = 'ALAMAT'
  end
  object Label5: TLabel
    Left = 32
    Top = 224
    Width = 27
    Height = 13
    Caption = 'NILAI'
  end
  object Hitam: TLabel
    Left = 669
    Top = 360
    Width = 27
    Height = 13
    Caption = 'Hitam'
  end
  object ComboBox1: TComboBox
    Left = 144
    Top = 136
    Width = 153
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Items.Strings = (
      'PRIA'
      'WANITA')
  end
  object Edit1: TEdit
    Left = 144
    Top = 56
    Width = 153
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 144
    Top = 96
    Width = 153
    Height = 21
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 144
    Top = 176
    Width = 153
    Height = 21
    TabOrder = 3
  end
  object Edit4: TEdit
    Left = 144
    Top = 216
    Width = 153
    Height = 21
    TabOrder = 4
    Text = '0'
  end
  object GroupBox1: TGroupBox
    Left = 592
    Top = 48
    Width = 257
    Height = 209
    Caption = 'GAMBAR'
    TabOrder = 5
    object Image1: TImage
      Left = 16
      Top = 16
      Width = 201
      Height = 185
      Stretch = True
    end
    object ScrollBar1: TScrollBar
      Left = 224
      Top = 16
      Width = 25
      Height = 185
      Kind = sbVertical
      PageSize = 0
      TabOrder = 0
      OnChange = ScrollBar1Change
    end
  end
  object SAVE: TButton
    Left = 40
    Top = 456
    Width = 81
    Height = 25
    Caption = 'SAVE'
    TabOrder = 6
    OnClick = SAVEClick
  end
  object DELETE: TButton
    Left = 136
    Top = 456
    Width = 81
    Height = 25
    Caption = 'DELETE'
    TabOrder = 7
    OnClick = DELETEClick
  end
  object HAPUS: TButton
    Left = 232
    Top = 456
    Width = 81
    Height = 25
    Caption = 'HAPUS'
    TabOrder = 8
    OnClick = HAPUSClick
  end
  object EXIT: TButton
    Left = 328
    Top = 456
    Width = 81
    Height = 25
    Caption = 'EXIT'
    TabOrder = 9
    OnClick = EXITClick
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 320
    Width = 513
    Height = 121
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ComboBox2: TComboBox
    Left = 328
    Top = 272
    Width = 105
    Height = 21
    ItemHeight = 13
    TabOrder = 11
    OnChange = ComboBox2Change
  end
  object Start: TButton
    Left = 440
    Top = 272
    Width = 65
    Height = 25
    Caption = 'Start'
    TabOrder = 12
    OnClick = StartClick
  end
  object VideoWindow1: TVideoWindow
    Left = 328
    Top = 48
    Width = 249
    Height = 209
    FilterGraph = FilterGraph1
    VMROptions.Mode = vmrWindowed
    Color = clBlack
  end
  object Capture: TButton
    Left = 512
    Top = 272
    Width = 65
    Height = 25
    Caption = 'Capture'
    TabOrder = 14
    OnClick = CaptureClick
  end
  object Chart1: TChart
    Left = 864
    Top = 48
    Width = 241
    Height = 209
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    TabOrder = 15
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlack
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object Scan: TButton
    Left = 645
    Top = 312
    Width = 76
    Height = 25
    Caption = 'Scan'
    TabOrder = 16
    OnClick = ScanClick
  end
  object Edit5: TEdit
    Left = 733
    Top = 312
    Width = 121
    Height = 21
    TabOrder = 17
  end
  object Edit6: TEdit
    Left = 733
    Top = 352
    Width = 121
    Height = 21
    TabOrder = 18
  end
  object Search: TButton
    Left = 648
    Top = 272
    Width = 73
    Height = 25
    Caption = 'Search'
    TabOrder = 19
    OnClick = SearchClick
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.BMP'
    Filter = 'BITMAP|*.BMP'
    Left = 37
    Top = 282
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 85
    Top = 282
  end
  object ADOConnection1: TADOConnection
    Left = 125
    Top = 282
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    Left = 173
    Top = 282
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = True
    LinearVolume = True
    Left = 549
    Top = 50
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 549
    Top = 90
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 549
    Top = 130
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 608
    Top = 312
  end
  object OpenDialog2: TOpenDialog
    DefaultExt = '*.BMP'
    Filter = 'BITMAP|*.BMP'
    Left = 608
    Top = 272
  end
end
