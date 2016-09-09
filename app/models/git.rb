module Git
	class Repo
		attr_accessor :local_path, :remote_path, :commits

		def initialize(remote_path, name)
		  did_clone = system "git clone #{remote_path}"
			system "cd #{name} && git pull origin" if !did_clone
		end
	end
end
