object FormLong: TFormLong
  Left = 64
  Top = 86
  Width = 801
  Height = 544
  Caption = 'Pomodoro Timer: Long Break'
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseMove = NormalMouseMove
  DesignSize = (
    785
    505)
  PixelsPerInch = 96
  TextHeight = 13
  object ShapeSesi: TShape
    Left = 488
    Top = 456
    Width = 137
    Height = 33
    Brush.Color = clActiveCaption
    Pen.Color = clActiveCaption
    Shape = stRoundRect
  end
  object LabelTitikDua: TLabel
    Left = 376
    Top = 88
    Width = 29
    Height = 208
    Alignment = taCenter
    Anchors = [akTop, akRight]
    Caption = ':'
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -173
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlBottom
  end
  object StartBase: TShape
    Left = 272
    Top = 328
    Width = 105
    Height = 49
    Pen.Color = clWhite
    Pen.Style = psClear
    Shape = stRoundRect
  end
  object Oval: TShape
    Left = 120
    Top = 32
    Width = 545
    Height = 393
    Brush.Style = bsClear
    Enabled = False
    Pen.Color = clWhite
    Shape = stEllipse
  end
  object StartText: TLabel
    Left = 296
    Top = 328
    Width = 56
    Height = 42
    Alignment = taCenter
    Caption = 'start'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clSkyBlue
    Font.Height = -35
    Font.Name = 'Bahnschrift SemiBold Condensed'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Start: TShape
    Left = 272
    Top = 328
    Width = 105
    Height = 49
    Cursor = crHandPoint
    Brush.Style = bsClear
    Pen.Color = clWhite
    Pen.Style = psClear
    Shape = stRoundRect
    OnMouseMove = ButtonMouseMoveBlue
    OnMouseUp = StartTimer
  end
  object ShortBreakText: TLabel
    Left = 344
    Top = 456
    Width = 95
    Height = 29
    Cursor = crHandPoint
    Alignment = taCenter
    Caption = 'Short Break'
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Bahnschrift SemiLight Condensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    OnClick = ShortBreakTextClick
    OnMouseEnter = TextMouseEnter
    OnMouseLeave = TextMouseLeve
  end
  object ResetText: TLabel
    Left = 432
    Top = 328
    Width = 61
    Height = 42
    Alignment = taCenter
    Caption = 'reset'
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -35
    Font.Name = 'Bahnschrift SemiBold Condensed'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Reset: TShape
    Left = 408
    Top = 328
    Width = 105
    Height = 49
    Cursor = crHandPoint
    Brush.Style = bsClear
    Pen.Color = clWhite
    Shape = stRoundRect
    OnMouseMove = ButtonMouseMove
    OnMouseUp = ResetTimer
  end
  object LongBreakText: TLabel
    Left = 512
    Top = 456
    Width = 90
    Height = 29
    Alignment = taCenter
    Caption = 'Long Break'
    Color = clActiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Bahnschrift SemiLight Condensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object LabelP: TLabel
    Left = 184
    Top = 456
    Width = 78
    Height = 29
    Cursor = crHandPoint
    Alignment = taCenter
    Caption = 'Pomodoro'
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Bahnschrift SemiLight Condensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    OnClick = LabelPClick
    OnMouseEnter = TextMouseEnter
    OnMouseLeave = TextMouseLeve
  end
  object LabelMenit: TLabel
    Left = 224
    Top = 96
    Width = 141
    Height = 208
    Alignment = taCenter
    Anchors = [akTop, akRight]
    Caption = '20'
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -173
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlBottom
  end
  object LabelDetik: TLabel
    Left = 416
    Top = 96
    Width = 141
    Height = 208
    Alignment = taCenter
    Anchors = [akTop, akRight]
    Caption = '00'
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -173
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlBottom
  end
  object EditText: TLabel
    Left = 360
    Top = 59
    Width = 68
    Height = 25
    Align = alCustom
    Anchors = [akTop]
    Caption = 'edit timer'
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindow
    Font.Height = -21
    Font.Name = 'Bahnschrift SemiLight Condensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Edit: TShape
    Left = 344
    Top = 56
    Width = 97
    Height = 33
    Cursor = crHandPoint
    Brush.Style = bsClear
    Pen.Color = clWhite
    Shape = stRoundRect
    OnMouseMove = ButtonMouseMove
    OnMouseUp = EditButtonMouseUp
  end
  object ButtonMenu: TLabel
    Left = 16
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
    Font.Style = [fsUnderline]
    ParentColor = False
    ParentFont = False
    OnClick = ButtonMenuClick
    OnMouseEnter = TextMouseEnter
    OnMouseLeave = TextMouseLeve
  end
  object ButtonHelp: TLabel
    Left = 720
    Top = 16
    Width = 38
    Height = 25
    Cursor = crHandPoint
    Caption = ' Help '
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindow
    Font.Height = -21
    Font.Name = 'Bahnschrift SemiLight Condensed'
    Font.Style = [fsUnderline]
    ParentColor = False
    ParentFont = False
    OnClick = ButtonHelpClick
    OnMouseEnter = TextMouseEnter
    OnMouseLeave = TextMouseLeve
  end
  object EditMenitPomo: TEdit
    Left = 224
    Top = 96
    Width = 153
    Height = 185
    Cursor = crIBeam
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -173
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = [fsUnderline]
    ParentFont = False
    TabOrder = 0
    Text = '20'
    Visible = False
  end
  object EditDetikPomo: TEdit
    Left = 416
    Top = 96
    Width = 153
    Height = 185
    Cursor = crIBeam
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -173
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = [fsUnderline]
    ParentFont = False
    TabOrder = 1
    Text = '00'
    Visible = False
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 376
    Top = 201
  end
end
