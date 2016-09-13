module BuildPacks
  def self.docker_run(repo)
		puts 'running docker'
	  system "docker stop $(docker ps -q --filter ancestor=#{repo.name})"
		system "pwd"
		system "cd projects/#{repo.name} &&  docker build -t  #{repo.name} ."
		system " docker run -p #{5000 + repo.id}:3000 #{repo.name} &"
		puts "#{repo.name} running on port #{5000 + repo.id}"
	end
	def self.docker_compose_run(repo)
		puts 'running docker-compose build'
		system "cd projects/#{repo.name} && docker-compose build"
		puts 'running docker-compose up'
		system "docker-compose up"
	end
end

module ProcessHelper
	def self.get_used_ports 
		system "./scripts/get_ports.sh"
	end
end

# 
class Repo < ApplicationRecord
		before_save :clone

		# clone the repo or pull changes if it didnt clone
		def clone
		  did_clone = system "git clone #{remote_path} projects/#{name}"
			system "cd projects/#{name} && git pull origin" if !did_clone
		end

		# pull changes if there are any changes
		def pull_changes
			system "cd projects/#{name} && git pull origin"
			ProcessHelper::get_used_ports
		end

		# run the appropriate build pack
		def run
			if self.buildpack == 'dockerfile'
				BuildPacks::docker_run(self)
			elsif self.buildpack == 'docker-compose'
				BuildPacks::docker_compose_run(self)
			end
		end
end
