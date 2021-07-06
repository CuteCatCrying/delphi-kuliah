object Form1: TForm1
  Left = 305
  Top = 123
  Width = 800
  Height = 522
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
    Top = 16
    Width = 297
    Height = 297
    Stretch = True
  end
  object Label1: TLabel
    Left = 96
    Top = 384
    Width = 38
    Height = 13
    Caption = 'R Value'
  end
  object Label2: TLabel
    Left = 96
    Top = 416
    Width = 38
    Height = 13
    Caption = 'G Value'
  end
  object Label3: TLabel
    Left = 96
    Top = 448
    Width = 37
    Height = 13
    Caption = 'B Value'
  end
  object Chart1: TChart
    Left = 344
    Top = 16
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
    Top = 16
    Width = 17
    Height = 297
    Kind = sbVertical
    PageSize = 0
    TabOrder = 1
    OnChange = ScrollBar1Change
  end
  object ButtonOpenFile: TButton
    Left = 8
    Top = 320
    Width = 129
    Height = 25
    Caption = 'Open File'
    TabOrder = 2
    OnClick = ButtonOpenFileClick
  end
  object ButtonScan: TButton
    Left = 8
    Top = 352
    Width = 129
    Height = 25
    Caption = 'Scan'
    TabOrder = 3
    OnClick = ButtonScanClick
  end
  object ButtonStop: TButton
    Left = 144
    Top = 320
    Width = 121
    Height = 25
    Caption = 'Stop'
    TabOrder = 4
    OnClick = ButtonStopClick
  end
  object EditScan: TEdit
    Left = 144
    Top = 352
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '0'
  end
  object EditRValue: TEdit
    Left = 144
    Top = 384
    Width = 121
    Height = 21
    TabOrder = 6
    Text = '0'
  end
  object EditGValue: TEdit
    Left = 144
    Top = 416
    Width = 121
    Height = 21
    TabOrder = 7
    Text = '0'
  end
  object EditBValue: TEdit
    Left = 144
    Top = 448
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
    Top = 320
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 304
    Top = 320
  end
end
