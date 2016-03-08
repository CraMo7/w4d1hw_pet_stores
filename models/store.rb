require("pg")

class Store

  attr_reader(:name, :address, :category)

  def initialize(args)
    @name = args["name"]
    @address = args["address"]
    @category = args["category"]
    @id = args["id"] # => ternary or other guard here is somewhat unnecessary as, when passed a params hash from the /new page without an 'id' key, the @id will be set to a fairly harmless empty string. Setting it to nil wouldn't change anything in this app. No conditional ever evaluates the truthiness of @id as of the current state of this webapp. However, NB: Ruby is weird, so empty string is truthy AFAIK, while nil would be falsey, which would be useful if it were used.
  end

  # => INDEX
  def self.index()
    sql = "SELECT * FROM stores;"
    stores_index_from_table = Store.db(sql)
    stores_index_array = stores_index_from_table.map {|store| Store.new(store)}
    return stores_index_array
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
    store_hash_returned = Store.db(sql)
    return store_hash_returned
  end

  # => UPDATE
  def update(args)
    @name = args["name"]
    @address = args["address"]
    @category = args["category"]
    sql = "UPDATE stores SET name='#{@name}', address='#{@address}', category='#{@category}' WHERE id = '#{@id}';"
    sql_return = Store.db(sql)
    return sql_return
  end

  # => DESTROY
  def destroy(id)
    sql = "DELETE FROM stores WHERE id='#{id}'"
    sql_return = Store.db(sql)
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