module BuildPacks
  def self.docker_run(repo)
	  system "docker stop $(docker ps -q --filter ancestor=#{repo.name})"
		system "docker build -t #{repo.name} #{repo.name}"
		system "docker run -p #{5000 + repo.id}:3000 #{repo.name}"
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
			system "cd #{name} && git pull origin" if !did_clone
		end

		# pull changes if there are any changes
		def pull_changes
			system "cd #{name} && git pull origin"
			ProcessHelper::get_used_ports
		end

		# run the appropriate build pack
		def run
			BuildPacks::docker_run(self)
		end
end
