# Project  

Autor:        Fernando J. Muñoz  
Descripción:  Establecer un estándar en el desarrollo de Ruby on Rails
Fecha inicio: 5/11/2014  

##Fecha:        5/11/2014
###Objetivos:  
1. Crea aplicación 
2. Subirla a GitHub
3. Subirla a Heroku

###Pasos:

- rails _ 4.2.0.beta4 _ new project  
- cd project  
- mv README.rdoc README.md  
- modificar Gemfile
```sh
source 'https://rubygems.org'


ruby '2.1.2'

gem 'rails', '4.2.0.beta4'
gem 'sass-rails', '~> 5.0.0.beta1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails', '~> 4.0.0.beta2'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

gem 'rails-html-sanitizer', '~> 1.0.1'
gem 'bootstrap-sass', '~> 3.3.0.1'
gem 'will_paginate', '~> 3.0.7'
gem 'will_paginate-bootstrap', '~> 1.0.1'

group :development do
  gem 'annotate', '~> 2.6.5'
  gem 'better_errors', '~> 2.0.0'
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'quiet_assets', '~> 1.0.3'
  gem 'rails_layout', '~> 1.0.23'
end

group :development, :test do
  gem 'sqlite3', '~> 1.3.10'
  gem 'byebug', '~> 3.5.1'
  gem 'web-console', '~> 2.0.0.beta4'
  gem 'spring', '~> 1.1.3'
end

group :production do
  gem 'pg', '~> 0.17.1'
  gem 'rails_12factor', '~> 0.0.3'
end

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.1', group: :doc

``` 

- bundle install --without production

- Instalar annotate con:

```sh
rails g annotate:install
```

- Para guardar también las rutas hacer

```sh
annotate --routes
```

- Ir a GitHub y crear ahi un repositorio con el mismo nombre de la aplicación

- Comenzamos a registrar los cambios con GIT

```sh
git init
git add -A
git commit -m "Commit inicial"
```

- Subimos las modificaciones a GitHub

```sh
git remote add origin git@github.com:munozfj/project.git
git push -u origin master
```

- Publicar en Heroku

```sh
RAILS_ENV=production rake assets:precompile
heroku create
git push heroku master
heroku config:set SECRET_KEY_BASE=`ruby -rsecurerandom -e "puts SecureRandom.hex(64)"`
heroku apps:rename project
heroku logs
heroku open
```

