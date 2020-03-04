require "pry"
def find_item_by_name_in_collection(name, collection)

  collection.each do |ele|
    if ele[:item] == name
      return ele
  end
end
return nil
end

def consolidate_cart(cart)
 arr=[]
 cart.each do |ele|
   arr.each do |item|
    if find_item_by_name_in_collection(ele, arr)
      binding.pry
      item[:count]+=1
    else
      ele[:count] =1
      arr << ele
    end
 end
 end
binding.pry
 return arr
end

def apply_coupons(cart, coupons)
  arr=cart
  coupons.each do |coupon|
    if find_item_by_name_in_collection(coupon[:item],cart)
      cart_item = find_item_by_name_in_collection(coupon[:item], cart)
      binding.pry
      to_Add = {
          :item => coupon[:item]+ " W/COUPON",
          :price => (coupon[:cost]/ coupon[:num]).round(2),
          :clearance => cart_item[:clearance],
          :count => cart_item[:count]
      }
      arr << to_Add
    end
    
  end
  arr
end

def apply_clearance(cart)
  arr=[]
 car.each do |item|
   if item[:clearance] ==true
    
     #item[:price] = (item[:price] * .8).round(2)
     arr << item
    else
      arr << item
   end
 end
 arr
end

def checkout(cart, coupons)
  consol_cart= consolidate_cart(cart)
  ap_coupons_cart = apply_coupons(consol_cart)
  clear_cart= apply_clearance(ap_coupons_cart)
  price= 0 
  clear.each do |item|
    price += (item[:price] * item[:count])
  end
  if price > 100
   # price = (price *.9).round(2)
  end
  price
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
