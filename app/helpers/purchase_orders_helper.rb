module PurchaseOrdersHelper
  # Returns the current shop (if any).
  def list_product
    @list_product ||= session[:list_product]
  end

  def add_product(*args)
    product = Product.find(args[0][:product_id])
    @list_product = if list_product.nil?
                      []
                    else
                      list_product
                    end
    index = @list_product.find_index { |p| p['product_id'].to_i == args[0][:product_id].to_i }
    if index.nil?
      image = product.image
      if image.nil?
        @list_product.push(product_id: product.id, name: product.name,
                           price: product.price, quantity: args[0][:quantity])
      else
        @list_product.push(product_id: product.id, name: product.name, image: image.url.url,
                           price: product.price, quantity: args[0][:quantity])
      end
    else
      @list_product[index]['quantity'] = @list_product[index]['quantity'].to_i + args[0][:quantity].to_i
    end
    session[:list_product] = @list_product
  end

  def delete_products(*args)
    @list_product = list_product
    @list_product.delete_if { |product| product['product_id'].to_i == args[0].to_i }
    session[:list_product] = @list_product
  end
end
