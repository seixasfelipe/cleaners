require 'rspec/core/rake_task'

namespace :spec do
  RSpec::Core::RakeTask.new :all do |spec|
    spec.pattern = FileList['spec/**/*_spec.rb']
    spec.rspec_opts = ['--tty', '--color', '--format documentation']
  end

  RSpec::Core::RakeTask.new :features do |spec|
    spec.pattern = FileList['spec/features/*_spec.rb']
    spec.rspec_opts = ['--tty', '--color', '--format documentation']
  end

  RSpec::Core::RakeTask.new :models do |spec|
    spec.pattern = FileList['spec/models/*_spec.rb']
    spec.rspec_opts = ['--tty', '--color', '--format documentation']
  end
end

task :default => 'spec:all'