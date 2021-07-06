unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls, Jpeg, DSPack, dsutil, directshow9,
  TeEngine, Series, TeeProcs, Chart;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    GroupBox1: TGroupBox;
    Image1: TImage;
    ScrollBar1: TScrollBar;
    SAVE: TButton;
    DELETE: TButton;
    HAPUS: TButton;
    EXIT: TButton;
    DBGrid1: TDBGrid;
    OpenDialog1: TOpenDialog;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    FilterGraph1: TFilterGraph;
    SampleGrabber1: TSampleGrabber;
    Filter1: TFilter;
    ComboBox2: TComboBox;
    Start: TButton;
    VideoWindow1: TVideoWindow;
    Capture: TButton;
    Chart1: TChart;
    Series1: TLineSeries;
    Scan: TButton;
    Timer1: TTimer;
    Edit5: TEdit;
    Hitam: TLabel;
    Edit6: TEdit;
    Search: TButton;
    OpenDialog2: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure EXITClick(Sender: TObject);
    procedure HAPUSClick(Sender: TObject);
    procedure DELETEClick(Sender: TObject);
    procedure SAVEClick(Sender: TObject);
    procedure StartClick(Sender: TObject);
    procedure CaptureClick(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ScanClick(Sender: TObject);
    procedure SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  gambar2: TBitmap;
  CapEnum : tsysdevenum;
  Aa,hit,hitam1: integer;
  warna: TColor;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);  //pogram setting connection otomatis=delpi mncari scr otmatis program databasenya
var alamatdb : WideString;
    //aa : Integer;
begin
gambar2:=TBitmap.Create;
ScrollBar1.Max:=Image1.Picture.Height;     //hitungan pembacaan

alamatdb :=ExtractFilePath(Application.ExeName) + 'datasimpan.mdb'; //nama file name
  with ADOConnection1 do             // dari with sampai end adalah program connection ke data base
  begin
    Connected := False;
    LoginPrompt := False;
    Mode := cmShareDenyNone;
    ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' +
    alamatdb + ';Persist Security Info=False';
  end;
  ADOConnection1.Connected := True;
  ADOtable1.Connection:= ADOConnection1;
  ADOtable1.TableName:='data';
  ADOtable1.Active:=true;
  Datasource1.DataSet:= ADOtable1;
  DBGrid1.DataSource:= DataSource1;

end;

procedure TForm1.EXITClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.HAPUSClick(Sender: TObject);
begin
edit1.Text:='';
edit2.Text:='';
edit3.Text:='';
edit4.Text:='0';
combobox1.Text:='';

end;

procedure TForm1.DELETEClick(Sender: TObject);
begin
adotable1.Delete; //menghapus database barisan yang diclick
Showmessage('Data Telah di Hapus');
end;

procedure TForm1.SAVEClick(Sender: TObject);
var
  Jpg: TJPEGImage;
  B1 : TBitmap;
begin
  Jpg := TJPEGImage.Create;
  Jpg.Assign(image1.Picture.Bitmap);
    B1 := TBitmap.Create;
      B1.Assign(jpg);
    Jpg.Assign(B1);

adotable1.Open;
adotable1.Append;
adotable1.FieldByName('Kode').AsString:=edit1.Text;
adotable1.FieldByName('Nama').AsString:=edit2.Text;
adotable1.FieldByName('Jenis Kelamin').AsString:=combobox1.Text;
adotable1.FieldByName('Alamat').AsString:=edit3.Text;
adotable1.FieldByName('Nilai').AsString:=edit4.Text;
adotable1.FieldByName('Gambar').Assign(B1);
adotable1.Post;     //simpan
edit1.Text:='';     //dihapus sampai 0
edit2.Text:='';
edit3.Text:='';
edit4.Text:='0';
combobox1.Text:='';
image1.Picture:=nil;
showmessage('Data Telah Disimpan');

end;

procedure TForm1.StartClick(Sender: TObject);  //membaca kamera yang aktif
var i : integer;
begin
//program pendeteksi kamera
CapEnum:=TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
for i:=0 to CapEnum.CountFilters-1 do
begin
combobox2.Items.Add(CapEnum.Filters[i].FriendlyName);
end;
end;

procedure TForm1.CaptureClick(Sender: TObject);
begin
//program short
samplegrabber1.GetBitmap(Image1.Picture.Bitmap);
ScrollBar1.Enabled := True;
gambar2.Assign(Image1.Picture);
ScrollBar1.Max:=Image1.Picture.Height;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
//menggambil kamera mana yang dipakai/diambil
FilterGraph1.ClearGraph;
FilterGraph1.Active := False;
Filter1.BaseFilter.Moniker :=
capenum.GetMoniker(combobox2.ItemIndex);
FilterGraph1.Active := true;
with FilterGraph1 as ICaptureGraphBuilder2 do
RenderStream(@PIN_CATEGORY_PREVIEW,
nil, Filter1 as IBaseFilter, SampleGrabber1 as
IBaseFilter, VideoWindow1 as
IBaseFilter); FilterGraph1.Play;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
var
  black: byte;
  i, j, lebar: integer;
  warna: TColor;
  garis: TBitmap;

  begin
  Series1.Clear;

  j:=ScrollBar1.Position;
  lebar:=Image1.Picture.Bitmap.Width;
  garis:=TBitmap.Create;
  garis.Assign(gambar2);
  garis.Canvas.MoveTo(0,j);
  garis.Canvas.LineTo(lebar,j);

  for i:=0 to lebar-1 do
begin
  warna:=Image1.Picture.Bitmap.Canvas.Pixels[i,j];
  black:=GetRValue(warna);

  Series1.AddXY(i,black);
  case black of
  0..50:
  begin
  hit :=1;
  hitam1 :=hitam1+hit;
  edit4.Text:=inttostr(hitam1);
  edit6.Text:=inttostr(hitam1);
  
  end;
  end;
end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
Aa:=Aa+1;
ScrollBar1.Position:=Aa;
edit5.Text:=Inttostr(Aa);
end;

procedure TForm1.ScanClick(Sender: TObject);
begin
TIMER1.Enabled:=TRUE;
end;

procedure TForm1.SearchClick(Sender: TObject);
var
open: string;
begin
timer1.Enabled:=false;        //program penormalan nilai
Aa:=0;
edit5.Text:=inttostr(Aa);
hitam1 :=0;
edit6.Text:=inttostr(hitam1);
OpenDialog2.Execute;          // program membuka gambar
open:=OpenDialog2.FileName;
Image1.Picture.LoadFromFile(open);
ScrollBar1.Enabled:= True;
gambar2.Assign(Image1.Picture);
ScrollBar1.Max:=Image1.Picture.Height;
gambar2.Free;
end;

end.
