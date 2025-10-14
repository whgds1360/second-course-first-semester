procedure Task1;
begin
  
  Randomize;
  
  var arr:array of integer;
  var (cou, sum, proizv):= (0, 0, 1);
  var (begin_, end_):=(readinteger, readinteger);
  
  
  Setlength(arr, 20);
  for var i:= 0 to length(arr)-1 do
    begin 
      arr[i]:=random(115)-22;
      if (arr[i] mod 2 = 0) and (i mod 2 <> 0) then cou:=cou+1;
      if arr [i] mod 2 <> 0 then proizv:=proizv * arr[i];
    end;
  
  for var i:= begin_ to end_ do sum:= sum + arr[i]; 
  
  writeln(arr);
  writeln('Количество: ', cou);
  writeln('Произведение: ', proizv);
  writeln('Сумма элементов в диапазоне от ',begin_ ,' до ', end_ ,' равна ', sum)
  
end;



procedure Task2;
begin
  
  var arr:array of integer;
  Setlength(arr, 20);
  
  for var i:= 0 to length(arr)-1 do arr[i]:=random(100);
  
  writeln(arr);
  writeln(arr.SequenceEqual(arr.Sorted()));
      
end;



procedure Task3;
begin
  
 var arr: array of integer;
  SetLength(arr, 20);

  for var i := 0 to Length(arr)-1 do arr[i] := Random(100)-50;
  writeln('Исходный массив: ', arr);

  var negativeCount := 0;
  for var i := 0 to Length(arr)-1 do
    if arr[i] < 0 then 
      negativeCount := negativeCount + 1;

  var new_arr: array of integer;
  SetLength(new_arr, Length(arr) + negativeCount);

  var step := 0;
  for var i := 0 to Length(arr)-1 do
    begin
      new_arr[i + step] := arr[i];
      if arr[i] < 0 then 
      begin
        new_arr[i + step + 1] := i;
        step := step + 1;
      end;
    end;

  writeln('Новый массив: ', new_arr);

end;
  
Begin
  Task1;
  Task2;
  Task3
End.  