-- using Oracle SQL Developer
copy from <user_source>@<IP_source>:<port>/<servicename_source> to <user_target>@<IP_target>:<port>/<servicename_target> 
create <table_name_target> using select * from <table_name_source>
