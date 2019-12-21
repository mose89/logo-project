class Faq < ApplicationRecord
  validates :question, presence: true
  validates :answer, presence: true


  require "csv"

  def self.import(file)
    CSV.foreach(file.path, :col_sep => ";", :quote_char => "|", headers: true) do |row|
      faq_hash = row.to_hash # exclude the price field
      id = faq_hash.keys.first
      faqs = Faq.where(id: faq_hash[id])

      if faqs.count == 1
        faqs.first.update_attributes(faq_hash)

      else
        faq = Faq.new
        faq.id = faq_hash[id]
        faq.question = faq_hash["question"]
        faq.answer = faq_hash["answer"]
        faq.save!
      end
    end
  end


end
