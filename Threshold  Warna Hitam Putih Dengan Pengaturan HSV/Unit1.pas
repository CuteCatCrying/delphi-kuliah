unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DirectShow9, DSUtil, DSPack, Math, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    VideoWindow1: TVideoWindow;
    FilterGraph1: TFilterGraph;
    SampleGrabber1: TSampleGrabber;
    Filter1: TFilter;
    Image1: TImage;
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Timer1: TTimer;
    ScrollBar1: TScrollBar;
    Label1: TLabel;
    ScrollBar2: TScrollBar;
    Label2: TLabel;
    ScrollBar3: TScrollBar;
    Label3: TLabel;
    ScrollBar4: TScrollBar;
    Label4: TLabel;
    ScrollBar5: TScrollBar;
    Label5: TLabel;
    ScrollBar6: TScrollBar;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar4Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure ScrollBar5Change(Sender: TObject);
    procedure ScrollBar3Change(Sender: TObject);
    procedure ScrollBar6Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CapEnum:TSysDevEnum;
  maxH,maxS,maxV,minH,minS,minV:byte;


implementation

{$R *.dfm}

procedure RGB2HSV(R,G,B : Byte; out Hue,Sat,Val: Double);
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

procedure BGR2BINER(var image1:Timage);
var
  PC, PH: PByteArray;
  R,G,B,K:byte;
  x,y:integer;
  Hue,Sat,Val:Double;
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
      RGB2HSV(R,G,B,Hue,Sat,Val);
      if (Hue>minH) and (Hue<maxH) or (Sat>minS) and (Sat<maxS) or (Val>minV) and (Val<maxV)then
      begin
        K:=255;
      end
      else
      begin
        K:=0;
      end;
      PH[3*x+2]:= K;
      PH[3*x+1]:= K;
      PH[3*x]:= K;
      end;
    end;
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
  samplegrabber1.GetBitmap(image1.Picture.Bitmap);
  BGR2BINER(image1);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  timer1.Enabled:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  timer1.Enabled:=false;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  minH:=scrollbar1.Position;
  label1.Caption:=inttostr(minH);
end;

procedure TForm1.ScrollBar6Change(Sender: TObject);
begin
  maxV:=scrollbar6.Position;
  label6.Caption:=inttostr(maxV);
end;


procedure TForm1.ScrollBar4Change(Sender: TObject);
begin
  maxH:=scrollbar4.Position;
  label4.Caption:=inttostr(maxH);
end;

procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
  minS:=scrollbar2.Position;
  label2.Caption:=inttostr(minS);
end;

procedure TForm1.ScrollBar5Change(Sender: TObject);
begin
  maxS:=scrollbar5.Position;
  label5.Caption:=inttostr(maxS);
end;

procedure TForm1.ScrollBar3Change(Sender: TObject);
begin
  minV:=scrollbar3.Position;
  label3.Caption:=inttostr(minV);
end;

end.
