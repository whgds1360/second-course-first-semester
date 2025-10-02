procedure Task1;
begin
  
  var (n, step, i):=(readinteger, readinteger, 1);
  
  while i <= n do 
    begin
      writeln('Фунтов:', i, ' ','Граммов:',i*400);
      i:= i + step
    end;
  
end;



procedure Task2;
begin
  
  var (limit, n):=(readinteger('Лимит: '), readinteger('Количество товара: '));
  var i, sum: integer;
  
  while i < n do
    begin
      var x:=readinteger('Введите цену товара: ');
      sum := sum + x;
      i := i + 1
    end;
    
  if sum > limit then writeln('Денег не хватит!')
  else writeln('Денег хватит!')
  
end;



procedure Task3;
begin
  
  var arr: array of integer;
  var n:= readinteger;
  var couSP, couIS, couPR: integer;
  
  Setlength(arr, n);
  for var i:= 0 to length(arr) - 1 do
    begin
      arr[i]:= readinteger;
      
      case arr[i] of 
        1: inc(couSP);
        2: inc(couIS);
        3: inc(couPR)  
      end;
    end;
    
    writeln('Марок по спорту: ', couSP);
    writeln('Марок по искусству: ', couIS);
    writeln('Марок по прочему: ', couPR)    
  
end;


procedure Task4;
begin
  
  Randomize;
  var sum, maximum, j:integer;
  
  var arr:array of integer;
  Setlength(arr, 15);

  for var i:= 0 to length(arr)-1 do
    begin
      arr[i]:= random(160, 200);
      sum:= sum + arr[i];
      if maximum < arr[i] then j:=i
    end;
    
  var arr_surname:array of string;
  Setlength(arr_surname, 15);
  
  for var of
  := 0 to length(arr_surname)-1 do
    begin
      arr_surname[j]:= readstring('Введите фамилию: ');
    end;
  
  
  
  
  writeln(arr);
  writeln(arr_surname);
  writeln('Средний рост: ', round(sum/length(arr)));
  writeln('Максимальный рост: ', max(arr), ' ', 'Фамилия: ', arr_surname[j])
  
end;

Begin
  //Task1
  //Task2
  //Task3
  Task4
end.