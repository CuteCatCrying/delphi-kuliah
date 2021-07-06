object Form1: TForm1
  Left = 169
  Top = 110
  Width = 932
  Height = 613
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
    Left = 120
    Top = 16
    Width = 722
    Height = 46
    Caption = 'Aplikasi Pendeteksi Tingkat Kematangan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 288
    Top = 64
    Width = 396
    Height = 37
    Caption = 'Pada Buah Apel dan Tomat'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 320
    Top = 400
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
    Left = 320
    Top = 440
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
    Left = 320
    Top = 480
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
    Left = 648
    Top = 400
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
  object Label7: TLabel
    Left = 624
    Top = 368
    Width = 232
    Height = 20
    Caption = 'Mentah || Mangkal || Matang'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ImageCapture: TImage
    Left = 16
    Top = 352
    Width = 241
    Height = 185
    Stretch = True
  end
  object Label8: TLabel
    Left = 32
    Top = 344
    Width = 63
    Height = 13
    Caption = 'Hasil Capture'
  end
  object VideoWindow1: TVideoWindow
    Left = 16
    Top = 120
    Width = 241
    Height = 201
    FilterGraph = FilterGraph1
    VMROptions.Mode = vmrWindowed
    Color = clBlack
  end
  object ScrollBar1: TScrollBar
    Left = 272
    Top = 352
    Width = 17
    Height = 193
    Kind = sbVertical
    PageSize = 0
    TabOrder = 1
    OnChange = ScrollBar1Change
  end
  object ButtonCapture: TButton
    Left = 320
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Capture'
    TabOrder = 2
    OnClick = ButtonCaptureClick
  end
  object ButtonOpen: TButton
    Left = 320
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Open Image'
    TabOrder = 3
    OnClick = ButtonOpenClick
  end
  object ButtonSave: TButton
    Left = 320
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Save Image'
    TabOrder = 4
    OnClick = ButtonSaveClick
  end
  object ButtonExit: TButton
    Left = 424
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 5
    OnClick = ButtonExitClick
  end
  object ButtonScan: TButton
    Left = 424
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Scan Image'
    TabOrder = 6
    OnClick = ButtonScanClick
  end
  object Chart1: TChart
    Left = 536
    Top = 120
    Width = 369
    Height = 241
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Grafik Histogram')
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
    Left = 320
    Top = 352
    Width = 185
    Height = 21
    TabOrder = 8
    Text = '0'
  end
  object ComboBox1: TComboBox
    Left = 320
    Top = 128
    Width = 177
    Height = 21
    ItemHeight = 13
    TabOrder = 9
    Text = '-- Pilih Camera --'
    OnChange = ComboBox1Change
  end
  object MaskRed: TMaskEdit
    Left = 384
    Top = 400
    Width = 121
    Height = 21
    TabOrder = 10
    Text = '0'
  end
  object MaskGreen: TMaskEdit
    Left = 384
    Top = 440
    Width = 121
    Height = 21
    TabOrder = 11
    Text = '0'
  end
  object MaskBlue: TMaskEdit
    Left = 384
    Top = 480
    Width = 121
    Height = 21
    TabOrder = 12
    Text = '0'
  end
  object ButtonReset: TButton
    Left = 424
    Top = 176
    Width = 75
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
    Top = 128
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 224
    Top = 128
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 160
    Top = 128
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = '.bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 224
    Top = 288
  end
  object TimerScan: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerScanTimer
    Left = 24
    Top = 288
  end
  object OpenPictureDialog1: TOpenPictureDialog
    DefaultExt = '.bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 192
    Top = 288
  end
end
