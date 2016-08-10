require 'restaurant'
class Guide

  class Config
    @@actions =['list','add', 'find', 'quit', 'recommend']

    def self.actions; @@actions;end

  end

  def initialize(path=nil)
    Restaurant.filepath = path
    if Restaurant.file_usable?
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

    result = nil
    until result == :quit
      action = get_action
      result = do_action(action)
    end
    conclusion
  end

  def get_action
    action = nil
    until Guide::Config.actions.include?(action)
      puts "Actions: " + Guide::Config.actions.join(", ") if action
      print ">"
      user_response = gets.chomp
      action = user_response.downcase.strip
    end
    return action
  end

  def do_action(action)
    case action
      when 'list'
        puts "Listing...."
      when 'find'
        puts "Finding...."
      when 'add'
        puts "Add...."
      when 'recommend'
        puts "Recommend...."
      when 'quit'
        return :quit
      else
        puts "\n I didn't understand that command"
    end

  end

  def introduction
    puts "\n\n<<< Welcome to Tafuta Msosi >>>\n\n"
    puts "This is an interactive guide to help you find the food you crave.\n\n"
  end

  def conclusion
    puts "\n<<< Karibu Goodbye and Bon Appetit! >>>\n\n\n"
  end
end
