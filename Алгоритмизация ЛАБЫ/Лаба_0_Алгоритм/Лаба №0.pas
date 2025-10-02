{procedure Task1;
begin

  var a := readinteger('Введите число: ');
  
  writeln(abs(a) mod 10)
  
end;}

{function Task2(num: integer):integer;
begin
  result:= (abs(num) div 10) mod 10
end;}  

{function Task3(num: integer):integer;
begin

  var a:= abs(num) div 100;
  var b:= (abs(num) div 10) mod 10;
  var c:= abs(num) mod 10;
  
  result:= a + b + c

end;}

{function Task4(num: integer):integer;
begin

  if num mod 2 = 0 then result:= num + 2
  else result:= num + 1
  
end;}

{function Task5(num: integer):integer;
begin

  result:= abs(num)

end;}

{function Task6(a, b, c: real):real;
begin

  var p:= (a + b + c) / 2;
  var itog:= sqrt(p*(p-a)*(p-b)*(p-c));
  
  result:= itog
  
end;}

{function Task7(R: real):real;
begin

  var V:= (4/3)*Pi*Power(R, 3);
  result:= V

end;}

{function Task8(x1, y1, x2, y2:real):real;
begin

  var (x, y):= (((x1 + x2) / 2), ((y1 + y2) / 2));  
  result:= x;
  result:= y
  

end;}

procedure Task9;
begin

  var (a, c, b, d):=(readreal(), readreal(), readreal(), readreal());
  var x:= (d-c)/(a-b);
  var y:= a * (d-c)/(a-b)+c;
  
  print(x, y)
   
end;

Begin
 // Task1
 //Writeln(Task2(readinteger()))
 //WriteLn(Task3(readinteger()))
 //WriteLn(Task4(readinteger()))
 //WriteLn(Task5(readinteger()))
 //WriteLn(Task6(readreal(), readreal(), readreal()):0:2)
 //Writeln(Task7(readreal()):0:2)
 //WriteLn(Task8(readreal(), readreal(), readreal(), readreal()))
 Task9
End.  
    
    
    
