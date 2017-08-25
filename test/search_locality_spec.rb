require 'rspec'
require_relative '../search_locality'

describe 'Search Locality' do
  let(:invalid_directory) {"bogus_directory"}
  let(:first_term) {"developer"}
  let(:second_term) {"operations"}
  let(:localitySearch) {LocalitySearch.new}

  it 'should return an error message if the directory is not valid' do
    expect{localitySearch.get_files(invalid_directory)}.to raise_error('Directory invalid')
  end

end