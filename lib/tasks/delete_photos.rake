namespace :photos do
  desc "Delete all photos"
  task delete_all: :environment do
    Photo.find_each do |photo|
      photo.image.purge
      photo.destroy
    end
    puts "All photos have been deleted."
  end
end
