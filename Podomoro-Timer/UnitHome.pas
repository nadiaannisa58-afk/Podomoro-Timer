unit UnitHome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg;

type
  TFormHome = class(TForm)
    ButtonPomo: TLabel;
    ButtonTDQuote: TLabel;
    ButtonStudy: TLabel;
    TimerJam: TTimer;
    ImageCloud: TImage;
    LabelStudyBuddy: TLabel;
    LabelTime: TLabel;
    LabelSambutan: TLabel;
    Label1: TLabel;
    ButtonQuotes: TLabel;
    procedure RedirectPage(A: TLabel; Sender: TForm);
    procedure Greetings;
    procedure ButtonTDQuoteClick(Sender: TObject);
    procedure ButtonStudyClick(Sender: TObject);
    procedure ButtonPomoClick(Sender: TObject);
    procedure ButtonQuotesClick(Sender: TObject);
    procedure UpdateTimeLabel;
    procedure TimerJamTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LabelStudyBuddyClick(Sender: TObject);
    procedure ButtonColorMouseEnter(Sender: TObject);
    procedure ButtonColorMouseLeave(Sender: TObject);
    procedure ButtonMouseEnter(Sender: TObject);
    procedure ButtonMouseLeave(Sender: TObject);
    procedure BalikHome;
  private
    Time: integer;
  public
  end;

var
  FormHome: TFormHome;

implementation

uses UnitTD, UnitQuote, UnitTips, UnitPomo, UnitCreator;

{$R *.dfm}

procedure TFormHome.ButtonColorMouseEnter(Sender: TObject);
begin
  if Sender is TLabel then
    (Sender as TLabel).Color:=clGradientActiveCaption;
    (Sender as TLabel).Font.Color:=clWhite;
end;

procedure TFormHome.ButtonColorMouseLeave(Sender: TObject);
begin
  if Sender is TLabel then
    (Sender as TLabel).Color := clActiveCaption;
    (Sender as TLabel).Font.Color:= clWhite;
end;

procedure TFormHome.RedirectPage(A: TLabel; Sender: TForm);
begin
    A.Color := clWhite;
    A.Font.Color:= clActiveCaption;
    (Sender as TForm).Show;
end;

{======================================================= Button To-Do and Quote}

procedure TFormHome.ButtonTDQuoteClick(Sender: TObject);
begin
    RedirectPage(ButtonTDQuote, FormTD);
end;

{============================================================ Button Study Tips}

procedure TFormHome.ButtonStudyClick(Sender: TObject);
begin
    RedirectPage(ButtonStudy, FormTips);
    FormHome.Hide;
end;

{================================================================ Button Quotes}

procedure TFormHome.ButtonQuotesClick(Sender: TObject);
begin
    RedirectPage(ButtonQuotes, FormQuote);
end;

{============================================================== Button Pomodoro}

procedure TFormHome.ButtonPomoClick(Sender: TObject);
begin
    RedirectPage(ButtonPomo, FormPomo);
    FormHome.Hide;
end;

{===================================================================== Homepage}

procedure TFormHome.UpdateTimeLabel;
var
    titik: integer;
function AnimTitik(titik: integer): string;           {materi fungsi recurrence}
    begin
        if titik mod 4=0 then
            result:=''
        else
            result:=AnimTitik(titik-1)+'.';
    end;
begin
    titik:=strtoint(FormatDateTime('ss', Now));
    Time:= strtoint(FormatDateTime('hh', Now));
    LabelTime.Caption:= FormatDateTime('hh:mm', Now)+' '+AnimTitik(Titik);
end;

procedure TFormHome.Greetings;
  procedure Tell(A:string);
  begin
      LabelSambutan.Caption:=' Good '+A;
  end;

BEGIN
    if (4<Time) and (Time<13) then
        Tell('morning')
    else if (12<Time) and (Time<19) then
        Tell('afternoon')
    else
        Tell('evening');
END;

procedure TFormHome.FormCreate(Sender: TObject);
begin
    UpdateTimeLabel;
    Greetings;                                                 {1 detik=1000}
    TimerJam.Enabled:= True;
end;

procedure TFormHome.TimerJamTimer(Sender: TObject);
begin
    UpdateTimeLabel;
end;

{====================================================================== Creator}

procedure TFormHome.LabelStudyBuddyClick(Sender: TObject);
begin
    FormCreator.Show;
end;

{============================================================ Button Ganti font}

procedure TFormHome.ButtonMouseEnter(Sender: TObject);
begin
  if Sender is TLabel then
    (Sender as TLabel).Font.Style := (Sender as TLabel).Font.Style + [fsBold];
end;

procedure TFormHome.ButtonMouseLeave(Sender: TObject);
begin
  if Sender is TLabel then
    (Sender as TLabel).Font.Style := (Sender as TLabel).Font.Style - [fsBold];
end;

procedure TFormHome.BalikHome;
begin
    FormHome.Show;
end;

end.
