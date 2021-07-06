object Form1: TForm1
  Left = 397
  Top = 145
  Width = 774
  Height = 492
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 194
    Top = 22
    Width = 444
    Height = 31
    Caption = 'Aplikasi Pendeteksi Warna Jenis Bawang'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'Microsoft Tai Le'
    Font.Style = []
    ParentFont = False
  end
  object ImageOpen: TImage
    Left = 20
    Top = 82
    Width = 301
    Height = 194
    Stretch = True
  end
  object LabelResult: TLabel
    Left = 468
    Top = 389
    Width = 124
    Height = 26
    Caption = 'Hasil Deteksi'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Microsoft Tai Le'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 190
    Top = 373
    Width = 21
    Height = 14
    Caption = 'Red'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 187
    Top = 397
    Width = 33
    Height = 14
    Caption = 'Green'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 193
    Top = 421
    Width = 25
    Height = 14
    Caption = 'Blue'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 388
    Top = 333
    Width = 277
    Height = 25
    Caption = 'Bawang Putih / Merah / Bombai'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Microsoft Tai Le'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 126
    Top = 341
    Width = 95
    Height = 14
    Caption = 'Scrollbar Position'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object DBChart1: TDBChart
    Left = 387
    Top = 82
    Width = 350
    Height = 247
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TDBChart')
    TabOrder = 0
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
  object ButtonOpen: TButton
    Left = 19
    Top = 284
    Width = 118
    Height = 23
    Caption = 'Open Image'
    TabOrder = 1
    OnClick = ButtonOpenClick
  end
  object ButtonReset: TButton
    Left = 224
    Top = 282
    Width = 121
    Height = 23
    Caption = 'Reset'
    TabOrder = 2
    OnClick = ButtonResetClick
  end
  object ButtonExit: TButton
    Left = 19
    Top = 311
    Width = 118
    Height = 24
    Caption = 'Exit'
    TabOrder = 3
    OnClick = ButtonExitClick
  end
  object ScrollBar1: TScrollBar
    Left = 333
    Top = 82
    Width = 16
    Height = 199
    Kind = sbVertical
    PageSize = 0
    TabOrder = 4
    OnChange = ScrollBar1Change
  end
  object MaskRed: TMaskEdit
    Left = 224
    Top = 371
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '0'
  end
  object MaskGreen: TMaskEdit
    Left = 225
    Top = 394
    Width = 120
    Height = 21
    TabOrder = 6
    Text = '0'
  end
  object MaskBlue: TMaskEdit
    Left = 224
    Top = 418
    Width = 121
    Height = 21
    TabOrder = 7
    Text = '0'
  end
  object MaskScan: TMaskEdit
    Left = 224
    Top = 343
    Width = 122
    Height = 21
    TabOrder = 8
    Text = '0'
  end
  object ButtonScan: TButton
    Left = 224
    Top = 306
    Width = 121
    Height = 23
    Caption = 'Scan Image'
    TabOrder = 9
    OnClick = ButtonScanClick
  end
  object TimerScan: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerScanTimer
    Left = 256
    Top = 88
  end
  object OpenPictureDialog1: TOpenPictureDialog
    DefaultExt = '.bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 286
    Top = 90
  end
end
