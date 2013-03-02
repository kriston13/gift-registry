class AddTreatAsPriceToAttrName < ActiveRecord::Migration
  def change
    add_column :attr_names, :treat_as_price, :boolean
  end
end
