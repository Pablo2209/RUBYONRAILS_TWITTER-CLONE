class Like < ApplicationRecord

    /Asociacion likes con el tweet N a 1, por eso user en singular/
    belongs_to :tweet

    /Asociacion likes con el user N a 1, por eso user en singular/
    belongs_to :user

end
