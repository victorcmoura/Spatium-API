class Build < ApplicationRecord
  before_save :limit_amazon_bucket
  has_one :file_object

  private

  # Method to avoid Carrot's bankrupcy
  def limit_amazon_bucket
    if !self.is_master
      while Build.where(:is_master => [nil, false]).count > 30
        @exclude_build = Build.where(:is_master => [nil, false]).first
        @file = @exclude_build.file_object

        @file.destroy
        @exclude_build.destroy
      end
    end
  end

end
