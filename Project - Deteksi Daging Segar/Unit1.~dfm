object Form1: TForm1
  Left = 262
  Top = 200
  Width = 936
  Height = 476
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
    Left = 184
    Top = 16
    Width = 600
    Height = 46
    Caption = 'Aplikasi Pendeteksi Daging Segar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 352
    Top = 304
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
    Left = 352
    Top = 328
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
    Left = 352
    Top = 352
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
    Left = 632
    Top = 328
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
    Left = 256
    Top = 80
    Width = 241
    Height = 193
    Stretch = True
  end
  object Label8: TLabel
    Left = 272
    Top = 72
    Width = 63
    Height = 13
    Caption = 'Hasil Capture'
  end
  object VideoWindow1: TVideoWindow
    Left = 8
    Top = 72
    Width = 241
    Height = 201
    FilterGraph = FilterGraph1
    VMROptions.Mode = vmrWindowed
    Color = clBlack
  end
  object ScrollBar1: TScrollBar
    Left = 504
    Top = 80
    Width = 17
    Height = 193
    Kind = sbVertical
    PageSize = 0
    TabOrder = 1
    OnChange = ScrollBar1Change
  end
  object ButtonCapture: TButton
    Left = 8
    Top = 304
    Width = 121
    Height = 25
    Caption = 'Capture'
    TabOrder = 2
    OnClick = ButtonCaptureClick
  end
  object ButtonOpen: TButton
    Left = 136
    Top = 336
    Width = 115
    Height = 25
    Caption = 'Open Image'
    TabOrder = 3
    OnClick = ButtonOpenClick
  end
  object ButtonSave: TButton
    Left = 8
    Top = 336
    Width = 121
    Height = 25
    Caption = 'Save Image'
    TabOrder = 4
    OnClick = ButtonSaveClick
  end
  object ButtonExit: TButton
    Left = 8
    Top = 400
    Width = 241
    Height = 25
    Caption = 'Exit'
    TabOrder = 5
    OnClick = ButtonExitClick
  end
  object ButtonScan: TButton
    Left = 8
    Top = 368
    Width = 241
    Height = 25
    Caption = 'Scan Image'
    TabOrder = 6
    OnClick = ButtonScanClick
  end
  object Chart1: TChart
    Left = 528
    Top = 80
    Width = 369
    Height = 241
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
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
    Left = 336
    Top = 280
    Width = 185
    Height = 21
    TabOrder = 8
    Text = '0'
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 280
    Width = 241
    Height = 21
    ItemHeight = 13
    TabOrder = 9
    Text = '-- Pilih Camera --'
    OnChange = ComboBox1Change
  end
  object MaskRed: TMaskEdit
    Left = 400
    Top = 304
    Width = 121
    Height = 21
    TabOrder = 10
    Text = '0'
  end
  object MaskGreen: TMaskEdit
    Left = 400
    Top = 328
    Width = 121
    Height = 21
    TabOrder = 11
    Text = '0'
  end
  object MaskBlue: TMaskEdit
    Left = 400
    Top = 352
    Width = 121
    Height = 21
    TabOrder = 12
    Text = '0'
  end
  object ButtonReset: TButton
    Left = 136
    Top = 304
    Width = 115
    Height = 25
    Caption = 'Reset'
    TabOrder = 13
    OnClick = ButtonResetClick
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = False
    LinearVolume = True
    Left = 184
    Top = 80
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 216
    Top = 80
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 152
    Top = 80
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = '.bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 216
    Top = 240
  end
  object TimerScan: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerScanTimer
    Left = 16
    Top = 240
  end
  object OpenPictureDialog1: TOpenPictureDialog
    DefaultExt = '.bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 184
    Top = 240
  end
end
