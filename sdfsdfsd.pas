procedure perest(head,tail:tstr);
 begin
  if length(tail)=6 then
   print(head)
   else
    begin
     for i:=1 to length(tail) do
     begin
      newhead:=head+copy(tail,i,1);
      newtail:=tail;
      delete(newtail,i,1);
      perest(newhead,newtail);
     end;
    end;
  end.