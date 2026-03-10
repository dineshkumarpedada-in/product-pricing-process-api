%dw 2.0
import * from dw::util::Timer
output application/json skipNullOn='everywhere'
---
{
	"apiName": vars.loggingVars.appName,
	"appVersion": vars.loggingVars.appVersion,
	"timeStamp": now(),
	"correlationId": vars.loggingVars.correlationId,
	"flowName": vars.loggingVars.flowName default "",
	"step": Mule::p('step.flowEnd')
}