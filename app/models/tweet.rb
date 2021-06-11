class Tweet < ApplicationRecord

    /Asociacion tweets con el usuario N a 1, por eso user en singular/
    belongs_to :user

    /Codigo de kaminari, cantidad de elementos por pagina/
    paginates_per 5
end
