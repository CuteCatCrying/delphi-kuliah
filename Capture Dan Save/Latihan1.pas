unit Latihan1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DSPack, ExtCtrls, dsutil, directshow9, ExtDlgs, Jpeg;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    ComboBox1: TComboBox;
    VideoWindow1: TVideoWindow;
    FilterGraph1: TFilterGraph;
    SampleGrabber1: TSampleGrabber;
    Filter1: TFilter;
    Image1: TImage;
    Image2: TImage;
    SavePictureDialog1: TSavePictureDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  capenum : tsysdevenum;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var i : integer;
begin
Capenum := Tsysdevenum.create(CLSID_VideoInputDeviceCategory);
For i := 0 to capenum.CountFilters-1 do
begin
combobox1.Items.add(capenum.filters[i].friendlyName);
end;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
samplegrabber1.GetBitmap(image1.Picture.bitmap);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if SavePictureDialog1.Execute then
Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
if OpenPictureDialog1.Execute then
Image2.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
FilterGraph1.ClearGraph;
FilterGraph1.Active := False;
Filter1.BaseFilter.Moniker := Capenum.GetMoniker(Combobox1.ItemIndex);
FilterGraph1.Active := True;
with FilterGraph1 as ICaptureGraphBuilder2 do
RenderStream (@PIN_CATEGORY_PREVIEW,
nil, Filter1 as IBaseFilter, SampleGrabber1 as
IBaseFilter, VideoWindow1 as
IBaseFilter); FilterGraph1.Play;
end;

begin

end.
