require("pg")

class Pet

  attr_reader(:name, :species, :breed, :age, :store)

  def initialize(args)
    @name = args["name"]
    @species = args["species"]
    @breed = args["breed"]
    @age = args["age"]
    @store = args["store"]
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