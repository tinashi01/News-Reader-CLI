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
        # puts articles[1]
        articles.each.with_index(1) do |item, index|
            if index < 7
                puts "#{index}. #{item}"
            end
        end
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "Please type the number of the article that most interests you:"
    end

    def read_article
        input = gets.to_i
        article = NewsReader::Article.find_article(input)

        

        if input > 0 && input < 7
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
            puts "Sorry, no such article."
        end
    end



    # adding timing on the prompt so user has time to read?

    def menu
        # menu options
        puts "----------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "Thank you for using the app. How may I help today?"
        puts "1. View articles"
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