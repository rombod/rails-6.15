class Product < ApplicationRecord
	has_many :orders
	has_many :comments
  validates :name, presence: true
  validates :description, presence: true
  validates :colour, presence: true
  validates :price_in_cents, presence: true
  validates :image_url, presence: true
  
	def highest_rating_comment
		comments.rating_desc.first
	end

	def lowest_rating_comment
		comments.rating_asc.first
	end

	def average_rating
  comments.average(:rating).to_f
  end

  def views
  	$redis.get("product:#{id}")
  end

  def viewed!
  	$redis.incr("product:#{id}")
  end

end