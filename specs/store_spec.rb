require("minitest/autorun")
require("minitest/rg")
require_relative("../models/store.rb") 

class StoreTest < MiniTest::Test

  def setup
    params = {
      "name" => "Proper Pets",
      "address" => "1 Shopping Street, Edinburgh",
      "category" => "general"
    }
    @store = Store.new(params)
  end

  def test_store_has_name
    assert_equal("Proper Pets", @store.name)
  end

  def test_store_has_address
    assert_equal("1 Shopping Street, Edinburgh", @store.address)
  end

  def test_store_has_category
    assert_equal("general", @store.category)
  end

end