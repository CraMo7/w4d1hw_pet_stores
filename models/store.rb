require("pg")

class Store

  attr_reader(:name, :address, :category)

  def initialize(args)
    @name = args["name"]
    @address = args["address"]
    @category = args["category"]
    @id = args["id"]
  end

  # => INDEX
  def self.index()
    sql = "SELECT * FROM stores;"
    stores_index_from_table = Store.db(sql)
    stores_index_array = stores_index_from_table.map {|store| Store.new(store)}   
  end

  # => CREATE
  def create()
    sql = "INSERT INTO stores VALUES(
      '#{@name}',
      '#{@address}',
      '#{@category}');"
    sql_return = Store.db(sql)
    return sql_return
  end

  # => SHOW
  def self.show(id)
    sql = "SELECT * FROM stores WHERE id=#{id};"
    sql_return = Store.db(sql)
    return sql_return
  end

  # => UPDATE
  def update(args)
    @name = args["name"]
    @address = args["address"]
    @category = args["category"]
    sql = "UPDATE stores SET name='#{@name}', address='#{@address}', category='#{@category}' WHERE id = '#{@id}';"
  end

  # => DESTROY
  def destroy(id)
    
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