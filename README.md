# Delphi-Hangul-Parser

#### 함수를 호출하면 단어를 자음/모음으로 분리합니다.

##### ***예제1***
```pascal
memo1.text := HangulParse('강택현');
```
###### 결과 -> ㄱㅏㅇㅌㅐㄱㅎㅕㄴ
##### ***예제2***
```pascal
memo1.text := HangulParse(Edit1.Text, ',');
```
###### 결과 -> ㄱ,ㅏ,ㅇ,ㅌ,ㅐ,ㄱ,ㅎ,ㅕ,ㄴ
##### ***예제3***
```pascal
var
  arrHangul : TArray<string>;
  I: Integer;
begin
  arrHangul := HangulParse(Edit1.Text, ',').Split([',']);

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

