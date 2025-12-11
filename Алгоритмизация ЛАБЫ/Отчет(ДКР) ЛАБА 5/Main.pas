type
  Comparator = function(a, b: integer): boolean;
  
  FuckingShit = class
    private
    arr_from_file, begin_arr: array of integer;
    
    // Компараторы
    function Ascending(a, b: integer): boolean := a > b;
    function Descending(a, b: integer): boolean := a < b;
    
    public
    constructor(begin_arr: array of integer);
    begin
      self.begin_arr := begin_arr;
      // Записываем начальный массив в файл
      self.WriteToFile('input.txt', begin_arr);
    end;
    
    // Сортировка подсчетом
    procedure CountingSort(var arr: array of integer; comp: Comparator);
    // Пирамидальная сортировка
    procedure HeapSort(var arr: array of integer; comp: Comparator);
    // Работа с файлами
    procedure ReadFromFile(filename: string; var arr: array of integer);
    procedure WriteToFile(filename: string; arr: array of integer);
    
    procedure Main(num_operation: integer);
  end;



procedure FuckingShit.CountingSort(var arr: array of integer; comp: Comparator);
var
  count: array of integer;
  i, j, min, max, idx: integer;
begin
  if Length(arr) = 0 then Exit;
  
  min := arr[0];
  max := arr[0];
  for i := 1 to High(arr) do
  begin
    if arr[i] < min then min := arr[i];
    if arr[i] > max then max := arr[i];
  end;
  
  SetLength(count, max - min + 1);
  for i := 0 to High(arr) do
    Inc(count[arr[i] - min]);
  
  idx := 0;
  if comp(1, 2) then // проверка на убывание
    for i := High(count) downto 0 do
      for j := 1 to count[i] do
      begin
        arr[idx] := i + min;
        Inc(idx);
      end
  else
    for i := 0 to High(count) do
      for j := 1 to count[i] do
      begin
        arr[idx] := i + min;
        Inc(idx);
      end;
end;


procedure FuckingShit.HeapSort(var arr: array of integer; comp: Comparator);
var
  n: integer;
  
  procedure SiftDown(i, size: integer);
  var
    l, r, m: integer;
    t: integer;
  begin
    while 2 * i + 1 < size do
    begin
      l := 2 * i + 1;
      r := 2 * i + 2;
      m := i;
      
      if comp(arr[l], arr[m]) then m := l;
      if (r < size) and comp(arr[r], arr[m]) then m := r;
      
      if m = i then break;
      
      t := arr[i];
      arr[i] := arr[m];
      arr[m] := t;
      i := m;
    end;
  end;

begin
  n := Length(arr);
  
  // Построение пирамиды
  for var i := n div 2 - 1 downto 0 do
    SiftDown(i, n);
  
  // Сортировка
  for var i := n - 1 downto 1 do
  begin
    var t := arr[0];
    arr[0] := arr[i];
    arr[i] := t;
    SiftDown(0, i);
  end;
end;


procedure FuckingShit.ReadFromFile(filename: string; var arr: array of integer);
begin
  var f: Text;
  Assign(f, filename);
  Reset(f);
  
  var temp: List<integer> := new List<integer>;
  while not Eof(f) do
  begin
    var val: integer;
    try
      Read(f, val);
      temp.Add(val);
    except
       on System.FormatException do Print('')
       else Println('')
    end; 
  end;
  Close(f);
  
  SetLength(arr, temp.Count);
  for var i := 0 to temp.Count - 1 do
    arr[i] := temp[i];
end;


procedure FuckingShit.WriteToFile(filename: string; arr: array of integer);
begin
  var f: Text;
  Assign(f, filename);
  Rewrite(f);
  
  for var i := 0 to High(arr) do
    Write(f, arr[i], ' ');
  Close(f);
end;


procedure FuckingShit.Main(num_operation: integer);
begin
  // Читаем массив из файла
  self.ReadFromFile('input.txt', self.arr_from_file);
  
  case num_operation of
    1: self.CountingSort(self.arr_from_file, self.Ascending);
    2: self.HeapSort(self.arr_from_file, self.Descending);
  end;
  
  // Выводим результат
  Print('Результат:');
  foreach var x in self.arr_from_file do
    Print(x);
  
  // Записываем результат в файл
  var out_filename := '';
  case num_operation of
    1: out_filename := 'output_counting.txt';
    2: out_filename := 'output_heap.txt';
  end;
  if out_filename <> '' then
    self.WriteToFile(out_filename, self.arr_from_file);
end;


begin
  var begin_arr := ReadArrInteger(10);
  var Test: FuckingShit := new FuckingShit(begin_arr);
  
  Test.Main(1);
end.