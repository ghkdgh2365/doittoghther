class Post < ActiveRecord::Base
    resourcify
    include Authority::Abilities
    belongs_to :user
    belongs_to :bulletin
    has_one :confirm, dependent: :destroy
    validates :title, presence: true
    validates :content, presence: true
    validates :checker_name, presence: true
    validates :receiver_name, presence: true
    validates :goal_category, presence: true
    validates :information_agree, presence: true
    validates :penalty_exist, presence: true
    # validates :goal_checker, presence: true
    validates_date :start_day, :on_or_after => :today
    validates_date :end_day, :on_or_after => :start_day
end
