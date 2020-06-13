class DemoController < ApplicationController

  layout "application"

  def index
    render(:template => 'demo/index')
  end

  def hello
    @array = [1,2,3,4,5]
    render('hello')
  end

  def other_hello
    redirect_to(:action => 'hello')
  end
end
