class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :line_items
  has_many :products, :through => :line_items

  after_commit :queue_processing, on: :create

  def queue_processing
    OrderWorker.perform_async(id)
  end

  def self.recent
    where("placed_at > ?", 7.days.ago)
  end

  def self.by(customer)
    where(customer_id: customer.id)
  end

  def calculate_total_amount
    self.total_amount = 0
    for line_item in line_items
      self.total_amount += line_item.total_amount
    end
    save
  end
end
