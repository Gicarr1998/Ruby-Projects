class TopicsController < ApplicationController

  before_action :set_topic, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
      if @topic.update(topic_params)
        redirect_to root_url
      else
        render 'edit'
      end
  end

  def destroy
    if @topic.destroy
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def upvote
    @topic.votes.create
    redirect_to root_url
  end

  def downvote
    if @topic.votes.count > 0
      @topic.votes.last.destroy
      redirect_to root_url
    end
  end

private
  def topic_params
    params.require(:topic).permit(:title, :description)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
