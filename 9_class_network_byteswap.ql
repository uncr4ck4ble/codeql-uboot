import cpp

class NetworkByteSwap extends Expr{
    NetworkByteSwap(){
        //可以在exits 创建临时变量m，执行后面语句
         exists(Macro m |  m.getName().regexpMatch("ntoh.*")| this =m.getAnInvocation().getExpr())
    
    }


}

from NetworkByteSwap n
select n 