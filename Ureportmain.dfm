object Freportmain: TFreportmain
  Left = 391
  Top = 200
  Width = 882
  Height = 508
  Caption = 'Freportmain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 874
    Height = 41
    Align = alTop
    TabOrder = 0
    object grp1: TGroupBox
      Left = 1
      Top = 1
      Width = 480
      Height = 39
      Align = alLeft
      Caption = #26597#35810#26465#20214
      TabOrder = 0
      object Label2: TLabel
        Left = 72
        Top = 16
        Width = 25
        Height = 13
        AutoSize = False
        Caption = #24180
      end
      object Label1: TLabel
        Left = 88
        Top = 16
        Width = 32
        Height = 13
        AutoSize = False
        Caption = #21608#26399
      end
      object Label3: TLabel
        Left = 224
        Top = 16
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #26085#26399#33539#22260
      end
      object edit1: TEdit
        Left = 8
        Top = 16
        Width = 57
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object combobox1: TComboBox
        Left = 120
        Top = 16
        Width = 57
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnSelect = combobox1Select
        Items.Strings = (
          #26376
          #21608)
      end
      object combobox2: TComboBox
        Left = 176
        Top = 16
        Width = 49
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnSelect = combobox2Select
      end
      object datetimepicker1: TDateTimePicker
        Left = 288
        Top = 16
        Width = 89
        Height = 21
        Date = 40568.409182939810000000
        Time = 40568.409182939810000000
        TabOrder = 3
      end
      object datetimepicker2: TDateTimePicker
        Left = 384
        Top = 16
        Width = 89
        Height = 21
        Date = 40568.409249305560000000
        Time = 40568.409249305560000000
        TabOrder = 4
      end
    end
    object btn10: TButton
      Left = 488
      Top = 8
      Width = 65
      Height = 25
      Caption = #21047#26032
      TabOrder = 1
      OnClick = btn10Click
    end
    object btn6: TButton
      Left = 560
      Top = 8
      Width = 75
      Height = 25
      Caption = #25171#21360
      TabOrder = 2
      OnClick = btn6Click
    end
    object btn7: TButton
      Left = 640
      Top = 8
      Width = 75
      Height = 25
      Caption = #23548#20986
      TabOrder = 3
      OnClick = btn7Click
    end
    object btn8: TButton
      Left = 728
      Top = 8
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 4
      OnClick = btn8Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 41
    Width = 874
    Height = 433
    Align = alClient
    TabOrder = 1
  end
  object rmreport1: TRMReport
    ThreadPrepareReport = True
    InitialZoom = pzDefault
    PreviewButtons = [rmpbZoom, rmpbLoad, rmpbSave, rmpbPrint, rmpbFind, rmpbPageSetup, rmpbExit, rmpbExport, rmpbNavigator]
    DefaultCollate = False
    SaveReportOptions.RegistryPath = 'Software\ReportMachine\ReportSettings\'
    Preview = Freportview.rmprvw1
    PreviewOptions.RulerUnit = rmutScreenPixels
    PreviewOptions.RulerVisible = False
    PreviewOptions.DrawBorder = False
    PreviewOptions.BorderPen.Color = clGray
    PreviewOptions.BorderPen.Style = psDash
    CompressLevel = rmzcFastest
    CompressThread = False
    LaterBuildEvents = True
    OnlyOwnerDataSet = False
    Left = 816
    Top = 8
    ReportData = {}
  end
  object rmds1: TRMDBDataSet
    Visible = True
    DataSet = qry1
    Left = 824
    Top = 48
  end
  object qry1: TADOQuery
    Active = True
    Connection = DM.ADOConn_Mysql
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from bom_in_d order by whse_id,inware_date desc')
    Left = 792
    Top = 48
  end
  object qry2: TADOQuery
    Active = True
    Connection = DM.ADOConn_Mysql
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select *   from bom_out_d  order by whse_id,out_date desc')
    Left = 792
    Top = 80
  end
  object rmds2: TRMDBDataSet
    Visible = True
    DataSet = qry2
    Left = 824
    Top = 80
  end
  object qry3: TADOQuery
    Connection = DM.ADOConn_Mysql
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from stock_d  order by whse_id,cat_id desc')
    Left = 792
    Top = 112
  end
  object rmds3: TRMDBDataSet
    Visible = True
    DataSet = qry3
    Left = 824
    Top = 112
  end
  object qry4: TADOQuery
    Connection = DM.ADOConn_Mysql
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select elder_name,con_code,sum(iif(`fee_type`=0,1,)) as record0,' +
        'sum(iif(`fee_type`=0,`fee_sum`,)) as fee0,min(iif(`fee_type`=0,`' +
        'start_date`,)) as mindate0,max(iif(`fee_type`=0,`end_date`,)) as' +
        ' maxdate0,sum(iif(`fee_type`=1,1,)) as record1,sum(iif(`fee_type' +
        '`=1,`fee_sum`,)) as fee1,sum(iif(`fee_type`=2,1,)) as record2,su' +
        'm(iif(`fee_type`=2,`fee_sum`,)) as fee2, sum(iif(`fee_type`=3,1,' +
        ')) as record3,sum(iif(`fee_type`=3,`fee_sum`,)) as fee3,sum(iif(' +
        '`fee_type`=4,1,)) as record4,sum(iif(`fee_type`=4,`fee_sum`,)) a' +
        's fee4,sum(fee_sum) as allfee from elder_handin_all')
    Left = 792
    Top = 144
  end
  object rmds4: TRMDBDataSet
    Visible = True
    DataSet = qry4
    Left = 824
    Top = 144
  end
  object qry5: TADOQuery
    Active = True
    Connection = DM.ADOConn_Mysql
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from elder_base_info order by instate')
    Left = 792
    Top = 176
  end
  object rmds5: TRMDBDataSet
    Visible = True
    DataSet = qry5
    Left = 824
    Top = 176
  end
  object qry6: TADOQuery
    Connection = DM.ADOConn_Mysql
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select  a.id,a.in_date,project,IIF(payway=1,"'#29616#37329'",IIf(payway=2,"'#21047 +
        #21345'",iif(payway=3,"'#32769#20154#38134#34892#38134#34892'","'#36716#24080'"))) AS pay,c_debit,c_credit,c_blanc' +
        'e,b_debit,b_credit,b_blance,a.remark,b.name from z_recivepay a,d' +
        'ict_op b where a.input_id=b.id')
    Left = 792
    Top = 208
  end
  object rmds6: TRMDBDataSet
    Visible = True
    DataSet = qry6
    Left = 824
    Top = 208
  end
  object qry7: TADOQuery
    Active = True
    Connection = DM.ADOConn_Mysql
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select  id,tend_memo,input_date,elder_name,con_code,tend_date,du' +
        'ty_man,iif(health_memo=0,"'#31361#21457#30149'",iif(health_memo=1,"'#39592#25240'",iif(health' +
        '_memo=2,"'#28907#20260'",iif(health_memo=3,"'#30896#20260'",iif(health_memo=4,"'#35109#30126'","'#20854#23427'")' +
        ')))) as healthmemoname from accident_record')
    Left = 792
    Top = 240
  end
  object rmds7: TRMDBDataSet
    Visible = True
    DataSet = qry7
    Left = 824
    Top = 240
  end
  object tmr1: TTimer
    Interval = 3000
    OnTimer = tmr1Timer
    Left = 464
    Top = 88
  end
end
