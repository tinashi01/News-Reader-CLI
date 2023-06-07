class NewsReader::Article 
    # each article should have an author, title, description, url

    attr_accessor :author, :title, :description, :url

    @@all = []

    def initialize(author, title, description, url)
        @author = author
        @title = title
        @description = description
        @url = url
        @@all << self
    end

    def self.all
        NewsReader::API.article_info
        @@all
    end

    def self.find_article(num)
        self.all[num - 1]
    end

    # creating method which generates a random article
    # 60 results
    def self.random_article
        self.all[rand(59)]
    end
end

