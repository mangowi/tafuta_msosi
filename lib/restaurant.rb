class Restaurant

  @@filepath = nil

  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT, path)
  end

  attr_accessor :name, :cusine, :price
  def self.file_exists?
   if @@filepath && File.exist?(@@filepath)
     return true
   else
     return false
   end
  end

 def self.file_usable?
   return false unless @@filepath
   return false unless File.exists?(@@filepath)
   return false unless File.readable?(@@filepath)
   return false unless File.writable?(@@filepath)
   return true
 end


  def self.create_file
      File.open(@@filepath, 'w') unless file_exists?
      return file_usable?
  end

  def self.saved_restaurants
    # read the restaurant file
    # return instances of restaurant
  end

  def self.build_from_questions
    args = {}
    puts "Restaurant name: "
    args[:name] = gets.chomp.strip

    puts "Cusine name: "
    args[:cusine] = gets.chomp.strip

    puts "Avarage price: "
    args[:price] = gets.chomp.strip

    restaurant = self.new(args)
    return restaurant;
  end

  def initialize(args={})
    @name     = args[:name]   || ""
    @cusine   = args[:cusine] || ""
    @price    = args[:price]  || ""
  end

  def save
    return false unless Restaurant.file_usable?
    File.open(@@filepath, 'a') do |file|
              file.puts "#{[@name, @cusine, @price].join("\t")}\n"
    end
    return true
  end

end