uses
  crt;
procedure menu; 
begin
  TextColor(Green);
  writeln('Нажмите "1" сортировка "пузырьком".');
  TextColor(Blue);
  writeln('Нажмите "2" сортировка "слиянием".');
  TextColor(Red);
  writeln('Нажмите "3" чтобы выйти из программы.');
  TextColor(White)
end;
var
  m, n, k, i, j: integer;
  mass: Array [1..10] of integer;
  mas: array [1..10] of integer;
  inp, outp: text;
  key: char;
procedure MergeSort(a, c: integer);
var
    x, j, i, n1, n2: integer;
    rez: array[1..10] of integer;
begin 
    if c <= a then 
        exit 
    else 
    begin
        x := (a + c) div 2;
        MergeSort(a, x);
        MergeSort(x + 1, c);
        n1 := a;
        n2 := x + 1;
        for i := a to c do 
        begin
            if (n1 < x + 1) and ((n2 > c) or (mas[n1] < mas[n2])) then
            begin
                rez[i] := mas[n1];
                inc(n1);
            end 
            else 
            begin
                rez[i] := mas[n2];
                inc(n2);
            end;
        end;
        for j := a to c do
            mas[j] := rez[j];
    end; 
end;

begin
  menu;
  repeat
    key := ReadKey;
    case key of
      '1':
        begin
  clrscr;
  assign(inp, 'D:\учеба\ОАИП\ДКР5\qwe.txt');
  assign(outp, 'D:\учеба\ОАИП\ДКР5\rty.txt');
  reset(inp);
  rewrite(outp); 
  readln(inp, m);
  for i := 1 to m do
    read(inp, mass[i]);
    writeln(mass);
    for i := 1 to m - 1 do
      for j := 1 to m - i do
        if mass[j] > mass[j + 1] then 
              begin
                k := mass[j];
                mass[j] := mass[j + 1];
                mass[j + 1] := k
              end;
              for i := 1 to m do
                 write(outp, mass[i]:4);
                 writeln(mass);
                 close(inp);
                 close(outp);
                 menu;
              end;
        '2':
        begin
  assign(inp, 'D:\учеба\ОАИП\ДКР5\qwe.txt');
  assign(outp, 'D:\учеба\ОАИП\ДКР5\rty.txt');
  reset(inp);
  rewrite(outp); 
  readln(inp, n);
  for i := 1 to n do
    read(inp, mas[i]);
    writeln(mas);
    MergeSort(1, n);
    for i := 1 to n do
      write(outp, mas[i]:4);
      close(inp);
      close(outp);
      writeln(mas);
      menu;
        end;
       end;
  until key = '3'
end.