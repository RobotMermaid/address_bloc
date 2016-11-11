require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book= AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{address_book.entries.count} cosmonauts"
    puts "1 - View all cosmonauts"
    puts "2 - View Entry Number n"
    puts "3 - Enter a new cosmonaut"
    puts "4 - Search for a cosmonaut"
    puts "5 - Import cosmonauts from a CSV"
    puts "6 - Exit"
    print "Enter your selection: "
    selection = gets.to_i

    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        entry_n_submenu
        main_menu
      when 3
        system "clear"
        create_entry
        main_menu
      when 4
        system "clear"
        search_entries
        main_menu
     when 5
       system "clear"
       read_csv
       main_menu
    when 6
      puts "Qapla'!"
      exit(0)
    else
      system "clear"
      puts "Sorry, no such cosmonaut onboard"
      main_menu
    end
  end

  def view_all_entries
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      entry_submenu(entry)
    end
    system "clear"
    puts "End of entries"
  end

  def view_specific_entry
    #gets value search entries and display one
    print "Choose a cosmonaut's name: "
    cosmo = nil
    name = gets.chomp
    address_book.entries.each do |entry|
      if name == entry.name
        cosmo = entry
      end
    end
      if cosmo != nil
        puts "here is the info for #{name}"
        puts cosmo.to_s
      else
        puts "not valid"
        main_menu
      end
  end

  def entry_n_submenu
    print "entry number to view: "
    selection = gets.chomp.to_i
    if selection < address_book.entries.count
      puts address_book.entries[selection]
      puts "press enter to return to the main menu"
      gets.chomp
      system "clear"
    else
      puts "#{selection} is invalid"
      entry_n_submenu
    end
  end

  def create_entry
    system "clear"
    puts "New AddressBloc Entry"
    print "Name "
    name = gets.chomp
    print "Phone number "
    phone_number = gets.chomp
    print "Email Address "
    email = gets.chomp

    address_book.add_entry(name, phone_number, email)

    system "clear"
    puts "New entry created"

  end
  def search_entries

  end
  def read_csv

  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit entry"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection
       when "n"
          #index+=1
          #address_book.entries[index]

      when "d"
        #address_book.delete(entry)

      when "e"


      when "m"


      else
        system "clear"
        puts "#{selection} is not a valid option"
        entry_submenu(entry)
      end
  end
end
