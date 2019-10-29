object MainForm: TMainForm
  Left = 299
  Top = 136
  Width = 1279
  Height = 840
  Caption = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1077' '#1076#1083#1103' '#1088#1072#1073#1086#1090#1099' '#1089' '#1092#1072#1081#1083#1072#1084#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 1263
    Height = 66
    Align = alTop
    TabOrder = 0
    object Label5: TLabel
      Left = 150
      Top = 1
      Width = 1112
      Height = 64
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 'Label5'
      WordWrap = True
    end
    object RadioGroup1: TRadioGroup
      Left = 1
      Top = 1
      Width = 149
      Height = 64
      Align = alLeft
      Caption = #1056#1077#1078#1080#1084' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103
      Items.Strings = (
        #1050#1072#1090#1072#1083#1086#1075#1080' '#1080' '#1092#1072#1081#1083#1099
        #1044#1080#1089#1082#1080)
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 66
    Width = 1263
    Height = 715
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077
      object Splitter3: TSplitter
        Left = 600
        Top = 0
        Height = 683
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 600
        Height = 683
        Align = alLeft
        Caption = 'Panel2'
        Constraints.MinWidth = 600
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 301
          Top = 1
          Width = 2
          Height = 681
        end
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 300
          Height = 681
          Align = alLeft
          Caption = 'Panel3'
          Constraints.MinWidth = 300
          TabOrder = 0
          object ListView1: TListView
            Left = 1
            Top = 85
            Width = 298
            Height = 548
            Align = alClient
            Columns = <>
            MultiSelect = True
            ReadOnly = True
            TabOrder = 0
            ViewStyle = vsList
            OnClick = ListView1Click
            OnDblClick = ListView1DblClick
          end
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 298
            Height = 84
            Align = alTop
            TabOrder = 1
            object Label1: TLabel
              Left = 89
              Top = 9
              Width = 32
              Height = 17
              Caption = #1044#1080#1089#1082
            end
            object LDirectoryLabel: TLabel
              Left = 1
              Top = 65
              Width = 296
              Height = 18
              Align = alBottom
              Caption = 'LDirectoryLabel'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object LLvsego: TLabel
              Left = 168
              Top = 6
              Width = 41
              Height = 17
              Caption = #1042#1089#1077#1075#1086':'
            end
            object LLZanyato: TLabel
              Left = 168
              Top = 26
              Width = 50
              Height = 17
              Caption = #1047#1072#1085#1103#1090#1086':'
            end
            object LLFree: TLabel
              Left = 168
              Top = 45
              Width = 69
              Height = 17
              Caption = #1057#1074#1086#1073#1086#1076#1085#1086':'
            end
            object DirUpButton: TButton
              Left = 28
              Top = 6
              Width = 59
              Height = 21
              Caption = #1053#1072#1079#1072#1076
              TabOrder = 0
              OnClick = DirUpButtonClick
            end
            object ComboBox1: TComboBox
              Left = 121
              Top = 6
              Width = 47
              Height = 25
              Style = csDropDownList
              ItemHeight = 17
              TabOrder = 1
              OnChange = ComboBox1Change
            end
            object Button2: TButton
              Left = 6
              Top = 40
              Width = 85
              Height = 21
              Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
              TabOrder = 2
              OnClick = Button2Click
            end
            object Button4: TButton
              Left = 97
              Top = 40
              Width = 66
              Height = 21
              Caption = #1059#1076#1072#1083#1080#1090#1100
              TabOrder = 3
              OnClick = Button4Click
            end
            object btn_refresh: TBitBtn
              Left = 2
              Top = 6
              Width = 25
              Height = 27
              TabOrder = 4
              OnClick = btn_refreshClick
              Glyph.Data = {
                EA070000424DEA070000000000003600000028000000160000001D0000000100
                180000000000B407000000000000000000000000000000000000C8D0D4C8D0D4
                C8D0D4C8D0D4C8D1D5C8D1D5B1B4B7BBC2C6C8D0D4C8D0D4C8D0D4C8D0D4C8D0
                D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0
                D4C8D0D4C8D0D4C8D0D4C9D4D9A59890705E53A3A8A9C8D1D5C8D0D4C8D0D4C8
                D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
                0000C8D0D4C8D0D4C8D0D4C9D3D8BEBFBEB0785662422F8F9495C8D1D5CAD2D6
                C9D1D5C8D0D4C8D0D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
                D4C8D0D40000C8D0D4C8D0D4C8D1D6C3CED4BB9680C3663164351A747476B5BF
                C3B7C1C5B6BEC3BBC4C9C1C9CEC6CFD3C9D1D6C9D1D5C8D0D4C8D0D4C8D0D4C8
                D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C7D0D4BAACA4C4794CC7642A7F401C5F
                4D427A706A7A6B627468627C746F82818094999CAFB7BBBFC7CBC8D0D4C8D0D4
                C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C9D4D9C3BFBBC18762C76930C16128
                A6542283421A803F1B833C137B3C1673361461351C583F30635D59868A8CB5BD
                C1C6CFD3C9D1D5C8D0D4C8D0D4C8D0D40000C8D1D6C0C9CEBF9E83CA7737C46B
                28BD6526B76226B55F24B65F25B75F26B95F25B65B25A7532091471A713C1B62
                4838747271A3A9ADC2CACEC8D0D4C8D0D4C8D0D40000C4CCD2B8AA9CC48243CD
                7625C37125C06D25BF6C25C06B25C06B25C36B26C46C25C36A27C46927C76926
                C3672A9E592A64462F6A6562A2A8ACC5CDD2C9D1D5C8D0D40000C6C5C0CEAA7C
                D79543CC8025C77A21C67A23C67925C87824C47626C78038D19963D39F70D59D
                6CDFA36DE4A065DF995EBD834E7C5E3D6F6B66ABB2B7C8D0D4C8D0D40000CCCB
                C0E5CB9AF0CE93E4B671D39234CE831ACD8420D08320AB7E2D9E8F76B2ADA6CC
                C9C1C1B8AEB9B2A8DBC5B1E4C3A3F1C08BCA9A5E78603E898B8ABEC6CBC9D0D4
                0000C6CDCFC1C2BBCFC7ABEAD5A7EED297E9C075DEA13CD9921E9D7F1F728877
                C1C9D2C8D1D5C4CBD0C0C9CECAD0D3C9CCCDCDC5BCE1C6A8D1AA6F887A5CA2A7
                AAC6CED30000C7CFD4C5CED3C1C8CABFC2BFD5CBABEFD9A3F9DD9EF1C673BE91
                2152784CC5CBD4C9D2D6C8D0D4C8D0D5C7D0D4C7CFD4C4CDD2BBC1C3D8C7B0B9
                996A969285BFC8CD0000C8D0D4C8D0D4C7D0D4C6CFD4C5CDD1C0C5C6B8B39AE5
                D29EFFE5AA97B46EA4ABB1C9D1D6C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7D0D5
                BFC9CDCDB195A89A8BBEC6CA0000C8D0D4C8D0D4C8D0D4C8D0D4C7D0D4C8D0D6
                BFC9D0BBBEBDD6C9A8CDBA749FA4A6CAD3D8CAD2D7C9D1D5C8D0D4C8D0D4C8D0
                D4C8D0D4C8D1D6BFC6CBBCC2C7C6CDD20000C8D0D4C8D1D5C8D0D4C8D0D4C8D0
                D4C8D0D4C8D0D5C8D1D6C7D2DABAC2CCCAD2D6BAC2C6B4BDC3C3CCD1CAD2D7C9
                D1D5C8D0D4C8D0D4C8D0D4C8D1D5C9D1D5C8D0D40000C6CED1BCC2C5BEC6CBC9
                D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CAD2D7C0C7CABF9A77797259959A9D
                B3BBC1C3CBD1C9D1D6C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000CBC4B6AC9471
                959795BBC4C9C8D1D5C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C2CCD2DAC796E5AB
                1596741B756C50888988A6AFB5BDC6CCC8D0D5C9D1D5C8D0D4C8D0D40000D0CF
                C3CFB17998845E8D908FB0B9BDC3CBD0C8D0D4C9D1D5C8D0D4C9D1D5C8D2D7BE
                BEB7EFBB3FE2A91FC09018907128776D518E9088A8AEB2BBC4C9C6CED3C8D0D4
                0000C3CBD0D3C9AFD0AB69886D40736E638C8F90ABB2B6B7C0C6C1CBD1C1CAD0
                C4CFD5C0C6CAD8AF65E0A12BDC9920D99C1DC08C15906D1E746540818176A2A7
                AAC4CBCF0000C5CED4C4C8C7DFCAA6D8AC6B997340795F3E7E705C847A6E928B
                838D878098948FA29387C18B4ED9912AD28B23D28D22D18E22CB8C1EB57F1789
                6A28837F73BCC4C80000C8D0D4C3CDD2C5C4C0E5C9A8E7AF76CA8744AA6A2995
                591F874E1983511E87531F9E5B1EC57525CB7D25C97D24C97F24CA8024CD8324
                CF8520B58637A49E8DC2CACF0000C8D0D4C9D1D5BFC6CBC6C4BFE2C5ABE7A97A
                D68343C56C29BC6623B96621BD6922C06D23C36F24C27024C06F25C17225C474
                23C77724BF7C30AD9676BBC0C1C8D0D50000C8D0D4C8D0D4C8D0D5C3CCD1C3C4
                C3D7BEAEDE9D76D0814FC06B34BE642ABF6426BD6326BA6223BA6324B96424BD
                6725C26A24BD6E2AA07A54B2B3B1C8D1D7C8D0D40000C8D0D4C8D0D4C8D0D4C8
                D0D4C1CBCFC6CACDC5B9B1C2A694CE9979CB8963C97F53C4784CC07648C47F54
                C17240BE632ABD6226A96D44A19A92C0C8CDC9D1D6C8D0D40000C8D0D4C8D0D4
                C8D0D4C8D0D4C8D0D4C7D0D5C2CCD0BFC5C8BEB9B6B4AAA3BEAA9FBAA496B5A4
                9AC6B2A7D29A7AC56A36AF5C2DA28676BAC2C6C9D1D6C8D0D4C8D0D40000C8D0
                D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7D0D4C4CDD1C1CACFC4CCD0C4
                CBCEC3CCD1C8CCCED7B39DC7784B976E55ACAFAFC9D2D7C8D0D4C8D0D4C8D0D4
                0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D5
                C8D0D5C8D0D5C8D1D5CAD1D4D9BEADC186659A928BC1CBD0C9D1D5C8D0D4C8D0
                D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
                D4C8D0D4C8D0D4C8D0D4C7D0D4C7CFD3CDBEB5C3AB9DB8C2C8C9D2D6C8D0D4C8
                D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
                D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7CFD3BDC2C4B9BEC2CAD3D7C8D0D4
                C8D0D4C8D0D4C8D0D4C8D0D40000}
              Margin = 0
            end
          end
          object StatusBar1: TStatusBar
            Left = 1
            Top = 650
            Width = 298
            Height = 30
            Panels = <
              item
                Text = #1060#1072#1081#1083':'
                Width = 50
              end>
          end
          object ProgressBar1: TProgressBar
            Left = 1
            Top = 633
            Width = 298
            Height = 17
            Align = alBottom
            TabOrder = 3
          end
        end
        object Panel4: TPanel
          Left = 303
          Top = 1
          Width = 296
          Height = 681
          Align = alClient
          Caption = 'Panel4'
          Constraints.MinWidth = 300
          TabOrder = 1
          object StatusBar2: TStatusBar
            Left = 1
            Top = 650
            Width = 294
            Height = 30
            Panels = <
              item
                Text = #1060#1072#1081#1083':'
                Width = 50
              end>
          end
          object Panel7: TPanel
            Left = 1
            Top = 1
            Width = 294
            Height = 84
            Align = alTop
            TabOrder = 1
            object Label2: TLabel
              Left = 89
              Top = 9
              Width = 32
              Height = 17
              Caption = #1044#1080#1089#1082
            end
            object RDirectoryLabel: TLabel
              Left = 1
              Top = 65
              Width = 292
              Height = 18
              Align = alBottom
              Caption = 'rDirectoryLabel'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object RLVsego: TLabel
              Left = 168
              Top = 6
              Width = 41
              Height = 17
              Caption = #1042#1089#1077#1075#1086':'
            end
            object RLZanyato: TLabel
              Left = 168
              Top = 26
              Width = 50
              Height = 17
              Caption = #1047#1072#1085#1103#1090#1086':'
            end
            object RLFree: TLabel
              Left = 168
              Top = 45
              Width = 69
              Height = 17
              Caption = #1057#1074#1086#1073#1086#1076#1085#1086':'
            end
            object Button1: TButton
              Left = 28
              Top = 6
              Width = 59
              Height = 21
              Caption = #1053#1072#1079#1072#1076
              TabOrder = 0
              OnClick = Button1Click
            end
            object ComboBox2: TComboBox
              Left = 121
              Top = 6
              Width = 47
              Height = 25
              Style = csDropDownList
              ItemHeight = 17
              TabOrder = 1
              OnChange = ComboBox2Change
            end
            object Button3: TButton
              Left = 6
              Top = 40
              Width = 85
              Height = 21
              Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
              TabOrder = 2
              OnClick = Button3Click
            end
            object Button5: TButton
              Left = 97
              Top = 40
              Width = 66
              Height = 21
              Caption = #1059#1076#1072#1083#1080#1090#1100
              TabOrder = 3
              OnClick = Button5Click
            end
            object BitBtn2: TBitBtn
              Left = 2
              Top = 6
              Width = 25
              Height = 27
              TabOrder = 4
              OnClick = BitBtn2Click
              Glyph.Data = {
                EA070000424DEA070000000000003600000028000000160000001D0000000100
                180000000000B407000000000000000000000000000000000000C8D0D4C8D0D4
                C8D0D4C8D0D4C8D1D5C8D1D5B1B4B7BBC2C6C8D0D4C8D0D4C8D0D4C8D0D4C8D0
                D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0
                D4C8D0D4C8D0D4C8D0D4C9D4D9A59890705E53A3A8A9C8D1D5C8D0D4C8D0D4C8
                D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
                0000C8D0D4C8D0D4C8D0D4C9D3D8BEBFBEB0785662422F8F9495C8D1D5CAD2D6
                C9D1D5C8D0D4C8D0D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
                D4C8D0D40000C8D0D4C8D0D4C8D1D6C3CED4BB9680C3663164351A747476B5BF
                C3B7C1C5B6BEC3BBC4C9C1C9CEC6CFD3C9D1D6C9D1D5C8D0D4C8D0D4C8D0D4C8
                D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C7D0D4BAACA4C4794CC7642A7F401C5F
                4D427A706A7A6B627468627C746F82818094999CAFB7BBBFC7CBC8D0D4C8D0D4
                C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C9D4D9C3BFBBC18762C76930C16128
                A6542283421A803F1B833C137B3C1673361461351C583F30635D59868A8CB5BD
                C1C6CFD3C9D1D5C8D0D4C8D0D4C8D0D40000C8D1D6C0C9CEBF9E83CA7737C46B
                28BD6526B76226B55F24B65F25B75F26B95F25B65B25A7532091471A713C1B62
                4838747271A3A9ADC2CACEC8D0D4C8D0D4C8D0D40000C4CCD2B8AA9CC48243CD
                7625C37125C06D25BF6C25C06B25C06B25C36B26C46C25C36A27C46927C76926
                C3672A9E592A64462F6A6562A2A8ACC5CDD2C9D1D5C8D0D40000C6C5C0CEAA7C
                D79543CC8025C77A21C67A23C67925C87824C47626C78038D19963D39F70D59D
                6CDFA36DE4A065DF995EBD834E7C5E3D6F6B66ABB2B7C8D0D4C8D0D40000CCCB
                C0E5CB9AF0CE93E4B671D39234CE831ACD8420D08320AB7E2D9E8F76B2ADA6CC
                C9C1C1B8AEB9B2A8DBC5B1E4C3A3F1C08BCA9A5E78603E898B8ABEC6CBC9D0D4
                0000C6CDCFC1C2BBCFC7ABEAD5A7EED297E9C075DEA13CD9921E9D7F1F728877
                C1C9D2C8D1D5C4CBD0C0C9CECAD0D3C9CCCDCDC5BCE1C6A8D1AA6F887A5CA2A7
                AAC6CED30000C7CFD4C5CED3C1C8CABFC2BFD5CBABEFD9A3F9DD9EF1C673BE91
                2152784CC5CBD4C9D2D6C8D0D4C8D0D5C7D0D4C7CFD4C4CDD2BBC1C3D8C7B0B9
                996A969285BFC8CD0000C8D0D4C8D0D4C7D0D4C6CFD4C5CDD1C0C5C6B8B39AE5
                D29EFFE5AA97B46EA4ABB1C9D1D6C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7D0D5
                BFC9CDCDB195A89A8BBEC6CA0000C8D0D4C8D0D4C8D0D4C8D0D4C7D0D4C8D0D6
                BFC9D0BBBEBDD6C9A8CDBA749FA4A6CAD3D8CAD2D7C9D1D5C8D0D4C8D0D4C8D0
                D4C8D0D4C8D1D6BFC6CBBCC2C7C6CDD20000C8D0D4C8D1D5C8D0D4C8D0D4C8D0
                D4C8D0D4C8D0D5C8D1D6C7D2DABAC2CCCAD2D6BAC2C6B4BDC3C3CCD1CAD2D7C9
                D1D5C8D0D4C8D0D4C8D0D4C8D1D5C9D1D5C8D0D40000C6CED1BCC2C5BEC6CBC9
                D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CAD2D7C0C7CABF9A77797259959A9D
                B3BBC1C3CBD1C9D1D6C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000CBC4B6AC9471
                959795BBC4C9C8D1D5C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C2CCD2DAC796E5AB
                1596741B756C50888988A6AFB5BDC6CCC8D0D5C9D1D5C8D0D4C8D0D40000D0CF
                C3CFB17998845E8D908FB0B9BDC3CBD0C8D0D4C9D1D5C8D0D4C9D1D5C8D2D7BE
                BEB7EFBB3FE2A91FC09018907128776D518E9088A8AEB2BBC4C9C6CED3C8D0D4
                0000C3CBD0D3C9AFD0AB69886D40736E638C8F90ABB2B6B7C0C6C1CBD1C1CAD0
                C4CFD5C0C6CAD8AF65E0A12BDC9920D99C1DC08C15906D1E746540818176A2A7
                AAC4CBCF0000C5CED4C4C8C7DFCAA6D8AC6B997340795F3E7E705C847A6E928B
                838D878098948FA29387C18B4ED9912AD28B23D28D22D18E22CB8C1EB57F1789
                6A28837F73BCC4C80000C8D0D4C3CDD2C5C4C0E5C9A8E7AF76CA8744AA6A2995
                591F874E1983511E87531F9E5B1EC57525CB7D25C97D24C97F24CA8024CD8324
                CF8520B58637A49E8DC2CACF0000C8D0D4C9D1D5BFC6CBC6C4BFE2C5ABE7A97A
                D68343C56C29BC6623B96621BD6922C06D23C36F24C27024C06F25C17225C474
                23C77724BF7C30AD9676BBC0C1C8D0D50000C8D0D4C8D0D4C8D0D5C3CCD1C3C4
                C3D7BEAEDE9D76D0814FC06B34BE642ABF6426BD6326BA6223BA6324B96424BD
                6725C26A24BD6E2AA07A54B2B3B1C8D1D7C8D0D40000C8D0D4C8D0D4C8D0D4C8
                D0D4C1CBCFC6CACDC5B9B1C2A694CE9979CB8963C97F53C4784CC07648C47F54
                C17240BE632ABD6226A96D44A19A92C0C8CDC9D1D6C8D0D40000C8D0D4C8D0D4
                C8D0D4C8D0D4C8D0D4C7D0D5C2CCD0BFC5C8BEB9B6B4AAA3BEAA9FBAA496B5A4
                9AC6B2A7D29A7AC56A36AF5C2DA28676BAC2C6C9D1D6C8D0D4C8D0D40000C8D0
                D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7D0D4C4CDD1C1CACFC4CCD0C4
                CBCEC3CCD1C8CCCED7B39DC7784B976E55ACAFAFC9D2D7C8D0D4C8D0D4C8D0D4
                0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D5
                C8D0D5C8D0D5C8D1D5CAD1D4D9BEADC186659A928BC1CBD0C9D1D5C8D0D4C8D0
                D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
                D4C8D0D4C8D0D4C8D0D4C7D0D4C7CFD3CDBEB5C3AB9DB8C2C8C9D2D6C8D0D4C8
                D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
                D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7CFD3BDC2C4B9BEC2CAD3D7C8D0D4
                C8D0D4C8D0D4C8D0D4C8D0D40000}
              Margin = 0
            end
          end
          object ListView2: TListView
            Left = 1
            Top = 85
            Width = 294
            Height = 548
            Align = alClient
            Columns = <>
            MultiSelect = True
            ReadOnly = True
            TabOrder = 2
            ViewStyle = vsList
            OnClick = ListView2Click
            OnDblClick = ListView2DblClick
          end
          object ProgressBar2: TProgressBar
            Left = 1
            Top = 633
            Width = 294
            Height = 17
            Align = alBottom
            TabOrder = 3
          end
        end
      end
      object Panel16: TPanel
        Left = 603
        Top = 0
        Width = 652
        Height = 683
        Align = alClient
        Caption = 'Panel16'
        Constraints.MinHeight = 300
        Constraints.MinWidth = 200
        TabOrder = 1
        object Panel8: TPanel
          Left = 1
          Top = 1
          Width = 650
          Height = 33
          Align = alTop
          TabOrder = 0
          object Button6: TButton
            Left = 6
            Top = 6
            Width = 87
            Height = 21
            Caption = #1054#1095#1080#1089#1090#1080#1090#1100
            TabOrder = 0
            OnClick = Button6Click
          end
        end
        object Memo1: TMemo
          Left = 1
          Top = 34
          Width = 650
          Height = 648
          Align = alClient
          Lines.Strings = (
            'Memo1')
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 1
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1040#1085#1072#1083#1080#1079
      ImageIndex = 1
      object Splitter4: TSplitter
        Left = 253
        Top = 0
        Height = 683
        MinSize = 300
      end
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 253
        Height = 683
        Align = alLeft
        Caption = 'Panel3'
        Constraints.MinWidth = 253
        TabOrder = 0
        object ListView3: TListView
          Left = 1
          Top = 85
          Width = 251
          Height = 550
          Align = alClient
          Columns = <>
          MultiSelect = True
          ReadOnly = True
          TabOrder = 0
          ViewStyle = vsList
          OnClick = ListView3Click
          OnDblClick = ListView3DblClick
        end
        object Panel10: TPanel
          Left = 1
          Top = 1
          Width = 251
          Height = 84
          Align = alTop
          TabOrder = 1
          object Label3: TLabel
            Left = 89
            Top = 9
            Width = 32
            Height = 17
            Caption = #1044#1080#1089#1082
          end
          object LDirectoryLabel2: TLabel
            Left = 1
            Top = 65
            Width = 249
            Height = 18
            Align = alBottom
            Caption = 'LDirectoryLabel2'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Lvsego2: TLabel
            Left = 168
            Top = 6
            Width = 41
            Height = 17
            Caption = #1042#1089#1077#1075#1086':'
          end
          object LZanyato2: TLabel
            Left = 168
            Top = 26
            Width = 50
            Height = 17
            Caption = #1047#1072#1085#1103#1090#1086':'
          end
          object LLFREE2: TLabel
            Left = 168
            Top = 45
            Width = 69
            Height = 17
            Caption = #1057#1074#1086#1073#1086#1076#1085#1086':'
          end
          object Button7: TButton
            Left = 28
            Top = 6
            Width = 59
            Height = 21
            Caption = #1053#1072#1079#1072#1076
            TabOrder = 0
            OnClick = Button7Click
          end
          object ComboBox3: TComboBox
            Left = 121
            Top = 6
            Width = 47
            Height = 25
            Style = csDropDownList
            ItemHeight = 17
            TabOrder = 1
            OnChange = ComboBox3Change
          end
          object Button8: TButton
            Left = 6
            Top = 40
            Width = 144
            Height = 21
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1081#1083#1099
            TabOrder = 2
            OnClick = Button8Click
          end
          object BitBtn3: TBitBtn
            Left = 2
            Top = 6
            Width = 25
            Height = 27
            TabOrder = 3
            OnClick = BitBtn3Click
            Glyph.Data = {
              EA070000424DEA070000000000003600000028000000160000001D0000000100
              180000000000B407000000000000000000000000000000000000C8D0D4C8D0D4
              C8D0D4C8D0D4C8D1D5C8D1D5B1B4B7BBC2C6C8D0D4C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0
              D4C8D0D4C8D0D4C8D0D4C9D4D9A59890705E53A3A8A9C8D1D5C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
              0000C8D0D4C8D0D4C8D0D4C9D3D8BEBFBEB0785662422F8F9495C8D1D5CAD2D6
              C9D1D5C8D0D4C8D0D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D40000C8D0D4C8D0D4C8D1D6C3CED4BB9680C3663164351A747476B5BF
              C3B7C1C5B6BEC3BBC4C9C1C9CEC6CFD3C9D1D6C9D1D5C8D0D4C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C7D0D4BAACA4C4794CC7642A7F401C5F
              4D427A706A7A6B627468627C746F82818094999CAFB7BBBFC7CBC8D0D4C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C9D4D9C3BFBBC18762C76930C16128
              A6542283421A803F1B833C137B3C1673361461351C583F30635D59868A8CB5BD
              C1C6CFD3C9D1D5C8D0D4C8D0D4C8D0D40000C8D1D6C0C9CEBF9E83CA7737C46B
              28BD6526B76226B55F24B65F25B75F26B95F25B65B25A7532091471A713C1B62
              4838747271A3A9ADC2CACEC8D0D4C8D0D4C8D0D40000C4CCD2B8AA9CC48243CD
              7625C37125C06D25BF6C25C06B25C06B25C36B26C46C25C36A27C46927C76926
              C3672A9E592A64462F6A6562A2A8ACC5CDD2C9D1D5C8D0D40000C6C5C0CEAA7C
              D79543CC8025C77A21C67A23C67925C87824C47626C78038D19963D39F70D59D
              6CDFA36DE4A065DF995EBD834E7C5E3D6F6B66ABB2B7C8D0D4C8D0D40000CCCB
              C0E5CB9AF0CE93E4B671D39234CE831ACD8420D08320AB7E2D9E8F76B2ADA6CC
              C9C1C1B8AEB9B2A8DBC5B1E4C3A3F1C08BCA9A5E78603E898B8ABEC6CBC9D0D4
              0000C6CDCFC1C2BBCFC7ABEAD5A7EED297E9C075DEA13CD9921E9D7F1F728877
              C1C9D2C8D1D5C4CBD0C0C9CECAD0D3C9CCCDCDC5BCE1C6A8D1AA6F887A5CA2A7
              AAC6CED30000C7CFD4C5CED3C1C8CABFC2BFD5CBABEFD9A3F9DD9EF1C673BE91
              2152784CC5CBD4C9D2D6C8D0D4C8D0D5C7D0D4C7CFD4C4CDD2BBC1C3D8C7B0B9
              996A969285BFC8CD0000C8D0D4C8D0D4C7D0D4C6CFD4C5CDD1C0C5C6B8B39AE5
              D29EFFE5AA97B46EA4ABB1C9D1D6C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7D0D5
              BFC9CDCDB195A89A8BBEC6CA0000C8D0D4C8D0D4C8D0D4C8D0D4C7D0D4C8D0D6
              BFC9D0BBBEBDD6C9A8CDBA749FA4A6CAD3D8CAD2D7C9D1D5C8D0D4C8D0D4C8D0
              D4C8D0D4C8D1D6BFC6CBBCC2C7C6CDD20000C8D0D4C8D1D5C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D5C8D1D6C7D2DABAC2CCCAD2D6BAC2C6B4BDC3C3CCD1CAD2D7C9
              D1D5C8D0D4C8D0D4C8D0D4C8D1D5C9D1D5C8D0D40000C6CED1BCC2C5BEC6CBC9
              D1D5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CAD2D7C0C7CABF9A77797259959A9D
              B3BBC1C3CBD1C9D1D6C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000CBC4B6AC9471
              959795BBC4C9C8D1D5C9D1D5C8D0D4C8D0D4C8D0D4C8D0D4C2CCD2DAC796E5AB
              1596741B756C50888988A6AFB5BDC6CCC8D0D5C9D1D5C8D0D4C8D0D40000D0CF
              C3CFB17998845E8D908FB0B9BDC3CBD0C8D0D4C9D1D5C8D0D4C9D1D5C8D2D7BE
              BEB7EFBB3FE2A91FC09018907128776D518E9088A8AEB2BBC4C9C6CED3C8D0D4
              0000C3CBD0D3C9AFD0AB69886D40736E638C8F90ABB2B6B7C0C6C1CBD1C1CAD0
              C4CFD5C0C6CAD8AF65E0A12BDC9920D99C1DC08C15906D1E746540818176A2A7
              AAC4CBCF0000C5CED4C4C8C7DFCAA6D8AC6B997340795F3E7E705C847A6E928B
              838D878098948FA29387C18B4ED9912AD28B23D28D22D18E22CB8C1EB57F1789
              6A28837F73BCC4C80000C8D0D4C3CDD2C5C4C0E5C9A8E7AF76CA8744AA6A2995
              591F874E1983511E87531F9E5B1EC57525CB7D25C97D24C97F24CA8024CD8324
              CF8520B58637A49E8DC2CACF0000C8D0D4C9D1D5BFC6CBC6C4BFE2C5ABE7A97A
              D68343C56C29BC6623B96621BD6922C06D23C36F24C27024C06F25C17225C474
              23C77724BF7C30AD9676BBC0C1C8D0D50000C8D0D4C8D0D4C8D0D5C3CCD1C3C4
              C3D7BEAEDE9D76D0814FC06B34BE642ABF6426BD6326BA6223BA6324B96424BD
              6725C26A24BD6E2AA07A54B2B3B1C8D1D7C8D0D40000C8D0D4C8D0D4C8D0D4C8
              D0D4C1CBCFC6CACDC5B9B1C2A694CE9979CB8963C97F53C4784CC07648C47F54
              C17240BE632ABD6226A96D44A19A92C0C8CDC9D1D6C8D0D40000C8D0D4C8D0D4
              C8D0D4C8D0D4C8D0D4C7D0D5C2CCD0BFC5C8BEB9B6B4AAA3BEAA9FBAA496B5A4
              9AC6B2A7D29A7AC56A36AF5C2DA28676BAC2C6C9D1D6C8D0D4C8D0D40000C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7D0D4C4CDD1C1CACFC4CCD0C4
              CBCEC3CCD1C8CCCED7B39DC7784B976E55ACAFAFC9D2D7C8D0D4C8D0D4C8D0D4
              0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D5
              C8D0D5C8D0D5C8D1D5CAD1D4D9BEADC186659A928BC1CBD0C9D1D5C8D0D4C8D0
              D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C7D0D4C7CFD3CDBEB5C3AB9DB8C2C8C9D2D6C8D0D4C8
              D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C7CFD3BDC2C4B9BEC2CAD3D7C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D40000}
            Margin = 0
          end
        end
        object StatusBar3: TStatusBar
          Left = 1
          Top = 652
          Width = 251
          Height = 30
          Panels = <
            item
              Text = #1060#1072#1081#1083':'
              Width = 50
            end>
        end
        object ProgressBar3: TProgressBar
          Left = 1
          Top = 635
          Width = 251
          Height = 17
          Align = alBottom
          TabOrder = 3
        end
      end
      object Panel15: TPanel
        Left = 256
        Top = 0
        Width = 999
        Height = 683
        Align = alClient
        Caption = 'Panel15'
        TabOrder = 1
        object Splitter2: TSplitter
          Left = 364
          Top = 1
          Height = 681
        end
        object Panel11: TPanel
          Left = 1
          Top = 1
          Width = 363
          Height = 681
          Align = alLeft
          Caption = 'Panel11'
          Constraints.MinWidth = 250
          TabOrder = 0
          object Panel12: TPanel
            Left = 1
            Top = 1
            Width = 361
            Height = 58
            Align = alTop
            TabOrder = 0
            object Label4: TLabel
              Left = 136
              Top = 6
              Width = 112
              Height = 17
              Caption = #1060#1072#1081#1083#1086#1074' '#1074' '#1089#1087#1080#1089#1082#1077':'
            end
            object Lcountfiles: TLabel
              Left = 155
              Top = 26
              Width = 64
              Height = 17
              Caption = 'Lcountfiles'
            end
            object Button11: TButton
              Left = 6
              Top = 6
              Width = 85
              Height = 21
              Caption = #1054#1095#1080#1089#1090#1080#1090#1100
              TabOrder = 0
              OnClick = Button11Click
            end
            object Button12: TButton
              Left = 6
              Top = 32
              Width = 131
              Height = 21
              Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1089#1087#1080#1089#1082#1072
              TabOrder = 1
              OnClick = Button12Click
            end
          end
          object ListBox1: TListBox
            Left = 1
            Top = 59
            Width = 361
            Height = 621
            Align = alClient
            ItemHeight = 17
            MultiSelect = True
            TabOrder = 1
          end
        end
        object Panel13: TPanel
          Left = 367
          Top = 1
          Width = 631
          Height = 681
          Align = alClient
          Caption = 'Panel13'
          Constraints.MinWidth = 330
          TabOrder = 1
          object Panel14: TPanel
            Left = 1
            Top = 1
            Width = 629
            Height = 58
            Align = alTop
            TabOrder = 0
            object BitBtn1: TBitBtn
              Left = 0
              Top = 6
              Width = 98
              Height = 21
              Caption = #1040#1085#1072#1083#1080#1079
              TabOrder = 0
              OnClick = BitBtn1Click
            end
            object Button13: TButton
              Left = 194
              Top = 6
              Width = 72
              Height = 21
              Caption = #1054#1095#1080#1089#1090#1080#1090#1100
              TabOrder = 1
              OnClick = Button13Click
            end
            object Button14: TButton
              Left = 0
              Top = 32
              Width = 98
              Height = 21
              Caption = #1055#1088#1080#1086#1089#1090#1072#1085#1086#1074#1080#1090#1100
              TabOrder = 2
              OnClick = Button14Click
            end
            object Button15: TButton
              Left = 104
              Top = 32
              Width = 85
              Height = 21
              Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100
              TabOrder = 3
              OnClick = Button15Click
            end
            object Button16: TButton
              Left = 104
              Top = 6
              Width = 85
              Height = 21
              Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100
              TabOrder = 4
              OnClick = Button16Click
            end
          end
          object Memo2: TMemo
            Left = 1
            Top = 59
            Width = 629
            Height = 604
            Align = alClient
            Lines.Strings = (
              'Memo2')
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object ProgressBar4: TProgressBar
            Left = 1
            Top = 663
            Width = 629
            Height = 17
            Align = alBottom
            TabOrder = 2
          end
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 272
    Top = 32
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N5: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N5Click
      end
    end
    object N2: TMenuItem
      Caption = #1056#1077#1078#1080#1084' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103
      object N4: TMenuItem
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1092#1072#1081#1083#1086#1074
        OnClick = N4Click
      end
      object N3: TMenuItem
        Caption = 
          #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1075#1086' '#1082#1072#1090#1072#1083#1086#1078#1085#1086#1081' '#1089#1090#1088#1091#1082#1090#1091#1088#1099' '#1089' '#1086#1076#1085#1086#1075#1086' '#1076#1080#1089#1082#1072' '#1085#1072' '#1076 +
          #1088#1091#1075#1086#1081
        OnClick = N3Click
      end
    end
    object N6: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080
      object N7: TMenuItem
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1040#1085#1072#1083#1080#1079
        OnClick = N8Click
      end
    end
    object N9: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object N10: TMenuItem
        Caption = #1056#1091#1082#1086#1074#1086#1076#1089#1090#1074#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        OnClick = N10Click
      end
      object N11: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = N11Click
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 464
    Top = 32
  end
end
