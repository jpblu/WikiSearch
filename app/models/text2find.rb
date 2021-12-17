class Text2find 
    include ActiveModel::Model
    attr_accessor :wordinput

    validates :wordinput, presence: true, length: { minimum: 3 }
end