# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :setup_profile

  has_one :profile
  has_many :jobs, dependent: :destroy

  accepts_nested_attributes_for :jobs

  def setup_profile
    Profile.create(user_id: self.id)
  end

  def admin?
    role == 'Admin'
  end

  def attendant?
    role == 'Attendant'
  end

  def employer?
    role == 'Employer'
  end

  def worker?
    role == 'Worker'
  end

end
