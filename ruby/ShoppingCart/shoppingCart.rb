require 'date'

class Item

	attr_accessor :price
	attr_accessor :discount

	@@total = 0

	def initialize(price)
		@price = price
		@discount = 0
	    @@total = @@total + 1
	end

	def discount()
		return @discount
	end

	def price()
		return @price
	end

	def setDiscount(discount)
		@discount = discount
	end

	def finalPrice()
		return price - discount
	end

	def self.total()
		return @@total
	end
end


class Fruit < Item

	attr_accessor :discount

	def chkIfDiscount(time)

		puts 'Checking if fruit has discount.... (only on weekends, friday to test)'

		if time.wday == 6 || time.wday == 0 || time.wday == 5
			puts "This fruit has a 10% discount because we're on weekend"
			setDiscount(price * 0.1)
			puts "This fruit discount is: #{discount}"
		else
			puts "This fruit has NO discount because we're not on weekend"
		end
	end

	def initialize(price)
		super(price)
		chkIfDiscount(Time.new)
	end
end

class HouseWare < Item
	def initialize(price)
		super(price)
		chkIfDiscount
	end

	def chkIfDiscount()
		
		if price > 100
			setDiscount(price * 0.05)
		end

		puts "HouseWare current discount: #{discount}"
	end
end

class Bananas < Fruit
	def initialize()
		super(10)
	end
end

class OrangeJuice < Item
	def initialize()
		super(10)
	end
end

class Rice < Item
	def initialize()
		super(1)
	end
end

class VacuumCleaner < HouseWare
	def initialize()
		super(150)
	end
end

class Anchovies < Item
	def initialize()
		super(2)
	end
end

class ShoppingCart

	@totalPrice = 0;
	@totalDiscount = 0;
	@finalPrice = 0;

	@@purchaseArray = []

	def initialize()
		doGreet
	end

	def purchaseArray
		return @@purchaseArray
	end

	def totalPrice
		cPrice = 0
		@@purchaseArray.each do |element|
			cPrice += element.price
		end
		return cPrice
	end

	def totalItemDiscounts
		cDiscounts = 0
		@@purchaseArray.each do |element|
			cDiscounts += element.discount
		end
		return cDiscounts
	end

	def addProduct(productId)
		case productId
			when 1
				puts 'bananas added'
				@@purchaseArray.push( Bananas.new )
			when 2
				@@purchaseArray.push( OrangeJuice.new )
				puts 'OrangeJuice Added'
			when 3
				@@purchaseArray.push( Rice.new )
				puts 'Rice added'
			when 4
				puts 'VacuumCleaner added'
				@@purchaseArray.push( VacuumCleaner.new )
			when 5 
				@@purchaseArray.push( Anchovies.new )
				puts 'Anchovies added'
			else 
				puts 'The product code you entered is invalid'
		end
	end

	def confirmPurchase
		@totalPrice = totalPrice();
		@totalDiscount = totalItemDiscounts();
		@finalPrice = @totalPrice - @totalDiscount;
		@specialDiscount = 0;

		if Item.total >= 5
			#puts "As you have buyed more than 5 items, you have a special 10% discount in your purchase!"
			@specialDiscount = @finalPrice * 0.1
			#puts "Special Discount: #{@specialDiscount} "
			@finalPrice -= @specialDiscount
		end

		showProductList()

		return "Total Price: #{@totalPrice}", 
			   "Total Discounts: #{@totalDiscount} + #{@specialDiscount} = #{@totalDiscount+@specialDiscount}",
			   "Final Purchase Price: #{@finalPrice}\n\n\n"
	end	

	def showProductList
		i = 0;
		purchaseArray.each do |element|
			i += 1;
			puts "#{i}: Product: #{element} /// Price: #{element.price} //// Discount #{element.discount}"
		end
		puts "\n\n\n"
	end

	def doGreet
		puts "\n\n\n Welcome to SimpleRubyShop!!! \n\n\n";
		puts "Please enter the following number to add the item to your shopping cart.\n\n";
		puts "(1) Bananas, (2) Orange Juice, (3) Rice, (4) Vacuum Cleaner, (5) Anchovies, and (9) to checkout and receive the bill.\n\n\n"
		
		requestItem()
	end

	def requestItem

		puts "Please enter the product number or 9 to finish:"

		usrNum = (gets.chomp).to_i;

		if usrNum != 9
			addProduct(usrNum);
			requestItem()
		else
			puts "\n\n\nDispatching receipt.......\n\n"
			puts confirmPurchase()
			puts "\n\n\nThank you for your purchase.  Good bye!!!\n\n"
		end
	end
end


mySCar = ShoppingCart.new()