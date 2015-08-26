class Bird
  include Mongoid::Document
  field :name, type: String
  field :family, type: String
  field :visible, type: Mongoid::Boolean
  field :added, type: Date
  field :continents, type: String

  validates :family, :visible, :continents, presence: true
  validates :name, presence: true, uniqueness: true
  after_create :add_registry_date

  private

  def add_registry_date
    self.added = Date.today
    self.save!
  end

end
