unit UPrincP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ComPort, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TFPrincP = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Memo1: TMemo;
    Memo2: TMemo;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit15: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    procedure ComPort1RxChar(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    function IntToBin(number : byte) : string;
  private
    { Private declarations }
    Str : string;
    allStr : string;
    count : integer;
    countInstruction : integer;
    high_instruction : byte;
    low_instruction : byte;
    high_rd1 : byte;
    low_rd1 : byte;
    high_rd2 : byte;
    low_rd2 : byte;
    high_pcNext : byte;
    low_pcNext : byte;
    high_extImm : byte;
    low_extImm : byte;
    high_aluRes : byte;
    low_aluRes : byte;
    high_branchAddress : byte;
    low_branchAddress : byte;
    high_writeData : byte;
    low_writeData : byte;
    high_jumpAddress : byte;
    low_jumpAddress : byte;
    signals : byte;
    instruction : string;
    rd1 : string;
    rd2 : string;
    pcNext : string;
    extImm : string;
    aluRes : string;
    branchAddress : string;
    writeData : string;
    jumpAddress : string;
    okFirst : boolean;
    signalStr : string;
  public
    { Public declarations }
  end;

var
  FPrincP: TFPrincP;

implementation

{$R *.dfm}

uses USecondP;

procedure TFPrincP.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TFPrincP.Button2Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TFPrincP.Button3Click(Sender: TObject);
begin
  //FSecondP.Show();
end;

procedure TFPrincP.ComPort1RxChar(Sender: TObject);
var b : byte;
    c : char;
begin
  //b := ComPort1.ReadByte();



//  if okFirst = false then
//  begin
//    okFirst := true;
//    exit;
//  end;
//
//
//  if count = 0 then
//  begin
//    high_instruction := b;
//  end else if count = 1 then
//  begin
//    low_instruction := b;
//    instruction := instruction + IntToHex(high_instruction);
//    instruction := instruction + IntToHex(low_instruction);
//    Edit1.Text := instruction;
//    Memo2.Lines.Add(instruction);
//  end else if count = 2 then
//  begin
//    high_rd1 := b;
//  end else if count = 3 then
//  begin
//    low_rd1 := b;
//    rd1 := rd1 + IntToHex(high_rd1);
//    rd1 := rd1 + IntToHex(low_rd1);
//    Edit2.Text := rd1;
//    Memo2.Lines.Add(rd1);
//  end else if count = 4 then
//  begin
//    high_rd2 := b;
//  end else if count = 5 then
//  begin
//    low_rd2 := b;
//    rd2 := rd2 + IntToHex(high_rd2);
//    rd2 := rd2 + IntToHex(low_rd2);
//    Edit3.Text := rd2;
//    Memo2.Lines.Add(rd2);
//  end else if count = 6 then
//  begin
//    high_pcNext := b;
//  end else if count = 7 then
//  begin
//    low_pcNext := b;
//    pcNext := pcNext + IntToHex(high_pcNext);
//    pcNext := pcNext + IntToHex(low_pcNext);
//    Edit4.Text := pcNext;
//    Memo2.Lines.Add(pcNext);
//  end else if count = 8 then
//  begin
//    high_extImm := b;
//  end else if count = 9 then
//  begin
//    low_extImm := b;
//    extImm := extImm + IntToHex(high_extImm);
//    extImm := extImm + IntToHex(low_extImm);
//    Edit5.Text := extImm;
//    Memo2.Lines.Add(extImm);
//  end else if count = 10 then
//  begin
//    high_aluRes := b;
//  end else if count = 11 then
//  begin
//    low_aluRes := b;
//    aluRes := aluRes + IntToHex(high_aluRes);
//    aluRes := aluRes + IntToHex(low_aluRes);
//    Edit6.Text := aluRes;
//    Memo2.Lines.Add(aluRes);
//  end else if count = 12 then
//  begin
//    high_branchAddress := b;
//  end else if count = 13 then
//  begin
//    low_branchAddress := b;
//    branchAddress := branchAddress + IntToHex(high_branchAddress);
//    branchAddress := branchAddress + IntToHex(low_branchAddress);
//    Edit7.Text := branchAddress;
//    Memo2.Lines.Add(branchAddress);
//  end else if count = 14 then
//  begin
//    high_writeData := b;
//  end else if count = 15 then
//  begin
//    low_writeData := b;
//    writeData := writeData + IntToHex(high_writeData);
//    writeData := writeData + IntToHex(low_writeData);
//    Edit8.Text := writeData;
//    Memo2.Lines.Add(writeData);
//  end else if count = 16 then
//  begin
//    high_jumpAddress := b;
//  end else if count = 17 then
//  begin
//    low_jumpAddress := b;
//    jumpAddress := jumpAddress + IntToHex(high_jumpAddress);
//    jumpAddress := jumpAddress + IntToHex(low_jumpAddress);
//    Edit9.Text := jumpAddress;
//    Memo2.Lines.Add(jumpAddress);
//  end else if count = 18 then
//  begin
//    signals := b;
//
//    signalStr := IntToBin(signals);
//
//    Edit10.Text := signalStr.Chars[0];
//    Edit11.Text := signalStr.Chars[1];
//    Edit12.Text := signalStr.Chars[2];
//    Edit13.Text := signalStr.Chars[3];
//    Edit14.Text := signalStr.Chars[4];
//    Edit15.Text := signalStr.Chars[7];
//    Edit16.Text := signalStr.Chars[5];
//    Edit17.Text := signalStr.Chars[6];
//    Edit18.Text := Edit14.Text;
//    Edit19.Text := Edit17.Text;
//    Edit20.Text := Edit16.Text;
//    Edit21.Text := Edit12.Text;
//    Edit22.Text := Edit13.Text;
//    Edit23.Text := Edit11.Text;
//    Edit24.Text := Edit10.Text;
//
//    instruction := '';
//    rd1 := '';
//    rd2 := '';
//    pcNext := '';
//    extImm := '';
//    aluRes := '';
//    branchAddress := '';
//    writeData := '';
//    jumpAddress := '';
//    signalStr := '';
//
//  end;
//
//  allStr := allStr + b.ToString;
//
//  Memo1.Lines.Add(b.ToString);
//  Memo1.Lines.Add(count.ToString);
//
//  if count = 18  then
//  begin
//    count := 0;
//  end else begin
//    count := count + 1;
//  end;



End;

procedure TFPrincP.FormShow(Sender: TObject);
begin
//  allStr := '';
//  instruction := '';
//  rd1 := '';
//  rd2 := '';
//  pcNext := '';
//  extImm := '';
//  aluRes := '';
//  branchAddress := '';
//  writeData := '';
//  jumpAddress := '';
//  signalStr := '';
//  count := 0;
//  okFirst := false;
end;

function TFPrincP.IntToBin(number: byte): string;
var
  i: integer;
begin
//  for i := 0 to 7 do
//    Result := IntToStr((number shr i) and 1)+Result;
end;


end.
