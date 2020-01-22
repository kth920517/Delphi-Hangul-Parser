{******************************************************************************}
{                                                                              }
{                           Delphi HangulParser                                }
{                                                                              }
{                       Copyright (C) TeakHyun Kang                            }
{                                                                              }
{                       https://github.com/kth920517                           }
{                       https://developist.tistory.com/                        }
{                                                                              }
{******************************************************************************}

unit HangulParser;

interface

uses
  System.Classes, System.SysUtils, Winapi.Windows;

const
  HANGUL_START_UNICODE = $AC00;
  HANGUL_END_UNICODE   = $D7A3;

  //초성
  ARRAY_SET_CHOSUNG : array[0..18] of string = (
    'ㄱ', 'ㄲ',
    'ㄴ',
    'ㄷ', 'ㄸ',
    'ㄹ', 'ㅁ',
    'ㅂ', 'ㅃ',
    'ㅅ', 'ㅆ',
    'ㅇ',
    'ㅈ', 'ㅉ',
    'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ');

  //중성
  ARRAY_SET_JUNGSUNG : array[0..20] of string = (
    'ㅏ', 'ㅐ', 'ㅑ', 'ㅒ',
    'ㅓ', 'ㅔ', 'ㅕ', 'ㅖ',
    'ㅗ', 'ㅘ', 'ㅙ', 'ㅚ', 'ㅛ',
    'ㅜ', 'ㅝ', 'ㅞ', 'ㅟ', 'ㅠ',
    'ㅡ', 'ㅢ', 'ㅣ');

  //종성
  ARRAY_SET_JONGSUNG : array[0..27] of string = (
    '', 'ㄱ', 'ㄲ', 'ㄳ',
    'ㄴ', 'ㄵ', 'ㄶ',
    'ㄷ',
    'ㄹ', 'ㄺ', 'ㄻ', 'ㄼ', 'ㄽ', 'ㄾ', 'ㄿ', 'ㅀ',
    'ㅁ',
    'ㅂ', 'ㅄ',
    'ㅅ', 'ㅆ',
    'ㅇ', 'ㅈ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ');

function HangulParse(AWord: string; ADelimiter: Char = #0): string;

implementation

function HangulParse(AWord: string; ADelimiter: Char): string;
var
  I: Integer;
  nLength : Integer;
  lstResult : TStringList;

  sTemp : WideChar;
  nUniCode : Integer;
  nCho  : Integer;
  nJung : Integer;
  nJong : Integer;
begin
  Result := '';

  if AWord = '' then Exit;

  try
    lstResult := TStringList.Create;
    lstResult.LineBreak := '';
    lstResult.Delimiter := ADelimiter;
    lstResult.StrictDelimiter := True;

    try
      nLength := Length(AWord);

      for I := 1 to nLength do
      begin
        sTemp := AWord[I];
        nUniCode := Integer(sTemp);

        if (HANGUL_START_UNICODE <= nUniCode) and (nUniCode <= HANGUL_END_UNICODE) then
        begin
          nUniCode := nUniCode - HANGUL_START_UNICODE;
          nJong    := nUniCode mod 28;
          nJung    := (nUniCode - nJong) div 28 mod 21;
          nCho     := Integer((nUniCode - nJong) div 28 div 21);

          lstResult.Add(ARRAY_SET_CHOSUNG[nCho]);
          lstResult.Add(ARRAY_SET_JUNGSUNG[nJung]);

          if nJong > 0 then
            lstResult.Add(ARRAY_SET_JONGSUNG[nJong]);
        end
        else
          lstResult.Add(sTemp);
      end;

      if ADelimiter = '' then
        Result := lstResult.Text
      else
        Result := lstResult.DelimitedText;
    finally
      lstResult.Free;
    end;
  except
    on E: Exception do
      raise Exception.Create('Hangul Parse Failed! - ' + E.Message);
  end;
end;

end.
