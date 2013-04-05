Gem::Specification.new do |s|
   
   s.name = 'widgetify'
   s.version = '0.0.1'
   s.date = '2012-07-30'
   s.summary = 'open graph and oembed data parsing '
   s.add_runtime_dependency "nokogiri",["= 1.5.4"]
   s.add_runtime_dependency "embedly", ["~> 1.5"]
   s.add_runtime_dependency "koala", ["~> 1.6"]
   s.add_runtime_dependency "activesupport", ["~> 3.2"]
   s.add_runtime_dependency "rack", ["~> 1.4"]
   s.description = 'a gem by which the video and the image attributes from the open graph can be parsed'
   s.authors = ['santanu bhattacharya']
   s.email = 'sbhattacharya@kreeti.com'
   s.files = `git ls-files`.split("\n")
   s.homepage = 'https://github.com/funnyfarmsf/widgetify'
   s.license = 'MIT'

end