program StudyBuddy;

uses
  Forms,
  UnitHome in 'UnitHome.pas' {FormHome},
  UnitHelpPomo in 'UnitHelpPomo.pas' {FormHelpPomo},
  UnitCreator in 'UnitCreator.pas' {FormCreator},
  UnitLong in 'UnitLong.pas' {FormLong},
  UnitPomo in 'UnitPomo.pas' {FormPomo},
  UnitShort in 'UnitShort.pas' {FormShort},
  UnitQuote in 'UnitQuote.pas' {FormQuote},
  UnitTips in 'UnitTips.pas' {FormTips},
  UnitTD in 'UnitTD.pas' {FormTD};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormHome, FormHome);
  Application.CreateForm(TFormHelpPomo, FormHelpPomo);
  Application.CreateForm(TFormCreator, FormCreator);
  Application.CreateForm(TFormLong, FormLong);
  Application.CreateForm(TFormPomo, FormPomo);
  Application.CreateForm(TFormShort, FormShort);
  Application.CreateForm(TFormQuote, FormQuote);
  Application.CreateForm(TFormTips, FormTips);
  Application.CreateForm(TFormTD, FormTD);
  Application.CreateForm(TFormTD, FormTD);
  Application.Run;
end.
