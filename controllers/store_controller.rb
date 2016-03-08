require("pg")
require_relative("../models/store.rb")

# => redirects
get("/stores/") {redirect(to("/stores"))}
get("/stores/new/") {redirect(to("/stores/new"))}
get("/stores/:id/") {redirect(to("/stores/:id"))}
get("/stores/:id/edit/") {redirect(to("/stores/:id/edit"))}

# => INDEX
get("/stores") do
  @stores_index_array = Store.index()
  erb(:layout_pet) {erb(:"store_views/index")}
end

# => NEW
get("/stores/new") do
  erb(:layout_pet) {erb(:"store_views/new")}
end

# => CREATE
post("/stores") do
  @store = Store.new(params)
  @store.create()
  erb(:layout_pet) {erb(:"store_views/create")}
end

# => SHOW
get("/stores/:id") do
  @store = Store.show(:id)
  erb(:layout_pet) {erb(:"store_views/show")}
end

# => EDIT
get("/stores/:id/edit") do
  @store = Store.new(Store.show(:id))
  erb(:layout_pet) {erb(:"store_views/edit")}
end

# => UPDATE
put("/stores/:id") do
  @store = Store.new(params)
  @store.update()
  erb(:layout_pet) {erb(:"store_views/update")}
end

# => DESTROY
delete("/stores/:id/delete") do
  @store = Store.new(params)
  @store.destroy
  erb(:layout_pet) {erb(:"store_views/destroy")}
end