class ArticlesSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :body, :image

  belongs_to :user, serializer: VeryBasicUserInfoSerializer

  def image 
    ActiveStorage::Current.set(host: "https://www.example.com") do
      object.image.service_url
    end
  end
  
end
