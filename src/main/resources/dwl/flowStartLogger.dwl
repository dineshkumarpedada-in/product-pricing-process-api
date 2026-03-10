%dw 2.0
import * from dw::util::Timer
output application/json
---
{
	"flowName": vars.loggingVars.flowName default "",
	"apiName": vars.loggingVars.appName,
	"appVersion": vars.loggingVars.appVersion,
	"timeStamp": now(),
	"correlationId": vars.loggingVars.correlationId,
	"step": Mule::p('step.flowStart')
	
}