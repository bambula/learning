type  ptr = ^elem;
      elem = record
             inf:integer;
             ref:ptr;
             end;
             
procedure add_begin(var root:ptr; x:integer);
var a:ptr;
begin
  new(a);
  a^.inf:=x;
  a^.ref:=root;
  root:=a;
end;

procedure add_end(var root:ptr; x:integer);
var a,b:ptr;
begin
  if root = nil then
    add_begin(root,x)
  else
  begin
    new(a);
    a:=root;
    while a^.ref<>nil do
      a:=a^.ref;
    new(b);
    b^.inf:=x;
    b^.ref:=nil;
    a^.ref:=b;
  end;
end;

procedure print(root:ptr);
var a:ptr;
begin
  if root<>nil then
  begin
    new(a);
    a:=root;
    write(a^.inf,' ');
    while a^.ref<>nil do
    begin
      a:=a^.ref;
      write(a^.inf,' ');
    end;
    writeln();
  end
  else
    writeln('� ������ ��� ���������.');
end;

procedure change(var a,b:ptr);
var buf:integer;
begin
  buf:=a^.inf;
  a^.inf:=b^.inf;
  b^.inf:=buf;
end;
procedure simple_choice(var root:ptr);
var a,min:ptr;
begin
if root<>nil then
begin
  a:=root;
  min:=a;
  while a<>nil do
  begin
    if min^.inf>a^.inf then
      min:=a;
    a:=a^.ref;
  end;
  change(min,root);
  simple_choice(root^.ref);
end;
end;

VAR root:ptr;
    x,i:integer;
BEGIN
  randomize();
  for i:=1 to 10 do
  begin
    x:=random(50);
    add_end(root,x);
  end;
  print(root);
  simple_choice(root);
  print(root);
END.