require 'restaurant'
class Guide

  def initialize(path=nil)
    Restaurant.filepath = path
    if Restaurant.file_exists?
      puts "Found restaurant file."
    elsif Restaurant.create_file
      puts "Created restaurant file."
    else
      puts "Exiting. \n\n\n"
      exit!
    end


  end

  def launch!
    introduction

    conclusion
  end

  def introduction
    puts "\n\n<<< Welcome to Tafuta Msosi >>>\n\n"
    puts "This is an interactive guide to help you find the food you crave.\n\n"
  end

  def conclusion
    puts "\n<<< Karibu Goodbye and Bon Appetit! >>>\n\n\n"
  end
end
