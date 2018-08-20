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
  case when ascii('ㄱ')<=ascii(tmpStr) and ascii(tmpStr) <= ascii('ㅎ') then chr(ascii(tmpStr))
  when tmpStr < '나' then 'ㄱ'
  when tmpStr < '다' then 'ㄴ'
  when tmpStr < '라' then 'ㄷ'
  when tmpStr < '마' then 'ㄹ'
  when tmpStr < '바' then 'ㅁ'
  when tmpStr < '사' then 'ㅂ'
  when tmpStr < '아' then 'ㅅ'
  when tmpStr < '자' then 'ㅇ'
  when tmpStr < '차' then 'ㅈ'
  when tmpStr < '카' then 'ㅊ'
  when tmpStr < '타' then 'ㅋ'
  when tmpStr < '파' then 'ㅌ'
  when tmpStr < '하' then 'ㅍ'
  else 'ㅎ'
  end;
  end loop;
  return returnVal;
end;