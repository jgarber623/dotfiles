namespace :ruby do
  desc 'Install latest Ruby and set global default'
  task :install do
    prompt 'Are you sure you want to install Ruby 2.4.2? [Yn]'

    case $stdin.gets.chomp
    when 'Y'
      prompt 'Installing Ruby 2.4.2...'

      sh 'rbenv install 2.4.2'
      sh 'rbenv global 2.4.2'
    else
      prompt 'Skipping Ruby 2.4.2 installation...', 37
    end
  end

  desc 'Install common Ruby gems'
  task :install_gems do
    prompt 'Are you sure you want to install Ruby gems? [Yn]'

    case $stdin.gets.chomp
    when 'Y'
      prompt 'Installing Ruby gems...'

      sh 'gem update --system'
      sh 'gem install bundler travis'
    else
      prompt 'Skipping Ruby gem installation...', 37
    end
  end
end

task ruby: 'ruby:install'
