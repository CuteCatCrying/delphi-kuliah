unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ExtDlgs, ComCtrls;

type
  TForm1 = class(TForm)
    ButtonMuatCitra: TButton;
    ButtonRerata: TButton;
    ButtonNTSC: TButton;
    Image1: TImage;
    Image2: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    Timer1: TTimer;
    Button1: TButton;
    procedure ButtonMuatCitraClick(Sender: TObject);
    procedure ButtonRerataClick(Sender: TObject);
    procedure ButtonNTSCClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

procedure TForm1.ButtonMuatCitraClick(Sender: TObject);
begin
  if (OpenPictureDialog1.Execute) then
    begin
      Image1.Picture.LoadFromFile(
        OpenPictureDialog1.FileName);
      Image2.Picture := Image1.Picture;
    end
end;

procedure TForm1.ButtonRerataClick(Sender: TObject);
var
  PC, PH: PByteArray;
  x, y: integer;
  R, G, B, K: byte;
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
    end;
  Image2.Refresh;
end;

procedure TForm1.ButtonNTSCClick(Sender: TObject);
var
  PC, PH: PByteArray;
  x, y: integer;
  R, G, B, K: byte;
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
          K := Round(0.299*R+0.114*G+0.587*B);
          if K < 128 then K := 0
          else
          K := 255;
          PH[3*x+2] := K;
          PH[3*x+1] := K;
          PH[3*x] := K;
        end;
    end;
  Image2.Refresh;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  Close ();
end;

end.
