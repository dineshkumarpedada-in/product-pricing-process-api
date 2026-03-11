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
	"step": Mule::p('step.processEnd'),
	"statusCode": if(!isEmpty(attributes.statusCode)) attributes.statusCode else if(!isEmpty(vars.httpStatus)) vars.httpStatus else "NA",
	"processEndTime": (currentMilliseconds() - vars.apiKickOffTime) as String ++ "ms"
}