class Student < ApplicationRecord
    def fullname
        "#{name} #{surname}"
    end
end
