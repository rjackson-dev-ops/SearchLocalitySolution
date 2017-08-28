require 'rspec'
require_relative '../search_locality'

describe 'Search Locality' do
  let(:directory_to_search) {""}
  let(:first_term) {"developer"}
  let(:second_term) {"operations"}
  let(:number_words_between) {0}
  let(:string_match) {""}
  let(:localitySearch) {LocalitySearch.new(first_term, second_term, number_words_between, string_match)}
  let(:non_match_string) {"A tale of non-matched strings for testing."}
  let(:match_string) {"The " + first_term + " should also be involved in " + second_term + "."}

  it 'should return an error message if the directory is not valid' do
    directory_to_search = 'bogus_directory'
    expect{localitySearch.get_files(directory_to_search)}.to raise_error('Directory invalid')
  end

  it 'should return an empty list if the directory does not contain txt files' do
    directory_to_search = '../data/empty_directory'
    file_list = localitySearch.get_files(directory_to_search)
    expect(file_list).to be_empty
  end

  it 'should return one file when the directory has one text file' do
    directory_to_search = '../data/directory_with_file'
    file_list = localitySearch.get_files(directory_to_search)
    file_list_size = file_list.size
    expect(file_list_size).to eq(1)
  end

  it 'should return one file when the directory has one text file and other non text files' do
    directory_to_search = '../data/directory_with_non_text_files'
    file_list = localitySearch.get_files(directory_to_search)
    file_list_size = file_list.size
    expect(file_list_size).to eq(1)
  end

  context 'Non matching string' do
    let(:string_match) {non_match_string}

    it 'should return an empty list if string to be matched does not contain the terms' do
      match_list  = localitySearch.find_matching_strings(@first_term, @second_term, @number_words_between)
      expect(match_list).to be_empty
    end
  end

  context 'Matching string' do
    let(:string_match) {match_string}
    let(:number_words_between) {9}

    it 'should return a list with one entry if the match string contains one match with words in the search distance' do
      match_list  = localitySearch.find_matching_strings(@first_term, @second_term, @number_words_between)
      match_list_size = match_list.size
      expect(match_list_size).to eq(1)
    end



    context "Matching words too far apart" do
      let(:string_match) {match_string}
      let(:number_words_between) {5}

      it 'should return a empty list if the matching terms are too far apart' do
        match_list  = localitySearch.find_matching_strings(@first_term, @second_term, @number_words_between)
        expect(match_list).to be_empty()
      end
    end
  end


end