import cpp

from FunctionCall fc,Function f 

// where f.getName() ="memcpy" and fc.getTarget() =f
// select fc 

where f.getName()="memcpy"

select f.getACallToThisFunction()