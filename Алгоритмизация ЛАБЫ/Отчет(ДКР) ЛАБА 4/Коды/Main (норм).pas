uses GraphABC, System;

type 
  
  GraphFunction = function(x:real): real;
  
  TGraphPlotter = class
  private
  Xmin, Xmax, Ymin, Ymax:real; //границы коор. плоскости
  pxWidth, pxHeight:integer; // размеры в пикселях
  xCenter, yCenter:integer; // коор. центра в пикселях
  
  procedure SetPixelSize(aWidth, aHeight: integer);
  function XToPixel(x: real): integer;  // Перевод X в пиксели
  function YToPixel(y: real): integer;  // Перевод Y в пиксели
  procedure CalculateCenter;
  procedure BasicSettings;
  procedure DrawAxes(stepX, stepY: real);
  
  public
  constructor(aXmin, aXmax, aYmin, aYmax:real);
    begin
      self.Xmin := aXmin;
      self.Xmax := aXmax;
      self.Ymin := aYmin;
      self.Ymax := aYmax;
      
      SetPixelSize(800, 600);
      CalculateCenter;
      BasicSettings;
    end;
  procedure DrawGraph(begin_, end_, step_: real; f: GraphFunction);
 
  
end;


procedure TGraphPlotter.SetPixelSize(aWidth, aHeight: integer);
begin
  self.pxWidth:= aWidth;
  self.pxHeight:= aHeight;
  SetWindowSize(aWidth, aHeight);
end;


function TGraphPlotter.XToPixel(x:real):integer;
begin
  result:= Round((x - Xmin) / (Xmax - Xmin) * pxWidth)
end;


function TGraphPlotter.YToPixel(y:real):integer;
begin
  result:= Round(pxHeight - (y - Ymin) / (Ymax - Ymin) * pxHeight)
end;


procedure TGraphPlotter.CalculateCenter;
begin
  self.xCenter := XToPixel(0);   
  self.yCenter := YToPixel(0);
end;


procedure TGraphPlotter.BasicSettings;
begin
  //Перо
  SetPenColor(clBlack);
  SetPenWidth(1);
  
  //Текст
  SetFontColor(clBlack);
end;


procedure TGraphPlotter.DrawAxes(stepX, stepY: real);

begin
  // Ось X 
  MoveTo(0, self.yCenter);           
  LineTo(pxWidth, self.yCenter);     
  
  // Ось Y 
  MoveTo(self.xCenter, 0);           
  LineTo(self.xCenter, pxHeight);

//Засечки Ось X
  var x := Ceil(Xmin / stepX) * stepX;
  while x <= Xmax do
  begin
    if Abs(x) > 0.001 then 
    begin
      var px := XToPixel(x);
      MoveTo(px, yCenter - 5);
      LineTo(px, yCenter + 5);
      TextOut(px,yCenter + 10, x)
    end;
    x := x + stepX;
  end;  
    
 //Засечки Ось Y
  var y := Ceil(Ymin / stepY) * stepY;
  while y <= Ymax do
  begin
    if Abs(y) > 0.001 then 
    begin
      var py := YToPixel(y);
      MoveTo(xCenter - 5, py);
      LineTo(xCenter + 5, py);
      TextOut( xCenter + 10, py, y)
    end;
    y := y + stepY;
  end;

end;


procedure TGraphPlotter.DrawGraph(begin_, end_, step_: real; f: GraphFunction);
begin
  self.DrawAxes(1, 1);
  
  // Флаг, поднято ли перо
  var penUp := true;
  var x := begin_;
  var y := 0.0;
  
  while x <= end_ do 
  begin
    try
      y := f(x);
      
      if (y >= Ymin) and (y <= Ymax) then
      begin
        
        var px := XToPixel(x);
        var py := YToPixel(y);
        
        // Проверяем, находится ли точка в пределах окна
        if (px >= 0) and (px <= pxWidth) and (py >= 0) and (py <= pxHeight) then
        begin
          if penUp then
          begin
            MoveTo(px, py);
            penUp := false;
          end
          else
            LineTo(px, py);
        end
        else
          penUp := true; // Точка за пределами - поднимаем перо
      end
      else
        penUp := true; // Значение y вне диапазона - поднимаем перо
      
    except
      // Если функция не определена (например, деление на ноль)
      penUp := true;
    end;
    
    x := x + step_;
  end;
  
  TextOut(20, 20, 'График функции: 2x³ - x² + 2x');
end;


begin
  var MyFunc : GraphFunction;
  MyFunc := num -> 2 * Power(num, 3) + (-1 * Power(num, 2) + 2 * num);
  
  var Graph: TGraphPlotter := new TGraphPlotter (-10, 10, -5, 5);
  //Graph.DrawGraph(begin_:= 1, end_:= 10, step_:= 1, f:= MyFunc);
  Graph.DrawGraph(-10, 10, 0.1, MyFunc);
end.