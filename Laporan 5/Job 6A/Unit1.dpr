unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ExtDlgs, DSPack;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    TrackBar1: TTrackBar;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    Label2: TLabel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    SavePictureDialog1: TSavePictureDialog;
    SampleGrabber1: TSampleGrabber;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  threshold : integer;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
if (OpenPictureDialog1.Execute) then
begin
Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
Image2.Picture := Image1.Picture;
end
end;

procedure TForm1.Button2Click(Sender: TObject);
var
PC, PH: PByteArray;
x, y:  integer;
R, G, B, K: byte;
threshold : integer;
begin
for y:=0 to Image1.Picture.Height-1 do
begin
  PC := Image1.Picture.Bitmap.ScanLine[y];
  PH := Image2.Picture.Bitmap.ScanLine[y];
for x:=0 to Image1.Picture.Width-1 do
begin
    R := PC[3*x+2];
    G := PC[3*x+1];
    B := PC[3*x];
    K := Round((R+G+B)/3);
    PH[3*x+2] := K;
    PH[3*x+1] := K;
    PH[3*x] := K;

end;
Image2.Refresh;
end;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);

var
PC, PH: PByteArray;
x, y:  integer;
R, G, B, K, a: byte;
threshold : integer;
begin
for y:=0 to Image1.Picture.Height-1 do
begin
  PC := Image1.Picture.Bitmap.ScanLine[y];
  PH := Image2.Picture.Bitmap.ScanLine[y];
for x:=0 to Image1.Picture.Width-1 do
begin
    R := PC[3*x+2];
    G := PC[3*x+1];
    B := PC[3*x];
    K := Round((R+G+B)/3);

if K>=Trackbar1.Position  then
begin
a:=68;
end
else
a:=255;

    PH[3*x+2] := a;
    PH[3*x+1] := a;
    PH[3*x] := a;
end;
end;
label1.Caption:=IntToStr(K);
label1.Refresh;
Image2.Refresh;
end;



procedure TForm1.Button3Click(Sender: TObject);
var
PC, PH : PByteArray;
x,y : integer;
R,G,B,K : byte;
begin
for y:=0 to Image1.Picture.Height-1 do
  begin
  PC :=Image1.Picture.Bitmap.ScanLine[y];
  PH :=Image2.Picture.Bitmap.ScanLine[y];
    for x:=0 to Image1.Picture.Width-1 do
    begin
    R:=PC[3*x+2];
    G:=PC[3*x+1];
    B:=PC[3*x];
    K:= Round(0.299*R+0.114*G+0.587*B);
    if K<128 then K :=0
    else
    K :=255;
    PH[3*x+2] := K;
    PH[3*x+1] := K;
    PH[3*x] := K;
    end;
  end;
  Image2.Refresh;
end;




procedure TForm1.TrackBar2Change(Sender: TObject);
var
PC, PX : PByteArray;
x,y : integer;
R,G,B,K,s : byte;
begin
for y:=0 to Image1.Picture.Height-1 do
  begin
  PC :=Image1.Picture.Bitmap.ScanLine[y];
  PX :=Image2.Picture.Bitmap.ScanLine[y];
    for x:=0 to Image1.Picture.Width-1 do
    begin
    R:=PC[3*x+2];
    G:=PC[3*x+1];
    B:=PC[3*x];
    K:= Round(0.299*R+0.114*G+0.587*B);
    if K<128 then K :=0
    else
    K :=255;
    PX[3*x+2] := K;
    PX[3*x+1] := K;
    PX[3*x] := K;

if K>=Trackbar1.Position  then
begin
s:=255;
end
else
s:=1;

    PX[3*x+2] := s;
    PX[3*x+1] := s;
    PX[3*x] := s;
end;

Image2.Refresh;
end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 if SavePictureDialog1.Execute then
Image2.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
   Image1.Picture:=nil;
   Image2.Picture:=nil;
end;

end.
