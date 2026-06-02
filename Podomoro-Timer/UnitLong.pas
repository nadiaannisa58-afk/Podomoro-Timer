unit UnitLong;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFormLong = class(TForm)
    Timer1: TTimer;
    StartText: TLabel;
    StartBase: TShape;
    Start: TShape;
    ShortBreakText: TLabel;
    ResetText: TLabel;
    Reset: TShape;
    ShapeSesi: TShape;
    Oval: TShape;
    LongBreakText: TLabel;
    LabelTitikDua: TLabel;
    LabelP: TLabel;
    LabelMenit: TLabel;
    LabelDetik: TLabel;
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
    procedure TextMouseLeve(Sender: TObject);
    procedure LabelPClick(Sender: TObject);
    procedure ShortBreakTextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonHelpClick(Sender: TObject);
    procedure ButtonMenuClick(Sender: TObject);
  private
    MenitPomo, DetikPomo: integer;
    Durasi: Integer;
    SisaTimer: Integer;
    TimerJalan: Boolean;
    procedure UpdateTimer;
  public
  end;

var
  FormLong: TFormLong;


implementation

uses UnitPomo, UnitShort, UnitHome, UnitHelpPomo;

{$R *.dfm}

{============================================================BUTTON GANTI WARNA}

procedure TFormLong.ButtonMouseMove(Sender: TObject; Shift: TShiftState;
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
  if Assigned(LabelCtrl) then
      LabelCtrl.Font.Color := clMedGray;
end;

procedure TFormLong.ButtonMouseMoveBlue(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  StartText.Font.Color := clMedGray;
end;

procedure TFormLong.TextMouseEnter(Sender: TObject);
begin
    FormHome.ButtonMouseEnter(Sender as TObject);
end;

procedure TFormLong.TextMouseLeve(Sender: TObject);
begin
    FormHome.ButtonMouseLeave(Sender as TObject);
end;

{**********************************PANEL POMODORO******************************}

{=======================================================TEXT GANTI WARNA NORMAL}

procedure TFormLong.NormalMouseMove(Sender: TObject; Shift: TShiftState;
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

procedure TFormLong.EditButtonMouseUp(Sender: TObject; Button: TMouseButton;
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

procedure TFormLong.UpdateTimer;
var
  Minutes, Seconds: Integer;
begin
  Minutes:= SisaTimer div 60;
  Seconds:= SisaTimer mod 60;
  LabelMenit.Caption:= Format('%.2d', [Minutes]);
  LabelDetik.Caption:= Format('%.2d', [Seconds]);
end;

procedure TFormLong.FormCreate(Sender: TObject);
begin
  MenitPomo:=20;
  Durasi:=MenitPomo*60 + DetikPomo;
  SisaTimer:= Durasi;
  TimerJalan:= False;
end;

procedure TFormLong.StartTimer(Sender: TObject; Button: TMouseButton;   {start/pause timer}
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

procedure TFormLong.ResetTimer(Sender: TObject; Button: TMouseButton;   {start/pause timer}
  Shift: TShiftState; X, Y: Integer);
begin
  Timer1.Enabled:= False;
  SisaTimer:= Durasi;
  TimerJalan:= False;
  UpdateTimer;
  StartText.Caption:= 'start';
end;

procedure TFormLong.Timer1Timer(Sender: TObject);
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
      FormPomo.PindahKe(FormPomo, FormLong);
    end;
end;

{======================================================BUTTON POMO & LONG BREAK}

procedure TFormLong.LabelPClick(Sender: TObject);
begin
    FormPomo.PindahKe(FormPomo, FormLong);
end;

procedure TFormLong.ShortBreakTextClick(Sender: TObject);
begin
    FormPomo.PindahKe(FormShort, FormLong);
end;

procedure TFormLong.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FormHome.BalikHome;
end;

procedure TFormLong.ButtonHelpClick(Sender: TObject);
begin
    FormHelpPomo.Show;
end;


procedure TFormLong.ButtonMenuClick(Sender: TObject);
begin
    FormPomo.PindahKe(FormHome, FormLong);
end;

end.
