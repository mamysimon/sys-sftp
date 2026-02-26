%dw 2.0

fun calculTotalPrice(items): Number = items reduce ((item, acc = 0) -> acc + item.amount)
	
fun timestampToDate(timestamp: Number): DateTime = timestamp as DateTime

fun invoiceMapping(data)  = {
	"id": data.id,
	"total": calculTotalPrice(data.lines.data),
	"currency": upper(data.currency),
	"date": timestampToDate(data.created),
	"customer": {
		"id": data.customer,
		"city": data.customer_address.city,
		"country": data.customer_address.country,
		"postalCode": data.customer_address.postal_code,
		"email": data.customer_email,
		"name": data.customer_name,
		"phone": data.customer_phone
	},
	"lineItems":
		data.lines.data map((item) -> 
			{
				"id": item.id,
				"amount": item.amount
			}
		)
}

fun filterByCurrency(invoices, currency: String) =
    if (currency == "")
        invoices
    else
    	invoices filter ((invoice) -> upper(invoice.data.currency) == currency)