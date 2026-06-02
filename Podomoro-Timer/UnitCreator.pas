unit UnitCreator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormCreator = class(TForm)
    ButtonPomo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCreator: TFormCreator;

implementation

{$R *.dfm}

end.
