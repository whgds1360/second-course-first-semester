procedure task1(arr: array of integer);
begin
  
  arr.Println;
  
  var (min1, min2):=(0, 0);
  var minimum:= Real.Epsilon;
  
  for var i:= 0 to Length(arr) do
    for var j:= 1 to Length(arr)-1 do
      if abs(arr[i] - arr [j]) < minimum then
        begin
        minimum:= abs(arr[i] - arr[j]);
        min1:= arr[i];
        min2:= arr[j]
        end;
end;


procedure task2(str_, substr_:string);
begin
  
  var counter:= 0;
  for var i:= 1 to length(str_) - length(substr_) + 1 do
    if str_[i:i + length(substr_)] = substr_ then 
      counter += 1;
    
  println(counter)
end;


Begin
  var len_arr:= 10
  var arr:= ArrRandomInteger(len_arr, 1, 10);
  task1(10, arr);
  
  var (str, substr):=(readstring(), readstring());
  task2(str, substr)
end.  