object FormTips: TFormTips
  Left = 64
  Top = 86
  Width = 801
  Height = 544
  Caption = 'FormTips'
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clOlive
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonMenu: TLabel
    Left = 32
    Top = 16
    Width = 46
    Height = 25
    Cursor = crHandPoint
    Caption = ' Menu '
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Bahnschrift SemiLight Condensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    OnClick = ButtonMenuClick
    OnMouseEnter = ButtonMouseEnter
    OnMouseLeave = ButtonMouseLeave
  end
  object TitlePage: TLabel
    Left = 40
    Top = 72
    Width = 206
    Height = 57
    Caption = 'Studying Tips'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -47
    Font.Name = 'Bahnschrift SemiBold Condensed'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelBack: TLabel
    Left = 40
    Top = 456
    Width = 54
    Height = 31
    Caption = '<<<'
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Bell MT'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object LabelNext: TLabel
    Left = 704
    Top = 456
    Width = 54
    Height = 31
    Caption = '>>>'
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Bell MT'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object TBack: TShape
    Left = 32
    Top = 456
    Width = 65
    Height = 33
    Cursor = crHandPoint
    Brush.Style = bsClear
    Pen.Style = psClear
    Shape = stRoundRect
    OnMouseUp = ButtonBack
  end
  object Shape2: TShape
    Left = 696
    Top = 456
    Width = 65
    Height = 33
    Cursor = crHandPoint
    Brush.Style = bsClear
    Pen.Style = psClear
    Shape = stRoundRect
    OnMouseUp = ButtonNext
  end
  object Shape4: TShape
    Left = 32
    Top = 56
    Width = 721
    Height = 1
    Pen.Color = clWhite
    Pen.Width = 3
  end
  object Shape1: TShape
    Left = 104
    Top = 472
    Width = 569
    Height = 1
    Pen.Color = clWhite
    Pen.Width = 3
  end
  object MemoTips: TMemo
    Left = 32
    Top = 152
    Width = 721
    Height = 289
    Cursor = crArrow
    BorderStyle = bsNone
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowFrame
    Font.Height = -25
    Font.Name = 'Bahnschrift SemiCondensed'
    Font.Style = []
    Lines.Strings = (
      'TIPS 1'
      'lorem ipsum dolor amet')
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
end
