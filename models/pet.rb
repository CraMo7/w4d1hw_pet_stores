require("pg")

class Pet

  attr_reader(:name, :species, :breed, :age, :store)

  def initialize(args)
    @name = args["name"]
    @species = args["species"]
    @breed = args["breed"]
    @age = args["age"]
    @store = args["store"]
    @id = args["id"]
  end
  
  # => copy pasted from Store model - may not work
  def self.index()
    sql = "SELECT * FROM pets;"
    stores_index_from_table = Pet.db(sql)
    stores_index_array = stores_index_from_table.map {|pet| Pet.new(pet)}
    return stores_index_array
  end

  # => CREATE
  def create()
    sql = "INSERT INTO pets (
      name,
      address,
      category)
      VALUES(
      '#{@name}', name species breed age store - id
      '#{@address}',
      '#{@category}');"
    sql_return = Pet.db(sql)
    return sql_return
  end

  # => SHOW
  def self.show(id)
    sql = "SELECT * FROM stores WHERE id=#{id};"
    store_collection_returned = Pet.db(sql)
    store_hash = store_collection_returned[0]
    return store_hash
  end

  # => UPDATE
  def self.update(args)
    @name = args["name"]
    @address = args["address"]
    @category = args["category"]
    @id = args["id"]
    sql = "UPDATE stores SET name='#{@name}', address='#{@address}', category='#{@category}' WHERE id = '#{@id}';"
    sql_return = Pet.db(sql)
    return sql_return
  end

  # => DESTROY
  def destroy(id)
    sql = "DELETE FROM pets WHERE id=#{id};"
    sql_return = Pet.db(sql)
    return sql_return    
  end  

  private

  def self.db(sql)
    begin
      db = PG.connect({dbname: "petsbwe", host: "localhost"})
      sql_return = db.exec(sql)
    ensure
      db.close()
    end
    return sql_return
  end
end