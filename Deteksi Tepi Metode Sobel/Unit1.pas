unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, StdCtrls, DirectShow9, DSUtil,ExtCtrls, DSPack, Math;

type
  TForm1 = class(TForm)
    Image1: TImage;
    SobelImage: TImage;
    OpenButton: TButton;
    Detect2Button: TButton;
    ExitButton: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    VideoWindow1: TVideoWindow;
    StartButton: TButton;
    DetectButton: TButton;
    ComboBox1: TComboBox;
    FilterGraph1: TFilterGraph;
    SampleGrabber1: TSampleGrabber;
    Filter1: TFilter;
    Timer1: TTimer;
    Label7: TLabel;
    StopButton: TButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure OpenButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure Detect2ButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DetectButtonClick(Sender: TObject);
    procedure StopButtonClick(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CapEnum:TSysDevEnum;
  merah,hijau,biru:integer;
  Hue,Sat,Val:Double;

implementation

{$R *.dfm}
procedure RGB2HSV(R,G,B : Byte;out Hue,Sat,Val:Double);
var
  Min_,Max_,Delta : Double;
  H,S,V:Double;
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
      if R=Max_ then
        H:= (G-B)/Delta
      else
        if G= Max_ then
          H:= 2.0 + (B-R)/Delta
        else
          if B=Max_ then
            H:= 4.0+(R-G)/Delta
    end
  else
    H:= -1.0;
  H:=H*60;
  if H<0.0 then H:=H+360.0;
  //with Result Do
    //begin
      Hue := H;
      Sat := S*100/255;
      Val := V*100/255;
    //end;
  end;

procedure BGR2GRAY(var image1,image2:TImage);
var
  PC, PH: PByteArray;
  R,G,B,K:byte;
  x,y:integer;
begin
   for y:=0 to image1.picture.Bitmap.height-1 do
   begin
    PC := Image1.Picture.Bitmap.ScanLine[y];
    PH := Image1.Picture.Bitmap.ScanLine[y];
    for x:=0 to image1.picture.bitmap.width-1 do
    begin
      R := PC[3*x+2];
      G := PC[3*x+1];
      B := PC[3*x];
      K:=Round((R+G+B)/3);
      PH[3*x+2]:= K;
      PH[3*x+1]:= K;
      PH[3*x]:= K;
      end;
      //image2.Picture.Bitmap:=image1.Picture.Bitmap;
    end;
    //image2.Refresh;
end;

procedure Sobel(Image2: TImage);
const sobel : array[0..1,0..2,0..2] of smallint=
  (((-1,0,1),(-2,0,2),(-1,0,1)),
  ((-1,-2,-1),(0,0,0),(1,2,1)));
var
  row:array[0..8] of pbytearray;
  col:pbytearray;
  x,y:smallint;
  i,j,k,p:smallint;
  image:tbitmap;
  sum,jum:longint;
  begin
    p:=-120;
    //BGR2GRAY(image1,image2);
    image:=Tbitmap.Create;
    image.Width := Image2.Picture.Width;
    image.Height := Image2.Picture.Height;
    image.Assign(Image2.Picture.Bitmap);
  for y:=1 to Image2.Height-2 do
  begin
    for i:=-1 to 1 do
    row[i+1]:=image.ScanLine[y+i];
    col:=Image2.Picture.Bitmap.ScanLine[y];
  x:=3;
  repeat
  sum:=0;
  for i:=-1 to 1 do
  for j:=-1 to 1 do
    sum:=sum+(sobel[0,i+1,j+1]*row[i+1,x+j*3]);
    jum:=0;
  for i:=-1 to 1 do
  for j:=-1 to 1 do
    jum:=jum+(sobel[1,i+1,j+1]*row[i+1,x+j*3]);
    sum:=(sum+jum)+p;
  if sum>255 then sum:=255;
  if sum<0 then sum:=0;
  for k:=0 to 2 do col[x+k]:=sum;
    inc(x,3);
  until x>=3*(Image2.Width-4);
  end;
    //Image2.picture.bitmap:=Image1.Picture.Bitmap;
    image2.refresh;
    image.free;
end;

procedure TForm1.OpenButtonClick(Sender: TObject);
begin
  if (OpenPictureDialog1.Execute) then
  begin
    image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;

procedure TForm1.ExitButtonClick(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.Detect2ButtonClick(Sender: TObject);
begin
  BGR2GRAY(image1, SobelImage);
  SobelImage.Picture.Bitmap := Image1.Picture.Bitmap;
  Sobel(SobelImage);
end;
procedure TForm1.FormCreate(Sender: TObject);
var
  i : integer;
begin
  CapEnum := TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
  for i :=0 to CapEnum.CountFilters -1 do
  begin
    combobox1.Items.add(CapEnum.Filters[i].FriendlyName);
  end;
end;
procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  FilterGraph1.ClearGraph;
  FilterGraph1.Active:= false;
  Filter1.BaseFilter.Moniker:= CapEnum.GetMoniker(Combobox1.ItemIndex);
  FilterGraph1.Active :=True;
  with FilterGraph1 as ICaptureGraphBuilder2 do
   RenderStream(@PIN_CATEGORY_PREVIEW, nil,Filter1 as IBaseFilter, SampleGrabber1 as IBaseFilter,
  VideoWindow1 as IBaseFilter);
  FilterGraph1.Play;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Samplegrabber1.GetBitmap(SobelImage.Picture.Bitmap);
  Sobel(SobelImage);
end;

procedure TForm1.DetectButtonClick(Sender: TObject);
begin
  timer1.Enabled:=true;
end;

procedure TForm1.StopButtonClick(Sender: TObject);
begin
  timer1.Enabled:=false;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
RR,GG,BB:byte;
begin
   RR:=GetRValue(image1.Canvas.Pixels[x,y]);
   GG:=GetGValue(image1.Canvas.Pixels[x,y]);
   BB:=GetBValue(image1.Canvas.Pixels[x,y]);
   RGB2HSV(RR,GG,BB,Hue,Sat,Val);
   Hue:=Round(Hue);
   Sat:=Round(Sat);
   Val:=Round(Val);
   label2.Caption:=inttostr(RR);label4.Caption:=inttostr(GG);label6.Caption:=inttostr(BB);
   label9.Caption:=floattostr(Hue);label11.Caption:=floattostr(Sat);label13.Caption:=floattostr(Val);
end;

end.
