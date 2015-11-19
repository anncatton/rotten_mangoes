class Movie < ActiveRecord::Base

  scope :title, ->(title) { where("title LIKE ?", title) }
  scope :director, ->(director) { where("director LIKE ?", director) }
  scope :under_90_minutes, -> { where("runtime_in_minutes < ?", 90) }
  scope :between_90_and_120_minutes, -> { where("runtime_in_minutes >= ? AND runtime_in_minutes <= ?", 90, 120) }
  scope :over_120_minutes, -> { where("runtime_in_minutes > ?", 120) }

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
