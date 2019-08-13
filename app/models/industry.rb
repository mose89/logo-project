class Industry < ApplicationRecord
  validates :description, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Faq.create! row.to_hash
    end
  end
end
