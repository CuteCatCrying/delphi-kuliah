
//xtreme23ko.blogspot.com


unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DSUtil,DirectShow9, DSPack, StdCtrls, Buttons,
  ComCtrls;

type
  TForm1 = class(TForm)
    FilterGraph1: TFilterGraph;
    SampleGrabber1: TSampleGrabber;
    Filter1: TFilter;
    Timer1: TTimer;
    Panel2: TPanel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    TrackBar1: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    Panel1: TPanel;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox2: TComboBox;
    ScrollBox1: TScrollBox;
    VideoWindow1: TVideoWindow;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
        function  ScaleNotpersen(bitmap: TBitmap; hingin:integer; wingin:integer):Boolean;
    procedure CompareBitmaps(const BitmapA, BitmapB:  TBitmap;var Total, Match, Differ:  INTEGER);

  public
    { Public declarations }
  end;

var
  Form1: TForm1;
    VideoDev: TSysDevEnum;
  VideoMediaTypes: TEnumMediaType;
  photo1,photo2,photo3: Tbitmap;
  xL, yT, xR, yB, xTemp, yTemp: integer;
  Down: boolean;
  mydatetime: TDatetime;
  SaveFile: WideString;
  tanda_motion: string;
implementation

{$R *.dfm}
function  Tform1.ScaleNotpersen(bitmap: TBitmap; hingin:integer; wingin:integer):Boolean;
var
  TmpBmp: Tbitmap;
  Arect: Trect;
begin
  Result:=false;
  try
    TmpBmp:=Tbitmap.Create;
    try
      TmpBmp.Height:=hingin;
      TmpBmp.Width:=wingin;
      Arect:=Rect(0,0,wingin,hingin);
      TmpBmp.Canvas.StretchDraw(Arect,Bitmap);
      Bitmap.Assign(TmpBmp);
    finally
      TmpBmp.Free;
    end;
    Result:=true;
    except
    Result:=false;
  end;
end;

procedure TForm1.CompareBitmaps(const BitmapA, BitmapB:  TBitmap;
                          var Total, Match, Differ:  INTEGER);
Type
  TRGBTripleArray =  Array[WORD] of TRGBTriple;
  pRGBTripleArray =  ^TRGBTripleArray;

var
  i  :  INTEGER;
  j  :  INTEGER;
  rowA:  pRGBTripleArray;
  rowB:  pRGBTripleArray;
  margin: Integer;

begin
  margin:= Trackbar1.Position;  // "rough" sensitivity adjustment

  ASSERT( (BitmapA.width  = BitmapB.width) and
          (BitmapA.height = BitmapB.height),  'Different sizes');

  BitmapA.PixelFormat := pf24bit;
  BitmapB.PixelFormat := pf24bit;

  Total  := BitmapA.width * BitmapA.height;
  Match  := 0;
  Differ := 0;

  if yB < 2 then yB:= BitmapA.height-1;
  if xR < 2 then xR:= BitmapA.width-1;

  for j := yT to yB-1 do
  begin
    rowA := BitmapA.Scanline[j];
    rowB := BitmapB.Scanline[j];

    for i := xL to xR-1 do
    begin
      if  (abs((rowA[i].rgbtRed  - rowB[i].rgbtRed)) < margin)   AND
           (abs((rowA[i].rgbtGreen - rowB[i].rgbtGreen)) < margin)  AND
           (abs((rowA[i].rgbtBlue  - rowB[i].rgbtBlue)) < margin)
      then Inc(Match)
      else Inc(Differ);
      end;

  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var i: integer;
begin
  VideoDev := TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
  for i := 0 to VideoDev.CountFilters - 1 do
    Combobox1.Items.Add(VideoDev.Filters[i].FriendlyName);

  VideoMediaTypes:= TEnumMediaType.Create;
  xL:=20;
  yT:=20;
  xR:=150;
  yB:=110;
  photo1:=Tbitmap.Create;
  photo2:=TBitmap.Create;
  photo3:=TBitmap.Create;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FilterGraph1.Stop;
   FilterGraph1.Active:= False;
   FilterGraph1.ClearGraph;
   photo1.Free;
   photo2.Free;
   photo3.Free;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var
  VideoFormat: TPinList;
  i: integer;
begin
  // matikan timer1
  Timer1.Enabled:=false;
  Image1.Enabled:=false;
  VideoDev.SelectGUIDCategory(CLSID_VideoInputDeviceCategory);
  if ComboBox1.ItemIndex <> -1 then
  begin
    Filter1.BaseFilter.Moniker := VideoDev.GetMoniker(ComboBox1.ItemIndex);
    FilterGraph1.Active := true;
    VideoFormat := TPinList.Create(Filter1 as IBaseFilter);
    ComboBox2.Clear;
    VideoMediaTypes.Assign(VideoFormat.First);
    if (trim(ComboBox1.Text)='Video WebCam') then
      begin
      // tampilkan hanya ukuran gambar saja
       for i:=0 to round((VideoMediaTypes.Count/2)-1) do
       ComboBox2.Items.Add(trim(copy(VideoMediaTypes.MediaDescription[2*i],pos('X',VideoMediaTypes.MediaDescription[2*i])-8,length(VideoMediaTypes.MediaDescription[2*i]))));
      end
      else
      begin
      //tampilkan hanya ukuran gambar saja
       for i:=0 to VideoMediaTypes.Count-1 do
       ComboBox2.Items.Add(trim(copy(VideoMediaTypes.MediaDescription[i],pos('X',VideoMediaTypes.MediaDescription[i])-8,length(VideoMediaTypes.MediaDescription[i]))));
      end;
    //for i := 0 to VideoMediaTypes.Count - 1 do
    //  Combobox2.Items.Add(VideoMediaTypes.MediaDescription[i]);
    FilterGraph1.Active := false;
    VideoFormat.Free;
    ComboBox2.ItemIndex:=0;
    BitBtn1.Enabled:=True
  end;

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var PinList: TPinList;
begin
  if filtergraph1.Active then filtergraph1.Active:=false;
  Filtergraph1.ClearGraph;
  //set ukuran video window
  //VideoWindow1.Width:=strtoint(copy(ComboBox2.Text,pos('X',ComboBox2.text)-3,3));
  //VideoWindow1.Height:=strtoint(copy(ComboBox2.Text,pos('X',ComboBox2.text)+1,3));
  //aktifkan kembali filtergraph
  filtergraph1.Active:=true;
  // configure output Video media type
  if Filter1.FilterGraph <> nil then
  begin
    PinList := TPinList.Create(Filter1 as IBaseFilter);
    if ComboBox2.ItemIndex <> -1 then
      with (PinList.First as IAMStreamConfig) do
        SetFormat(VideoMediaTypes.Items[ComboBox2.ItemIndex].AMMediaType^);
    PinList.Free;
  end;
  // now render streams
  with FilterGraph1 as IcaptureGraphBuilder2 do
  begin
    // Connect Video preview (VideoWindow)
    if Filter1.BaseFilter.DataLength > 0 then
      RenderStream(@PIN_CATEGORY_PREVIEW, nil, Filter1 as IBaseFilter,
        Samplegrabber1 as IBaseFilter , VideoWindow1 as IBaseFilter);
  end;
  FilterGraph1.Play;
  //gambar ke image1 parameter motion detect
  image1.Canvas.Pen.Color := clwhite;
  image1.Canvas.Pen.Mode := pmXOR;
  image1.Canvas.Pen.Style:= psdot;
  image1.Canvas.Brush.Style := bsclear;
  image1.Canvas.Rectangle(xL, yT, xR, yB);
  timer1.Enabled:=true;
  Image1.Enabled:=true;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var   PixelsDiffer:  Integer;
      PixelsMatch :  Integer;
      PixelsTotal :  Integer;
begin
    if photo1.Empty then
    begin
      SampleGrabber1.GetBitmap(photo1);
      ScaleNotpersen(photo1,image1.Height,image1.Width);
      photo1.PixelFormat:= pf24bit;
    end;
    SampleGrabber1.GetBitmap(photo2);
    ScaleNotpersen(photo2,image1.Height,image1.Width);
    photo2.PixelFormat:=pf24bit;
    CompareBitmaps(photo1,photo2,PixelsTotal, PixelsMatch, PixelsDiffer);
    //check if motion is detected
    if(PixelsDiffer > trackbar1.Position) then
    begin
      photo1.Assign(photo2);
      image1.Picture.Bitmap:=photo1;
      shape1.Brush.Color:=clred;
      Label5.Caption:='Detected'
    end
    else
    begin
    Label5.Caption:='';
    shape1.Brush.Color:=clwhite;
    photo1.Assign(photo2);
    image1.Picture.Bitmap:=photo1;
    end;
    image1.Canvas.Pen.Color := clwhite;
    image1.Canvas.Pen.Mode := pmXOR;
    image1.Canvas.Pen.Style:= psdot;
    image1.Canvas.Brush.Style := bsclear;
    image1.Canvas.Rectangle(xL, yT, xR, yB);
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if (Button = mbLeft) then
    begin
      image1.Canvas.Pen.Color := clwhite;
      image1.Canvas.Pen.Mode := pmXOR;
      image1.Canvas.Pen.Style:= psdot;
      image1.Canvas.Brush.Style := bsclear;
      image1.Canvas.Rectangle(xL, yT, xR, yB);
      xL := X;
      yT := Y;
      xTemp := xL;
      yTemp := yT;
      Down := True;
      timer1.Enabled:=false;
    end;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if (Down) then
    begin
      image1.Canvas.Pen.Color := clwhite;
      image1.Canvas.Pen.Mode := pmXOR;
      image1.Canvas.Pen.Style:= psdot;
      image1.Canvas.Brush.Style := bsClear;
      image1.Canvas.Rectangle(xL, yT, xTemp, yTemp);
      if (X < 0) then
        xTemp := 0
      else if (X >= image1.Width) then
        xTemp := image1.Width-1
      else
        xTemp := X;
      if (Y < 0) then
        yTemp := 0
      else if (Y >= image1.Height) then
        yTemp := image1.Height-1
      else
        yTemp := Y;
      image1.Canvas.Rectangle(xL, yT, X, Y);
    end;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if ( Button = mbLeft ) then
    begin
      if (X < 0) then
        xR := 0
      else if (X >= image1.Width) then
        xR := image1.Width-1
      else
        xR := X;
      if (Y < 0) then
        yB := 0
      else if (Y >= image1.Height) then
        yB := image1.Height-1
      else
        yB := Y;
      Down := False;
      if (xR < xL) then
        begin
          xTemp := xL;
          xL := xR;
          xR := xTemp;
        end;
      if (yB < yT) then
        begin
          yTemp := yT;
          yT := yB;
          yB := yTemp;
        end;
    end;
      timer1.Enabled:=true;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  VideoDev.Free;
  VideoMediaTypes.Free;
end;

end.
