unit calculadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, StrUtils, Buttons, Menus;

type
  TForm2 = class(TForm)
    PnlTraseiro: TPanel;
    PnlZero: TPanel;
    PnlNove: TPanel;
    PnlQuatro: TPanel;
    PnlSete: TPanel;
    PnlOito: TPanel;
    PnlSeis: TPanel;
    PnlCinco: TPanel;
    PnlTres: TPanel;
    PnlDois: TPanel;
    EdtVisor: TEdit;
    PnlUm: TPanel;
    PnlVirgula: TPanel;
    PnlIgual: TPanel;
    PnlMultiplicar: TPanel;
    PnlSomar: TPanel;
    PnlDividir: TPanel;
    PnlSubtrair: TPanel;
    PnlLimpar: TPanel;
    PnlMenu: TPanel;
    SpeedButton1: TSpeedButton;
    PnlPadrao: TPanel;
    PnlVerde: TPanel;
    PnlJanio: TPanel;
    PnlEscuro: TPanel;
    TEMA: TLabel;
    SpdBtHistorico: TSpeedButton;
    GbHistorico: TGroupBox;
    MmHistorico: TMemo;
    procedure PnlSeteClick(Sender: TObject);
    procedure PnlOitoClick(Sender: TObject);
    procedure PnlNoveClick(Sender: TObject);
    procedure PnlQuatroClick(Sender: TObject);
    procedure PnlCincoClick(Sender: TObject);
    procedure PnlSeisClick(Sender: TObject);
    procedure PnlUmClick(Sender: TObject);
    procedure PnlDoisClick(Sender: TObject);
    procedure PnlTresClick(Sender: TObject);
    procedure PnlZeroClick(Sender: TObject);
    procedure PnlVirgulaClick(Sender: TObject);
    procedure PnlDividirClick(Sender: TObject);
    procedure PnlMultiplicarClick(Sender: TObject);
    procedure PnlSubtrairClick(Sender: TObject);
    procedure PnlSomarClick(Sender: TObject);
    procedure PnlIgualClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function JaTemVirgula(Texto: String): Boolean;
    function Backspace(Numero: String): String;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PnlLimparClick(Sender: TObject);
    procedure Operadores(Operador: String);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PnlPadraoClick(Sender: TObject);
    procedure PnlVerdeClick(Sender: TObject);
    procedure PnlJanioClick(Sender: TObject);
    procedure PnlEscuroClick(Sender: TObject);
    procedure MudarTema(IndiceTema: Integer);
    procedure SpdBtHistoricoClick(Sender: TObject);

  private
    procedure ApertarBotao(tecla: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IndiceJanio,
  Contador,
  ContadorHistorico: Integer;
  Aberto,
  HistoricoAberto: Boolean;
  Form2: TForm2;
  resultado: double;
  Var1,
  Var2,
  Oper: string;

implementation

uses Math;

{$R *.dfm}


procedure TForm2.PnlSeteClick(Sender: TObject);
begin
  ApertarBotao(PnlSete.Caption);
end;

procedure TForm2.PnlOitoClick(Sender: TObject);
Begin
  ApertarBotao(PnlOito.Caption);
end;

procedure TForm2.PnlNoveClick(Sender: TObject);
Begin
  ApertarBotao(PnlNove.Caption);
end;

procedure TForm2.PnlQuatroClick(Sender: TObject);
Begin
  ApertarBotao(PnlQuatro.Caption);
end;

procedure TForm2.PnlCincoClick(Sender: TObject);
Begin
  ApertarBotao(PnlCinco.Caption);
end;

procedure TForm2.PnlSeisClick(Sender: TObject);
Begin
  ApertarBotao(PnlSeis.Caption);
end;

procedure TForm2.PnlUmClick(Sender: TObject);
Begin
  ApertarBotao(PnlUm.Caption);
end;

procedure TForm2.PnlDoisClick(Sender: TObject);
Begin
  ApertarBotao (PnlDois.Caption);
end;

procedure TForm2.PnlTresClick(Sender: TObject);
Begin
  ApertarBotao (PnlTres.Caption);
end;

procedure Tform2.PnlZeroClick(Sender: TObject);
Begin
  ApertarBotao (PnlZero.Caption);
end;

procedure Tform2.ApertarBotao(tecla: string);
begin

  if (Oper = '') then
  begin
    Var1 := Var1 + tecla;
    EdtVisor.Text := Var1 + Oper + Var2;
  end
  else
  begin
    Var2 := Var2 + tecla;
    EdtVisor.Text := Var1 + Oper + Var2;
  end;

  EdtVisor.SetFocus;
  EdtVisor.SelStart := Length(EdtVisor.Text);

end;

procedure TForm2.PnlVirgulaClick(Sender: TObject);
begin

  if (Oper = '') then
  begin
    if Not JaTemVirgula(Var1) then
    begin
      Var1 := Var1 + ',';
      EdtVisor.Text := Var1;
    end;
  end
  else
  begin
    if Not JaTemVirgula(Var2) then
    begin
      Var2 := Var2 + ',';
      EdtVisor.Text := Var1 + Oper + Var2;
    end;
  end;

  EdtVisor.SetFocus;
  EdtVisor.SelStart := Length(EdtVisor.Text);

end;

function Tform2.JaTemVirgula(Texto: String): Boolean;
begin
  if pos(',', Texto) = 0 then
    Result := False
  else
    Result := True;
end;

procedure TForm2.PnlDividirClick(Sender: TObject);
begin
  Operadores('/');
end;

procedure TForm2.PnlMultiplicarClick(Sender: TObject);
begin
  Operadores('*');
end;

procedure TForm2.PnlSubtrairClick(Sender: TObject);
begin
  Operadores('-');
end;

procedure TForm2.PnlSomarClick(Sender: TObject);
begin
  Operadores('+');
end;

procedure Tform2.Operadores(Operador: String);
begin
  if (Var1 <> '') then
  begin
    Oper := Operador;
    EdtVisor.Text := Var1 + Oper + Var2;
    EdtVisor.SetFocus;
    EdtVisor.SelStart := Length(EdtVisor.Text);
  end;
end;

procedure TForm2.PnlIgualClick(Sender: TObject);

Var DataAtual: TDateTime;

begin
  if (Var2 <> '') then
  begin
    case AnsiIndexStr(Oper, ['/', '*', '-', '+'])of
       0:
       begin
         if (Var2 <> '0') then
          resultado := StrToFloat(Var1) / StrToFloat(Var2)
         else
         begin
           Application.MessageBox('Não é possível dividir por zero.', 'Erro de divisão' ,MB_OK + MB_ICONINFORMATION);
           PnlLimparClick(nil);
         end;
       end;
       1: resultado := StrToFloat(Var1) * StrToFloat(Var2);
       2: resultado := StrToFloat(Var1) - StrToFloat(Var2);
       3: resultado := StrToFloat(Var1) + StrToFloat(Var2);
    end;

    if (IndiceJanio = 2) then
       resultado := 24;

  end
  else
    PnlLimparClick(nil);

  MmHistorico.Lines.Add (Var1 + Oper + Var2 +' = ' + FloatToStr(resultado));
  DataAtual := Now;
  MmHistorico.Lines.Add (DateToStr(DataAtual) + ' - ' + (TimeToStr(DataAtual)));
  MmHistorico.Lines.Add('----------------------------------------');

  EdtVisor.Text := FloatToStr(resultado);
  Oper := '';
  Var1 := FloatToStr(resultado);
  Var2 := '';
  EdtVisor.SetFocus;
  EdtVisor.SelStart := Length(EdtVisor.Text);
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  IndiceJanio := 0;
  Contador:= 0;
  ContadorHistorico := 263;
  Aberto := True;
  HistoricoAberto := True;
  EdtVisor.SetFocus;
  Var1 := '';
  Var2 := '';
  resultado := 0;
  Oper := '';
end;

procedure TForm2.FormKeyPress(Sender: TObject; var Key: Char);
begin
   case Key of
     #8:
     begin
       if (Oper <> '') then
       begin
         Var2 := Backspace(Var2);
       end
       else
       if (Oper = '') then
       begin
         Var1 := Backspace(Var1);
       end
       else
       if (Oper <> '') and (Var2 = '') then
           Oper := Backspace(Oper);

       EdtVisor.Text := Var1 + Oper + Var2;
       EdtVisor.SelStart := Length(EdtVisor.Text);
     end;
     #13: PnlIgualClick(nil);
     '0': PnlZeroClick(nil);
     '1': PnlUmClick(nil);
     '2': PnlDoisClick(nil);
     '3': PnlTresClick(nil);
     '4': PnlQuatroClick(nil);
     '5': PnlCincoClick(nil);
     '6': PnlSeisClick(nil);
     '7': PnlSeteClick(nil);
     '8': PnlOitoClick(nil);
     '9': PnlNoveClick(nil);
     '/': PnlDividirClick(nil);
     '*': PnlMultiplicarClick(nil);
     '-': PnlSubtrairClick(nil);
     '+': PnlSomarClick(nil);
     ',': PnlVirgulaClick(nil);
   end;
end;

function Tform2.Backspace (Numero: String): String;
var
    Str: string;
begin
  Str := '';
  Str := Copy(Numero, 1, Length(Numero)-1);
  Result := Str;
end;

procedure TForm2.PnlLimparClick(Sender: TObject);
begin
  EdtVisor.SetFocus;
  Var1 := '';
  Var2 := '';
  resultado := 0;
  Oper := '';
  EdtVisor.Text := '';
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);

begin
  if (Aberto) then
  begin
    while (Contador <= 257) do
    begin
      PnlMenu.Height := Contador + 1;
      PnlMenu.Width := PnlMenu.Height;
      inc(Contador);
      Aberto := False;
    end;
  end
  else
  begin
    while (Contador > 28) do
    begin
      PnlMenu.Height := Contador - 1;
      PnlMenu.Width := PnlMenu.Height;
      Dec(Contador);
      Aberto := True;
    end;
  end;
end;

procedure TForm2.PnlPadraoClick(Sender: TObject);
begin
  IndiceJanio := 0;
  MudarTema(0);
end;

procedure TForm2.PnlVerdeClick(Sender: TObject);
begin
  IndiceJanio := 1;
  MudarTema(1);
end;

procedure TForm2.PnlJanioClick(Sender: TObject);
begin
  IndiceJanio := 2;
  MudarTema(2);
end;

procedure TForm2.PnlEscuroClick(Sender: TObject);
begin
  IndiceJanio := 3;
  MudarTema(3);
end;

procedure Tform2.MudarTema (IndiceTema: Integer);

var CorBotao, CorFundo, CorOperador, CorFonteVisor,  CorVisor,  CorParede, CorFonteBotao, CorFonteGbHistorico: TColor;

begin
  case IndiceTema of
      0:   //Padrão
      begin
        CorBotao := clBtnFace;
        CorFundo := clBtnFace;
        CorOperador := clSilver;
        CorFonteVisor := clBlack;
        CorVisor := clWhite;
        CorParede := clActiveCaption;
        CorFonteBotao := clBlack;
        CorFonteGbHistorico := clBlack;
      end;
      1:   //Verde
      begin
        CorBotao := $00E4E7C2;
        CorFundo := $00A6CEA7;
        CorOperador := $00BDBF7D;
        CorFonteVisor := $006B7535;
        CorVisor := clBtnFace;
        CorParede := $00447B4D;
        CorFonteBotao := clBlack;
        CorFonteGbHistorico := clBlack;
      end;
      2:   //Rosa
      begin
        CorBotao := $00F3DDF4;
        CorFundo := $00E292CE;
        CorOperador := $00DFB3DB;
        CorFonteVisor := $00A52BAE;
        CorVisor := clBtnFace;
        CorParede := $00E8ACB0;
        CorFonteBotao := clBlack;
        CorFonteGbHistorico := clBlack;
      end;
      3:   //Escuro
      begin
        CorBotao := $00452D29;
        CorFundo := $00452D29;
        CorOperador := $001F1610;
        CorFonteVisor := clBlack;
        CorVisor := clBtnFace;
        CorParede := $006A4D40;
        CorFonteBotao := clWhite;
        CorFonteGbHistorico := clWhite;
      end;
  end;
  PnlTraseiro.Color := CorFundo;
  PnlZero.Color := CorBotao;
  PnlZero.Font.Color := CorFonteBotao;
  PnlUm.Color := CorBotao;
  PnlUm.Font.Color := CorFonteBotao;
  PnlDois.Color := CorBotao;
  PnlDois.Font.Color := CorFonteBotao;
  PnlTres.Color := CorBotao;
  PnlTres.Font.Color := CorFonteBotao;
  PnlQuatro.Color := CorBotao;
  PnlQuatro.Font.Color := CorFonteBotao;
  PnlCinco.Color := CorBotao;
  PnlCinco.Font.Color := CorFonteBotao;
  PnlSeis.Color := CorBotao;
  PnlSeis.Font.Color := CorFonteBotao;
  PnlSete.Color := CorBotao;
  PnlSete.Font.Color := CorFonteBotao;
  PnlOito.Color := CorBotao;
  PnlOito.Font.Color := CorFonteBotao;
  PnlNove.Color := CorBotao;
  PnlNove.Font.Color := CorFonteBotao;
  PnlVirgula.Color := CorBotao;
  PnlVirgula.Font.Color := CorFonteBotao;
  PnlIgual.Color := CorBotao;
  PnlIgual.Font.Color := CorFonteBotao;
  PnlLimpar.Color := CorBotao;
  PnlLimpar.Font.Color := CorFonteBotao;
  PnlDividir.Color := CorOperador;
  PnlDividir.Font.Color := CorfonteBotao;
  PnlMultiplicar.Color := CorOperador;
  PnlMultiplicar.Font.Color := CorfonteBotao;
  PnlSomar.Color := CorOperador;
  PnlSomar.Font.Color := CorfonteBotao;
  PnlSubtrair.Color := CorOperador;
  PnlSubtrair.Font.Color := CorfonteBotao;
  EdtVisor.Font.Color := CorFonteVisor;
  EdtVisor.Color := CorVisor;
  Form2.Color := CorParede;
  PnlTraseiro.Font.Color := CorFonteBotao;
  GbHistorico.Font.Color := CorFonteGbHistorico;
end;

procedure TForm2.SpdBtHistoricoClick(Sender: TObject);
begin
  if (HistoricoAberto) then
  begin
    while (ContadorHistorico <= 437) do
    begin
      PnlTraseiro.Width := ContadorHistorico + 1;
      Form2.Width := ContadorHistorico + 84;
      inc(ContadorHistorico);
      HistoricoAberto := False;
      Application.ProcessMessages;
    end
  end
  else
  begin
    while (ContadorHistorico > 261) do
    begin
      PnlTraseiro.Width := ContadorHistorico - 1;
      Form2.Width := ContadorHistorico + 84 ;
      Dec(ContadorHistorico);
      HistoricoAberto := True;
      Application.ProcessMessages;
    end;
  end
end;

end.









