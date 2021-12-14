import cpp

from  Macro m 
//where m.getName() = "ntohl" or m.getName() ="ntohs" or m.getName() ="ntohll"
//where m.getName() in ["ntohl","ntohs","ntohll"]
where m.getName().regexpMatch("ntoh.*")
select m ,"find "