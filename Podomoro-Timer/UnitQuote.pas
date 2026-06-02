unit UnitQuote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormQuote = class(TForm)
    pompompom: TMemo;
    ButtonClick: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure TextMouseEnter(Sender: TObject);
    procedure TextMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormQuote: TFormQuote;

implementation

uses UnitHome;

{$R *.dfm}

procedure TFormQuote.TextMouseEnter(Sender: TObject);
begin
    FormHome.ButtonMouseEnter(Sender as TObject);
end;

procedure TFormQuote.TextMouseLeave(Sender: TObject);
begin

    FormHome.ButtonMouseLeave(Sender as TObject);
end;

const
	quotes: array [0..29] of string =('In my soul, I am still that small child who did not care about anything else but the beautiful colours of a rainbow.',
                                    'Some day, you will be old enough to start reading fairy tales again.',
                                    'When you feel a child inside of you springing to life, that’s how you know you’re where you should be.',
                                    'The wound is not my fault. But the healing is my responsibility.',
                                    'The first step towards getting somewhere is to decide that you are not going to stay where you are.',
                                    'Nothing can bring you peace but yourself.',
                                    'Work like there is someone working 24 hours a day to take it away from you.',
                                    'Life isn’t finding shelter in the storm. It’s about learning to dance in the rain.',
                                    'Life is like riding a bicycle. To keep your balance, you must keep moving.',
                                    'You are never too old to set another goal or to dream a new dream.',
                                    'It always seems impossible until it’s done.',
                                    'Life isn’t about finding yourself. Life is about creating yourself.',
                                    'Talk to yourself like someone you love.',
                                    'How you love yourself is how you teach others to love you.',
                                    'To fall in love with yourself is the first secret to happiness.',
                                    'You must find the place inside yourself where nothing is impossible.',
                                    'Be so completely yourself that everyone else feels safe to be themselves, too.',
                                    'The worst loneliness is to not be comfortable with yourself.',
                                    'No person is your friend who demands your silence, or denies your right to grow.',
                                    'Nothing brings down walls as surely as acceptance.',
                                    'Every step of our life we need to accept ourselves all over again.',
                                    'The way I see it, if you want the rainbow, you gotta put up with the rain.',
                                    'Know that everything is in perfect order whether you understand it or not.',
                                    'The key to happiness is believing you are enough.',
                                    'The more you know who you are, and what you want, the less you let things upset you.',
                                    'I will win. Not immediately, but definitely.',
                                    'You made it this far, don’t give up.',
                                    'I have done well on tests in the past, and I can do it again.',
                                    'You grow through what you go through.',
                                    'Life is a beautiful struggle.');

procedure TFormQuote.Button1Click(Sender: TObject);
var
  RandomCategoryIndex: Integer;
  Categories: array of string;
begin
  Randomize;

  SetLength(Categories, Length(quotes));
  Move(quotes[Low(quotes)], Categories[Low(Categories)], Length(quotes) * Sizeof(string));
  RandomCategoryIndex := Random(Length(Categories));
  pompompom.Text := Categories[RandomCategoryIndex];
end;


end.
