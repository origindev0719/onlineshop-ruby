class Listing < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url =>  "/images/:style/missing.png"
	                  #:storage => :dropbox,
                      #:dropbox_credentials => Rails.root.join("config/dropbox.yml"), :path => ":style/:id_:filename"
                      
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    
    validates :name, :description, :price, presence: true
    validates :price, numericality: {greater_than: 0}, numericality: {less_than: 1000000000}
    validates_attachment_presence :image
    
    belongs_to :user
    has_many :orders
end
