unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DSPack, ExtCtrls, dsutil, directshow9;

type
  TForm1 = class(TForm)
    Image1: TImage;
    VideoWindow1: TVideoWindow;
    FilterGraph1: TFilterGraph;
    SampleGrabber1: TSampleGrabber;
    Filter1: TFilter;
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
var
filename : String;
begin
samplegrabber1.GetBitmap(image1.Picture.bitmap);
// Save to file
filename := 'Hasil capture';
image1.Picture.SaveToFile('D:\' + filename + '.jpg');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
application.Terminate;
end;

end.
