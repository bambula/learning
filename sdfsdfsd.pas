procedure perest(head,tail:tstr); //Теперь определяй tail, только как переменную
 begin
  if length(tail)=6 then //Добавляй условие: 1+2+3=4+5+6: про StrToInt найди в справке в разделе Системные процедуры,
   print(head)           //главе Строки (как-то так). Она переводит строку в число (если строка состоит из цифр, конечно.
   else                  //Да, и подумай про условие выхода из цикла: там head или tail должен быть?
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