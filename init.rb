require 'sinatra'
require 'curb'
require 'json'


get '/' do
 erb :index
end

post '/results' do
  @seach = params[:query]
 erb :results
end


get '/about' do
  erb :about
end

get '/contact' do
  erb :contact
end

get '/events' do
  @data = Curl::Easy.perform("https://www.eventbriteapi.com/v3/events/search/?q=baking&sort_by=best&location.address=new+york+city&token=FGTPMLNV7K6MQVZZCC6S")
  @req = JSON.parse(@data.body_str)
  erb :events
end

get '/muffins' do
  $muffins = []
  class Muffin
    attr_accessor :name, :price, :img, :description
    def initialize(name,price,img,description)
      @name = name
      @price = price
      @img = img
      @description = description
      $muffins<< self
    end
  end

  muffin1 = Muffin.new("It Ain't Easy Being Green", "$7.99", "images/muffin1.png", "Our pitaschio-flavored will turn heads and tastebuds.")
  muffin2 = Muffin.new("Muffin Will Stop Me", "$7.99", "images/muffin2.png", "Don't let its simple exterior fool you. This packs a flavor kick in each bite!")
  muffin3 = Muffin.new("I Miss You a Choco-lot", "$7.99", "images/muffin3.png", "For our chocoholics.")
  muffin4 = Muffin.new("Remain Calm and Carrot On","$7.99", "images/muffin4.png", "We can even make vegetables taste good.")
  muffin5 = Muffin.new("It Gets (Peanut) Butter", "$7.99", "images/muffin5.png", "Goes great with jelly!")
  muffin6 = Muffin.new("Muffin At All", "$7.99", "images/muffin6.png", "A corn-flavored muffin thats tastes like a bowl of cereal in each bite!")

  erb :muffins
end

get '/cookies' do
  $cookies = []
  class Cookie
    attr_accessor :name, :price, :img, :description
    def initialize(name,price,img,description)
      @name = name
      @price = price
      @img = img
      @description = description
      $cookies << self
    end
  end

  cookie1 = Cookie.new("Better Chocolate than Never", "$5.99", "images/cookie1.png", "A classic flavor that never goes out of style!")
  cookie2 = Cookie.new("Fudge is Life", "$5.99", "images/cookie2.png", "Fudge on chocolate. Twice the chocolate. Twice the fun.")
  cookie3 = Cookie.new("Confetti, Set, Go!", "$5.99", "images/cookie3.png", "Enjoy the flavor of a funfetti birthday cake in a cookie!")
  cookie4 = Cookie.new("The Last Straw-berry","$5.99", "images/cookie4.png", "Satisfy your sweet tooth with this strawberry-flavored cookie.")
  cookie5 = Cookie.new("You Butter Believe", "$5.99", "images/cookie5.png", "Indulge in our rich and chewy butter cookies. It doesn't get butter than this!")
  erb :cookies
end

get '/cakes' do
  $cakes = []
  class Cake
    attr_accessor :name, :price, :img, :description
    def initialize(name,price,img,description)
      @name = name
      @price = price
      @img = img
      @description = description
      $cakes << self
    end
  end

  cake1 = Cake.new("Say Cheese-cake", "$39.99", "images/cake1.png", "Our pictureque and traditional cheesecake is a favorite crowd pleaser.")
  cake2 = Cake.new("Cookies and Cream of the Crop", "$45.99", "images/cake2.png", "Your favorite cookie in cheesecake form!")
  cake3 = Cake.new("The Sooner the (Cookie) Butter", "$49.99", "images/cake3.png", "Cookies. Butter. What else could you ask for?")
  cake4 = Cake.new("When Life Gives You Lemons","$35.99", "images/cake4.png", "K Lemon O P. Tart and Delicious. ")
  cake5 = Cake.new("Fruit Em' Up", "$49.99", "images/cake5.png", "Our cheesecake infused with tropical flavors and topped with fresh fruits.")
  erb :cakes
end
