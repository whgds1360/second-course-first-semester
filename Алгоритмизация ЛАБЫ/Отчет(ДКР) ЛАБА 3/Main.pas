function midle_treogylar_method(a, b, n: real): real;
var h, x, s: real;
var num: real;
 
begin
  h := (b - a) / n;
  x := a + h / 2;
  s := 0;
  
  var f : function(num: real): real;
  f := num -> 2 * Power(num, 3) + (-1 * Power(num, 2) + 2 * num);
  
  while x < b do
  begin
    s := s + f(x);
    x := x + h;
  end;
  
  result := s * h;
end;

procedure ShowMenu;
begin
  writeln('      CASE МЕНЮ      ');
  writeln('1 - задать значение a');
  writeln('2 - задать значение b');
  writeln('3 - задать значение n');
  writeln('4 - вычислить функцию');
  writeln('5 - ВЫХОД');
  writeln('');
end;


Begin
var global_a: real;
var global_b: real;
var global_n: real;

  
  ShowMenu;
  
  while true do
  begin
    var answer:= Readinteger('Выберите пункт меню: '); 
    
    case answer of
      1: 
        begin
          writeln('Текущее значение а = ', global_a);
          global_a:= Readreal('Введите новое значение a: ');
        end;
      
      2: 
        begin
          writeln('Текущее значение b = ', global_b);
          global_b:= Readreal('Введите новое значение b: ');
        end;
      
      3: 
        begin
          writeln('Текущее значение n = ', global_n);
          global_n:= Readreal('Введите новое значение n: ');
        end;
      
      4: 
        begin
          if global_n = 0 then
          begin
            writeln('Ошибка: n не может быть равно 0!');
            continue;
          end;
          
          if global_a >= global_b then
          begin
            writeln('Ошибка: a должно быть меньше b!');
            continue;
          end;
          
          writeln(midle_treogylar_method(global_a, global_b, global_n));
        end;
      
      5: 
        begin
          writeln('Выход из программы');
          break;
        end;
      
      else
        writeln('Неверный пункт меню. Выберите от 1 до 5');
      
    end;
  end;
end.