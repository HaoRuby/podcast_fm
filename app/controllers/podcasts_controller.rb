class PodcastsController < ApplicationController
	before_action :find_podcast, only: [:show, :dashboard]
	before_action :find_episode, only: [:show, :dashboard]

	def index
		@podcasts = Podcast.all.order("created_at DESC").paginate( page: params[:page], per_page: 1)
	end

	def show
		@episodes.paginate( page: params[:page], per_page: 1)
	end

	def dashboard
	end

	private
		def find_podcast
			if params[:id].nil?
				@podcast = current_podcast
			else
				@podcast = Podcast.find(params[:id])
			end
		end

		def find_episode
			@episodes = Episode.where(podcast_id: @podcast.id).order("created_at DESC").paginate( page: params[:page], per_page: 1)
		end
end
