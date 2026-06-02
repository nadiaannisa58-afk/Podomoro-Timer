object FormHelpPomo: TFormHelpPomo
  Left = 648
  Top = 128
  Width = 329
  Height = 272
  Caption = 'Help'
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 16
    Top = 200
    Width = 41
    Height = 25
    Pen.Style = psClear
    Shape = stRoundRect
  end
  object Label1: TLabel
    Left = 24
    Top = 200
    Width = 20
    Height = 23
    Caption = '<<'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clGrayText
    Font.Height = -20
    Font.Name = 'Bauhaus 93'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Shape2: TShape
    Left = 256
    Top = 199
    Width = 41
    Height = 25
    Pen.Style = psClear
    Shape = stRoundRect
  end
  object Label2: TLabel
    Left = 264
    Top = 200
    Width = 20
    Height = 23
    Caption = '>>'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clGrayText
    Font.Height = -20
    Font.Name = 'Bauhaus 93'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object TBack: TShape
    Left = 16
    Top = 200
    Width = 41
    Height = 25
    Cursor = crHandPoint
    Brush.Style = bsClear
    Pen.Style = psClear
    Shape = stRoundRect
    OnMouseUp = ButtonBack
  end
  object TNext: TShape
    Left = 256
    Top = 200
    Width = 41
    Height = 25
    Cursor = crHandPoint
    Brush.Style = bsClear
    Pen.Style = psClear
    Shape = stRoundRect
    OnMouseUp = ButtonNext
  end
  object NPanel: TLabel
    Left = 144
    Top = 200
    Width = 21
    Height = 25
    Alignment = taCenter
    Caption = '1/8'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentFont = False
  end
  object MemoHelp: TMemo
    Left = 8
    Top = 8
    Width = 297
    Height = 177
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clGrayText
    Font.Height = -19
    Font.Name = 'Bahnschrift'
    Font.Style = []
    Lines.Strings = (
      'User bisa menggunakan timer '
      'Pomodoro dengan durasi default '
      '25 '
      'menit untuk Pomodoro, 5 menit '
      'untuk '
      'short break, 20 menit untuk long '
      'break.')
    ParentFont = False
    TabOrder = 0
  end
end
