class NewsReader::CLI
    def welcome
        puts 'Welcome to the Australian Technology News Reader'
        loop do
            menu
            choice = gets.chomp
            if choice === "1"
                article_list
                read_article    
                enter
            elsif choice === "2"
                random_article
            elsif choice === "0"
                goodbye
                break
            else
                puts "No such option, please try again."
            end
        end
    end

    # format so we can loop through continuously and the input also loops


    def article_list
        puts 'Here is a list of articles to select from:'
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        articles = NewsReader::API.articles.uniq
        articles.each.with_index(1) do |item, index|
            if index < 11
                puts "#{index}. #{item}"
            end
        end
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "Please type the number of the article that most interests you:"
    end

    def read_article
        input = gets.to_i
        article = NewsReader::Article.find_article(input)

        if input > 0 && input < 11
            puts "Here is your selected article:"
            puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
            
            puts "`#{article.title}`"

            if article.author === "null"
                puts "Written by #{article.author}"
            else
                puts "No author information"  
            end

            puts "#{article.description}"
            puts "Continue reading at #{article.url}" 
            puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        else
            puts "Sorry, no such article. Please enter a valid number:"
            read_article
        end
    end

    # want to make my cli app more visually pleasant..

    def random_article
        random = NewsReader::Article.random_article
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "Random Headline Generator"
        puts "`#{random.title}`"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "Hit enter to load another headline or type menu to return to menu options:"
        input = gets.chomp
        until input.downcase === "menu"
            random_article
        end
    end

    def menu
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "Thank you for using the app. How may I help today?"
        puts "1. View Articles"
        puts "2. Random Technology-Headline Generator"
        puts "0. Exit App"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
    end

    def enter
        puts "Hit enter to return to the menu...."
        enter = gets.to_i
    end

    def goodbye
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "Thank you for using the News Reader app. Hope you enjoyed!"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
    end

end