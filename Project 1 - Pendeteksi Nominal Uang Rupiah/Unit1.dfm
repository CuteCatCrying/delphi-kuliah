object Form1: TForm1
  Left = 258
  Top = 128
  Width = 957
  Height = 499
  BorderIcons = [biSystemMenu]
  Caption = 'Capture Webcam'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 328
    Top = 112
    Width = 281
    Height = 217
  end
  object Image1: TImage
    Left = 328
    Top = 112
    Width = 281
    Height = 217
    Stretch = True
  end
  object Label10: TLabel
    Left = 328
    Top = 368
    Width = 30
    Height = 13
    Caption = 'Merah'
  end
  object Label11: TLabel
    Left = 328
    Top = 392
    Width = 24
    Height = 13
    Caption = 'Hijau'
  end
  object Label12: TLabel
    Left = 328
    Top = 416
    Width = 18
    Height = 13
    Caption = 'Biru'
  end
  object Label9: TLabel
    Left = 344
    Top = 104
    Width = 78
    Height = 13
    Caption = 'HASIL CAPTURE'
  end
  object Label1: TLabel
    Left = 232
    Top = 48
    Width = 449
    Height = 40
    Alignment = taCenter
    Caption = 'NOMINAL UANG RUPIAH'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Humnst777 Blk BT'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 616
    Top = 336
    Width = 167
    Height = 29
    Caption = 'HASIL DETEKSI : '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tekton Pro'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 616
    Top = 376
    Width = 3
    Height = 13
  end
  object Label4: TLabel
    Left = 232
    Top = 8
    Width = 442
    Height = 45
    Alignment = taCenter
    Caption = 'APLIKASI PENDETEKSI '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 832
    Top = 8
    Width = 24
    Height = 69
    Caption = '|'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -64
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 856
    Top = 24
    Width = 59
    Height = 13
    Caption = 'Rp. 50.000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 856
    Top = 40
    Width = 59
    Height = 13
    Caption = 'Rp. 20.000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 856
    Top = 56
    Width = 52
    Height = 13
    Caption = 'Rp. 5.000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ButtonScanRGB: TButton
    Left = 328
    Top = 336
    Width = 121
    Height = 25
    Caption = 'Scan'
    TabOrder = 1
    OnClick = ButtonScanRGBClick
  end
  object ScanEditRGB: TEdit
    Left = 456
    Top = 336
    Width = 153
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object MerahEdit: TEdit
    Left = 368
    Top = 368
    Width = 81
    Height = 21
    TabOrder = 3
    Text = '0'
  end
  object HijauEdit: TEdit
    Left = 368
    Top = 392
    Width = 81
    Height = 21
    TabOrder = 4
    Text = '0'
  end
  object BiruEdit: TEdit
    Left = 368
    Top = 416
    Width = 81
    Height = 21
    TabOrder = 5
    Text = '0'
  end
  object ScrollBar1: TScrollBar
    Left = 616
    Top = 112
    Width = 17
    Height = 217
    Kind = sbVertical
    PageSize = 0
    TabOrder = 0
    OnChange = ScrollBar1Change
  end
  object Chart1: TChart
    Left = 640
    Top = 112
    Width = 281
    Height = 217
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Grafik Histogram')
    TabOrder = 6
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
  object Button2: TButton
    Left = 182
    Top = 364
    Width = 139
    Height = 37
    Caption = 'Save'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 184
    Top = 408
    Width = 137
    Height = 33
    Caption = 'Exit'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Panel1: TPanel
    Left = 40
    Top = 112
    Width = 281
    Height = 217
    Align = alCustom
    Caption = 'Panel1'
    TabOrder = 9
    object VideoWindow1: TVideoWindow
      Left = 1
      Top = 1
      Width = 279
      Height = 216
      FilterGraph = FilterGraph1
      VMROptions.Mode = vmrWindowed
      Color = clBlack
      Align = alTop
    end
  end
  object Button5: TButton
    Left = 40
    Top = 408
    Width = 137
    Height = 33
    Caption = 'Reset'
    TabOrder = 10
    OnClick = Button5Click
  end
  object ComboBox1: TComboBox
    Left = 40
    Top = 335
    Width = 281
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 11
    Text = ' -- Pilih Camera--'
    OnSelect = ComboBox1Click
  end
  object Button1: TButton
    Left = 40
    Top = 368
    Width = 137
    Height = 33
    Caption = 'Capture'
    TabOrder = 12
    OnClick = Button1Click
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = True
    LinearVolume = True
    Left = 8
    Top = 113
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 8
    Top = 177
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 8
    Top = 145
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = 'JPG'
    Left = 8
    Top = 209
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 8
    Top = 241
  end
end
