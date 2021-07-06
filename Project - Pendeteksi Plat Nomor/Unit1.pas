unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TeEngine, Series, TeeProcs, Chart, ExtDlgs, Math;

type
THSV = record  // hue saturation value (HSV)
         Hue , Sat , Val : Double;
       end;

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
    Label4: TLabel;
    ResultImage: TImage;
    Label5: TLabel;
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
  maxH,maxS,maxV,minH,minS,minV: Integer;

implementation

{$R *.dfm}

function RGB2HSV(R,G,B: Byte): THSV;
var
  Min_,Max_,Delta : Double;
  H,S,V: Double;
begin
  H:=0.0;
  Min_ := Min(Min(R,G),B);
  Max_ := Max(Max(R,G),B);
  Delta:= (Max_-Min_);
  V:= Max_;
  if (Max_<> 0.0 ) then
    S:=255.0* Delta/Max_
  else
    S:=0.0;

  if (S<>0.0) then
    begin
      if R= Max_ then
        H:= (G-B)/Delta
      else
        if G= Max_ then
          H:= 2.0+(B-R)/Delta
        else
          if B= Max_ then
            H:= 4.0+(R-G)/Delta
    end
  else
    H:= -1.0;

  H:= H*60;
  if H<0.0 then
    H:= H+360.0;

  with Result Do
  begin
    Hue := H;;
    Sat := S*100/255;
    Val := V*100/255;
  end;
end;

procedure RGB2THRES(var Image1: Timage);
var
  PC,PH: PByteArray;
  R,G,B: byte;
  x,y: Integer;
  Hue,Sat,Val: Double;
  Result: THSV;
begin
 for y:=0 to Image1.Picture.Bitmap.Height-1 do
   begin
    PC := Image1.Picture.Bitmap.ScanLine[y];
    PH := Image1.Picture.Bitmap.ScanLine[y];
    for x:=0 to Image1.Picture.Bitmap.Width-1 do
      begin
        R := PC[3*x+2];
        G := PC[3*x+1];
        B := PC[3*x];
        Result := RGB2HSV(R,G,B);
        Hue := Result.Hue;
        Sat := Result.Sat;
        Val := Result.Val;

        if (Hue>=minH) and (Hue<=maxH) and (Sat>=minS) and (Sat<=maxS) and (Val>=minV) and (Val<=maxV) then
        begin
          PH[3*x+2]:= R;
          PH[3*x+1]:= G;
          PH[3*x]:= B;
        end
        else
        begin
          PH[3*x+2]:= 0;
          PH[3*x+1]:= 0;
          PH[3*x]:= 0;
        end;
      end;
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  minH := 190; maxH := 230;
  minS := 0; maxS := 8;
  minV := 0; maxV := 100;

  //minH := 340; maxH := 360;
  //minS := 20; maxS := 50;
  //minV := 60; maxV := 90;

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
  end;

  if Aa = ScrollBar1.Max then
  begin
    ResultImage.Picture := Image1.Picture;
    RGB2THRES(ResultImage);
  end;

  Image1.Picture.Assign(Garis);
  Garis.Free;
end;

procedure TForm1.ButtonStopClick(Sender: TObject);
begin
 TimerImage.Enabled := False;
end;

end.
