class Post < ActiveRecord::Base
  has_many :comments
  # has_many :tags
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  #like를 통한 m:n 관계, user테이블과 관계가 있다.
  #has_many :users, through: :likes

  has_many :posts_tags
  has_many :tags, through: :posts_tags
  accepts_nested_attributes_for :tags  ##명시해줘야함. _form.html.erb에서 @post에서가 아니라
#tags 에서 받아 오는 것이기 때문에 명시하고 , simple_form_for다시 명시해줘야함

  mount_uploader :img, ImgUploader

  # 검증(model validation)
  validates :title, presence: {message: "제목을 입력해주세요."},
                    length: {maximum: 30,
                            too_long: "제목은 %{count}자 이내로 입력해주세요." }
  validates :content, presence: {message: "내용을 입력해주세요."}
  def to_hashtags
    tags.map{|tag| '#'+tag.content}.inject(:+)
  end
end
