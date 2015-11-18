class Movie < ActiveRecord::Base

  has_many :reviews
  mount_uploader :poster_image, PosterImageUploader

  validates :title, :director, :description, :poster_image_url, :release_date, presence: true
  validates :runtime_in_minutes,
      numericality: { only_integer: true }

  validate :release_date_is_in_the_past

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

  def review_average
    unless reviews.count == 0
      reviews.sum(:rating_out_of_ten)/reviews.size
    end
  end

end
