class BloggersController < ApplicationController
  def index
    @bloggers = Blogger.all
  end

  def show
    @blogger = Blogger.find(params[:id])
  end

  def new
    @blogger = Blogger.new
  end

  def edit
  end

  def create
    @blogger = Blogger.new(blogger_params)

    if @blogger.valid?
      @blogger.save
      flash[:notice] = 'New blogger created.'
      redirect_to blogger_path(@blogger)
    else
      @erros = @blogger.errors.full_messages

      flash[:errors] = @blogger.errors.full_messages
      render 'new'
    end 
  end

  def update
  end

  def destroy
  end

  private 
    def blogger_params
      params.require(:blogger).permit(:name, :age, :bio)
    end 
end
