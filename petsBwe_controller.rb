require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("./controllers/pet_controller.rb")
require_relative("./controllers/store_controller.rb")

get("/") {erb(:welcome)}