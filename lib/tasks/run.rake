namespace :run do
  desc "Criar tabela de cores e tamanhos"
  task setup: :environment do
    puts %x{docker-compose run web bundle exec rake db:create RAILS_ENV=production}
    puts %x{docker-compose run web bundle exec rake db:migrate RAILS_ENV=production}
    puts "Enjoy"
  end

end
