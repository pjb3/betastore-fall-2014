class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, :through => :line_items

  validates :name, presence: { message: 'is required' }
  validates :price, numericality: { greater_than_or_equal_to: 0,
    message: 'must be a number' }

  def send_confirmation_email
    # TODO: Actually send email
    logger.warn "Sending emai to #{email}"
  end

end
