class TagsController < ApplicationController
	before_action :require_login

	def new
	  @tag = Tag.new
	  @media_id = params[:media_id]
	  @media_type = params[:media_type]
	end

	def create	
	  @tag = current_user.active_tags.create(tag_params)
	end

	private

	def tag_params
      params.require(:tag).permit(:tagged_id, :taggable_type, :taggable_id, :viewed)
	end
end
