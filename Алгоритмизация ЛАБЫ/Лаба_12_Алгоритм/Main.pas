procedure task1;
begin  
     var filetext: text;
     var a: string;
     var i: integer;
     
     assign(filetext,'E:\Second_year_of_college\Алгоритмизация ЛАБЫ\Лаба_12_Алгоритм\text1.txt');
     rewrite(filetext);
     for i:=1 to 10 do
         Writeln(filetext, i);
     close(filetext); 
     
     reset(filetext);
     for i:=1 to 10 do 
     begin
         Readln(filetext, a);
         Writeln(a);
     end;
     close(filetext);
end;


procedure task2(n, k:integer);
begin
   var filetext: text;
 
  assign(filetext,'E:\Second_year_of_college\Алгоритмизация ЛАБЫ\Лаба_12_Алгоритм\text2.txt');
  rewrite(filetext);
  for var i:=1 to n do begin
    for var j:=1 to k do
      write(filetext, '*');
    writeln(filetext, '');
  end;
  close(filetext);
end;


procedure task3(s:string);
begin
  var filetext: text;
 
  assign(filetext,'E:\Second_year_of_college\Алгоритмизация ЛАБЫ\Лаба_12_Алгоритм\text3.txt');
  append(filetext);
  write(filetext, s);
  close(filetext);
end;


procedure task4(k:integer);
begin
  
  var filetext: text;
  var lines: array[1..1000] of string;
 
  assign(filetext,'E:\Second_year_of_college\Алгоритмизация ЛАБЫ\Лаба_12_Алгоритм\text4.txt');
  reset(filetext);
  
  var count := 0;
  while not eof(filetext) do begin
    count := count + 1;
    readln(filetext, lines[count]);
  end;
  close(filetext);
  
  if k <= count then begin
    rewrite(filetext);
    for var i:= 1 to k-1 do begin
      writeln(filetext, lines[i]);
    end;
    write(filetext, ' ');
    for var i:=k to count do begin
      writeln(filetext, lines[i]);
    end;
    close(filetext);
  end
  else begin
    write('Нету строки k')
  end;
end;


procedure task5;
begin
  var filetext, inputtext: text;
  var lines: array of integer;
  
  assign(inputtext,'E:\Second_year_of_college\Алгоритмизация ЛАБЫ\Лаба_12_Алгоритм\input5.txt');
  
  reset(inputtext);
  var count := 0;
  while not eof(inputtext) do 
  begin
    var temp: string; 
    readln(inputtext, temp);
    count += 1;
  end;
  Close(inputtext);
  
  SetLength(lines, count);
  
  reset(inputtext);
  var i := 0; 
  while not eof(inputtext) do 
  begin
    readln(inputtext, lines[i]);
    i := i + 1;
  end;
  close(inputtext);
  
  Print(lines);
  
  assign(filetext,'E:\Second_year_of_college\Алгоритмизация ЛАБЫ\Лаба_12_Алгоритм\text5.txt');
  rewrite(filetext);
  writeln(filetext, lines.Min);
  writeln(filetext, lines.Max);
  close(filetext);
end;


procedure task6;
begin
  
  var filetext: text;
  var str: string;
  var lines: array[1..123] of string;
  
  assign(filetext,'E:\Second_year_of_college\Алгоритмизация ЛАБЫ\Лаба_12_Алгоритм\text6.txt');
  reset(filetext);
  
  var count := 0;
  while not eof(filetext) do begin
    readln(filetext, str);
    if str <> '' then begin
      count := count + 1;
      lines[count] := str;
    end;
  end;
  close(filetext);
  
  rewrite(filetext);
  for var i:= 1 to count do begin
    writeln(filetext, lines[i]);
  end;
  close(filetext);
end;


procedure task7;
begin 
  
  var filetext, inputtext: text;
  var n: integer;
  var lines: array[1..123] of integer;
  
  assign(inputtext,'E:\Second_year_of_college\Алгоритмизация ЛАБЫ\Лаба_12_Алгоритм\z3.in.txt');
  reset(inputtext);
  read(inputtext, n);
  close(inputtext);
  
  var sum := 0;
  for var i := 1 to n do begin
    var count := 0;
    for var j:=1 to i do begin
      if i mod j = 0 then
        count := count + 1;
    end;
    if count = 5 then
      sum := sum + i;
  end;
  
  
  assign(filetext,'E:\Second_year_of_college\Алгоритмизация ЛАБЫ\Лаба_12_Алгоритм\z3.out.txt');
  rewrite(filetext);
  writeln(filetext, sum);
  close(filetext);
end;

begin
  //task1;
  //task2(2, 2);
  //task3('FUCK')
  //task4(3)
  //task5
  task6
  //task7
end.  