select regexp_substr( ' A,B,C,D' , '[^,]+' , 1 , level) as STATE_PROVINCE 
from dual 
connect by regexp_substr( ' A,B,C,D' , '[^,]+' , 1 , level) is not null
