class OpenLibraryService
  include HTTParty

  base_uri 'openlibrary.org/api'

  def book_info(isbn)
    options = book_info_options(isbn)
    response = self.class.get('/books', options).parsed_response
    map_book_response isbn, response
  end

  private

  def map_book_response(isbn, data)
    book_data = data["ISBN:#{isbn}"]
    return nil unless book_data
    {
      isbn: isbn,
      title: book_data['title'],
      subtitle: book_data['subtitle'],
      number_of_pages: book_data['number_of_pages'],
      authors: book_data['authors'].map { |i| i['name'] }
    }
  end

  def book_info_options(isbn)
    {
      query: {
        bibkeys: "ISBN:#{isbn}",
        format: 'json',
        jscmd: 'data'
      }
    }
  end
end
