object FormQuote: TFormQuote
  Left = 905
  Top = 36
  Width = 300
  Height = 215
  Cursor = crArrow
  BorderStyle = bsSizeToolWin
  BorderWidth = 2
  Caption = 'Quotes'
  Color = clActiveCaption
  Font.Charset = OEM_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Terminal'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 12
  object ButtonClick: TLabel
    Left = 16
    Top = 8
    Width = 117
    Height = 33
    Cursor = crHandPoint
    Caption = 'today'#39's quote'
    Color = clActiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Bahnschrift SemiLight Condensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    OnClick = Button1Click
    OnMouseEnter = TextMouseEnter
    OnMouseLeave = TextMouseLeave
  end
  object pompompom: TMemo
    Left = 16
    Top = 48
    Width = 249
    Height = 105
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clGrayText
    Font.Height = -17
    Font.Name = 'Bahnschrift'
    Font.Style = []
    Lines.Strings = (
      'click the button above to find '
      'out ;)')
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
end
