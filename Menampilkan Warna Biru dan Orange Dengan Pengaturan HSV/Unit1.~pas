unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DSPack, StdCtrls, Buttons, DirectShow9, DSUtil, Math,
  ComCtrls;

type
THSV = record  // hue saturation value (HSV)
         Hue , Sat , Val : Double;
       end;

type
  TForm1 = class(TForm)
    VideoWindow1: TVideoWindow;
    Image1: TImage;
    ButtonBlue: TButton;
    ButtonOrange: TButton;
    ButtonToBiner: TButton;
    ComboBox1: TComboBox;
    FilterGraph1: TFilterGraph;
    SampleGrabber1: TSampleGrabber;
    Filter1: TFilter;
    TimerConvert: TTimer;
    LabelHMin: TLabel;
    LabelSMin: TLabel;
    LabelVMin: TLabel;
    LabelHMax: TLabel;
    LabelSMax: TLabel;
    LabelVMax: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ScrollBarSMin: TScrollBar;
    ScrollBarVMin: TScrollBar;
    ScrollBarSMax: TScrollBar;
    ScrollBarVMax: TScrollBar;
    ButtonYellow: TButton;
    ButtonGreen: TButton;
    ButtonRed: TButton;
    ScrollBarHMin: TScrollBar;
    ScrollBarHMax: TScrollBar;
    TimerBiner: TTimer;
    ButtonToRGB: TButton;
    procedure FormCreate(Sender: TObject);
    procedure UpdateValue;
    procedure ComboBox1Change(Sender: TObject);
    procedure TimerConvertTimer(Sender: TObject);
    procedure ButtonBlueClick(Sender: TObject);
    procedure ScrollBarSMinChange(Sender: TObject);
    procedure ScrollBarSMaxChange(Sender: TObject);
    procedure ScrollBarVMinChange(Sender: TObject);
    procedure ScrollBarVMaxChange(Sender: TObject);
    procedure ButtonYellowClick(Sender: TObject);
    procedure ButtonOrangeClick(Sender: TObject);
    procedure ButtonGreenClick(Sender: TObject);
    procedure ScrollBarHMinChange(Sender: TObject);
    procedure ScrollBarHMaxChange(Sender: TObject);
    procedure ButtonRedClick(Sender: TObject);
    procedure TimerBinerTimer(Sender: TObject);
    procedure ButtonToBinerClick(Sender: TObject);
    procedure ButtonToRGBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CapEnum: TSysDevEnum;
  maxH,maxS,maxV,minH,minS,minV: Integer;

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

procedure RGB2Biner(Image1: TImage);
var
  PC,PH: PByteArray;
  R,G,B,K: byte;
  x,y: Integer;
  Hue,Sat,Val: Double;
  Result: THSV;
begin
 for y:=0 to Image1.Picture.Bitmap.Height-1 do
   begin
    PC := Image1.Picture.Bitmap.ScanLine[y];
    PH := Image1.Picture.Bitmap.ScanLine[y];
    for x:=0 to Image1.Picture.Bitmap.Width-1 do
      begin
        R := PC[3*x+2];
        G := PC[3*x+1];
        B := PC[3*x];
        Result := RGB2HSV(R,G,B);
        Hue := Result.Hue;
        Sat := Result.Sat;
        Val := Result.Val;

        if (Hue>=minH) and (Hue<=maxH) and (Sat>=minS) and (Sat<=maxS) and (Val>=minV) and (Val<=maxV) then
        K := 255
        else
        K := 0;

        PH[3*x+2]:= K;
        PH[3*x+1]:= K;
        PH[3*x]:= K;
      end;
   end;
end;

procedure RGB2THRES(var Image1: Timage);
var
  PC,PH: PByteArray;
  R,G,B: byte;
  x,y: Integer;
  Hue,Sat,Val: Double;
  Result: THSV;
begin
 for y:=0 to Image1.Picture.Bitmap.Height-1 do
   begin
    PC := Image1.Picture.Bitmap.ScanLine[y];
    PH := Image1.Picture.Bitmap.ScanLine[y];
    for x:=0 to Image1.Picture.Bitmap.Width-1 do
      begin
        R := PC[3*x+2];
        G := PC[3*x+1];
        B := PC[3*x];
        Result := RGB2HSV(R,G,B);
        Hue := Result.Hue;
        Sat := Result.Sat;
        Val := Result.Val;

        if (Hue>=minH) and (Hue<=maxH) and (Sat>=minS) and (Sat<=maxS) and (Val>=minV) and (Val<=maxV) then
        begin
          PH[3*x+2]:= R;
          PH[3*x+1]:= G;
          PH[3*x]:= B;
        end
        else
        begin
          PH[3*x+2]:= 0;
          PH[3*x+1]:= 0;
          PH[3*x]:= 0;
        end;
      end;
   end;
end;

procedure TForm1.UpdateValue;
begin
  LabelHMin.Caption := IntToStr(minH);
  LabelHMax.Caption := IntToStr(maxH);
  LabelSMin.Caption := IntToStr(minS);
  LabelSMax.Caption := IntToStr(maxS);
  LabelVMin.Caption := IntToStr(minV);
  LabelVMax.Caption := IntToStr(maxV);
  ScrollBarHMin.Position := minH;
  ScrollBarHMax.Position := maxH;
  ScrollBarSMin.Position := minS;
  ScrollBarSMax.Position := maxS;
  ScrollBarVMin.Position := minV;
  ScrollBarVMax.Position := maxV;
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

  TimerConvert.Enabled := True;
end;

procedure TForm1.TimerConvertTimer(Sender: TObject);
begin
  SampleGrabber1.GetBitmap(Image1.Picture.Bitmap);
  RGB2THRES(Image1);
end;

procedure TForm1.TimerBinerTimer(Sender: TObject);
begin
  SampleGrabber1.GetBitmap(Image1.Picture.Bitmap);
  RGB2Biner(Image1);
end;

procedure TForm1.ScrollBarHMinChange(Sender: TObject);
begin
  minH := ScrollBarHMin.Position;
  LabelHMin.Caption := IntToStr(minH);
end;

procedure TForm1.ScrollBarHMaxChange(Sender: TObject);
begin
  maxH := ScrollBarHMax.Position;
  LabelHMax.Caption := IntToStr(maxH);
end;

procedure TForm1.ScrollBarSMinChange(Sender: TObject);
begin
  minS := ScrollBarSMin.Position;
  LabelSMin.Caption := IntToStr(minS);
end;

procedure TForm1.ScrollBarSMaxChange(Sender: TObject);
begin
  maxS := ScrollBarSMax.Position;
  LabelSMax.Caption := IntToStr(maxS);
end;

procedure TForm1.ScrollBarVMinChange(Sender: TObject);
begin
  minV := ScrollBarVMin.Position;
  LabelVMin.Caption := IntToStr(minV);
end;

procedure TForm1.ScrollBarVMaxChange(Sender: TObject);
begin
  maxV := ScrollBarVMax.Position;
  LabelVMax.Caption := IntToStr(maxV);
end;

procedure TForm1.ButtonBlueClick(Sender: TObject);
begin
  minH := 190; maxH := 255;
  minS := 0; maxS := 100;
  minV := 0; maxV := 100;
  UpdateValue();
end;

procedure TForm1.ButtonYellowClick(Sender: TObject);
begin
  minH := 30; maxH := 60;
  minS := 0; maxS := 100;
  minV := 0; maxV := 100;
  UpdateValue();
end;

procedure TForm1.ButtonOrangeClick(Sender: TObject);
begin
  minH := 0; maxH := 30;
  minS := 0; maxS := 100;
  minV := 0; maxV := 100;
  UpdateValue();
end;

procedure TForm1.ButtonGreenClick(Sender: TObject);
begin
  minH := 70; maxH := 120;
  minS := 0; maxS := 100;
  minV := 0; maxV := 100;
  UpdateValue();
end;

procedure TForm1.ButtonRedClick(Sender: TObject);
begin
  minH := 320; maxH := 360;
  minS := 0; maxS := 100;
  minV := 0; maxV := 100;
  UpdateValue();
end;

procedure TForm1.ButtonToBinerClick(Sender: TObject);
begin
  TimerConvert.Enabled := False;
  TimerBiner.Enabled := True;
end;

procedure TForm1.ButtonToRGBClick(Sender: TObject);
begin
  TimerConvert.Enabled := True;
  TimerBiner.Enabled := False;
end;

end.
