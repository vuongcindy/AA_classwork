# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :string
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
    attr_reader :author_id, :moderator_id
    validates :title, presence: true

    belongs_to :moderator,
        primary_key: :id,
        foreign_key: :moderator_id,
        class_name: :User

    has_many :posts,
        primary_key: :id,
        foreign_key: :sub_id,
        class_name: :Post

    def require_moderator_login
        if self.moderator_id != current_user.id
            redirect_to 
        end
    end
end
