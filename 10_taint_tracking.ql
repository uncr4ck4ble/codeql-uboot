import cpp
import semmle.code.cpp.dataflow.DataFlow
import DataFlow::PathGraph
import semmle.code.cpp.rangeanalysis.SimpleRangeAnalysis
import semmle.code.cpp.dataflow.TaintTracking
class NetworkByteSwap extends Expr{
    NetworkByteSwap(){
      
         exists(Macro m |  m.getName().regexpMatch("ntoh.*")| this =m.getAnInvocation().getExpr())
    
    }


}
class MyCfg extends TaintTracking::Configuration{
    MyCfg(){
        this = "MyCfg"
    }
    
    override predicate isSink(DataFlow::Node sink){
        exists(FunctionCall fc | sink.asExpr()= fc.getArgument(2) and fc.getTarget().getName()="memcpy"
        and not fc.getArgument(2).isConstant()
    
        )
    }
    
    override predicate isSource(DataFlow::Node source) {
         source.asExpr() instanceof NetworkByteSwap
    }
}

from DataFlow::PathNode source,DataFlow::PathNode sink,MyCfg dataFlow 
where dataFlow.hasFlowPath(source, sink)
select sink,source