class PassarPriceParaTabelaItemLines < ActiveRecord::Migration[5.1]

  def up  	
  	LineItem.all.each do |line_items|
  		line_items.price = line_items.product.price
  		puts line_items.product.price
  	end
  end

  def down
  	LineItem.all.each do |line_items|
  		puts line_items.product_id
  	end
  end

end
