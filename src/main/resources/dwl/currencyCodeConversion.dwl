%dw 2.0

/* GET request : Convert USD → requested currency.
POST/PUT request : Convert given currency → USD. */

var curRates = vars.exchangeRates.rates
var requestedCurrency = if ( !isEmpty(vars.queryParams.currencyCode) ) vars.queryParams.currencyCode else "USD"
var operation = vars.method
fun currencyConversion(price, currencyCode, operation) =
 // For GET operation
(if (operation == "GET") 
    if (requestedCurrency == "USD") 
        ((price)as String {format: "0.00"}) as Number
    else
        ((price * curRates[requestedCurrency]) as String {format: "0.00"}) as Number
 else  // For POST/PUT operations
    if (currencyCode == "USD") 
        ((price) as String {format: "0.00"}) as Number
    else
        ((price / curRates[currencyCode]) as String {format: "0.00"}) as Number
)
output application/json
---
if ( !isEmpty(vars.products.records) ) vars.products.records filter (!isEmpty($.price)) map ((item) -> item update {
	case .price -> currencyConversion(item.price, item.currencyCode, operation)
            case .currencyCode ->
                if ( operation == "GET" ) requestedCurrency
                else "USD"
})
else
    vars.products
    
