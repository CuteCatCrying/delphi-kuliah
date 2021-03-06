unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DSPack, ExtCtrls, TeeProcs, TeEngine, Chart, Mask,
  Series, ExtDlgs, DirectShow9, Math, DSUtil;

type
THSV = record  // hue saturation value (HSV)
         Hue , Sat , Val : Double;
       end;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    VideoWindow1: TVideoWindow;
    ScrollBar1: TScrollBar;
    ButtonCapture: TButton;
    ButtonOpen: TButton;
    ButtonSave: TButton;
    ButtonExit: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ButtonScan: TButton;
    LabelResult: TLabel;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    MaskValue: TMaskEdit;
    FilterGraph1: TFilterGraph;
    Filter1: TFilter;
    SampleGrabber1: TSampleGrabber;
    SavePictureDialog1: TSavePictureDialog;
    TimerScan: TTimer;
    ComboBox1: TComboBox;
    MaskRed: TMaskEdit;
    MaskGreen: TMaskEdit;
    MaskBlue: TMaskEdit;
    ImageCapture: TImage;
    Label8: TLabel;
    ButtonReset: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure Init;
    procedure ComboBox1Change(Sender: TObject);
    procedure ButtonCaptureClick(Sender: TObject);
    procedure TimerScanTimer(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ButtonScanClick(Sender: TObject);
    procedure ButtonResetClick(Sender: TObject);
    procedure ButtonOpenClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
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
  DagingSegar, DagingBusuk: Integer;

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

procedure RGB2THRES(var Image1: Timage;var Height: Integer;var Width: Integer);
var
  PC,PH: PByteArray;
  R,G,B: byte;
  Hue,Sat,Val: Double;
  Result: THSV;
begin
  if Height <= Image1.Picture.Height - 1 then
  begin
    PC := Image1.Picture.Bitmap.ScanLine[Height];
    R := PC[3*Width+2];
    G := PC[3*Width+1];
    B := PC[3*Width];
    Result := RGB2HSV(R,G,B);
    Hue := Result.Hue;
    Sat := Result.Sat;
    Val := Result.Val;

    if (Hue>=340) and (Hue<=360) and (Sat>=55) and (Sat<=100) and (Val>=60) and (Val<=90) then
    DagingSegar := DagingSegar + 1;

    if (Hue>=350) and (Hue<=360) and (Sat>=20) and (Sat<=50) and (Val>=50) and (Val<=80) then
    DagingBusuk := DagingBusuk + 1;
  end;
end;

procedure TForm1.Init;
begin
  Gambar := TBitmap.Create();
  LabelResult.Caption := 'Hasil Deteksi';
  
  Aa := 0;
  MaskValue.Text := IntToStr(Aa);
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
  Init();
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
  MaskValue.Text := IntToStr(j);
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

  maxVal := Max(DagingSegar, DagingBusuk);

  if maxVal = DagingSegar then
  LabelResult.Caption := 'Daging Segar';

  if maxVal = DagingBusuk then
  LabelResult.Caption := 'Daging Busuk';

  ImageCapture.Picture.Assign(Garis);
  Garis.Free;
end;
procedure TForm1.ButtonScanClick(Sender: TObject);
begin
  TimerScan.Enabled := True;
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

  Init();
end;

procedure TForm1.ButtonExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.ButtonSaveClick(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
  ImageCapture.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

end.
