unit UnitPomo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFormPomo = class(TForm)
    Timer1: TTimer;
    StartText: TLabel;
    StartBase: TShape;
    Start: TShape;
    ShortBreakText: TLabel;
    ResetText: TLabel;
    Reset: TShape;
    Pomod: TShape;
    Oval: TShape;
    LongBreakText: TLabel;
    LabelTitikDua: TLabel;
    LabelP: TLabel;
    LabelMenit: TLabel;
    LabelDetik: TLabel;
    LabelSesi: TLabel;
    EditText: TLabel;
    EditMenitPomo: TEdit;
    EditDetikPomo: TEdit;
    Edit: TShape;
    ButtonMenu: TLabel;
    ButtonHelp: TLabel;
    procedure ButtonMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure NormalMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure EditButtonMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonMouseMoveBlue(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure StartTimer(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ResetTimer(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure TextMouseEnter(Sender: TObject);
    procedure TextMouseLeave(Sender: TObject);
    procedure ShortBreakTextClick(Sender: TObject);
    procedure PindahKe(A: TForm; B: TForm);
    procedure LongBreakTextClick(Sender: TObject);
    procedure ButtonMenuClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonHelpClick(Sender: TObject);
  private
    MenitPomo, DetikPomo: integer;
    Durasi: Integer;
    SisaTimer: Integer;
    TimerJalan: Boolean;
    procedure UpdateTimer;
  public
    Sesi: integer;
  end;

var
  FormPomo: TFormPomo;


implementation

uses UnitShort, UnitLong, UnitHome, UnitHelpPomo;

{$R *.dfm}

{============================================================BUTTON GANTI WARNA}

procedure TFormPomo.ButtonMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  ShapeName, LabelName: string;
  Shape: TShape;
  LabelCtrl: TLabel;
begin
  (Sender as TShape).Pen.Color := clMedGray;
  Shape := TShape(Sender);
  ShapeName := Copy(Shape.Name, 1, Length(Shape.Name));
  LabelName := ShapeName + 'Text';
  LabelCtrl := TLabel(FindComponent(LabelName));
  If Assigned(LabelCtrl) then
  LabelCtrl.Font.Color := clMedGray;
end;

procedure TFormPomo.ButtonMouseMoveBlue(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  StartText.Font.Color := clMedGray;
end;

procedure TFormPomo.TextMouseEnter(Sender: TObject);
begin
    FormHome.ButtonMouseEnter(Sender as TObject);
end;

procedure TFormPomo.TextMouseLeave(Sender: TObject);
begin
    FormHome.ButtonMouseLeave(Sender as TObject);
end;

{**********************************PANEL POMODORO******************************}

{=======================================================TEXT GANTI WARNA NORMAL}

procedure TFormPomo.NormalMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
procedure NormalButton(A:TShape; C:TLabel);
begin
    A.Pen.Color:= clWhite;
    C.Font.Color:= clWhite;
end;
procedure NormalText(B:TLabel);
begin
    B.Font.Color:= clWhite;
end;

BEGIN
  NormalText(ShortBreakText);
  NormalText(LongBreakText);
  NormalButton(Edit, EditText);
  NormalButton(Reset, ResetText);
  StartBase.Brush.Color:=clwhite;
  StartText.Font.Color := clSkyBlue;
END;

{========================================================BUTTON EDIT TIMER POMO}

procedure TFormPomo.EditButtonMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
procedure EditTimerInt(var A: TLabel; B, C: TEdit; var D, E, F, G: integer);
    procedure InputNilai(var Q: integer; W: TEdit);
    begin
        if W.Text='' then
          Q:=0
        else
          Q:=strtoint(W.Text);
    end;

    procedure Perkecil(var R:integer);
    begin
        while R>99 do
        begin
            R:=R div 10;
        end;
    end;
begin
  if A.Caption='edit timer' then
    begin
      Timer1.Enabled:= false;
      Start.Enabled:= false;
      Reset.Enabled:= false;
      A.Caption:='selesai';
      B.Visible:=true;
      C.Visible:=true;
    end
  else
    begin
      Start.Enabled:= true;
      Reset.Enabled:= true;
      A.Caption:='edit timer';
      B.Visible:=false;
      C.Visible:=false;
      InputNilai(D, B);
      InputNilai(E, C);
      Perkecil(D);
      Perkecil(E);
      F:=D*60 + E; G:=F;
      UpdateTimer;
    end;
end;

BEGIN
    EditTimerInt(EditText, EditMenitPomo, EditDetikPomo, MenitPomo, DetikPomo, Durasi, SisaTimer);
END;

{================================================================TIMER POMODORO}

procedure TFormPomo.UpdateTimer;
var
  Minutes, Seconds: Integer;
begin
  Minutes:= SisaTimer div 60;
  Seconds:= SisaTimer mod 60;
  LabelMenit.Caption:= Format('%.2d', [Minutes]);
  LabelDetik.Caption:= Format('%.2d', [Seconds]);
end;

procedure TFormPomo.FormCreate(Sender: TObject);
begin
  MenitPomo:=25;
  Durasi:=MenitPomo*60 + DetikPomo;
  SisaTimer:= Durasi;
  TimerJalan:= False;
end;

procedure TFormPomo.StartTimer(Sender: TObject; Button: TMouseButton;   {start/pause timer}
  Shift: TShiftState; X, Y: Integer);
begin
  TimerJalan:= not TimerJalan;

  if TimerJalan then
  begin
    Timer1.Enabled:= True;
    StartText.Caption:= 'stop';
  end
  else
  begin
    Timer1.Enabled:= False;
    StartText.Caption:= 'start';
  end;
end;

procedure TFormPomo.ResetTimer(Sender: TObject; Button: TMouseButton;   {reset timer}
  Shift: TShiftState; X, Y: Integer);
begin
  Timer1.Enabled:= False;
  SisaTimer:= Durasi;
  TimerJalan:= False;
  UpdateTimer;
  StartText.Caption:= 'start';
end;

procedure TFormPomo.Timer1Timer(Sender: TObject);
begin
  if TimerJalan then
    begin
    Dec(SisaTimer);    {decrease: berkurang}
    UpdateTimer;       {waktu displaynya berubah}
    end;
  if SisaTimer <= 0 then                       {timer habis}
    begin
      Timer1.Enabled:= False;
      SisaTimer:= Durasi;
      TimerJalan:= False;
      UpdateTimer;
      StartText.Caption:= 'start';
      PindahKe(FormShort, FormPomo);
    end;
end;

{=====================================================BUTTON SHORT & LONG BREAK}

procedure TFormPomo.ShortBreakTextClick(Sender: TObject);
begin
    PindahKe(FormShort, FormPomo);
end;

procedure TFormPomo.PindahKe(A: TForm;B: TForm);
begin
    B.Hide;
    A.Show;
end;

procedure TFormPomo.LongBreakTextClick(Sender: TObject);
begin
    PindahKe(FormLong, FormPomo);
end;

procedure TFormPomo.ButtonMenuClick(Sender: TObject);
begin
    PindahKe(FormHome, FormPomo);
end;

procedure TFormPomo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FormHome.BalikHome;
end;

procedure TFormPomo.ButtonHelpClick(Sender: TObject);
begin
    FormHelpPomo.Show;
end;

end.
