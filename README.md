# Delphi-Hangul-Parser

## Feature
- 단어를 자음/모음으로 분리합니다.
- 단순 초성과 모음, 알파벳, 특수문자 등은 제외합니다.

## Function
- ***HangulParse(AWord: string; ADelimiter: Char = #0): string;***

## Example
- ParseToString
```pascal
memo1.text := HangulParse('테스트');
```
```
결과 : ㅌㅔㅅㅡㅌㅡ
```
- ParseToDelimeter
```pascal
memo1.text := HangulParse('테스트', ',');
```
```
결과 : ㅌ,ㅔ,ㅅ,ㅡ,ㅌ,ㅡ
```
- ParseToArray
```pascal
var
  arrHangul : TArray<string>;
  I: Integer;
begin
  arrHangul := HangulParse('테스트', ',').Split([',']);

  for I := 0 to High(arrHangul) do
  begin
    memo1.Lines.Add(inttostr(I+1) + '. ' + (arrHangul[I]));
  end;
end;
```
```
결과 : 
1. ㅌ
2. ㅔ
3. ㅅ
4. ㅡ
5. ㅌ
6. ㅡ
```

