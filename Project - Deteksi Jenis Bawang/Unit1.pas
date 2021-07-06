unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  DbChart, ExtDlgs, DSPack, DSUtil, DirectShow9, Math;

type
THSV = record
         Hue , Sat , Val : Double;
       end;

type
  TForm1 = class(TForm)
    TimerScan: TTimer;
    Label1: TLabel;
    ImageOpen: TImage;
    DBChart1: TDBChart;
    Series3: TLineSeries;
    Series1: TLineSeries;
    Series2: TLineSeries;
    ButtonOpen: TButton;
    ButtonReset: TButton;
    ButtonExit: TButton;
    ScrollBar1: TScrollBar;
    LabelResult: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MaskRed: TMaskEdit;
    MaskGreen: TMaskEdit;
    MaskBlue: TMaskEdit;
    MaskScan: TMaskEdit;
    ButtonScan: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    Label2: TLabel;
    Label3: TLabel;
    procedure Init;
    procedure ButtonExitClick(Sender: TObject);
    procedure ButtonResetClick(Sender: TObject);
    procedure ButtonOpenClick(Sender: TObject);
    procedure TimerScanTimer(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ButtonScanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CapEnum: TSysDevEnum;
  Gambar: TBitmap;
  Garis: TBitmap;
  Aa: Integer;
  mrh, merah, merah1: Integer;
  hju, hijau, hijau1: Integer;
  bru, biru, biru1: Integer;
  BawangPutih, BawangMerah, BawangBombai: Integer;

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

procedure RGB2THRES(var Image1: TImage;var Height: Integer;var Width: Integer);
var
  PC: PByteArray;
  R,G,B: byte;
  Hue,Sat,Val: Double;
  Result: THSV;
begin
  if Height <= Image1.Picture.Bitmap.Height - 1 then
  begin
    PC := Image1.Picture.Bitmap.ScanLine[Height];
    R := PC[3*Width+2];
    G := PC[3*Width+1];
    B := PC[3*Width];
    Result := RGB2HSV(R,G,B);
    Hue := Result.Hue;
    Sat := Result.Sat;
    Val := Result.Val;

    if (Hue>=0) and (Hue<=50) and (Sat>=0) and (Sat<=50) and (Val>=60) and (Val<=90) then
    begin
      BawangPutih := BawangPutih + 1;
    end;

    if (Hue>=330) and (Hue<=350) and (Sat>=40) and (Sat<=80) and (Val>=50) and (Val<=90) then
    begin
      BawangMerah := BawangMerah + 1;
    end;

    if (Hue>=20) and (Hue<=50) and (Sat>=30) and (Sat<=80) and (Val>=80) and (Val<=100) then
    begin
      BawangBombai := BawangBombai + 1;
    end;
  end;
end;

procedure TForm1.Init;
begin
  Gambar := TBitmap.Create();
  BawangPutih := 0;
  BawangMerah := 0;
  BawangBombai := 0;
  LabelResult.Caption := 'Hasil Deteksi';
  
  Aa := 0;
  MaskScan.Text := IntToStr(Aa);
  merah1 := 0;
  MaskRed.Text := IntToStr(merah1);
  hijau1 := 0;
  MaskGreen.Text := IntToStr(hijau1);
  biru1 := 0;
  MaskBlue.Text := IntToStr(biru1);

  if not ImageOpen.Picture.Bitmap.Empty then
  begin
    ScrollBar1.Enabled := True;
    Gambar.Assign(ImageOpen.Picture);
    ScrollBar1.Max := ImageOpen.Picture.Height;
  end;
end;

procedure TForm1.ButtonExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.ButtonResetClick(Sender: TObject);
begin
  TimerScan.Enabled := False;
  Init();
end;

procedure TForm1.ButtonOpenClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  ImageOpen.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TForm1.TimerScanTimer(Sender: TObject);
begin
 if Aa <= ScrollBar1.Max then
 begin
   Aa := Aa + 1;
   ScrollBar1.Position := Aa;
 end;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
var
  red, green, blue: byte;
  i, j, lebar: Integer;
  Warna: TColor;
  maxVal: Integer;
begin
  Series1.Clear;
  Series2.Clear;
  Series3.Clear;
  j := ScrollBar1.Position;
  MaskScan.Text := IntToStr(j);
  lebar := ImageOpen.Picture.Bitmap.Width;

  Garis := TBitmap.Create();
  Garis.Assign(Gambar);
  Garis.Canvas.MoveTo(0, j);
  Garis.Canvas.LineTo(lebar, j);

  for i:=0 to lebar-1 do
  begin
    Warna := ImageOpen.Picture.Bitmap.Canvas.Pixels[i, j];
    red := GetRValue(Warna);
    green := GetGValue(Warna);
    blue := GetBValue(Warna);

    Series1.AddXY(i, red);
    Series2.AddXY(i, green);
    Series3.AddXY(i, blue);

    MaskRed.Text := IntToStr(red);
    MaskGreen.Text := IntToStr(green);
    MaskBlue.Text := IntToStr(blue);

    RGB2THRES(ImageOpen, j, i);
  end;

  maxVal := Max(Max(BawangPutih, BawangMerah), BawangBombai);

  if maxVal = BawangPutih then
  LabelResult.Caption := 'Bawang Putih';

  if maxVal = BawangMerah then
  LabelResult.Caption := 'Bawang Merah';

  if maxVal = BawangBombai then
  LabelResult.Caption := 'Bawang Bombai';

  ImageOpen.Picture.Assign(Garis);
  Garis.Free;
end;

procedure TForm1.ButtonScanClick(Sender: TObject);
begin
  TimerScan.Enabled := True;
  Init();
end;

end.
