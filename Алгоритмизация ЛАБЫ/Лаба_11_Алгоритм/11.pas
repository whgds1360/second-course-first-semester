uses GraphABC;

procedure task0;
begin
  
  SetPenColor(clPurple);
  
  MoveTo(100,100);
  LineTo(200,100);
  LineTo(200,200);
  LineTo(100,200);
  LineTo(100,100);
  
  MoveTo(300,100);
  LineTo(350,200);
  LineTo(250,200);
  LineTo(300,100);
end;


procedure task1;
begin
  
  SetPenColor(clBlack);
  SetPenWidth(2);
  
  Circle(100,100,50);
  FloodFill(100,100,clRed);
  
  //Треугольник снизу
  MoveTo(150,100);
  LineTo(300,180);
  LineTo(450,100);
  LineTo(150,100);
  FloodFill(300,150, clLime);
  
  //Треугольник Сверху
  MoveTo(150,100);
  LineTo(300,20);
  LineTo(450,100);
  LineTo(150,100);
  FloodFill(300,25, clBlue);
  
  Circle(500,100,50);
  FloodFill(500,100,clYellow);
end;


procedure task2;
begin
  
  SetPenColor(clBlack);
  SetPenWidth(2);
  
  //Треугольник Левый
  MoveTo(200,200);
  LineTo(130,100);
  LineTo(315,150);
  LineTo(300,200);
  LineTo(200,200);
  //FloodFill(210,190,clBlue);
  
  
  //Треугольник Правый
  MoveTo(350,200);
  LineTo(500,200);
  LineTo(570,100);
  LineTo(350,200);
  //FloodFill(500,190,clLime);
  
  //Треугольник Центральный
  MoveTo(300,200);
  LineTo(350,20);
  LineTo(400,200);
  LineTo(350,200);
  //FloodFill(350,190,clRed);
  Circle(390,190,1);
 
  
  
end;

Begin
  //task0;
  //task1;
  task2
  
End.