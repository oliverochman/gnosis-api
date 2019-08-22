class AddAssociationBetweenUniversityAndResearchGroup < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :university
  end
end
