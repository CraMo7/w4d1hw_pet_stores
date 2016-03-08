require("pg")
require_relative("../models/pet.rb")

# => redirects
get("/pets/") {redirect(to("/pets"))}
get("/pets/new/") {redirect(to("/pets/new"))}
get("/pets/:id/") {redirect(to("/pets/:id"))}
get("/pets/:id/edit/") {redirect(to("/pets/:id/edit"))}


# => INDEX
get("/pets") do
  @pets_index_array = Pet.index()
  erb(:layout_pet) {erb(:"pet_views/index")}
end

# => NEW
get("/pets/new") do
  erb(:layout_pet) {erb(:"pet_views/new")}
end

# => CREATE
post("/pets") do
  @pet = Pet.new(params)
  @pet.create()
  erb(:layout_pet) {erb(:"pet_views/create")}
end

# => SHOW
get("/pets/:id") do
  @pet = Pet.show(:id)
  erb(:layout_pet) {erb(:"pet_views/show")}
end

# => EDIT
get("/pets/:id/edit") do
  @pet = Pet.new(Pet.show(:id))
  erb(:layout_pet) {erb(:"pet_views/edit")}
end

# => UPDATE
post("/pets/:id") do
  @pet = Pet.new(params)
  @pet.update()
  erb(:layout_pet) {erb(:"pet_views/update")}
end

# => DESTROY
delete("/pets/:id/delete") do
  @pet = Pet.new(params)
  @pet.destroy
  erb(:layout_pet) {erb(:"pet_views/destroy")}
end

# # => INDEX
# get("/pets") do

#   erb(:layout_pet) {erb(:"pet_views/index")}
# end

# # => NEW
# get("/pets/new") do

#   erb(:layout_pet) {erb(:"pet_views/new")}
# end

# # => CREATE
# post("/pets") do

#   erb(:layout_pet) {erb(:"pet_views/create")}
# end

# # => SHOW
# get("/pets/:id") do

#   erb(:layout_pet) {erb(:"pet_views/show")}
# end

# # => EDIT
# get("/pets/:id/edit") do

#   erb(:layout_pet) {erb(:"pet_views/edit")}
# end

# # => UPDATE
# put("/pets/:id") do

#   erb(:layout_pet) {erb(:"pet_views/update")}
# end

# # => DESTROY
# delete("/pets/:id/delete") do

#   erb(:layout_pet) {erb(:"pet_views/destroy")}
# end