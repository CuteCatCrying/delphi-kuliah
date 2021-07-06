unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DirectShow9, DsUtil, DSPack, ExtCtrls, StdCtrls, Menus, ExtDlgs, DB,
  ADODB, Grids, ComCtrls, TeEngine, Series, TeeProcs, Chart;

type
  TForm1 = class(TForm)
    FilterGraph1: TFilterGraph;
    SampleGrabber1: TSampleGrabber;
    Filter1: TFilter;
    SavePictureDialog1: TSavePictureDialog;
    Timer1: TTimer;
    Shape1: TShape;
    Image1: TImage;
    ButtonScanRGB: TButton;
    ScanEditRGB: TEdit;
    MerahEdit: TEdit;
    HijauEdit: TEdit;
    BiruEdit: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ScrollBar1: TScrollBar;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Button2: TButton;
    Button4: TButton;
    Panel1: TPanel;
    VideoWindow1: TVideoWindow;
    Button5: TButton;
    Label9: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure listingDevice;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);


    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ButtonScanRGBClick(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CapEnum: TSySDevEnum;
  gambar2:TBitmap;
  RGBscan, RGBscan2, stop, stop2: integer;
  mrh,merah,merah1,hju,hijau,hijau1,br,biru,biru1 : integer;
  mrh2,merah2,merah12,hju2,hijau2,hijau12,br2,biru2,biru12 : integer;
  sse: integer;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);

begin
  samplegrabber1.GetBitmap(Image1.Picture.Bitmap);
  timer1.Enabled:=false;
                             //program penormalan nilai
  RGBscan:=0;
  ScanEditRGB.Text:=inttostr(RGBscan);
  merah1 := 0;
  MerahEdit.Text:=inttostr(Merah);
  hijau1 := 0;
  HijauEdit.Text:=inttostr(hijau);
  biru1 := 0;
  BiruEdit.Text:=inttostr(biru1);


  Scrollbar1.Enabled := True;
  Scrollbar1.max:=Image1.Picture.Height;

  stop:=Image1.Picture.Height;
  end;


procedure TForm1.ComboBox1Click(Sender: TObject);
begin
  FilterGraph1.ClearGraph;
  FilterGraph1.Active := false;
  Filter1.BaseFilter.Moniker :=capenum.GetMoniker(combobox1.ItemIndex);
  FilterGraph1.Active := true;
  with FilterGraph1 as ICaptureGraphBuilder2 do
    RenderStream(@PIN_CATEGORY_PREVIEW,nil, Filter1 as IBaseFilter, SampleGrabber1 as IBaseFilter, VideoWindow1 as IbaseFilter);
  FilterGraph1.Play;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  capenum.Free;
  FilterGraph1.ClearGraph;
  FilterGraph1.Active := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  listingDevice;
  timer1.Enabled:=false;


end;

procedure TForm1.listingDevice;
var i: integer;
begin
  CapEnum:=TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
  For i:=0 to CapEnum.CountFilters-1 do
  begin
    combobox1.Items.Add(CapEnum.Filters[i].FriendlyName);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if SavePictureDialog1.Execute then
Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
end;



procedure TForm1.Timer1Timer(Sender: TObject);
begin
RGBscan:=RGBscan+1;
Scrollbar1.Position := RGBscan;
ScanEditRGB.Text := inttostr(RGBscan);
if stop = ScrollBar1.Position then timer1.Enabled:=false;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
RGBscan2:=RGBscan2+1;



end;

procedure TForm1.Button4Click(Sender: TObject);
begin
Application.Terminate;
end;


procedure TForm1.ButtonScanRGBClick(Sender: TObject);
begin
Timer1.Enabled:= True;

end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
var
  red,green,blue:byte;
  i,j,lebar:integer;
  warna:TColor;
  garis:TBitmap;

begin
  Series1.Clear;
  Series2.Clear;
  Series3.Clear;
  j:=Scrollbar1.Position;
  lebar:=image1.Picture.Bitmap.Width;
  garis:=TBitmap.Create;
  garis.Assign(image1.Picture);
  garis.Canvas.MoveTo(0,j);
  garis.Canvas.LineTo(lebar,j);

  for i:=0 to lebar -1 do
begin
warna:=Image1.Picture.Bitmap.Canvas.Pixels[i,j];
red:=GetRValue(warna);
green:=GetGValue(warna);
blue:=GetBValue(warna);
Series1.AddXY(i,red);
Series2.AddXY(i,green);
Series3.AddXY(i,blue);
if (red = 255) or (red = 254) or (red = 253) or (red = 252) or (red = 251) or (red = 250) then
begin
mrh:=0;
merah1 := merah1+mrh;
MerahEdit.Text:=inttostr(merah1);
end
else
begin
mrh:=red;
merah1 := merah1+mrh;
MerahEdit.Text:=inttostr(merah1);
end;

if (green = 255) or (green = 254) or (green = 253) or (green = 252) or (green = 251) or (green = 250) then
begin
hju:=0;
hijau1 := hijau1+hju;
HijauEdit.Text:=inttostr(hijau1);
end
else
begin
hju:=green;
hijau1 := hijau1+hju;
HijauEdit.Text:=inttostr(hijau1);
end;

if (blue = 255) or (blue = 254) or (blue = 253) or (blue = 252) or (blue = 251) or (blue = 250) then
begin
br:=0;
biru1 := biru1+br;
BiruEdit.Text:=inttostr(biru1);
end
else
begin
br:=blue;
biru1 := biru1+br;
BiruEdit.Text:=inttostr(biru1);
end;
  if (biru1 > 42000000) then
  begin
  label2.Font.size:=18;
  label2.Caption:= 'RP. 50.000';
  end

  else if (hijau1 > 33000000) then
  begin
  label2.Font.size:=18;
  label2.Caption:= 'RP. 20.000';
 end

  else if (merah1 > 25000000) then
  begin
  label2.Font.size:=18;
  label2.Caption:= 'RP. 5.000';
  end

  else
  begin
  label2.Caption:= '';
  end;
end;
//  image1.Picture.Assign(garis);
  garis.Free;
end;


/////// data base

procedure TForm1.ScrollBar2Change(Sender: TObject);
var
  red2,green2,blue2:byte;
  i2,j2,lebar2:integer;
  warna2:TColor;
  garis2:TBitmap;

begin
  garis2:=TBitmap.Create;

  garis2.Canvas.MoveTo(0,j2);
  garis2.Canvas.LineTo(lebar2,j2);

  for i2:=0 to lebar2 -1 do
begin

red2:=GetRValue(warna2);
green2:=GetGValue(warna2);
blue2:=GetBValue(warna2);



if (red2 = 255) or (red2 = 254) or (red2 = 253) or (red2 = 252) or (red2 = 251) or (red2 = 250) then
begin
mrh2:=0;
merah12 := merah12+mrh2;

end
else
begin
mrh2:=red2;
merah12 := merah12+mrh2;

end;

if (green2 = 255) or (green2 = 254) or (green2 = 253) or (green2 = 252) or (green2 = 251) or (green2 = 250) then
begin
hju2:=0;
hijau12 := hijau12+hju2;

end
else
begin
hju2:=green2;
hijau12 := hijau12+hju2;

end;

if (blue2 = 255) or (blue2 = 254) or (blue2 = 253) or (blue2 = 252) or (blue2 = 251) or (blue2 = 250) then
begin
br2:=0;
biru12 := biru12+br2;

end
else
begin
br2:=blue2;
biru12 := biru12+br2;

end;
end;
  garis2.Free;
end;


//////



procedure TForm1.Button3Click(Sender: TObject);
var
sse, datamerah, datahijau, databiru:integer;
begin

  datamerah := (merah12) - (merah1);
  datahijau := (hijau12) - (hijau1);
  databiru := (biru12) - (biru1);

  sse := ((datamerah*datamerah)+(datahijau*datahijau)+(databiru*databiru));





  
end;

procedure TForm1.Button5Click(Sender: TObject);

begin
  timer1.Enabled:=false;

                             //program penormalan nilai
  RGBscan:=0;
  ScanEditRGB.Text:=inttostr(RGBscan);
  merah1 := 0;
  MerahEdit.Text:=inttostr(Merah);
  hijau1 := 0;
  HijauEdit.Text:=inttostr(hijau);
  biru1 := 0;
  BiruEdit.Text:=inttostr(biru1);

  RGBscan2:=0;

  merah12 := 0;

  hijau12 := 0;

  biru12 := 0;


  Scrollbar1.Enabled := True;

  Scrollbar1.max:=Image1.Picture.Height;


  stop:=Image1.Picture.Height;



end;


procedure TForm1.Button6Click(Sender: TObject);
begin
if (sse>=-1824275350) and (sse<=-202346719) then

else

end;

end.

