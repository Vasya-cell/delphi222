object FormQuestion: TFormQuestion
  Left = 695
  Top = 330
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1087#1088#1080' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1080' '#1080#1084#1077#1085' '#1092#1072#1081#1083#1086#1074
  ClientHeight = 281
  ClientWidth = 511
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 0
    Width = 511
    Height = 199
    Align = alTop
    Caption = #1044#1077#1081#1089#1090#1074#1080#1077
    Items.Strings = (
      #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1089' '#1079#1072#1084#1077#1085#1086#1081
      #1053#1077' '#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
      #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1085#1086' '#1089#1086#1093#1088#1072#1085#1080#1090#1100' '#1086#1073#1072' '#1092#1072#1081#1083#1072' ('#1082' '#1080#1084#1077#1085#1080' '#1076#1086#1073#1072#1074#1080#1090#1089#1103' "(2)")')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 96
    Top = 243
    Width = 97
    Height = 27
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 250
    Top = 243
    Width = 71
    Height = 27
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button2Click
  end
end
