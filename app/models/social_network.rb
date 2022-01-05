class SocialNetwork < ApplicationRecord
  belongs_to :client
  enum sc_key: ['facebook','instagram','organics','tik_tok']
end
