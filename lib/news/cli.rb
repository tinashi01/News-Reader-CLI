class NewsReader::CLI
    def welcome
        puts 'Welcome to the News Reader'
        category_list

    end

    def category_list
        puts 'Here is a list of sources to select from:'
        categories = NewsReader::API.new
        puts categories.category_type.uniq
        puts "Please type the category that most interests you:"
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