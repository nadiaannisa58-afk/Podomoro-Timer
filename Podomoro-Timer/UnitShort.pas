unit UnitShort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFormShort = class(TForm)
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
    procedure TambahSesi(var Sesi: integer);
    procedure LabelPClick(Sender: TObject);
    procedure UpdateSesi(Sesi: integer);
    procedure LongBreakTextClick(Sender: TObject);
    procedure ButtonHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonMenuClick(Sender: TObject);
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
  FormShort: TFormShort;


implementation

uses UnitPomo, UnitLong, UnitHome, UnitHelpPomo;

{$R *.dfm}

{============================================================BUTTON GANTI WARNA}

procedure TFormShort.ButtonMouseMove(Sender: TObject; Shift: TShiftState;
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

procedure TFormShort.ButtonMouseMoveBlue(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  StartText.Font.Color := clMedGray;
end;

procedure TFormShort.TextMouseEnter(Sender: TObject);
begin
    FormHome.ButtonMouseEnter(Sender as TObject);
end;

procedure TFormShort.TextMouseLeave(Sender: TObject);
begin
    FormHome.ButtonMouseLeave(Sender as TObject);
end;

{**********************************PANEL POMODORO******************************}

{=======================================================TEXT GANTI WARNA NORMAL}

procedure TFormShort.NormalMouseMove(Sender: TObject; Shift: TShiftState;
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

procedure TFormShort.EditButtonMouseUp(Sender: TObject; Button: TMouseButton;
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

procedure TFormShort.UpdateTimer;
var
  Minutes, Seconds: Integer;
begin
  Minutes:= SisaTimer div 60;
  Seconds:= SisaTimer mod 60;
  LabelMenit.Caption:= Format('%.2d', [Minutes]);
  LabelDetik.Caption:= Format('%.2d', [Seconds]);
end;

procedure TFormShort.FormCreate(Sender: TObject);
begin
  MenitPomo:=5;
  Durasi:=MenitPomo*60 + DetikPomo;
  SisaTimer:= Durasi;
  TimerJalan:= False;
end;

procedure TFormShort.StartTimer(Sender: TObject; Button: TMouseButton;   {start/pause timer}
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

procedure TFormShort.ResetTimer(Sender: TObject; Button: TMouseButton;   {start/pause timer}
  Shift: TShiftState; X, Y: Integer);
begin
  Timer1.Enabled:= False;
  SisaTimer:= Durasi;
  TimerJalan:= False;
  UpdateTimer;
  StartText.Caption:= 'start';
end;

procedure TFormShort.Timer1Timer(Sender: TObject);
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
      if Sesi=4 then
          FormPomo.PindahKe(FormLong, FormShort)
      else
          FormPomo.PindahKe(FormPomo, FormShort);
      TambahSesi(Sesi);
      UpdateSesi(Sesi);
    end;
end;

{===================================================================Update Sesi}

procedure TFormShort.TambahSesi(var Sesi: integer);
begin
    if Sesi=4 then
      Sesi:=1
    else if Sesi=0 then
      Sesi:=2
    else
      Sesi:=Sesi+1;
end;

procedure TFormShort.UpdateSesi(Sesi: integer);
begin
    LabelSesi.Caption:='sesi '+inttostr(Sesi);
    FormPomo.LabelSesi.Caption:=LabelSesi.Caption;
end;


{======================================================BUTTON POMO & LONG BREAK}

procedure TFormShort.LabelPClick(Sender: TObject);
begin
    FormPomo.PindahKe(FormPomo, FormShort);
end;

procedure TFormShort.LongBreakTextClick(Sender: TObject);
begin
    FormPomo.PindahKe(FormLong, FormShort);
end;

procedure TFormShort.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FormHome.BalikHome;
end;

procedure TFormShort.ButtonHelpClick(Sender: TObject);
begin
    FormHelpPomo.Show;
end;


procedure TFormShort.ButtonMenuClick(Sender: TObject);
begin
    FormPomo.PindahKe(FormHome, FormShort);
end;

end.
