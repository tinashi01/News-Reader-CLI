class NewsReader::CLI
    def welcome
        # puts 'Welcome to the Australian News Reader'
        # category_list
        puts 'Welcome to the Top Headlines in Australian Technology News Reader'
        article_list
    end

    def category_list
        puts 'Here is a list of categories to select from:'
        categories = NewsReader::API.new.category_type.uniq
        categories.each.with_index(1) do |item, index|
            if index < 5 do
                puts "#{index}. #{item}"
            end
        end
        puts "Please type the number of the category that most interests you:"

    end

    def article_list

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