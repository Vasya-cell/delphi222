object FormQuestion: TFormQuestion
  Left = 688
  Top = 244
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1087#1088#1080' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1080' '#1080#1084#1077#1085' '#1092#1072#1081#1083#1086#1074
  ClientHeight = 351
  ClientWidth = 590
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 20
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 0
    Width = 590
    Height = 249
    Align = alTop
    Caption = #1044#1077#1081#1089#1090#1074#1080#1077
    Items.Strings = (
      #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1089' '#1079#1072#1084#1077#1085#1086#1081
      #1053#1077' '#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
      #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1085#1086' '#1089#1086#1093#1088#1072#1085#1080#1090#1100' '#1086#1073#1072' '#1092#1072#1081#1083#1072' ('#1082' '#1080#1084#1077#1085#1080' '#1076#1086#1073#1072#1074#1080#1090#1089#1103' "(2)")')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 120
    Top = 304
    Width = 121
    Height = 33
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 312
    Top = 304
    Width = 89
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button2Click
  end
end