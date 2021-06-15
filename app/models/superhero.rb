class Superhero < ApplicationRecord
  validates :name, :power, :power_level, presence: :true
  validate :no_deadpool
  validates :good, inclusion: { in: [ true, false ] }
  validates_with SkrullValidator


  private

  def no_deadpool
    if self.name.downcase.include?("deadpool")
      @errors.add(:name, "must not include Deadpool, who is banned from our app")
    end
  end

end
