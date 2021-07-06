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
    VideoWindow1: TVideoWindow;
    FilterGraph1: TFilterGraph;
    Filter1: TFilter;
    SampleGrabber1: TSampleGrabber;
    TimerScan: TTimer;
    SavePictureDialog1: TSavePictureDialog;
    Label1: TLabel;
    ImageCapture: TImage;
    DBChart1: TDBChart;
    Series3: TLineSeries;
    Series1: TLineSeries;
    Series2: TLineSeries;
    ButtonCapture: TButton;
    ButtonOpen: TButton;
    ButtonReset: TButton;
    ButtonExit: TButton;
    ScrollBar1: TScrollBar;
    ComboBox1: TComboBox;
    Label2: TLabel;
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
    ButtonSave: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Init;
    procedure ComboBox1Change(Sender: TObject);
    procedure ButtonCaptureClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure ButtonResetClick(Sender: TObject);
    procedure ButtonOpenClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
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
  DaunMuda, DaunTua, DaunKering: Integer;

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

    if (Hue>=0) and (Hue<=20) and (Sat>=50) and (Sat<=70) and (Val>=40) and (Val<=90) then
    begin
      DaunKering := DaunKering + 1;
    end;

    if (Hue>=340) and (Hue<=360) and (Sat>=20) and (Sat<=50) and (Val>=60) and (Val<=90) then
    begin
      DaunMuda := DaunMuda + 1;
    end;

    if (Hue>=80) and (Hue<=100) and (Sat>=50) and (Sat<=100) and (Val>=20) and (Val<=100) then
    begin
      DaunTua := DaunTua + 1;
    end;
  end;
end;

procedure TForm1.Init;
begin
  Gambar := TBitmap.Create();
  DaunMuda := 0;
  DaunTua := 0;
  DaunKering := 0;
  LabelResult.Caption := 'Hasil Deteksi :';
  
  Aa := 0;
  MaskScan.Text := IntToStr(Aa);
  merah1 := 0;
  MaskRed.Text := IntToStr(merah1);
  hijau1 := 0;
  MaskGreen.Text := IntToStr(hijau1);
  biru1 := 0;
  MaskBlue.Text := IntToStr(biru1);

  if not ImageCapture.Picture.Bitmap.Empty then
  begin
    ScrollBar1.Enabled := True;
    Gambar.Assign(ImageCapture.Picture);
    ScrollBar1.Max := ImageCapture.Picture.Height;
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

procedure TForm1.ButtonCaptureClick(Sender: TObject);
begin
  SampleGrabber1.GetBitmap(ImageCapture.Picture.Bitmap);
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
  ImageCapture.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TForm1.ButtonSaveClick(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
  ImageCapture.Picture.SaveToFile(SavePictureDialog1.FileName);
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
  lebar := ImageCapture.Picture.Bitmap.Width;

  Garis := TBitmap.Create();
  Garis.Assign(Gambar);
  Garis.Canvas.MoveTo(0, j);
  Garis.Canvas.LineTo(lebar, j);

  for i:=0 to lebar-1 do
  begin
    Warna := ImageCapture.Picture.Bitmap.Canvas.Pixels[i, j];
    red := GetRValue(Warna);
    green := GetGValue(Warna);
    blue := GetBValue(Warna);

    Series1.AddXY(i, red);
    Series2.AddXY(i, green);
    Series3.AddXY(i, blue);

    MaskRed.Text := IntToStr(red);
    MaskGreen.Text := IntToStr(green);
    MaskBlue.Text := IntToStr(blue);

    RGB2THRES(ImageCapture, j, i);
  end;

  maxVal := Max(Max(DaunMuda, DaunTua), DaunKering);

  if maxVal = DaunMuda then
  LabelResult.Caption := 'Daun Muda';

  if maxVal = DaunTua then
  LabelResult.Caption := 'Daun Tua';

  if maxVal = DaunKering then
  LabelResult.Caption := 'Daun Kering';

  ImageCapture.Picture.Assign(Garis);
  Garis.Free;
end;

procedure TForm1.ButtonScanClick(Sender: TObject);
begin
  TimerScan.Enabled := True;
  Init();
end;

end.
