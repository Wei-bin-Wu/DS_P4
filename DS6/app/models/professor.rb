class Professor < ApplicationRecord
    def fullname
        "#{name} #{surname}"
    end
end
