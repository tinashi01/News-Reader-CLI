class NewsReader::CLI
    def welcome
        puts 'Welcome to the News Reader'
        category_list

    end

    def category_list
        puts 'Here is a list of articles to select from:'
        categories = NewsReader::API.new.category_type.uniq
        # puts categories[1]
        categories.each.with_index(1) do |item, index|
            if index < 7
                puts "#{index}. #{item}"
            end
        end
        puts "Please type the article that most interests you to read more:"
        num = gets.to_i

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