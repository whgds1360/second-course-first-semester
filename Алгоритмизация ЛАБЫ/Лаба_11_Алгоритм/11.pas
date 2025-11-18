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
  FloodFill(210,190,clBlue);
  
  Circle(130,100,30);
  FloodFill(210,190,clBlue);
  
  
  //Треугольник Правый
  MoveTo(400,200);
  LineTo(500,200);
  LineTo(570,100);
  LineTo(385,150);
  FloodFill(450,150,clWhite);
  
  Circle(570,100,30);
  FloodFill(570,100,clWhite);
  
  //Треугольник Центральный
  MoveTo(300,200);
  LineTo(350,20);
  LineTo(400,200);
  LineTo(300,200);
  FloodFill(350,190,clRed);
  
  Circle(350,20,30);
  FloodFill(350,20,clRed);
end;


procedure task3;
begin
  
  var x:=50;
  
  while x <= 290 do 
    begin
      Circle(x, 100, 10);
      FloodFill(x, 100, RGB(random(256), random(256), random(256)));
      x:= x + 30;
    end;  
end;


procedure task4;
begin

for var i:= 0 to 1000 do
  begin
    Circle(200, 200, Random(100))
  end;
end;


procedure task5;
begin
  for var i:= 0 to 10 do
    begin
      SetBrushColor(RGB(random(256), random(256), random(256)));
      Circle(i*50, i*40, i*5);
    end;
end;  


procedure task6;
begin
  var x:=windowwidth div 10;
  var y:=windowheight div 10;

  for var i := 0 to 10 do 
  begin
    for var j:= 0 to 10 do
    begin
      if (i + j) mod 2 = 0 then setbrushcolor(clBlack)
      else setbrushcolor(clWhite);
      Rectangle(i*x,j*y,(i+1)*x,(j+1)*y)
    end;
  end;
end;


procedure task7;
begin  
  var x :=56;
  var y :=360;
  setbrushcolor(clBlack);
  Rectangle(36,360,76,400);
  
 repeat 
  setpencolor(clWhite);
  circle(x,y,1);
  setpencolor(clGray);
  circle(x,y,1);
  x:=x+1;
  y:=y-1;
 until x>windowwidth div 2;
 repeat 
  setpencolor(clWhite);
  circle(x,y,1);
  setpencolor(clGray);
  circle(x,y,1);
  x:=x+1;
  y:=y+1;
 until x>600;
 setpencolor(clGray);
 setbrushcolor(clGray);
 Rectangle(570,360,610,400);
end;


Begin
  //task0;
  //task1;
  //task2;
  //task3;
  //task4;
  //task5;
  //task6;
  //task7
  
End.