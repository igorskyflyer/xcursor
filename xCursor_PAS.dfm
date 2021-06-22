object formX: TformX
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'xCursor :)'
  ClientHeight = 433
  ClientWidth = 632
  Color = clWhite
  Constraints.MaxHeight = 480
  Constraints.MaxWidth = 640
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = Menu
  OldCreateOrder = False
  PopupMenu = Popup
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BG: TImage
    Left = 0
    Top = 0
    Width = 632
    Height = 414
    Align = alClient
    ExplicitLeft = -48
    ExplicitTop = 16
    ExplicitHeight = 433
  end
  object ImgDrop: TImage
    Left = 187
    Top = 80
    Width = 257
    Height = 231
    Stretch = True
    OnMouseLeave = ImgDropMouseLeave
  end
  object LabelAbove: TLabel
    Left = 16
    Top = 328
    Width = 608
    Height = 89
    Alignment = taCenter
    AutoSize = False
    Caption = 'DRAG YOUR CURSOR FILE TO THE BOX ABOVE!'
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object Status: TStatusBar
    Left = 0
    Top = 414
    Width = 632
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object Menu: TMainMenu
    Left = 16
    Top = 16
    object MenuFile: TMenuItem
      Caption = 'File'
      OnClick = MenuFileClick
      object SubOpen: TMenuItem
        Caption = 'Open Cursor...'
        ShortCut = 16463
        OnClick = SubOpenClick
      end
      object SubChange: TMenuItem
        Caption = 'Change Cursor...'
        ShortCut = 16451
        OnClick = SubChangeClick
      end
      object SubApply: TMenuItem
        Caption = 'Apply Cursor'
        Enabled = False
        ShortCut = 16449
        OnClick = SubApplyClick
      end
      object SubRestart: TMenuItem
        Caption = 'Restart'
        ShortCut = 16466
        OnClick = SubRestartClick
      end
      object SubExit: TMenuItem
        Caption = 'Exit'
        ShortCut = 27
        OnClick = SubExitClick
      end
    end
    object MenuSearch: TMenuItem
      Caption = 'Search On...'
      object SubGoogle: TMenuItem
        Caption = 'Google'
        OnClick = SubGoogleClick
      end
      object SubTFC: TMenuItem
        Caption = 'Totally Free Cursors'
        OnClick = SubTFCClick
      end
      object SubMySpace: TMenuItem
        Caption = 'MySpace Cursor'
        OnClick = SubMySpaceClick
      end
      object Sub4U: TMenuItem
        Caption = 'Cursors4U'
        OnClick = Sub4UClick
      end
    end
    object MenuExtras: TMenuItem
      Caption = 'Extras'
      OnClick = MenuExtrasClick
      object Line1: TMenuItem
        Caption = '-'
      end
      object SubSonar: TMenuItem
        Caption = 'Mouse Sonar'
        Hint = 'Show Location Of Mouse When I Press CTRL Key'
        OnClick = SubSonarClick
        object SubMSOn: TMenuItem
          AutoCheck = True
          Caption = 'On'
          OnClick = SubMSOnClick
        end
        object SubMSOff: TMenuItem
          AutoCheck = True
          Caption = 'Off'
          OnClick = SubMSOffClick
        end
      end
      object SubReverse: TMenuItem
        Caption = 'Reverse Mouse Buttons'
        Hint = 'Reverse Mouse Buttons'
        OnClick = SubReverseClick
        object SubRMBOn: TMenuItem
          AutoCheck = True
          Caption = 'On'
          OnClick = SubRMBOnClick
        end
        object SubRMBOff: TMenuItem
          AutoCheck = True
          Caption = 'Off'
          OnClick = SubRMBOffClick
        end
      end
      object SubClickLock: TMenuItem
        Caption = 'Mouse ClickLock'
        Hint = 
          'Enables You To Highlight Or Drag Without Holding Down The Mouse ' +
          'Button'
        OnClick = SubClickLockClick
        object SubMCLOn: TMenuItem
          Caption = 'On'
          OnClick = SubMCLOnClick
        end
        object SubMCLOff: TMenuItem
          Caption = 'Off'
          OnClick = SubMCLOffClick
        end
      end
      object Line2: TMenuItem
        Caption = '-'
      end
      object SubRestore: TMenuItem
        Caption = 'Restore To Default...'
        object SubRestoreAll: TMenuItem
          Caption = 'All Cursors'
          OnClick = SubRestoreAllClick
        end
        object SubRestoreSingle: TMenuItem
          Caption = 'Single'
          object SubArrow: TMenuItem
            Caption = 'Arrow'
          end
          object SubBG: TMenuItem
            Caption = 'Working In Background'
          end
          object SubPreSelect: TMenuItem
            Caption = 'Precision Select'
          end
          object SubHelpCur: TMenuItem
            Caption = 'Help'
          end
          object SubTextSel: TMenuItem
            Caption = 'Text Select'
          end
          object SubUn: TMenuItem
            Caption = 'Unavailable'
          end
          object SubHandwriting: TMenuItem
            Caption = 'Handwriting'
          end
          object SubMove: TMenuItem
            Caption = 'Move'
          end
          object SubDiag1: TMenuItem
            Caption = 'Diagonal Resize 1'
          end
          object SubDiag2: TMenuItem
            Caption = 'Diagonal Resize 2'
          end
          object SubVert: TMenuItem
            Caption = 'Vertical Resize'
          end
          object SubHorz: TMenuItem
            Caption = 'Horizontal Resize'
          end
          object SubAltSel: TMenuItem
            Caption = 'Alternate Select'
          end
          object SubWait: TMenuItem
            Caption = 'Wait'
          end
          object SubHand: TMenuItem
            Caption = 'Hand'
          end
        end
      end
      object Line3: TMenuItem
        Caption = '-'
      end
      object SubGenerate: TMenuItem
        Caption = 'Generate .xcur File'
        object SubGenSingle: TMenuItem
          Caption = 'Single Cursor'
          ShortCut = 8275
          OnClick = SubGenSingleClick
        end
        object SubGenMulti: TMenuItem
          Caption = 'Multiple Cursors'
          ShortCut = 8269
          OnClick = SubGenMultiClick
        end
      end
      object Line4: TMenuItem
        Caption = '-'
      end
    end
    object MenuConfig: TMenuItem
      Caption = 'Config'
      object SubLanguage: TMenuItem
        Caption = 'Language'
        object SubEnglish: TMenuItem
          Caption = 'English'
          ShortCut = 16453
          OnClick = SubEnglishClick
        end
        object SubSrpski: TMenuItem
          Caption = 'Srpski'
          ShortCut = 16467
          OnClick = SubSrpskiClick
        end
      end
      object SubDrop: TMenuItem
        Caption = 'Default DropBox Action'
        object SubDropPre: TMenuItem
          Caption = 'Preview'
          OnClick = SubDropPreClick
        end
        object SubDropApply: TMenuItem
          Caption = 'Apply'
          OnClick = SubDropApplyClick
        end
      end
      object SubSAC: TMenuItem
        Caption = 'Safe-Apply Cursor'
        OnClick = SubSACClick
        object SubSACOn: TMenuItem
          AutoCheck = True
          Caption = 'On'
          OnClick = SubSACOnClick
        end
        object SubSACOff: TMenuItem
          AutoCheck = True
          Caption = 'Off'
          OnClick = SubSACOffClick
        end
      end
      object Line5: TMenuItem
        Caption = '-'
      end
      object SubxCur: TMenuItem
        Caption = 'Associate .xcur With xCursor'
        ShortCut = 113
        OnClick = SubxCurClick
      end
      object SubConMenu: TMenuItem
        Caption = 'Add To Context Menu'
        ShortCut = 32881
        OnClick = SubConMenuClick
      end
    end
    object MenuAbout: TMenuItem
      Caption = 'About'
      object SubHelp: TMenuItem
        Caption = 'Help'
        ShortCut = 112
      end
      object SubAuthor: TMenuItem
        Caption = 'Author'
        ShortCut = 8304
        OnClick = SubAuthorClick
      end
      object SubWeb: TMenuItem
        Caption = 'Website'
        ShortCut = 114
        OnClick = SubWebClick
      end
    end
  end
  object OpenCursor: TOpenDialog
    Filter = 
      'Cursor (*.cur)|*.cur|Animated Cursor (*.ani)|*.ani|Cursors (*.cu' +
      'r, *.ani)|*.cur; *.ani;'
    Left = 16
    Top = 64
  end
  object Popup: TPopupMenu
    MenuAnimation = [maLeftToRight, maBottomToTop]
    Left = 16
    Top = 112
    object PopTheme: TMenuItem
      Caption = 'Theme'
      object ThemeOrange: TMenuItem
        Caption = 'Orange Paradise'
      end
      object ThemeRainbow: TMenuItem
        Caption = 'Rainbow Water'
      end
      object ThemeCool: TMenuItem
        Caption = 'Cool Abstract'
      end
      object ThemeMarbles: TMenuItem
        Caption = 'White-Blue Marbles'
      end
      object ThemeBlue: TMenuItem
        Caption = 'Blue Abstract'
      end
      object SubPlanet: TMenuItem
        Caption = 'Planet'
      end
      object ThemeRay: TMenuItem
        Caption = 'Water Ray'
      end
      object ThemeRainbowish: TMenuItem
        Caption = 'Rainbowish Abstract'
      end
      object ThemePlanets: TMenuItem
        Caption = 'Planet Stripes'
      end
      object ThemeBlueRed: TMenuItem
        Caption = 'BlueFire && RedWater'
      end
      object ThemeHigh: TMenuItem
        Caption = 'High Abstraction'
      end
      object ThemeWhirl: TMenuItem
        Caption = 'Abstract Whirl'
      end
      object ThemeMachine: TMenuItem
        Caption = 'Machine Of Darkness'
      end
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 1900
    OnTimer = TimerTimer
    Left = 56
    Top = 16
  end
  object Save: TSaveDialog
    Left = 64
    Top = 64
  end
end
