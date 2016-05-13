require 'net/http'
require 'nokogiri'


class Page

  def initialize(url)
    @url = url
    uri = URI(url)
    res = Net::HTTP.get(uri)
    @pagina = Nokogiri::HTML(res)
  end

  def fetch
    puts "<url #{@url}"
    sleep 1 
    print "Fetching"  
    sleep 1  
    print "."
    sleep 1
    print "."
    sleep 1
    print "."
    sleep 1
    puts
  end

  def title
    titulo = @pagina.search("head > title").inner_text
    puts "Titulo: #{titulo} "
  end

  def links

    links = []

    l = @pagina.css('ul.nav.navbar-nav a').map { |link| links << link['href'] }
    links
    #[0]['href']
    puts "Links:"
    for i in 3..7
      puts menu_link = @pagina.search(".nav.navbar-nav > li:nth-child(#{i})").inner_text + " " + links[i -1]
    end
    puts "url>"
  end

  def see_page
    fetch
    title
    links
  end

end # Final de clase Page

# pagina = Page.new('http://www.codea.mx/')


class Browser

  def initialize
    puts "Ingresa la url a la que quieres acceder"
    url = gets.chomp
    @url = url
  end

  def run
    Page.new(@url).see_page
  end

end

Browser.new.run



