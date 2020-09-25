class TopicsController < ApplicationController
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
    @topic = Topic.find(params[:id])
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
      if @topic.update(topic_params)
        redirect_to root_url
      else
        render 'edit'
      end
  end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def upvote
    @topic = Topic.find(params[:id])
    @topic.votes.create
    redirect_to root_url
  end

  def downvote
    @topic = Topic.find(params[:id])
    if @topic.votes.count > 0
      @topic.votes.last.destroy
      redirect_to root_url
    end
  end
end
private
def topic_params
  params.require(:topic).permit(:title, :description)
end