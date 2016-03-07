require("pg")

class Store

  attr_reader(:name, :address, :category)

  def initialize(args)
    @name = args["name"]
    @address = args["address"]
    @category = args["category"]
    
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