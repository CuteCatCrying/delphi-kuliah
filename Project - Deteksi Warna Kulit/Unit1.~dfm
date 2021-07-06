object Form1: TForm1
  Left = 238
  Top = 137
  Width = 936
  Height = 507
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
    Left = 144
    Top = 16
    Width = 562
    Height = 46
    Caption = 'Aplikasi Pendeteksi Warna Kulit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 280
    Top = 360
    Width = 38
    Height = 16
    Caption = 'Merah'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 280
    Top = 384
    Width = 31
    Height = 16
    Caption = 'Hijau'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 280
    Top = 408
    Width = 23
    Height = 16
    Caption = 'Biru'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelResult: TLabel
    Left = 536
    Top = 408
    Width = 172
    Height = 29
    Caption = 'Hasil  Deteksi'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Mongolian Baiti'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ImageCapture: TImage
    Left = 264
    Top = 136
    Width = 241
    Height = 193
    Stretch = True
  end
  object Label8: TLabel
    Left = 280
    Top = 128
    Width = 63
    Height = 13
    Caption = 'Hasil Capture'
  end
  object Label2: TLabel
    Left = 304
    Top = 72
    Width = 274
    Height = 29
    Caption = 'Putih | Cokelat | Hitam'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Mongolian Baiti'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object VideoWindow1: TVideoWindow
    Left = 16
    Top = 128
    Width = 241
    Height = 201
    FilterGraph = FilterGraph1
    VMROptions.Mode = vmrWindowed
    Color = clBlack
  end
  object ScrollBar1: TScrollBar
    Left = 512
    Top = 144
    Width = 17
    Height = 185
    Kind = sbVertical
    PageSize = 0
    TabOrder = 1
    OnChange = ScrollBar1Change
  end
  object ButtonCapture: TButton
    Left = 16
    Top = 360
    Width = 89
    Height = 25
    Caption = 'Capture'
    TabOrder = 2
    OnClick = ButtonCaptureClick
  end
  object ButtonOpen: TButton
    Left = 112
    Top = 392
    Width = 83
    Height = 25
    Caption = 'Open Image'
    TabOrder = 3
    OnClick = ButtonOpenClick
  end
  object ButtonSave: TButton
    Left = 16
    Top = 392
    Width = 89
    Height = 25
    Caption = 'Save Image'
    TabOrder = 4
    OnClick = ButtonSaveClick
  end
  object ButtonExit: TButton
    Left = 536
    Top = 128
    Width = 369
    Height = 25
    Caption = 'Exit'
    TabOrder = 5
    OnClick = ButtonExitClick
  end
  object ButtonScan: TButton
    Left = 16
    Top = 424
    Width = 177
    Height = 25
    Caption = 'Scan Image'
    TabOrder = 6
    OnClick = ButtonScanClick
  end
  object Chart1: TChart
    Left = 536
    Top = 160
    Width = 369
    Height = 241
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    TabOrder = 7
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Merah'
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
      Title = 'Hijau'
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
      Title = 'Biru'
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
  object MaskValue: TMaskEdit
    Left = 264
    Top = 336
    Width = 185
    Height = 21
    TabOrder = 8
    Text = '0'
  end
  object ComboBox1: TComboBox
    Left = 16
    Top = 336
    Width = 177
    Height = 21
    ItemHeight = 13
    TabOrder = 9
    Text = '-- Pilih Camera --'
    OnChange = ComboBox1Change
  end
  object MaskRed: TMaskEdit
    Left = 328
    Top = 360
    Width = 121
    Height = 21
    TabOrder = 10
    Text = '0'
  end
  object MaskGreen: TMaskEdit
    Left = 328
    Top = 384
    Width = 121
    Height = 21
    TabOrder = 11
    Text = '0'
  end
  object MaskBlue: TMaskEdit
    Left = 328
    Top = 408
    Width = 121
    Height = 21
    TabOrder = 12
    Text = '0'
  end
  object ButtonReset: TButton
    Left = 112
    Top = 360
    Width = 83
    Height = 25
    Caption = 'Reset'
    TabOrder = 13
    OnClick = ButtonResetClick
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = False
    LinearVolume = True
    Left = 192
    Top = 136
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 224
    Top = 136
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 160
    Top = 136
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = '.bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 224
    Top = 296
  end
  object TimerScan: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerScanTimer
    Left = 24
    Top = 296
  end
  object OpenPictureDialog1: TOpenPictureDialog
    DefaultExt = '.bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 192
    Top = 296
  end
end
