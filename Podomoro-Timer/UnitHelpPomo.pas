unit UnitHelpPomo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

type
  TFormHelpPomo = class(TForm)
    Shape1: TShape;
    Label1: TLabel;
    Shape2: TShape;
    Label2: TLabel;
    TBack: TShape;
    TNext: TShape;
    NPanel: TLabel;
    MemoHelp: TMemo;
    procedure ShowHelp(i: integer);
    procedure HideHelp(i: integer);
    function GetHelpText(index: Integer): String;
    procedure ButtonNext(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure ButtonBack(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
    procedure NPanelKe(i: integer);
  private
    { Private declarations }
  public
    n: integer;
  end;

var
  FormHelpPomo: TFormHelpPomo;

implementation

{$R *.dfm}

const
    Memo1='User bisa menggunakan timer Pomodoro dengan durasi default 25 menit untuk Pomodoro, 5 menit untuk short break, 20 menit untuk long break.';
    Memo2='Setiap kali User menyelesaikan satu sesi (bagian apapun), User akan langsung diarahkan ke bagian berikutnya (misal selesai Pomodoro akan diarahkan ke short break).';
    Memo3='Satu siklus terdiri dari 4 sesi Pomodoro-short break dan 1 sesi long break.';
    Memo4='Sesi Pomodoro tertera di bagian kiri timer. Tampilan sesi akan bertambah satu jika User menyelesaikan satu sesi short break. Jika sesinya sudah mencapai 4, User akan langsung diarahkan ke bagian long break dan sesinya akan dimulai dari satu lagi.';
    Memo5='Untuk mengubah durasi timer, tekan tombol "edit timer" dan ketik durasi baru di timernya langsung. Apabila sudah, tekan tombol "selesai" agar timer bisa dipakai. Durasi baru akan disimpan.';
    Memo6='Ketika tombol "start" ditekan, timer akan dimulai dan tombolnya akan berubah menjadi "pause". Tombol "pause" akan menghentikan timer sementara.';
    Memo7='Tombol "reset" akan memulai ulang timer dari awal (dalam durasi baru).';
    Memo8='Jika User ingin pindah ke bagian pomodoro, short break, atau long break, tekan tombol bagian yang tersedia di bawah timer. User sedang ada di bagian yang di-highlight.';

procedure TFormHelpPomo.ShowHelp(i: integer);
begin
    NPanel.Caption:=inttostr(i)+'/8';
    MemoHelp.Text:=GetHelpText(i);
end;

procedure TFormHelpPomo.HideHelp(i: integer);
begin
    MemoHelp.Clear;
end;

function TFormHelpPomo.GetHelpText(index: Integer): String;
begin
  case index of
    1: Result:= Memo1;
    2: Result:= Memo2;
    3: Result:= Memo3;
    4: Result:= Memo4;
    5: Result:= Memo5;
    6: Result:= Memo6;
    7: Result:= Memo7;
    8: Result:= Memo8;
  else
    Result := Memo1;
  end;
end;

procedure TFormHelpPomo.NPanelKe(i: integer);
begin
    NPanel.Caption:=inttostr(i)+'/8';
end;

procedure TFormHelpPomo.ButtonNext(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    HideHelp(n);
    n:=n+1;
    if n=9 then n:=1;
    ShowHelp(n);
end;

procedure TFormHelpPomo.ButtonBack(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    HideHelp(n);
    n:=n-1;
    if n=0 then n:=8;
    ShowHelp(n);
end;

procedure TFormHelpPomo.FormCreate(Sender: TObject);
begin
    n:=1;
    ShowHelp(n);
end;

end.
