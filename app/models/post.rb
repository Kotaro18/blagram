class Post < ApplicationRecord
  belongs_to :user

  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos
  # accepts_nested_attributes_forは、親子関係のある関連モデル(今回でいうとPostモデルとPhotoモデル）で、親から子を作成したり保存するときに使える。
end
