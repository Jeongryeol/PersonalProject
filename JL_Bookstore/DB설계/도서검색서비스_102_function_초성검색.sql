CREATE OR REPLACE function adm_book.func_chosung(str in varchar2)
return varchar2
is
  returnVal varchar2(100);
  cnt number(5):=0;
  tmpStr varchar2(20);
begin
  if str is null then
    return '';
  end if;
  cnt := length(str);
  for i in 1..cnt
  loop
  tmpStr :=substr(str,i,1);
  returnVal := returnVal||
  case when ascii('��')<=ascii(tmpStr) and ascii(tmpStr) <= ascii('��') then chr(ascii(tmpStr))
  when tmpStr < '��' then '��'
  when tmpStr < '��' then '��'
  when tmpStr < '��' then '��'
  when tmpStr < '��' then '��'
  when tmpStr < '��' then '��'
  when tmpStr < '��' then '��'
  when tmpStr < '��' then '��'
  when tmpStr < '��' then '��'
  when tmpStr < '��' then '��'
  when tmpStr < 'ī' then '��'
  when tmpStr < 'Ÿ' then '��'
  when tmpStr < '��' then '��'
  when tmpStr < '��' then '��'
  else '��'
  end;
  end loop;
  return returnVal;
end;