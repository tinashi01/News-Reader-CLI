class NewsReader::CLI
    def welcome
        puts 'Welcome to the Australian Technology News Reader'.colorize(:cyan)
        puts "             __________
            |TECH  NEWS|
            |&&& ======|
            |=== ======|
            |=== == %%$|
            |[_] ======|
            |=== ===!##|
            |__________|"
        
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
                puts "No such option, please try again.".colorize(:red)
            end
        end
    end

    # format so we can loop through continuously and the input also loops


    def article_list
        puts 'Here is a list of articles to select from:'.colorize(:cyan)
        puts "----------------------------------------------------------------------------------------------------------------------------------------".colorize(:light_blue)
        articles = NewsReader::API.articles.uniq
        articles.each.with_index(1) do |item, index|
            if index < 11
                puts "#{index}. #{item}"
            end
        end
        puts "----------------------------------------------------------------------------------------------------------------------------------------".colorize(:light_blue)
        puts "Please type the number of the article that most interests you:".colorize(:cyan)
    end

    def read_article
        input = gets.to_i
        article = NewsReader::Article.find_article(input)

        if input > 0 && input < 11
            puts "Here is your selected article:".colorize(:cyan)
            puts "----------------------------------------------------------------------------------------------------------------------------------------".colorize(:light_blue)
            
            puts "#{article.title}".colorize(:magenta)

            if article.author === "null"
                puts "Written by #{article.author}".colorize(:light_blue)
            else
                puts "No author information".colorize(:red)
            end

            puts "#{article.description}".colorize(:light_blue)
            puts "Continue reading at #{article.url}" .colorize(:light_blue)
            puts "----------------------------------------------------------------------------------------------------------------------------------------".colorize(:light_blue)
        else
            puts "Sorry, no such article. Please enter a valid number:".colorize(:red)
            read_article
        end
    end

    # want to make my cli app more visually pleasant..

    def random_article
        random = NewsReader::Article.random_article
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------".colorize(:light_blue)
        puts "Headline".colorize(:cyan)
        puts "#{random.title}".colorize(:magenta)
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------".colorize(:light_blue)
        puts "Hit enter to load another headline or type menu to return to menu options:".colorize(:cyan)
        input = gets.chomp
        if input.downcase != "menu"
            random_article
        end
    end

    def menu
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------".colorize(:light_blue)
        puts "Here are our menu options. How may I help today?".colorize(:cyan)
        puts "1. View Articles"
        puts "2. Random Headline Generator"
        puts "0. Exit App"
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------".colorize(:light_blue)
    end

    def enter
        puts "Hit enter to return to the menu....".colorize(:cyan)
        enter = gets.to_i
    end

    def goodbye
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------".colorize(:light_blue)
        puts "Thank you for using the News Reader app. Hope you enjoyed!".colorize(:cyan)
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------".colorize(:light_blue)
    end

end