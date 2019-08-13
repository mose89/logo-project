class Faq < ApplicationRecord
  validates :question, presence: true
  validates :answer, presence: true


  require "csv"

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Faq.create! row.to_hash
    end
  end

end
