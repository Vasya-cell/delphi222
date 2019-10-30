object FormAbout: TFormAbout
  Left = 489
  Top = 349
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
  ClientHeight = 441
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 20
  object Label1: TLabel
    Left = 0
    Top = 20
    Width = 702
    Height = 20
    Align = alTop
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 0
    Top = 40
    Width = 702
    Height = 273
    Align = alTop
    Alignment = taCenter
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 0
    Top = 0
    Width = 702
    Height = 20
    Align = alTop
    Alignment = taCenter
    Caption = 'Label3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 304
    Top = 368
    Width = 97
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
end
