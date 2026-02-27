fun filterByCategory(products, category: String) =
    if (category == "")
        products
    else
    	products filter $.category == category
    	
fun formatProduct(product) = 
	{
		"id": product.id as Number,
		"name": product.name,
		"category": product.category,
		"price": product.price as Number,
		"stock": product.stock as Number
	}