require_relative 'controllers/menu_controller'

menu = MenuController.new
#clears the command line
system "clear"
puts "Welcome aboard the Starship AddressBloc!"

menu.main_menu
