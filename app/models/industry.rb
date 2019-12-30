class Industry < ApplicationRecord
  validates :description, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Industry.create! row.to_hash
    end
  end
end
