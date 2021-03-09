# frozen_string_literal: true

# Module provide #file_fixture method to get files for rspec
#
module FileFixtures
  def file_fixture(file_name)
    folder_path = 'spec/fixtures/files/'
    Pathname.new(folder_path + file_name)
  end
end
