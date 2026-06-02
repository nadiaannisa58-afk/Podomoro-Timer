unit UnitTips;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormTips = class(TForm)
    ButtonMenu: TLabel;
    TitlePage: TLabel;
    LabelBack: TLabel;
    LabelNext: TLabel;
    TBack: TShape;
    Shape2: TShape;
    MemoTips: TMemo;
    Shape4: TShape;
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure ShowTips(i: integer);
    procedure HideTips(i: integer);
    procedure ButtonNext(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
    procedure ButtonBack(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonMenuClick(Sender: TObject);
    function GetTipsText(index: Integer): String;
    procedure ButtonMouseEnter(Sender: TObject);
    procedure ButtonMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    n: integer;
  end;

var
  FormTips: TFormTips;

implementation

uses UnitHome;

{$R *.dfm}

const
    Memo1='1. Pomodoro Technique'+sLineBreak+'Its a time management technique that allows you to study in small chunks. It is separated by short breaks (5 minutes) i.e. one pomodoro. After the four Pomodoro you can take a longer break (20 minutes).';
    Memo2='2. Practice Question'+sLineBreak+'Put your phone on airplane od focus mode. Notify anyone you are expecting to contact you that you will be off-screen for a period of time. Turn off the TV. Turn on non-distracting instrumental music if you need background noise.';
    Memo3='3. Switch It Up'+sLineBreak+'Use different studying techniques to keep yourself interested. Read, watch videos, revies notes, create and use flash cards, or find a study buddy to quiz and have them quiz you.';
    Memo4='4. Get Enough Sleep'+sLineBreak+'To fully function, you need sleep, Your brain needs sleep to be sharp and focused. Sleep will help energize you and sleep helps you retain information.';
    Memo5='5. Schedule Study Time'+sLineBreak+'Review your calendar and schedule time to study throughout the week. Schedule enough time to cover all classes. Stick to the schedule! if something urgent comes up. reschedule your study time.';
    Memo6='Extra Tips'+sLineBreak+'*Review the information periodically, instead of cramming'
           +sLineBreak+'*Dont multitask'
           +sLineBreak+'*Test yourself frequently'
           +sLineBreak+'*Have a healthier lifestyle'
           +sLineBreak+'*Remember quality over quantity';

procedure TFormTips.ShowTips(i: integer);
begin
    MemoTips.Text:=GetTipsText(i);
end;

procedure TFormTips.HideTips(i: integer);
begin
    MemoTips.Clear;
end;

function TFormTips.GetTipsText(index: Integer): String;
begin
  case index of
    1: Result:= Memo1;
    2: Result:= Memo2;
    3: Result:= Memo3;
    4: Result:= Memo4;
    5: Result:= Memo5;
    6: Result:= Memo6;
  else
    Result := Memo1;
  end;
end;

procedure TFormTips.FormCreate(Sender: TObject);
begin
    n:=1;
    ShowTips(n);
end;

procedure TFormTips.ButtonNext(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    HideTips(n);
    n:= n + 1;
    if n=7 then
        n:= 1;
    ShowTips(n);
end;

procedure TFormTips.ButtonBack(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    HideTips(n);
    n:= n - 1;
    if n=0 then
        n:= 6;
    ShowTips(n);
end;

procedure TFormTips.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FormHome.BalikHome;
end;

procedure TFormTips.ButtonMenuClick(Sender: TObject);
begin
    FormHome.BalikHome;
    FormTips.Hide;
end;

procedure TFormTips.ButtonMouseEnter(Sender: TObject);
begin
    FormHome.ButtonMouseEnter(Sender as TObject);
end;

procedure TFormTips.ButtonMouseLeave(Sender: TObject);
begin
    FormHome.ButtonMouseLeave(Sender as TObject);
end;

end.
