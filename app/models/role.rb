class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    auditions.map { |audition| audition.actor } 
  end

  def locations
    auditions.map { |audition| audition.location }
  end

  def lead
    auditions.find_by(hired: true) || 'no actor has been hired for this role' 
  end

  def understudy
    auditions.where(hired: true).second || 'no actor has been hired for this role'
  end

end