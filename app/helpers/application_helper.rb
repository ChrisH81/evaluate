module ApplicationHelper

def product_price
  if general.offer.blank?
    return "product-price"
  else
    return "product-special-price"
  end
end

end
