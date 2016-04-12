class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.create( tool_params )
    session[:current_tool_id] = @tool.id
    session[:current_tool_count] = session[:current_tool_count].to_i + 1

    if @tool.save
      flash[:notice] = "Tool has been created successfully"
      redirect_to tool_path( @tool.id )
    else
      flash[:error] = "@tool.errors.full_messages.join(", ")"
      render :new
    end
  end

  # def edit
  #   @tool = Tool.find(4)
  # end
  #
  # def update
  #   @tool = Tool.find( params[:id] )
  #
  #   if @tool.update( tool_params )
  #     redirect_to tool_path(@tool.id)
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    tool = Tool.find( params[:id] )
    tool.destroy
    redirect_to tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity)
  end
end
