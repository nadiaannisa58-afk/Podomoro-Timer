unit UnitTD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormTD = class(TForm)
    Edit1: TEdit;
    Buttonadd: TButton;
    Buttoncomplete: TButton;
    Buttondellete: TButton;
    ListBox1: TListBox;
    procedure ButtonaddClick(Sender: TObject);
    procedure ButtoncompleteClick(Sender: TObject);
    procedure ButtondelleteClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  FormTD: TFormTD;

implementation

{$R *.dfm}

procedure TFormTD.ButtonaddClick(Sender: TObject);
begin
if Trim(Edit1.Text) <> '' then
    ListBox1.Items.Add(edit1.Text);
    Edit1.Clear;
end;

procedure TFormTD.ButtoncompleteClick(Sender: TObject);
var
  A, B: string;
  procedure CekA;
  begin
    B := Copy(A, 1, 11);
  end;
begin
  if ListBox1.ItemIndex <> -1 then
  begin
      A:=ListBox1.Items[ListBox1.ItemIndex];
      CekA;
      if Pos('[Completed]', A)=0 then
          ListBox1.Items[ListBox1.ItemIndex]:='[Completed] '+A
      else
          ListBox1.Items[ListBox1.ItemIndex]:=StringReplace(A, '[Completed] ', '', []);
  end;
end;


procedure TFormTD.ButtondelleteClick(Sender: TObject);
begin
  if ListBox1.ItemIndex <> -1 then
    ListBox1.Items.Delete(ListBox1.ItemIndex);
end;


end.
