unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TeEngine, Series, TeeProcs, Chart, ExtDlgs;

type
  TForm1 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Image1: TImage;
    ScrollBar1: TScrollBar;
    ButtonOpenFile: TButton;
    ButtonScan: TButton;
    ButtonStop: TButton;
    TimerImage: TTimer;
    EditScan: TEdit;
    EditRValue: TEdit;
    EditGValue: TEdit;
    EditBValue: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure ButtonOpenFileClick(Sender: TObject);
    procedure TimerImageTimer(Sender: TObject);
    procedure ButtonScanClick(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Gambar: TBitmap;
  Garis: TBitmap;
  Aa: Integer;
  mrh, merah, merah1: Integer;
  hju, hijau, hijau1: Integer;
  bru, biru, biru1: Integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Gambar := TBitmap.Create();
end;

procedure TForm1.ButtonOpenFileClick(Sender: TObject);
begin
  Aa := 0;
  EditScan.Text := IntToStr(Aa);
  merah1 := 0;
  EditRValue.Text := IntToStr(merah1);
  hijau1 := 0;
  EditGValue.Text := IntToStr(hijau1);
  biru1 := 0;
  EditBValue.Text := IntToStr(biru1);

  if OpenPictureDialog1.Execute then
  Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

  if not Image1.Picture.Bitmap.Empty then
  begin
    ScrollBar1.Enabled := True;
    Gambar.Assign(Image1.Picture);
    ScrollBar1.Max := Image1.Picture.Height;
  end;
end;

procedure TForm1.TimerImageTimer(Sender: TObject);
begin
 if Aa <= ScrollBar1.Max then
 begin
   Aa := Aa + 1;
   ScrollBar1.Position := Aa;
 end;
end;

procedure TForm1.ButtonScanClick(Sender: TObject);
begin
  TimerImage.Enabled := True;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
var
  red, green, blue: byte;
  i, j, lebar: Integer;
  Warna: TColor;
begin
  Series1.Clear;
  Series2.Clear;
  Series3.Clear;
  j := ScrollBar1.Position;
  EditScan.Text := IntToStr(j);
  lebar := Image1.Picture.Bitmap.Width;

  Garis := TBitmap.Create();
  Garis.Assign(Gambar);
  Garis.Canvas.MoveTo(0, j);
  Garis.Canvas.LineTo(lebar, j);

  for i:=0 to lebar-1 do
  begin
    Warna := Image1.Picture.Bitmap.Canvas.Pixels[i, j];
    red := GetRValue(Warna);
    green := GetGValue(Warna);
    blue := GetBValue(Warna);

    Series1.AddXY(i, red);
    Series2.AddXY(i, green);
    Series3.AddXY(i, blue);

    EditRValue.Text := IntToStr(red);
    EditGValue.Text := IntToStr(green);
    EditBValue.Text := IntToStr(blue);

//    if (red=255)or(red=254)or(red=253)or(red=252)or(red=251)or(red=250) then
//    begin
//      mrh := 0;
//      merah1 := merah1 + mrh;
//      EditRValue.Text := IntToStr(merah1);
//    end
//    else
//    begin
//      mrh := red;
//      merah1 := merah1 + mrh;
//      EditRValue.Text := IntToStr(merah1);
//    end;
//
//    if (green=255)or(green=254)or(green=253)or(green=252)or(green=251)or(green=250) then
//    begin
//      hju := 0;
//      hijau1 := hijau1 + hju;
//      EditGValue.Text := IntToStr(hijau1);
//   end
//    else
//    begin
//      hju := green;
//      hijau1 := hijau1 + hju;
//      EditGValue.Text := IntToStr(hijau1);
//    end;
//
//   if (blue=255)or(blue=254)or(blue=253)or(blue=252)or(blue=251)or(blue=250) then
//    begin
//      bru := 0;
//      biru1 := biru1 + bru;
//      EditBValue.Text := IntToStr(biru1);
//    end
//    else
//    begin
//      bru := blue;
//      biru1 := biru1 + bru;
//      EditBValue.Text := IntToStr(biru1);
//    end;
  end;

  Image1.Picture.Assign(Garis);
  Garis.Free;
end;

procedure TForm1.ButtonStopClick(Sender: TObject);
begin
 TimerImage.Enabled := False;
end;

end.
