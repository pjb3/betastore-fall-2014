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

  IMAGE_URLS = [
    'http://rackcdn.ultramerchandise.com/product_image_zoom/UltraBlack_TrackJacket_0.png',
    'http://www.jeffwennberg.com/wp-content/uploads/2014/09/salesman-product-retro-e1375069280369.jpg'
  ]

  def image_url
    IMAGE_URLS.sample
  end
end
