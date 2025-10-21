function Task1(text: string): string;
begin

  var i: integer;
  var words: array of string;
  words := text.Split(' ');
  for i := 0 to High(words) do
  begin
    if words[i] = 'Nikolay' then
      words[i] := 'Oleg';
  end;
  Task1 := string.Join(' ', words);
  
end;



function Task2(str: string): string;
begin
  var i: integer;
  for i := 1 to Length(str) do
  begin
    
    if str[i] = 'x' then
    begin
      Task2 := 'x';
      exit;
    end
    
    else if str[i] = 'w' then
    begin
      Task2 := 'w';
      exit;
    end;
    
  end;
  Task2 := 'None';
end;



function Task3(str: string): integer;
begin
  var i, count: integer;

  count := 0;
  for i := 1 to Length(str) do
  begin
    if (str[i] >= '0') and (str[i] <= '9') then
      count := count + 1;
  end;
  Task3 := count;
  
end;



Begin
  writeln(Task1('Nikolay Nikolay'));
  writeln(Task2('w x'));
  writeln(Task3('3 4 5 6'));
End.