class Perso < ApplicationRecord
  belongs_to :user

  def time_conversion(time)
    time = time.to_i
    seconds = time % 60
    time = time - seconds
    minutes = (time / 60) % 60
    time = (time / 60) - minutes
    hours = time / 60
    return "#{hours}h#{minutes}m#{seconds}s"
  end

  validates :pseudo, presence: true, length: { maximum: 12 }
end
