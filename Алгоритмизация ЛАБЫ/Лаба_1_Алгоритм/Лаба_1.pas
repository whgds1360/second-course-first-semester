procedure Task1();
begin
  
  var (surname , classes, passes):=(readstring(), readinteger(), readinteger());
  
  writeln('Ученик',' ', surname);
  writeln('Процент посещаемости:', (passes/classes*100):0:2, '%')
  
  
end;


procedure Task2();
begin
  
  var num:= readstring;
  var temp:= num[1];
  
  num[1]:= num[Length(num)];
  num[Length(num)]:= temp;
  
  
  writeln(num)
  
end;

procedure Task3();
begin
  
  var nums: array of integer;
  Setlength(nums, 3);
  
  for var i:= 0 to Length(nums) -1 do nums[i]:=readinteger;
  
  Sort(nums);
  
  foreach var i in nums do write(i, ' ')
    
end;

procedure Task4();
begin
  
  var (a, b, c):=(readinteger, readinteger, readinteger);
  var p:= (a + b + c) / 2;
  var s:= sqrt(p * (p - a) * (p - b) * (p - c));
  
  writeln(s/100:0:2)
  
end;

procedure Task5();
begin
  
  var (num, litr, save):= (readinteger, readinteger, readinteger);
  
  if num * litr >= save then writeln('Yes')
  else writeln('No')
  
end;

Begin
  //Task1
  //Task2
  //Task3
  //Task4
  Task5
end.