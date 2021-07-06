object Form1: TForm1
  Left = 221
  Top = 77
  Width = 851
  Height = 577
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
    Left = 186
    Top = 22
    Width = 507
    Height = 37
    Caption = 'Aplikasi Pendeteksi Warna Pada Daun'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'Sitka Small'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ImageCapture: TImage
    Left = 468
    Top = 82
    Width = 328
    Height = 194
    Stretch = True
  end
  object Label2: TLabel
    Left = 478
    Top = 72
    Width = 82
    Height = 18
    Caption = 'Hasil Capture'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object LabelResult: TLabel
    Left = 156
    Top = 461
    Width = 135
    Height = 24
    Caption = 'Hasil Deteksi :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Lucida Bright'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 22
    Top = 349
    Width = 35
    Height = 14
    Caption = 'Merah'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 163
    Top = 349
    Width = 29
    Height = 14
    Caption = 'Hijau'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 297
    Top = 349
    Width = 22
    Height = 14
    Caption = 'Biru'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object VideoWindow1: TVideoWindow
    Left = 22
    Top = 82
    Width = 321
    Height = 201
    FilterGraph = FilterGraph1
    VMROptions.Mode = vmrWindowed
    Color = clBlack
  end
  object DBChart1: TDBChart
    Left = 467
    Top = 290
    Width = 328
    Height = 231
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Grafik Histogram')
    TabOrder = 1
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Red'
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
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Title = 'Green'
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
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlue
      Title = 'Blue'
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
  object ButtonCapture: TButton
    Left = 371
    Top = 126
    Width = 70
    Height = 24
    Caption = 'Capture'
    TabOrder = 2
    OnClick = ButtonCaptureClick
  end
  object ButtonOpen: TButton
    Left = 371
    Top = 156
    Width = 70
    Height = 23
    Caption = 'Open'
    TabOrder = 3
    OnClick = ButtonOpenClick
  end
  object ButtonReset: TButton
    Left = 371
    Top = 218
    Width = 70
    Height = 23
    Caption = 'Reset'
    TabOrder = 4
    OnClick = ButtonResetClick
  end
  object ButtonExit: TButton
    Left = 371
    Top = 247
    Width = 70
    Height = 24
    Caption = 'Exit'
    TabOrder = 5
    OnClick = ButtonExitClick
  end
  object ScrollBar1: TScrollBar
    Left = 805
    Top = 82
    Width = 16
    Height = 191
    Kind = sbVertical
    PageSize = 0
    TabOrder = 6
    OnChange = ScrollBar1Change
  end
  object ComboBox1: TComboBox
    Left = 20
    Top = 290
    Width = 246
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    Text = '- Pilih Camera -'
    OnChange = ComboBox1Change
  end
  object MaskRed: TMaskEdit
    Left = 59
    Top = 347
    Width = 98
    Height = 21
    TabOrder = 8
    Text = '0'
  end
  object MaskGreen: TMaskEdit
    Left = 193
    Top = 346
    Width = 98
    Height = 21
    TabOrder = 9
    Text = '0'
  end
  object MaskBlue: TMaskEdit
    Left = 319
    Top = 346
    Width = 98
    Height = 21
    TabOrder = 10
    Text = '0'
  end
  object MaskScan: TMaskEdit
    Left = 149
    Top = 423
    Width = 157
    Height = 21
    TabOrder = 11
    Text = '0'
  end
  object ButtonScan: TButton
    Left = 186
    Top = 394
    Width = 82
    Height = 23
    Caption = 'Scan Image'
    TabOrder = 12
    OnClick = ButtonScanClick
  end
  object ButtonSave: TButton
    Left = 371
    Top = 188
    Width = 70
    Height = 23
    Caption = 'Save'
    TabOrder = 13
    OnClick = ButtonSaveClick
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = False
    LinearVolume = True
    Left = 32
    Top = 96
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 64
    Top = 96
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 96
    Top = 96
  end
  object TimerScan: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerScanTimer
    Left = 304
    Top = 240
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = '.bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 304
    Top = 96
  end
  object OpenPictureDialog1: TOpenPictureDialog
    DefaultExt = '.bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 270
    Top = 98
  end
end
