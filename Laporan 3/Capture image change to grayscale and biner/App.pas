unit App;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ExtDlgs, DSPack, DSutil, DirectShow9;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    Button2: TButton;
    Button3: TButton;
    Image1: TImage;
    Image2: TImage;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    VideoWindow1: TVideoWindow;
    Filter1: TFilter;
    SampleGrabber1: TSampleGrabber;
    FilterGraph1: TFilterGraph;
    SavePictureDialog1: TSavePictureDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    Button7: TButton;
    Button8: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Capenum: TSysDevEnum;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
 i: integer;
begin
  ComboBox1.Items.Clear;
  Capenum := TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
  for i := 0 to Capenum.CountFilters-1 do
    begin
      ComboBox1.Items.Add(Capenum.Filters[i].FriendlyName);
    end;
end;


procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  FilterGraph1.ClearGraph;
  FilterGraph1.Active := False;
  Filter1.BaseFilter.Moniker := Capenum.GetMoniker(ComboBox1.ItemIndex);
  FilterGraph1.Active := True;
  with FilterGraph1 as ICaptureGraphBuilder2 do
    RenderStream(@PIN_CATEGORY_PREVIEW,
    nil, Filter1 as IBaseFilter, SampleGrabber1 as IBaseFilter,
    VideoWindow1 as IBaseFilter);
    FilterGraph1.Play;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  SampleGrabber1.GetBitmap(Image1.Picture.Bitmap);
  SampleGrabber1.GetBitmap(Image2.Picture.Bitmap);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if(SavePictureDialog1.Execute) then
  Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if(OpenPictureDialog1.Execute) then
  Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  Image2.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TForm1.Button5Click(Sender: TObject);
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

procedure TForm1.Button6Click(Sender: TObject);
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

procedure TForm1.Button3Click(Sender: TObject);
begin
  Application.Terminate
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  if (SavePictureDialog1.Execute) then
  Image2.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

end.
