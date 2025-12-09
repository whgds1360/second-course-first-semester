uses GraphABC;


var
  scaleX, scaleY: real;
  a, b: real;
  n: integer;


function F(x: real): real;
begin
  Result := 2 * Power(x, 3) - Power(x, 2) + 2 * x;
end;  
  

function generator(begin_, end_, step_:integer): sequence of real;
begin
  var f : function(num: real): real;
  f := num -> 2 * Power(num, 3) + (-1 * Power(num, 2) + 2 * num);
  
  while begin_ <= end_ do 
  begin
    yield f(begin_);
    begin_ += step_;
  end;
end;


function ToScreenX(x: real): integer;
begin
  Result := Round(WindowWidth/2 + x * scaleX);
end;


function ToScreenY(y: real): integer;
begin
  Result := Round(WindowHeight/2 - y * scaleY);
end;


procedure DrawAxes;
begin
  SetPenColor(clBlack);
  SetPenWidth(2);
  
  
  Line(0, WindowHeight div 2, WindowWidth, WindowHeight div 2);
  Line(WindowWidth div 2, 0, WindowWidth div 2, WindowHeight);
  
  
  Line(WindowWidth-10, WindowHeight div 2 - 5, WindowWidth, WindowHeight div 2);
  Line(WindowWidth-10, WindowHeight div 2 + 5, WindowWidth, WindowHeight div 2);
  Line(WindowWidth div 2 - 5, 10, WindowWidth div 2, 0);
  Line(WindowWidth div 2 + 5, 10, WindowWidth div 2, 0);
  
  
  SetFontColor(clBlack);
  TextOut(WindowWidth - 20, WindowHeight div 2 + 10, 'X');
  TextOut(WindowWidth div 2 + 10, 5, 'Y');
end;


procedure DrawGraph(a, b, n: real);
var
  x, step: real;
  y: real;
  minY, maxY: real;
begin
  var maxX := Abs(a);
  if Abs(b) > maxX then maxX := Abs(b);
  if maxX = 0 then maxX := 1;
  scaleX := (WindowWidth div 2 - 20) / maxX;
  
  
  step := 0.1;
  x := a;
  minY := F(a);
  maxY := F(a);
  
  while x <= b do
  begin
    y := F(x);
    if y < minY then minY := y;
    if y > maxY then maxY := y;
    x := x + step;
  end;
  
  
  var rangeY := maxY - minY;
  if rangeY = 0 then rangeY := 1;
  scaleY := (WindowHeight div 2 - 20) / (rangeY / 2);
  
  
  ClearWindow(clWhite);
  
  
  DrawAxes;
  
  // Рисуем график
  SetPenColor(clBlue);
  SetPenWidth(2);
  
  step := 0.01;
  x := a;
  
  MoveTo(ToScreenX(x), ToScreenY(F(x)));
  
  while x <= b do
  begin
    LineTo(ToScreenX(x), ToScreenY(F(x)));
    x := x + step;
  end;
end;


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
  writeln('5 - график функции');
  writeln('6 - ВЫХОД');
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
         DrawGraph(global_a,global_b,global_n)
        end;
      
      6: 
        begin
          writeln('Выход из программы');
          break;
        end;
      
      else
        writeln('Неверный пункт меню. Выберите от 1 до 5');   
    end;
  end;
end.