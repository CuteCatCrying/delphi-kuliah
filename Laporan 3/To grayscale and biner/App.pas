unit App;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtDlgs, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    Label1: TLabel;
    Label2: TLabel;
    TrackBar1: TTrackBar;
    Image1: TImage;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if(OpenPictureDialog1.Execute) then
    begin
      Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
      Image2.Picture := Image1.Picture;
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  PC,PH: PByteArray;
  x,y: integer;
  R,G,B,K: byte;
begin
  for y:= 0 to Image1.Picture.Height-1 do
    begin
      PC := Image1.Picture.Bitmap.ScanLine[y];
      PH := Image2.Picture.Bitmap.ScanLine[y];
      for x:= 0 to Image1.Picture.Width-1 do
        begin
          R := PC[3*x + 2];
          G := PC[3*x + 1];
          B := PC[3*x];
          K := Round((R+G+B)/3);
          PH[3*x + 2] := K;
          PH[3*x + 1] := K;
          PH[3*x] := K;
        end;
    end;
    Image2.Refresh;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
var
  threshold: integer;
begin
  threshold := TrackBar1.Position;
  Label2.Caption := IntToStr(threshold);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  PC,PH: PByteArray;
  x,xx,y,yy: integer;
  R,G,B,K: byte;
begin
  for y := 0 to Image1.Picture.Height-1 do
    begin
      PC := Image1.Picture.Bitmap.ScanLine[y];
      PH := Image2.Picture.Bitmap.ScanLine[y];
      for x := 0 to Image1.Picture.Width-1 do
        begin
          R := PC[3*x + 2];
          G := PC[3*x + 1];
          B := PC[3*x];
          K := Round(0.299*R + 0.114*G + 0.587*B);
          if K < 128 then K := 0
          else K := 255;

          PH[3*x + 2] := K;
          PH[3*x + 1] := K;
          PH[3*x] := K;
        end;
    end;
    Image2.Refresh;
end;

end.
