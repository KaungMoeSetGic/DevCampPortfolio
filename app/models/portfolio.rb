class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image

    def self.angular # Class method
        where(subtitle: "Angular")
    end

    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') } # lambda function

    after_initialize :set_defaults # after_initialize do when new method in controller run at the same time

    def set_defaults
        self.main_image ||= "https://placehold.co/600x400"
        self.thumb_image ||= "https://placehold.co/350x200"
    end

    # meaning of self.main_image ||= "https://placehold.co/600x400"
    # if self.main_image == nil
    #   self.main_image == "https://placehold.co/600x400"
end
