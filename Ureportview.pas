unit Ureportview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RM_Common, RM_Class, RM_e_main, RM_e_Xls, ImgList, ComCtrls,
  ToolWin, RM_Preview, ExtCtrls;

type
  TFreportview = class(TForm)
    pnl1: TPanel;
    rmprvw1: TRMPreview;
    tlb1: TToolBar;
    btn1: TToolButton;
    btn2: TToolButton;
    btn3: TToolButton;
    btn4: TToolButton;
    btn5: TToolButton;
    btn6: TToolButton;
    btn7: TToolButton;
    btn8: TToolButton;
    btn10: TToolButton;
    btn9: TToolButton;
    btn11: TToolButton;
    btn12: TToolButton;
    btn14: TToolButton;
    ImageList1: TImageList;
    dlgOpen1: TOpenDialog;
    dlgSave1: TSaveDialog;
    rmxlsxprt1: TRMXLSExport;
    btn13: TToolButton;
    btn15: TToolButton;
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn15Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Freportview: TFreportview;

implementation

{$R *.dfm}

uses RM_Const, RM_Utils;

procedure TFreportview.btn2Click(Sender: TObject);
begin
rmprvw1.Zoom := 100;
end;

procedure TFreportview.btn13Click(Sender: TObject);
begin
rmprvw1.ExportToXlsFile;
end;

procedure TFreportview.btn3Click(Sender: TObject);
begin
rmprvw1.OnePage;
end;

procedure TFreportview.btn4Click(Sender: TObject);
begin
rmprvw1.PageWidth;
end;

procedure TFreportview.btn6Click(Sender: TObject);
begin
rmprvw1.First;
end;

procedure TFreportview.btn7Click(Sender: TObject);
begin
rmprvw1.Prev;
end;

procedure TFreportview.btn8Click(Sender: TObject);
begin
rmprvw1.Next;
end;

procedure TFreportview.btn9Click(Sender: TObject);
begin
rmprvw1.Last;
end;

procedure TFreportview.btn11Click(Sender: TObject);
begin
  if rmprvw1.Report = nil then
    Exit;

  dlgOpen1.Filter := RMLoadStr(SRepFile) + ' (*.rmp)|*.rmp';
  with dlgOpen1 do
  begin
    if Execute then
      rmprvw1.LoadFromFile(FileName);
  end;
end;

procedure TFreportview.btn12Click(Sender: TObject);
var
  i:Integer;
  s:string;
begin
  if rmprvw1.Report = nil then
    Exit;

  s := RMLoadStr(SRepFile) + ' (*.rmp)|*.rmp';
  for i := 0 to RMFiltersCount - 1 do
    s := s + '|' + RMFilters(i).FilterDesc + '|' +
        RMFilters(i).FilterExt;

  dlgSave1.Filter := s;
  dlgSave1.FilterIndex := 1;
  if dlgSave1.Execute then
  begin
    rmprvw1.SaveToFile(dlgSave1.FileName, dlgSave1.FilterIndex);
  end;
end;


procedure TFreportview.btn15Click(Sender: TObject);
begin
rmprvw1.Print;
end;

end.
