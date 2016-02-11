class PostsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]

  # GET /posts
  # GET /posts.json
  def index
  @posts = Post.all
 
  respond_to do |format|
    format.html # index.html.erb
    format.xml  { render :xml => @posts }
  end
end

  # GET /posts/1
  # GET /posts/1.json
 def show
  @post = Post.find(params[:id])
 
  respond_to do |format|
    format.html # show.html.erb
    format.xml  { render :xml => @post }
  end
end

  # GET /posts/new
  def new
  @post = Post.new
 
  respond_to do |format|
    format.html # new.html.erb
    format.xml  { render :xml => @post }
  end
end

  # GET /posts/1/edit
  def edit
  @post = Post.find(params[:id])
end

  # POST /posts
  # POST /posts.json
 def create
  @post = Post.new(params[:post])
 
  respond_to do |format|
    if @post.save
      format.html { redirect_to(@post,
                    :notice => 'Post was successfully created.') }
      format.xml  { render :xml => @post,
                    :status => :created, :location => @post }
    else
      format.html { render :action => "new" }
      format.xml  { render :xml => @post.errors,
                    :status => :unprocessable_entity }
    end
  end
end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
  @post = Post.find(params[:id])
 
  respond_to do |format|
    if @post.update_attributes(params[:post])
      format.html { redirect_to(@post,
                    :notice => 'Post was successfully updated.') }
      format.xml  { head :ok }
    else
      format.html { render :action => "edit" }
      format.xml  { render :xml => @post.errors,
                    :status => :unprocessable_entity }
    end
  end
end

  # DELETE /posts/1
  # DELETE /posts/1.json
 def destroy
  @post = Post.find(params[:id])
  @post.destroy
 
  respond_to do |format|
    format.html { redirect_to(posts_url) }
    format.xml  { head :ok }
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :title, :content)
    end
end
