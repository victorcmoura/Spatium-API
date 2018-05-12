class FileObject < ApplicationRecord
    has_one_attached :file
    belongs_to :build
end
