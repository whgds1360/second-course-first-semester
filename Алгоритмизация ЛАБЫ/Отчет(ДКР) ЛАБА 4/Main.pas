uses GraphABC;


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

procedure draw(begin_, end_, step_: integer);
begin
  var width := WindowWidth;
  var height := WindowHeight;
  
  // Получаем данные для графика
  var data := generator(begin_, end_, step_).ToArray;
  if data.Length = 0 then
  begin
    TextOut(10, 10, 'Нет данных для построения графика');
    exit;
  end;
  
  // Находим минимальные и максимальные значения
  var minX := begin_;
  var maxX := end_;
  var minY := data.Min();
  var maxY := data.Max();
  
  // Добавляем отступы
  var padding := 50;
  var plotWidth := width - 2 * padding;
  var plotHeight := height - 2 * padding;
  
  // Очищаем окно
  ClearWindow(clWhite);
  
  // Рисуем оси координат
  SetPenColor(clBlack);
  SetPenWidth(2);
  
  // Ось X
  Line(padding, height - padding, width - padding, height - padding);
  // Ось Y
  Line(padding, padding, padding, height - padding);
  
  // Стрелки на осях
  Line(width - padding, height - padding, width - padding - 10, height - padding - 5);
  Line(width - padding, height - padding, width - padding - 10, height - padding + 5);
  Line(padding, padding, padding - 5, padding + 10);
  Line(padding, padding, padding + 5, padding + 10);
  
  // Подписи осей
  SetFontColor(clBlack);
  SetFontSize(10);
  TextOut(width - padding - 15, height - padding + 10, 'X');
  TextOut(padding - 20, padding - 20, 'Y');
  
  // Функции преобразования координат
  function TransformX(x: real): integer;
  begin
    Result := padding + Round((x - minX) / (maxX - minX) * plotWidth);
  end;
  
  function TransformY(y: real): integer;
  begin
    Result := height - padding - Round((y - minY) / (maxY - minY) * plotHeight);
  end;
  
  // Рисуем график
  SetPenColor(clBlue);
  SetPenWidth(3);
  
  for var i := 0 to data.Length - 2 do
  begin
    var x1 := begin_ + i * step_;
    var x2 := begin_ + (i + 1) * step_;
    
    Line(
      TransformX(x1), 
      TransformY(data[i]),
      TransformX(x2),
      TransformY(data[i + 1])
    );
  end;
  
  // Рисуем точки
  SetBrushColor(clRed);
  for var i := 0 to data.Length - 1 do
  begin
    var x := begin_ + i * step_;
    FillCircle(TransformX(x), TransformY(data[i]), 4);
  end;
  
  // Разметка осей
  SetPenColor(clGray);
  SetPenWidth(1);
  SetFontSize(8);
  
  // Деления на оси X
  var xStep := (maxX - minX) / 5;
  for var i := 0 to 5 do
  begin
    var xVal := minX + i * xStep;
    var xPos := TransformX(xVal);
    Line(xPos, height - padding - 5, xPos, height - padding + 5);
    TextOut(xPos - 10, height - padding + 15, Format('{0:F1}', xVal));
  end;
  
  // Деления на оси Y
  var yStep := (maxY - minY) / 5;
  for var i := 0 to 5 do
  begin
    var yVal := minY + i * yStep;
    var yPos := TransformY(yVal);
    Line(padding - 5, yPos, padding + 5, yPos);
    TextOut(padding - 40, yPos - 5, Format('{0:F1}', yVal));
  end;
  
  // Заголовок
  SetFontSize(14);
  SetFontStyle(fsBold);
  TextOut(width div 2 - 100, 20, 'График функции f(x) = 2x³ - x² + 2x');
  
  // Информация
  SetFontSize(10);
  SetFontStyle(fsNormal);
  TextOut(10, 10, Format('a={0}, b={1}, step={2}', begin_, end_, step_));
  TextOut(10, 25, Format('minY={0:F2}, maxY={1:F2}', minY, maxY));
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
         Draw(1,20,1)
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