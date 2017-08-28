require 'rspec'
require_relative '../search_locality'

describe 'Search Locality' do
  let(:directory_to_search) {""}
  let(:first_term) {"developer"}
  let(:second_term) {"operations"}
  let(:number_words_between) {0}
  let(:string_match) {""}
  let(:localitySearch) {LocalitySearch.new(first_term, second_term, number_words_between, directory_to_search)}
  let(:non_match_string) {"A tale of non-matched strings for testing."}
  let(:match_string) {"The " + first_term + " should also be involved in " + second_term + "."}

  context "Search invalid directory" do
    let(:directory_to_search) {"bogus_directory"}
    it 'should return an error message if the directory is not valid' do
      expect{localitySearch.get_files()}.to raise_error('Directory invalid')
    end
  end

  context "Search directory with no text files" do
    let(:directory_to_search) {"../data/empty_directory"}

    it 'should return an empty list if the directory does not contain txt files' do
      file_list = localitySearch.get_files()
      expect(file_list).to be_empty
    end

    it 'should return an empty match list when searching an empty directory' do
      match_list = localitySearch.search_files()
      expect(match_list).to be_empty()
    end

    it 'should return an message that no matches where found' do
      search_output = localitySearch.print_output()
      expect(search_output).to eq("No Matches found\n")
    end

  end

  context 'Find files in director with one text file' do

  end

  context 'Search directory with one text file' do
    let(:directory_to_search) {'../data/directory_with_file'}
    it 'should return one file when the directory has one text file' do
      file_list = localitySearch.get_files()
      file_list_size = file_list.size
      expect(file_list_size).to eq(1)
    end

  end

  context 'Search directory with one text file and other files' do
    let(:directory_to_search) {'../data/directory_with_non_text_files'}

    it 'should return one file when the directory has one text file and other non text files' do
      file_list = localitySearch.get_files()
      file_list_size = file_list.size
      expect(file_list_size).to eq(1)
    end
  end

  context 'Non matching string' do
    let(:string_match) {non_match_string}

    it 'should return an empty list if string to be matched does not contain the terms' do
      match_list  = localitySearch.find_matching_terms(first_term, second_term, number_words_between, match_string)
      expect(match_list).to be_empty
    end
  end

  context 'Matching string' do
    let(:string_match) {match_string}
    let(:number_words_between) {9}

    it 'should return a list with one entry if the match string contains one match with words in the search distance' do
      match_list  = localitySearch.find_matching_terms(first_term, second_term, number_words_between, match_string)
      match_list_size = match_list.size
      expect(match_list_size).to eq(1)
    end

    context "Matching words too far apart" do
      let(:string_match) {match_string}
      let(:number_words_between) {5}

      it 'should return a empty list if the matching terms are too far apart' do
        match_list  = localitySearch.find_matching_terms(first_term, second_term, number_words_between, match_string)
        expect(match_list).to be_empty()
      end
    end

  end

  context 'Search directory with one matching text file and other files' do
    let(:directory_to_search) {'../data/directory_with_non_text_files'}
    let(:number_words_between) {9}

    it 'should return a match list with one entry when the directory has one matching text file and other non text files' do
      match_list  = localitySearch.search_files()
      match_list_size = match_list.size
      expect(match_list_size).to eq(1)
    end
  end

  context 'Search directory with multiple matching text files and other files' do
    let(:directory_to_search) {'../data/directory_with_multple_text_files'}
    let(:number_words_between) {9}

    it 'should return a match list with one entry when the directory has one matching text file and other non text files' do
      match_list  = localitySearch.search_files()
      match_list_size = match_list.size
      expect(match_list_size).to eq(4)
    end
  end

  context 'Search directory with single matching text file and output results' do
    let(:directory_to_search) {'../data/directory_with_non_text_files'}
    let(:number_words_between) {9}

    it 'should ouput a list of matches when the directory has one matching text file and other non text files' do
      match_list  = localitySearch.search_files()
      match_output = localitySearch.print_output
      expect(match_output).to eq("Found the following matches\nIn file ../data/directory_with_non_text_files/text.txt-the first term was found at index 1 and the second term was found at index 6\n")
    end
  end

end