uses System;


procedure task1(num_file:string);
begin
  var f: file of char;
  var ch: char;
  var content: string;
  var lastSpacePos: integer;
  
  
  assign(f, GetCurrentDir+'\'+ num_file+'.txt');
  reset(f);
  content := '';
  while not eof(f) do
  begin
    read(f, ch);
    content := content + ch;
  end;
  close(f);
  
  writeln('Исходный файл: ', content);
  
  
  lastSpacePos := 0;
  for var i := 1 to length(content) do
    if content[i] = ' ' then
      lastSpacePos := i;
  
  content := copy(content, 1, lastSpacePos - 1);
    

  assign(f, GetCurrentDir+'\'+ num_file + '.txt');
  rewrite(f);
  for var i := 1 to length(content) do
    write(f, content[i]);
  close(f);
    
  writeln('Результат: ', content);
end;


procedure task2(num_file: string);
begin
  var f: Text;
  var maxLength := 0;
  var count := 0;
  var lines: array of string;
  SetLength(lines, 0);
  var currentLine: string;
  
  assign(f, GetCurrentDir + '\' + num_file + '.txt');
  reset(f);
  
  while not eof(f) do
  begin
    readln(f, currentLine);
    if Length(currentLine) > maxLength then
      maxLength := Length(currentLine);
  end;
  
  close(f);
  reset(f);
  
  while not eof(f) do
  begin
    readln(f, currentLine);
    if Length(currentLine) = maxLength then
    begin
      count := count + 1;
      SetLength(lines, count);
      lines[count - 1] := currentLine;
    end;
  end;
  
  close(f);
  
  var outputFile: Text;
  assign(outputFile, 'output2.txt');
  rewrite(outputFile);
  
  for var i := count - 1 downto 0 do
    writeln(outputFile, lines[i]);
  
  close(outputFile);
  
  writeln('Файл создан успешно!');
  writeln('Максимальная длина строки: ', maxLength);
  writeln('Найдено строк: ', count);
end;


procedure task3();
var
  originalFile, oddFile, evenFile: file of real;
  i, count: integer;
  number: real;
begin
  assign(originalFile, 'numbers.txt');
  rewrite(originalFile);
  
  for i := 1 to 10 do
  begin
    number := i * 1.5 + 0.1;
    write(originalFile, number);
  end;
  
  close(originalFile);
  writeln('Исходный файл создан и заполнен.');
  
  reset(originalFile);
  
  assign(oddFile, 'odd_numbers.txt');
  assign(evenFile, 'even_numbers.txt');
  rewrite(oddFile);
  rewrite(evenFile);
  
  count := 0;
  while not eof(originalFile) do
  begin
    read(originalFile, number);
    count := count + 1;
    
    if count mod 2 = 1 then
      write(oddFile, number)
    else 
      write(evenFile, number);
  end;
  
  close(originalFile);
  close(oddFile);
  close(evenFile);
  
  writeln('Файлы созданы успешно!');
  writeln('Всего обработано чисел: ', count);
end;


procedure task4();
var
  numbersFile: file of real;
  i, count: integer;
  number, sum: real;
begin
  assign(numbersFile, 'numbers4.txt');
  rewrite(numbersFile);
  
  for i := 1 to 10 do
  begin
    number := i * 1.5 + 0.1;
    write(numbersFile, number);
  end;
  
  close(numbersFile);
  writeln('Исходный файл создан и заполнен.');
  
  reset(numbersFile);
  
  sum := 0;
  count := 0;
  
  while not eof(numbersFile) do
  begin
    read(numbersFile, number);
    count := count + 1;
    
    if count mod 2 = 0 then
      sum := sum + number;
  end;
  
  close(numbersFile);

  writeln('Сумма элементов с четными номерами: ', sum:0:2);
  writeln('Всего элементов в файле: ', count);
end;


procedure task5();
var
  f: file of real;
  i, n: integer;
  prev, current, next: real;
  lastLocalMax: real;
  position, count: integer;
begin
  assign(f, 'numbers5.txt');
  rewrite(f);
  
  write(f, 1.5);  
  write(f, 3.2);  
  write(f, 2.1);  // локальный максимум (3.2)
  write(f, 4.7);  
  write(f, 3.8);  // локальный максимум (4.7)
  write(f, 2.9);  
  write(f, 5.1);  
  write(f, 4.3);  // локальный максимум (5.1)
  write(f, 6.8);  
  write(f, 5.5);  // локальный максимум (6.8) 
  
  close(f);
  writeln('Файл создан и заполнен числами');
  
  reset(f);
  
  if filesize(f) < 3 then
  begin
    writeln('Файл содержит менее 3 элементов. Локальных максимумов нет.');
    close(f);
    exit;
  end;
  
  seek(f, 0);
  read(f, prev);
  read(f, current);
  read(f, next);
  
  lastLocalMax := 0;
  position := -1;
  count := 0;

  if current > next then
  begin
    lastLocalMax := current;
    position := 2;
    count := count + 1;
    writeln('Найден локальный максимум: ', current:0:2, ' на позиции ', position);
  end;
  
  for i := 3 to filesize(f) - 1 do
  begin
    prev := current;
    current := next;
    seek(f, i);
    read(f, next);
    
    if (current > prev) and (current > next) then
    begin
      lastLocalMax := current;
      position := i;
      count := count + 1;
      writeln('Найден локальный максимум: ', current:0:2, ' на позиции ', position);
    end;
  end;
  
  if filesize(f) > 1 then
  begin
    seek(f, filesize(f) - 1);
    read(f, current);
    seek(f, filesize(f) - 2);
    read(f, prev);
    
    if current > prev then
    begin
      lastLocalMax := current;
      position := filesize(f);
      count := count + 1;
      writeln('Найден локальный максимум: ', current:0:2, ' на позиции ', position);
    end;
  end;
  
  close(f);
  
  writeln;
  if position > 0 then
  begin
    writeln('Последний локальный максимум: ', lastLocalMax:0:2);
    writeln('Позиция в файле: ', position);
    writeln('Всего найдено локальных максимумов: ', count);
  end
  else
    writeln('Локальных максимумов не найдено');
end;


procedure task6();
var
  f, tmp: file of real;
  i, minIndex, maxIndex: integer;
  number, minNumber, maxNumber: real;
begin

  assign(f, 'numbers6.txt');
  rewrite(f);
  
  write(f, 5.1);
  write(f, 1.5);  // min
  write(f, 3.2);
  write(f, 9.8);  // max
  write(f, 4.7);
  write(f, 2.3);
  
  close(f);
  
  reset(f);
  
  read(f, number);
  minNumber := number;
  maxNumber := number;
  minIndex := 0;
  maxIndex := 0;
  
  for i := 1 to filesize(f) - 1 do
  begin
    read(f, number);
    
    if number < minNumber then
    begin
      minNumber := number;
      minIndex := i;
    end;
    
    if number > maxNumber then
    begin
      maxNumber := number;
      maxIndex := i;
    end;
  end;
  close(f);
  
  writeln('Минимальный элемент: ', minNumber:0:2, ' (позиция ', minIndex + 1, ')');
  writeln('Максимальный элемент: ', maxNumber:0:2, ' (позиция ', maxIndex + 1, ')');
  
  reset(f);
  assign(tmp, 'temp.txt');
  rewrite(tmp);
  
  for i := 0 to filesize(f) - 1 do
  begin
    seek(f, i);
    read(f, number);
    
    if i = minIndex then
      write(tmp, maxNumber)      
    else if i = maxIndex then
      write(tmp, minNumber)      
    else
      write(tmp, number);        
  end;
  
  close(f);
  close(tmp);
  
  erase(f);
  rename(tmp, 'numbers6.txt');
  
  writeln('Элементы успешно поменяны местами!');
end;


procedure task7();
var
  f: file of char;
  i: integer;
  ch: char;
begin
  assign(f, 'text.dat');
  rewrite(f);
  
  write(f, 'A');
  write(f, 'B');
  write(f, 'C');
  write(f, 'D');
  write(f, 'E');
  write(f, 'F');
  write(f, 'G');
  write(f, 'H');
  
  close(f);
  writeln('Исходный файл создан.');
  
  writeln('Исходное содержимое:');
  reset(f);
  while not eof(f) do
  begin
    read(f, ch);
    write(ch, ' ');
  end;
  close(f);
  writeln;
  
  reset(f);
  for i := 0 to filesize(f) - 1 do
  begin
    if i mod 2 = 1 then  
    begin
      seek(f, i);        
      write(f, '!');
    end;
  end;
  close(f);
  
  writeln('Результат после замены:');
  reset(f);
  while not eof(f) do
  begin
    read(f, ch);
    write(ch, ' ');
  end;
  close(f);
  writeln;
end;


BEGIN
//task1('1')
//task2('2')
//task3()
//task4()
//task5()
//task6()
//task7()
END.
