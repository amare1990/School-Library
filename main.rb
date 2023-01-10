require './app'

def main
  app = App.new
  app.run

  at_exit do
    app.save_rentals
  end
end

main
