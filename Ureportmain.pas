unit Ureportmain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RM_System, RM_Common, RM_Class, StdCtrls,
  RM_GridReport, AdvCombo, ComCtrls, Buttons, DateUtils, DB, ADODB,Typinfo,
  RM_Dataset;

type
  ReportType=(inware,outware,stock1,elderinfo,elderfee,cashier,accident);
  TFreportmain = class(TForm)
    pnl1: TPanel;
    rmreport1: TRMReport;
    grp1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    edit1: TEdit;
    combobox1: TComboBox;
    combobox2: TComboBox;
    datetimepicker1: TDateTimePicker;
    datetimepicker2: TDateTimePicker;
    btn10: TButton;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    pnl2: TPanel;
    rmds1: TRMDBDataSet;
    qry1: TADOQuery;
    qry2: TADOQuery;
    rmds2: TRMDBDataSet;
    qry3: TADOQuery;
    rmds3: TRMDBDataSet;
    qry4: TADOQuery;
    rmds4: TRMDBDataSet;
    qry5: TADOQuery;
    rmds5: TRMDBDataSet;
    qry6: TADOQuery;
    rmds6: TRMDBDataSet;
    qry7: TADOQuery;
    rmds7: TRMDBDataSet;
    tmr1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure combobox1Select(Sender: TObject);
    procedure combobox2Select(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    whatreport:ReportType;
  end;

var
  Freportmain: TFreportmain;

implementation

uses  Ureportview, main, UDM;

{$R *.dfm}

procedure TFreportmain.FormShow(Sender: TObject);
begin
  freportmain.Width := 906;
  freportmain.Height := 665;
  Freportview:=TFreportview.create(freportmain.pnl2);
  Freportview.Parent:=freportmain.pnl2;
  Freportview.Align:=alClient;
  rmreport1.Preview:=Freportview.rmprvw1;
  Freportview.Show;
  btn10.Click;
end;


procedure TFreportmain.btn6Click(Sender: TObject);
begin
  rmreport1.PrintReport;
end;

procedure TFreportmain.btn7Click(Sender: TObject);
begin
Freportview.btn13.Click;
end;

procedure TFreportmain.btn8Click(Sender: TObject);
var
  i:integer;
begin
  i:=fmain.pagecontrol1.ActivePageIndex;
  fmain.pagecontrol1.ActivePageIndex:=0;
  fmain.pagecontrol1.Pages[i].TabVisible:=false;
end;

procedure TFreportmain.FormCreate(Sender: TObject);
var
  i:integer;
  m:integer;
begin
  combobox1.ItemIndex:=0;
  edit1.Text:=inttostr(yearof(now));
  m:=monthof(now);
  for i:=1 to m do
    combobox2.Items.Add(inttostr(i)+'月');
  combobox2.ItemIndex:=m-1;
  DateTimePicker1.Date:=StartOfTheMonth(now);
  DateTimePicker2.Date:=endOfTheMonth(now);
end;

procedure TFreportmain.combobox1Select(Sender: TObject);
var
  m,i:integer;
begin
  combobox2.Items.Clear;
  if combobox1.ItemIndex=0 then
  begin
    m:=monthof(now);
    for i:=1 to m do
      combobox2.Items.Add(inttostr(i)+'月');
      combobox2.ItemIndex:=m-1;
      DateTimePicker1.Date:=StartOfTheMonth(now);
      DateTimePicker2.Date:=endOfTheMonth(now);
      exit;
  end;
  if combobox1.ItemIndex=1 then
  begin
    m:=weekof(now);
    for i:=1 to m do
      combobox2.Items.Add(inttostr(i)+'周');
      combobox2.ItemIndex:=m-1;
      DateTimePicker1.Date:=StartOfTheweek(now);
      DateTimePicker2.Date:=endOfTheweek(now);
      exit;
  end;
end;

procedure TFreportmain.combobox2Select(Sender: TObject);
var
 y,m:integer;
begin
  y:=strtoint(edit1.Text);
  if combobox1.ItemIndex=0 then
  begin
    m:=strtoint(copy(combobox2.Text,1,length(combobox2.Text)-2));
    DateTimePicker1.Date:=StartOfAMonth(y,m);
    DateTimePicker2.Date:=endOfAMonth(y,m);
    exit;
  end;
  if combobox1.ItemIndex=1 then
  begin
    m:=strtoint(copy(combobox2.Text,1,length(combobox2.Text)-2));
    DateTimePicker1.Date:=StartOfAWeek(y,m);
    DateTimePicker2.Date:=endOfAWeek(y,m);
    exit;
  end;
end;

procedure TFreportmain.btn10Click(Sender: TObject);
var
  rmffile,sqlstr:string;
//  qry1:TADOQuery;
//  rmds1:TRMDBDataSet;
begin
//  qry1:=TADOQuery.Create(nil);
//  rmds1:=TRMDBDataSet.Create(nil);
//  rmds1.DataSet:=qry1;
//  qry1.Connection:=dm.ADOConn_Mysql;
//  tmr1.Enabled:=true;
  case whatreport  of
     inware:
     begin
       sqlstr:='';rmffile:='';
       rmffile:='inware.rmf';
       sqlstr:='select * from bom_in_d where format(inware_date,"yyyy-MM-dd") between :d1 and :d2 order by whse_id,inware_date desc';
       qry1.Close;
      qry1.SQL.Clear;
      qry1.SQL.Add(sqlstr);
      qry1.parameters.ParamByName('d1').Value:=formatdatetime('yyyy-mm-dd',DateTimePicker1.date);
      qry1.parameters.ParamByName('d2').Value:=formatdatetime('yyyy-mm-dd',DateTimePicker2.date);
      qry1.Open;
     end;
     outware:
     begin
       sqlstr:='';rmffile:='';
       rmffile:='outware.rmf';
       sqlstr:='select *   from bom_out_d where format(out_date,"yyyy-MM-dd") between :d1 and :d2 order by whse_id,out_date desc';
       qry2.Close;
      qry2.SQL.Clear;
      qry2.SQL.Add(sqlstr);
      qry2.parameters.ParamByName('d1').Value:=formatdatetime('yyyy-mm-dd',DateTimePicker1.date);
      qry2.parameters.ParamByName('d2').Value:=formatdatetime('yyyy-mm-dd',DateTimePicker2.date);
      qry2.Open;
     end;
     stock1:
     begin
       sqlstr:='';rmffile:='';
       rmffile:='stock_d';
       sqlstr:='select * from stock_d where format(in_date,"yyyy-MM-dd") between :d1 and :d2 order by whse_id,cat_id desc';
       qry3.Close;
      qry3.SQL.Clear;
      qry3.SQL.Add(sqlstr);
      qry3.parameters.ParamByName('d1').Value:=formatdatetime('yyyy-mm-dd',DateTimePicker1.date);
      qry3.parameters.ParamByName('d2').Value:=formatdatetime('yyyy-mm-dd',DateTimePicker2.date);
      qry3.Open;
     end;
     elderfee:
     begin
       sqlstr:='';rmffile:='';
       rmffile:='elderfeetable.rmf';
       sqlstr:='select elder_name,con_code,'+'sum(iif(`fee_type`=0,1,)) as record0,sum(iif(`fee_type`=0,`fee_sum`,)) as fee0,min(iif(`fee_type`=0,`start_date`,)) as mindate0,max(iif(`fee_type`=0,`end_date`,)) as maxdate0,'+'sum(iif(`fee_type`=1,1,)) as record1,sum(iif(`fee_type`=1,`fee_sum`,)) as fee1,'+'sum(iif(`fee_type`=2,1,)) as record2,sum(iif(`fee_type`=2,`fee_sum`,)) as fee2,'+' sum(iif(`fee_type`=3,1,)) as record3,sum(iif(`fee_type`=3,`fee_sum`,)) as fee3,'+'sum(iif(`fee_type`=4,1,)) as record4,sum(iif(`fee_type`=4,`fee_sum`,)) as fee4,sum(fee_sum) as allfee'+' from elder_handin_all where format(input_date,"yyyy-MM-dd") between :d1 and :d2 group by elder_name,con_code ';
       qry4.Close;
      qry4.SQL.Clear;
      qry4.SQL.Add(sqlstr);
      qry4.parameters.ParamByName('d1').Value:=formatdatetime('yyyy-mm-dd',DateTimePicker1.date);
      qry4.parameters.ParamByName('d2').Value:=formatdatetime('yyyy-mm-dd',DateTimePicker2.date);
      qry4.Open;
     end;
     elderinfo:
     begin
       sqlstr:='';rmffile:='';
       rmffile:='elderdetail.rmf';
       sqlstr:='select * from elder_base_info where format(input_date,"yyyy-MM-dd") between :d1 and :d2 order by instate ';
       qry5.Close;
      qry5.SQL.Clear;
      qry5.SQL.Add(sqlstr);
      qry5.parameters.ParamByName('d1').Value:=formatdatetime('yyyy-mm-dd',DateTimePicker1.date);
      qry5.parameters.ParamByName('d2').Value:=formatdatetime('yyyy-mm-dd',DateTimePicker2.date);
      qry5.Open;
     end;
     cashier:
     begin
       sqlstr:='';rmffile:='';
       rmffile:='cash.rmf';
       sqlstr:='select  a.id,a.in_date,project,IIF(payway=1,"现金",IIf(payway=2,"刷卡",iif(payway=3,"老人银行银行","转帐"))) AS pay,'+'c_debit,c_credit,c_blance,b_debit,b_credit,b_blance,a.remark,b.name from z_recivepay a,dict_op b where a.input_id=b.id and format(a.in_date,"yyyy-MM-dd") between :d1 and :d2';
       qry6.Close;
       qry6.SQL.Clear;
       qry6.SQL.Add(sqlstr);
       qry6.parameters.ParamByName('d1').Value:=formatdatetime('yyyy-mm-dd',DateTimePicker1.date);
       qry6.parameters.ParamByName('d2').Value:=formatdatetime('yyyy-mm-dd',DateTimePicker2.date);
       qry6.Open;
     end;
     accident:
     begin
       sqlstr:='';rmffile:='';
       rmffile:='accident.rmf';
       sqlstr:='select  id,tend_memo,input_date,elder_name,con_code,tend_date,duty_man,';
       sqlstr:=sqlstr+'iif(health_memo=0,"突发病",iif(health_memo=1,"骨折",iif(health_memo=2,"烫伤",iif(health_memo=3,"碰伤",iif(health_memo=4,"褥疮","其它"))))) as healthmemoname from accident_record';
       sqlstr:=sqlstr+' where format(input_date,"yyyy-MM-dd") between :d1 and :d2 order by input_date';
       qry7.Close;
       qry7.SQL.Clear;
       qry7.SQL.Add(sqlstr);
       qry7.parameters.ParamByName('d1').Value:=formatdatetime('yyyy-MM-dd',DateTimePicker1.date);
       qry7.parameters.ParamByName('d2').Value:=formatdatetime('yyyy-MM-dd',DateTimePicker2.date);
       qry7.Open;
     end;
     else
     begin
       ShowMessage('没有找到');Exit;
     end;
  end;
  rmreport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'报表\'+rmffile);
  rmreport1.ShowReport;

end;

procedure TFreportmain.tmr1Timer(Sender: TObject);
var
  p:PTypeInfo;
  i:Integer;
begin
   p:=TypeInfo(ReportType);
   if Ord(whatreport)<GetTypeData(p)^.MaxValue then
   begin
     whatreport:=succ(whatreport);
   end
   else
   whatreport:=inware;
   btn10.click;
end;

end.
