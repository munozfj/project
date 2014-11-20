# Project  

Autor:        Fernando J. Muñoz  
Descripción:  Establecer un estándar en el desarrollo de Ruby on Rails   
Fecha inicio: 5/11/2014  

##Fecha: 5/11/2014
###Objetivos:  
1. Crea aplicación 
2. Subirla a GitHub
3. Subirla a Heroku

###Pasos:
- Crear aplicación con:  
```sh
rails _4.2.0.beta4_ new project      
```   
- cd project  
- mv README.rdoc README.md  
- Modificar el archivo Gemfile   
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

gem 'sdoc', '~> 0.4.1', group: :doc
```   
- Instalar gemas:  
```sh
bundle install --without production    
```   
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

##Fecha: 5/11/2014
###Objetivos:  
1. Crear páginas estáticas
2. Establecer Root
3. Crear rutas con nombre

###Pasos:  
- Creo una nueva rama de desarrollo   
```sh
git co -b pag-estaticas    
``` 
- Crear las paginas estaticas 
```sh
rails g controller Static home contact about help forum     
```    
- Modificar el archivo /config/routes.rb para que tenga pagina root  
```sh
root 'static#home'    
```    
- Crear nombres para las paginas estaticas     
```sh
get 'contact', to: 'static#contact', as: 'contact'
get 'about', to: 'static#about', as: 'about'
get 'help', to: 'static#help', as: 'help'
get 'forum', to: 'static#forum', as: 'form'
```    
- Reiniciar el servidor web para que tome los cambios realizados  
- Registrar en routes.rb las nuevas rutas  
```sh
annotate --routes
```    
- Para ver los nombres de las rutas hacer  
```sh
rake routes
```    
- Modificar levemente las vistas de las paginas estáticas   
- Confirmar cambios en la rama  
```sh
git branch
git status
git add -A
git commit -m "Paginas estaticas"
```    
- Coloco los cambios de la rama en MASTER
```sh
git co master
git branch
git merge <nombre rama aux>
```    
- Subir los cambios a GitHub  
```sh
git push
```     
- Subir los cambios a Heroku  
```sh
git push heroku
heroku open  
```    
- La rama auxiliar se podria eliminar
```sh
git branch
git -d <nombre rama aux>
```    

##Fecha: 6/11/2014
###Objetivos:  
1. Crear un título para las paginas de la aplicación

###Pasos:  
- Creo una nueva rama de desarrollo   
```sh
git co -b titulo  
``` 
- Crear un helper /helpers/application_helper.rb que armará el titulo para todas las paginas
```sh
def full_title(page_title=nil)
    base_title = "My Project"
    if page_title
      content_for(:title) { "#{page_title} | #{base_title}" }
    else
      content_for?(:title) ? content_for(:title) : base_title
    end
end  
```    
- Modificar el layout de la aplicación para que utilice dicho helper  
```sh
<title><%= full_title %></title>   
```    
- Modificar todas las vistas que sean necesarias para que muestren su titulo 
```sh
<% full_title 'About Us' %>    
```    
- Confirmar cambios en la rama  
```sh
git branch
git status
git add -A
git commit -m "Titulo general"
```    
- Coloco los cambios de la rama en MASTER
```sh
git co master
git branch
git merge <nombre rama aux>
```    
- Subir los cambios a GitHub  
```sh
git push
```     
- Subir los cambios a Heroku  
```sh
RAILS_ENV=production rake assets:precompile 
git push heroku
heroku open  
```    
- La rama auxiliar se podria eliminar
```sh
git branch
git -d <nombre rama aux>
```    
##Fecha: 6/11/2014
###Objetivos:  
1. Modificar el layout de la aplicacion con rails_layout
2. Utilizar Bootstrap

###Pasos:  
- Creo una nueva rama de desarrollo   
```sh
git co -b layout  
``` 
- Para modificar el layout de la aplicación para que use Bootstrap3   
```sh
rails generate layout:install bootstrap3 --force 
``` 
- Como se va a utilizar autenticacion por devise, genero el navigation para eso  
```sh
rails generate layout:navigation --force 
``` 
- Modificar el archivo _navigation_links.html.erb   
```sh
<%# add navigation links to this file %>
<li><%= link_to 'Home', root_path %></li>
<li><%= link_to 'About', about_path %></li>
<li><%= link_to 'Contact', contact_path %></li>
<li><%= link_to 'Forum', forum_path %></li>
``` 
- Crear /views/layouts el partial footer  
```sh
<!-- Footer -->
<hr>
<footer>
<small>FM &copy; Company <%= Time.now.year %></small>
</footer>
``` 
- Crear /views/layouts el partial _favicon.html.erb  
```sh
<!-- https://www.iconfinder.com -->
<!-- https://www.iconfinder.com/icons/85827/scale_weight_icon#size=30 -->
<!-- Favicon tradicional -->
<%= favicon_link_tag 'app.png', rel: 'shortcut icon' , type: 'image/png'%>
<!-- Favincon para Appel y Android -->
<%= favicon_link_tag 'app-60.png', rel: 'apple-touch-icon', type: 'image/png' , size:'60x60' %>
<%= favicon_link_tag 'app-72.png', rel: 'apple-touch-icon', type: 'image/png' , size:'72x72' %>
<%= favicon_link_tag 'app-120.png', rel: 'apple-touch-icon', type: 'image/png' , size:'120x120' %>
<%= favicon_link_tag 'app-152.png', rel: 'apple-touch-icon', type: 'image/png' , size:'152x152' %>
<%= favicon_link_tag 'app.png', rel: 'apple-touch-icon-precomposed', type: 'image/png' %>
``` 
- Crear /views/layouts el partial _metas.html.erb  
```sh
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="RoR Project">
<meta name="author" content="Fernando J. Muñoz">
``` 
- Crear /views/layouts el partial _shim.html.erb  
```sh
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
``` 
- Colocar los iconos de la aplicación en /assets/images  
- Modificar el layo de la aplicación para que contenga los partials anteiores
```sh
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <%= render 'layouts/metas' %>
    <%= render 'layouts/favicon' %>

    <title><%= full_title %></title>
  
    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track' => true %>
    <%= csrf_meta_tags %>

    <%= render 'layouts/shim' %>
  </head>
  <body>
    <header>
      <%= render 'layouts/navigation' %>
    </header>
    <main class="container theme-showcase" role="main">
      <div class="jumbotron">
        <%= render 'layouts/messages' %>
        <%= yield %>
      </div>
    </main>
    <%= render 'layouts/footer' %>
    <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
  </body>
</html>
``` 
- En caso de desearse un tema de Bootwatch, crear en /assets/stylesheets el archivo bootwatch.css.scss con toda la configuracion del tema elegido  
- Para los estilos propios de la aplicacion, crear en /assets/stylesheets el archivo custom.css.scss 

- Confirmar cambios en la rama  
```sh
git branch
git status
git add -A
git commit -m "Layout"
```    
- Coloco los cambios de la rama en MASTER
```sh
git co master
git branch
git merge <nombre rama aux>
```    
- Subir los cambios a GitHub  
```sh
git push
```     
- Subir los cambios a Heroku  
```sh
RAILS_ENV=production rake assets:precompile 
git push heroku
heroku open  
```    
- La rama auxiliar se podria eliminar
```sh
git branch
git -d <nombre rama aux>
```    

##Fecha: 19/11/2014
###Objetivos:  
1. Implementar Devise para la autenticación

###Pasos:  
- Creo una nueva rama de desarrollo   
```sh
git co -b devise  
``` 
- En el archivo Gemfile agrego la gema de deivse  
```sh
#Autenticacion
gem 'devise', '~> 3.4.1'
``` 
- Instalar la gema con   
```sh
bundle install
``` 
- Para instalar Devise ejecutar lo siguiente  
```sh
rails g devise:install
rails g devise User
rake db:migrate
annotate --routes
``` 
- rails s  
- Verificar las condiciones necesarias para Devise  
```sh
* En el archivo /environments/development.rb debe existir la linea para el mail
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
* Tiene que estar definida una pagina root
* El layout debe mostrar los mensajes flash
``` 
- Agregar en el layout los links a las pantallas creadas por Devise 
```sh
<ul class="nav navbar-nav navbar-right">
  <% if user_signed_in? %>
    <li><%= link_to current_user.email , edit_user_registration_path %></li>
    <li><%= link_to 'Sign out', destroy_user_session_path, :method=>'delete' %></li>
  <% else %>
    <li><%= link_to 'Sign in', new_user_session_path %></li>
    <li><%= link_to 'Sign up', new_user_registration_path %></li>
  <% end %>

</ul>
``` 
- En la pagina home agregar el boton para ingresar a la aplicación 
```sh
<%= link_to "Sign up &raquo;".html_safe, new_user_session_path, class: "btn btn-primary btn-lg"  %>
``` 
- Modificar también en el archivo initializers/devise.rb  
```sh
config.mailer_sender = 'no-replay@rails-project.com'
``` 
- Modificar las vistas de Devise haciendo  
```sh
rails g devise:views
rails generate layout:devise bootstrap3
``` 
- Modificar las vistas para que todas tengan el look and feel correspondiente y el título de la páginas  
- Para restringir el acceso a las distintas paginas usar en los controladores  
```sh
before_filter :authenticate_user!, except: [:metodo1, :metodo2]
o
before_filter :authenticate_user!, only: [:metodo1, :metodo2]
``` 
- Confirmar cambios en la rama  
```sh
git branch
git status
git add -A
git commit -m "Devise"
```    
- Coloco los cambios de la rama en MASTER
```sh
git co master
git branch
git merge <nombre rama aux>
```    
- Subir los cambios a GitHub  
```sh
git push
```     
- Subir los cambios a Heroku  
```sh
RAILS_ENV=production rake assets:precompile 
git push heroku
heroku run rake db:migrate
heroku open  
```    
- La rama auxiliar se podria eliminar
```sh
git branch
git -d <nombre rama aux>
```    

##Fecha: 19/11/2014
###Objetivos:  
1. Implementar password strength
2. Implementar Google Recaptcha
###Fuentes:
1. https://github.com/plataformatec/devise/wiki/How-To:-Use-Recaptcha-with-Devise
2. http://www.tweetegy.com/2012/10/setting-up-a-captcha-with-recaptcha-service-and-the-captcha-gem/
3. https://developers.google.com/recaptcha/docs/customization
4. http://www.sitepoint.com/5-bootstrap-password-strength-metercomplexity-demos/

###Pasos:  
- Creo una nueva rama de desarrollo   
```sh
git co -b strength   
``` 
- Agregar en el archivo Gemfile la gema   
```sh
gem "recaptcha", :require => "recaptcha/rails" 
``` 
- Configur Google Recaptcha para el ambiente y la aplicacion en
```sh
https://www.google.com/recaptcha/intro/index.html
``` 
- Se obtendra dos variables RECAPTCHA_PUBLIC_KEY y RECAPTCHA_PRIVATE_KEY  
- Colocar ambas en el archivo /config/secrets  para todos los ambientes   
- En la vista que se quiere tener el captcha colocar  
```sh
<%= raw recaptcha_tags %>
``` 
- Para modificar los controladores de Devise hacer
```sh
rails g devise:controllers users
``` 
- Modificar el controlador registrations correspondientes para que tenga encuenta la validez del captcha a la hora de insertar el nuevo dato en la base de datos    
```sh
if verify_recaptcha
  super
else
  build_resource(sign_up_params)
  clean_up_passwords(resource)
  flash.now[:alert] = "There was an error with the recaptcha code below. Please re-enter the code."      
  flash.delete :recaptcha_error
  render :new
end
``` 
- Modificar routes.rb para que tome el controlador modificado  
```sh
devise_for :users, controllers: { registrations: "users/registrations" }
``` 
- Para modificar el theme del captcha en la vista de la pantalla modificada agregar  
```sh
<% content_for :head_recaptcha do %>
  <script>
    var RecaptchaOptions = {
      theme : 'clean'
    };
  </script>
<% end %>
``` 
- Para que dicho javascript aparezca con esta pantalla agregar en el layout de la aplicacion   
```sh
<%= yield :head_recaptcha %>
``` 
- Para la validacion de la password agregar debajo del campo password 
```sh
<div id="passstrength"></div>
``` 
- Tambien agregar el siguiente javascript  
```sh
<% content_for :foot_pass_strength do %>
  <script >
$('#user_password').keyup(function(e) {
     var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
     var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
     var enoughRegex = new RegExp("(?=.{6,}).*", "g");
     if (false == enoughRegex.test($(this).val())) {
             $('#passstrength').html('More Characters');
             $('#passstrength').css('color', 'red');
     } else if (strongRegex.test($(this).val())) {
             $('#passstrength').className = 'ok';
             $('#passstrength').html('Strong!');
             $('#passstrength').css('color', 'green');
     } else if (mediumRegex.test($(this).val())) {
             $('#passstrength').className = 'alert';
             $('#passstrength').html('Medium!');
             $('#passstrength').css('color', 'blue');
     } else {
             $('#passstrength').className = 'error';
             $('#passstrength').html('Weak!');
             $('#passstrength').css('color', 'orange');
     }
     return true;
});

 </script>
<% end %>
``` 
- Para que dicho javascript aparezca con esta pantalla agregar en el layout de la aplicacion   
```sh
<%= yield :foot_pass_strength %>
``` 
- Dar formato al texto  
```sh
#passstrength 
{
  font-weight:bold;
}
``` 
- Confirmar cambios en la rama  
```sh
RAILS_ENV=production rake assets:precompile 
git branch
git status
git add -A
git commit -m "Strength"
```    
- Coloco los cambios de la rama en MASTER
```sh
git co master
git branch
git merge <nombre rama aux>
```    
- Subir los cambios a GitHub  
```sh
git push
```     
- Subir los cambios a Heroku  
```sh
git push heroku
heroku run rake db:migrate
heroku config:set RECAPTCHA_PUBLIC_KEY="xxx"
heroku config:set RECAPTCHA_PRIVATE_KEY="xxx"
heroku open  
```    
- La rama auxiliar se podria eliminar
```sh
git branch
git -d <nombre rama aux>
```    
