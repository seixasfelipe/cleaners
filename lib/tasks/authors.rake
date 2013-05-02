namespace :admin do
  desc "Creating or updating author files"
  task :authors do
    sorted_authors = `git log --pretty=format:'%an'| env LC_ALL=C sort| env LC_ALL=C uniq | env LC_ALL=C sort -u`
    file = File.open('AUTHORS', 'w'){ |file|
      file.write(sorted_authors)
    }
  end
end