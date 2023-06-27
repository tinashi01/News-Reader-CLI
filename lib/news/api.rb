# thinking about scraping to get categories instead of API...
# API will still be used to get articles.

class NewsReader::API
    URL = "https://saurav.tech/NewsAPI/top-headlines/category/technology/au.json"



    def self.get_article
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
        # directly change to json here to avoid repeats
    end

    def self.articles
        # formatting as json so we can work with data
        articles = JSON.parse(self.get_article)

   
        articles["articles"].collect do |article|
            article["title"]
        end
    end

   def self.article_info
    info = JSON.parse(self.get_article)
    
    info["articles"].collect do |item|
        author = item["author"]
        title = item["title"]
        description = item["description"]
        url = item["url"]
        NewsReader::Article.new(author, title, description, url)
    end
    
   end

end