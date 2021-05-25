class Administrator < ApplicationRecord
    def fullname
        "#{name} #{surname}"
    end
end
