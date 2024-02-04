-- using Oracle SQL Developer
copy from <user_source>/<password>@<IP_source>:<port>/<servicename_source> to <user_target>/<password>@<IP_target>:<port>/<servicename_target> create <table_name_target> using select * from <table_name_source>
