class User < ApplicationRecord
    has_secure_password
    has_many :sent_messages, foreign_key: "sender_id", class_name: "PrivateMessage"
    has_many :received_messages, foreign_key: "recipient_id", class_name: "PrivateMessage"
    has_many :gossips
    has_many :comments, dependent: :destroy
    #belongs_to :city
    validates :password, presence: true, length: { minimum: 2 }
    
end
