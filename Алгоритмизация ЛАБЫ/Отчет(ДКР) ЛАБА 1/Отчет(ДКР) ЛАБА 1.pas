Begin

var y:real;           
var start_ := -11.0;        
var step_ := 0.1;  
var x:=readinteger;

if x < -9 then  writeln(Exp(x) * log10(abs(x - 8))                            // 
else if x < -4 then  writeln(99 + Exp(x))                                     // 
else if (-4 <= x)  and (x < 2) then  writeln(Power(x, 0.1*x) + cos(2*x))      // Здесь решение задания №1.
else if 2 <= x then writeln(Exp(x) - Power(x, 0.1*x))                         // 
else writeln(0);                                                              // 

//////////////////////////////////////////////////////////////////////////////// 
//////////////////////////////////////////////////////////////////////////////// Это задание №2 с прогоном по диапазону [-11;4] с шагом 0.1
////////////////////////////////////////////////////////////////////////////////

writeln('| ','X  ':5,' | ','Y  ':5,' |');
if x < -9 then
  begin  
    while  start_ <= - 9 do
      begin
        y:= Exp(start_) * log10(abs(start_ - 8);
        writeln ('| ', start_:5:1 ,' | ', y:5:1 ,' |');                         // На эти строки можно не обращать внимания, они нужны для красивого вывода
        start_:= start_ + step_;                                                // start_:5:1 } здесь 5 это ширина строки, 1 это кол-во знаков после запятой
      end;
  end
  
else if x < -4 then
  begin
    while  start_ <= - 4 do
      begin
        y:= 99 + Exp(start_);
        writeln ('| ', start_:5:1 ,' | ', y:5:1 ,' |');
        start_:= start_ + step_;
    end; 
  end
  
else if -4 <= x then
  begin
    while  start_ <= 2 do
      begin
        y:=Power(start_, 0.1 * start_) + cos(2 * start_);
        writeln ('| ', start_:5:1 ,' | ', y:5:1 ,' |');
        start_:= start_ + step_;
      end; 
  end

else if -4 <= x then
  begin
    writeln('| ','X  ':5,' | ','Y  ':5,' |');
    while start_ <= 4.0 do
      begin
        y:= Exp(start_) - Power(start_, 0.1 * start_);
        writeln ('| ', start_:5:1 ,' | ', y:5:1 ,' |');
        start_:= start_ + step_;
      end;
  end
End.