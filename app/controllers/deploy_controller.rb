class DeployController < ApplicationController
	# create a new deploy
	def deploy
		puts params
		
		 if  Repo.where(remote_path: repo_params[:remote_path]).count < 0
			repo = Repo.create(repo_params)
			repo.run
			puts repo.remote_path
		else
			repo = Repo.where(remote_path: repo_params[:remote_path]).first
			repo.pull_changes
			repo.run
		end
		render json: {message: 'hello'}
  end

	private

	def repo_params
		params.require(:repo_info).permit(:name, :remote_path, :buildpack)
	end
end
