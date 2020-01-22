# Delphi-Hangul-Parser

#### uses절에 HangulParser를 추가하고 함수를 호출하면 해당 단어를 분리합니다.
#### (가 ~ 힣에 해당하지 않는 단순 초성과 모음, 알파벳, 특수문자 등은 제외)

##### ***HangulParse(AWord: string; ADelimiter: Char = #0): string;***

##### ***예제 1***
```pascal
memo1.text := HangulParse('강택현');
```
###### 결과 -> ㄱㅏㅇㅌㅐㄱㅎㅕㄴ
##### ***예제 2***
```pascal
memo1.text := HangulParse('강택현', ',');
```
###### 결과 -> ㄱ,ㅏ,ㅇ,ㅌ,ㅐ,ㄱ,ㅎ,ㅕ,ㄴ
##### ***예제 3***
```pascal
var
  arrHangul : TArray<string>;
  I: Integer;
begin
  arrHangul := HangulParse('강택현', ',').Split([',']);

  for I := 0 to High(arrHangul) do
  begin
    memo1.Lines.Add(inttostr(I+1) + '. ' + (arrHangul[I]));
  end;
end;
```
###### 결과 -> 
###### 1. ㄱ
###### 2. ㅏ
###### 3. ㅇ
###### 4. ㅌ
###### 5. ㅐ
###### 6. ㄱ
###### 7. ㅎ
###### 8. ㅕ
###### 9. ㄴ

