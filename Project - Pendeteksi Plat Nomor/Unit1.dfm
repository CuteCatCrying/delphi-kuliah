object Form1: TForm1
  Left = 211
  Top = 65
  Width = 797
  Height = 610
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
    Top = 56
    Width = 297
    Height = 297
    Stretch = True
  end
  object Label1: TLabel
    Left = 96
    Top = 424
    Width = 38
    Height = 13
    Caption = 'R Value'
  end
  object Label2: TLabel
    Left = 96
    Top = 456
    Width = 38
    Height = 13
    Caption = 'G Value'
  end
  object Label3: TLabel
    Left = 96
    Top = 488
    Width = 37
    Height = 13
    Caption = 'B Value'
  end
  object Label4: TLabel
    Left = 160
    Top = 16
    Width = 562
    Height = 33
    Caption = 'Aplikasi Pendeteksi Plat Nomor Kendaraan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Century'
    Font.Style = []
    ParentFont = False
  end
  object ResultImage: TImage
    Left = 576
    Top = 360
    Width = 193
    Height = 193
    Stretch = True
  end
  object Label5: TLabel
    Left = 440
    Top = 360
    Width = 126
    Height = 23
    Caption = 'Hasil Deteksi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Century'
    Font.Style = []
    ParentFont = False
  end
  object Chart1: TChart
    Left = 344
    Top = 56
    Width = 425
    Height = 298
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
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
  object ScrollBar1: TScrollBar
    Left = 312
    Top = 56
    Width = 17
    Height = 297
    Kind = sbVertical
    PageSize = 0
    TabOrder = 1
    OnChange = ScrollBar1Change
  end
  object ButtonOpenFile: TButton
    Left = 8
    Top = 360
    Width = 129
    Height = 25
    Caption = 'Open File'
    TabOrder = 2
    OnClick = ButtonOpenFileClick
  end
  object ButtonScan: TButton
    Left = 8
    Top = 392
    Width = 129
    Height = 25
    Caption = 'Scan'
    TabOrder = 3
    OnClick = ButtonScanClick
  end
  object ButtonStop: TButton
    Left = 144
    Top = 360
    Width = 121
    Height = 25
    Caption = 'Stop'
    TabOrder = 4
    OnClick = ButtonStopClick
  end
  object EditScan: TEdit
    Left = 144
    Top = 392
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '0'
  end
  object EditRValue: TEdit
    Left = 144
    Top = 424
    Width = 121
    Height = 21
    TabOrder = 6
    Text = '0'
  end
  object EditGValue: TEdit
    Left = 144
    Top = 456
    Width = 121
    Height = 21
    TabOrder = 7
    Text = '0'
  end
  object EditBValue: TEdit
    Left = 144
    Top = 488
    Width = 121
    Height = 21
    TabOrder = 8
    Text = '0'
  end
  object TimerImage: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerImageTimer
    Left = 272
    Top = 360
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 304
    Top = 360
  end
end
