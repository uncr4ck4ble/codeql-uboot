import cpp

from Macro m ,MacroInvocation ma 
where m.getName().regexpMatch("ntoh.*")
select m.getAnInvocation()
