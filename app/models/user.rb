class User < ActiveRecord::Base
  rolify
  include Authority::UserAbilities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  has_many :posts, dependent: :destroy
  has_many :bulletins, dependent: :destroy
  has_many :confirms, dependent: :destroy
  
  after_create :set_default_role, if: Proc.new { User.count > 1 }
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    user = User.find_by('email = ?', auth['info']['email'])
    if user.blank?
       user = User.new(
         {
          provider: auth.provider,
          uid: auth.uid,
          email: auth.info.email,
          password: Devise.friendly_token[0,20]
         }
       )
       if user.provider == "facebook"? user.save!(:validate => false) : user.save!
          user.email = auth.info.email
       end
       user.save!
    end
    user
  end
  
  private
  def set_default_role
    add_role :user
  end
  
end
