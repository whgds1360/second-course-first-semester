procedure one();
begin
//Произведение цифр 
  var n:=readinteger();
  var p:= 1;
  
  while n <> 0 do:
    begin
    var a:= n mod 10;
    p:=p * a;
    n:= n div 10;
    end;
    
  print(p)    
end;


procedure two();
begin
//Количество делителей числа  
  var:= readinteger();
  var (x, k):= (1, 0);
  
  while x <= n do:
    begin
      if n mod x == 0 then k:= k + 1;
      x:= x + 1;
    end;
  
  print(k)
end;


function three(n:integer):bool;
begin
//Проверка на совершенность числа 
  var (x,s):= (1, 0);
  
  while x < do:
    begin
      if n mod x == 0 then s:= s + x;
      x:= x + 1;
    end;
  
  if s == n then 
  begin
    print('Да');
    result:= True;
  end;
  else 
    begin
      print('Нет');
      result:= False;
    end;  
end;


procedure four();
begin
//Количество простых числе из n введеных
  var n:= readinteger();
  var (i, k) := (1, 0);
  
  while i <= n do:
    begin
      
      var (x, c, y) := (1, 0, readinteger());
      while x <= y do:
        begin
          if y mod x == 0 then c:= c + 1;
          x:= x + 1;
        end;
    if c == 2 then k:= k + 1;
    i:= i + 1;
    
    print(k)
    end;
end;


procedure five(nums:array of integer);
begin  
  
  var proizv := 1;
  
  foreach var num in nums do:
    if three(num) then proizv:= proiz * num
  
  print(proizv)
end;  
