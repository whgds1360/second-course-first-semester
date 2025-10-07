function Task1(num:integer):real;
begin
  var x:=num;
  
  if x < -9 then result:= Exp(x) * log10(x) - 8
  else if x < -4 then result:= 99 + Exp(x)
  else if (-4 <= x)  and (x < 2) then result:= Power(x, 0.1*x) + cos(2*x)
  else if 2 <= x then result:= Exp(x) - Power(x, 0.1*x)
  else result:= 0
end;





procedure sup_proc_1;
begin
  while  start_ <= - 9 do
    begin
      y:= Exp(start_) * log10(start_) - 8;
      start_:= start_ + step_
    end;
end;



procedure sup_proc_2;
begin
  while  start_ <= - 4 do
    begin
      y:= 99 + Exp(start_);
      start_:= start_ + step_
    end; 
end;



procedure sup_proc_3;
begin
  while  start_ <= 2 do
    begin
      y:=Power(start_, 0.1 * start_) + cos(2 * start_);
      start_:= start_ + step;
    end; 
end; 



procedure sup_proc_4;
begin
  while start_ <= 4.0 do
    begin
      y:= Exp(start_) - Power(start_, 0.1 * start_);
      start_:= start_ + step_;
    end;
end;






procedure Task2(num_of_func:integer);
begin
  var num:= num_of_func;
  
  case num of 
    1:sup_proc_1;
    2:sup_proc_2;
    3:sup_proc_3;
    4:sup_proc_4; 
  end;
end;  

  

Begin
  
  y:=0
  start_ = -11.0
  end_ = 4.0
  step_ = 0.1
  
  writeln(Task1())
  Task2()
End.