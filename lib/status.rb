require 'net/http'
require 'json'

class Status

	def self.isitdown(url) # e.g. google.com
		uri = URI('http://downforeveryoneorjustme.com/' + url)
		output = Net::HTTP.get(uri)
		if output =~ /It's just you/
			return "#{url} is up"
		else
			return "#{url} is down"
		end
	end

	def self.findurl(word)
		uri = URI('http://api.duckduckgo.com/?q=!' + word + '&format=json&t=downforeveryone-bot')
		output = Net::HTTP.get(uri)
		hash = JSON.parse(output)
		if hash['Redirect']
			return /https?:\/\/([\w{2,}\.]+)/.match(hash['Redirect'])[1]
		else

	end

end

#puts Status.isitdown('google.com')
#puts Status.isitdown('facebook.com')
#puts Status.isitdown('technorati.com')

geturl = Status.findurl('facebook')
puts Status.isitdown(geturl)
