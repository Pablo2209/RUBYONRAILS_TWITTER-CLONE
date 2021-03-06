class Tweet < ApplicationRecord

    #Asociacion del tweets   con los likes  1 a N, por eso tweets es plural
    has_many :likes
      def liked?(user)
    !!self.likes.find{|like| like.user_id == user.id}
end
    /Asociacion tweets con el usuario N a 1, por eso user en singular/
    belongs_to :user

    /Codigo de kaminari, cantidad de elementos por pagina/
    paginates_per 5
end
