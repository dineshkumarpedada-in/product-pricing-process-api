%dw 2.0
output application/json skipNullOn='everywhere'
---
{
	"flowName": vars.loggingVars.flowName,
	"requestIdentifier" : vars.loggingVars.vars.requestIdentifier,
	"apiName": vars.loggingVars.appName,
	"appVersion": vars.loggingVars.appVersion,
	"timeStamp": now(),
	"correlationId": vars.loggingVars.correlationId,
	"processStartTime": vars.apiKickOffTime	as String ++ "ms",
	"requestIdentifier": vars.loggingVars.requestIdentifier,
	"step": Mule::p('step.processStart')
}