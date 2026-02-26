fun filterByCategory(products, category: String) =
    if (category == "")
        products
    else
    	products filter $.category == category