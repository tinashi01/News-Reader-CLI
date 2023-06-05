class NewsReader::CLI
    def welcome
        puts 'Welcome to the News Reader'
        article_list
        # valid_input
        read_article
    end

    def article_list
        puts 'Here is a list of articles to select from:'
        articles = NewsReader::API.articles.uniq
        # puts articles[1]
        articles.each.with_index(1) do |item, index|
            if index < 7
                puts "#{index}. #{item}"
            end
        end
        puts "Please type the number of the article that most interests you to read more:"

    end

    def valid_input
        num = gets.to_i
        
    end

    def read_article
        article = NewsReader::Article.all
        # article.each.with_index(1) do |item, index|
        #     if index < 3
        #         puts "#{index}. #{article}"
        #     end
        # # end
        # binding.pry
    end

    # menu options could instead sort by category?
    # 
    

    # def menu    
    #     puts '--Menu--'
    #     puts 'Choose your news source:'
    #     puts '1. BBC News'
    #     puts '2. CNN'
    #     puts '3. Fox News'
    #     puts '4. Exit'
    # end

    # def bbc_news
    #     puts "Here are the top 10 articles from BBC News..."

    # end
end