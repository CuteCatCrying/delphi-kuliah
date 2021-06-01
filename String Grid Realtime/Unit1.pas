unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, DSPack, StdCtrls, DirectShow9, DSUtil, Math,
  ExtDlgs, Grids;

type
  TForm1 = class(TForm)
    MainVideo: TVideoWindow;
    MainImage: TImage;
    ComboBox1: TComboBox;
    FilterGraph1: TFilterGraph;
    SampleGrabber1: TSampleGrabber;
    Filter1: TFilter;
    OriginalTimer: TTimer;
    GrayscaleTimer: TTimer;
    BinaryTimer: TTimer;
    GrayscaleButton: TButton;
    OriginalButton: TButton;
    BinaryButton: TButton;
    Label2: TLabel;
    StringGrid: TStringGrid;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    SavePictureDialog1: TSavePictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure OriginalTimerTimer(Sender: TObject);
    procedure GrayscaleButtonClick(Sender: TObject);
    procedure GrayscaleTimerTimer(Sender: TObject);
    procedure OriginalButtonClick(Sender: TObject);
    procedure BinaryTimerTimer(Sender: TObject);
    procedure BinaryButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CapEnum: TSysDevEnum;

implementation

{$R *.dfm}

procedure ToOriginalImage(var TargetImage: Timage);
var
  PC,PH: PByteArray;
  R,G,B: byte;
  x,y: integer;
begin
  for y:=0 to TargetImage.picture.Bitmap.height-1 do
  begin
    PC := TargetImage.Picture.Bitmap.ScanLine[y];
    PH := TargetImage.Picture.Bitmap.ScanLine[y];
    for x:=0 to TargetImage.picture.bitmap.width-1 do
    begin
      R := PC[3*x+2];
      G := PC[3*x+1];
      B := PC[3*x];

      PH[3*x+2]:= R;
      PH[3*x+1]:= G;
      PH[3*x]:= B;
      end;
    end;
end;

procedure ToGrayscaleImage(var TargetImage: Timage);
var
  PC,PH: PByteArray;
  R,G,B,K: byte;
  x,y: integer;
begin
  for y:=0 to TargetImage.picture.Bitmap.height-1 do
  begin
    PC := TargetImage.Picture.Bitmap.ScanLine[y];
    PH := TargetImage.Picture.Bitmap.ScanLine[y];
    for x:=0 to TargetImage.picture.bitmap.width-1 do
    begin
      R := PC[3*x+2];
      G := PC[3*x+1];
      B := PC[3*x];

      K := Round((R+G+B)/3);
      PH[3*x+2]:= K;
      PH[3*x+1]:= K;
      PH[3*x]:= K;
      end;
    end;
end;

procedure ToBinaryImage(TargetImage: Timage);
var
  PC,PH: PByteArray;
  x,y: integer;
  R,G,B,K: byte;
begin
  for y := 0 to TargetImage.Picture.Height-1 do
    begin
      PC := TargetImage.Picture.Bitmap.ScanLine[y];
      PH := TargetImage.Picture.Bitmap.ScanLine[y];
      for x := 0 to TargetImage.Picture.Width-1 do
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
end;

procedure ToDomainSpasial(TargetImage: TImage; TargetGrid: TStringGrid);
var
  PC: PByteArray;
  x, y: integer;
  R, G, B: byte;
begin
  TargetGrid.RowCount := TargetImage.Picture.Width;
  TargetGrid.ColCount := TargetImage.Picture.Height;

  for y:=0 to TargetImage.Picture.Height-1 do
  begin
    PC := TargetImage.Picture.Bitmap.ScanLine[y];

    for x:=0 to TargetImage.Picture.Width-1 do
    begin
      R := PC[3*x+2];
      G := PC[3*x+1];
      B := PC[3*x];

      TargetGrid.Cells[(y+1), (3*x+2)] := IntToStr(R);
      TargetGrid.Cells[(y+1), (3*x+1)] := IntToStr(G);
      TargetGrid.Cells[(y+1), (3*x)] := IntToStr(B);
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
    ComboBox1.Items.Add(CapEnum.Filters[i].FriendlyName);
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
  MainVideo as IBaseFilter);

  FilterGraph1.Play;
  OriginalTimer.Enabled := True;
end;

procedure TForm1.OriginalTimerTimer(Sender: TObject);
begin
  SampleGrabber1.GetBitmap(MainImage.Picture.Bitmap);
  ToOriginalImage(MainImage);
end;

procedure TForm1.GrayscaleTimerTimer(Sender: TObject);
begin
  SampleGrabber1.GetBitmap(MainImage.Picture.Bitmap);
  ToGrayscaleImage(MainImage);
  ToDomainSpasial(MainImage, StringGrid);
end;

procedure TForm1.BinaryTimerTimer(Sender: TObject);
begin
  SampleGrabber1.GetBitmap(MainImage.Picture.Bitmap);
  ToBinaryImage(MainImage);
  ToDomainSpasial(MainImage, StringGrid);
end;

procedure TForm1.OriginalButtonClick(Sender: TObject);
begin
  GrayscaleTimer.Enabled := False;
  BinaryTimer.Enabled := False;
  OriginalTimer.Enabled := True;
end;

procedure TForm1.GrayscaleButtonClick(Sender: TObject);
begin
  OriginalTimer.Enabled := False;
  BinaryTimer.Enabled := False;
  GrayscaleTimer.Enabled := True;
end;

procedure TForm1.BinaryButtonClick(Sender: TObject);
begin
  OriginalTimer.Enabled := False;
  GrayscaleTimer.Enabled := False;
  BinaryTimer.Enabled := True;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  OriginalTimer.Enabled := False;
  GrayscaleTimer.Enabled := False;
  BinaryTimer.Enabled := False;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
  MainImage.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

end.
