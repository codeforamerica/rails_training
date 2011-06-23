class TweetersController < ApplicationController
  # GET /tweeters
  # GET /tweeters.xml
  def index
    
    @tweeters = Tweeter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tweeters }
    end
  end

  # GET /tweeters/1
  # GET /tweeters/1.xml
  def show
    @tweeter = Tweeter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tweeter }
    end
  end

  # GET /tweeters/new
  # GET /tweeters/new.xml
  def new
    @tweeter = Tweeter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tweeter }
    end
  end

  # GET /tweeters/1/edit
  def edit
    @tweeter = Tweeter.find(params[:id])
  end

  # POST /tweeters
  # POST /tweeters.xml
  def create
    @tweeter = Tweeter.new(params[:tweeter])

    respond_to do |format|
      if @tweeter.save
        format.html { redirect_to(@tweeter, :notice => 'Tweeter was successfully created.') }
        format.xml  { render :xml => @tweeter, :status => :created, :location => @tweeter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tweeter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tweeters/1
  # PUT /tweeters/1.xml
  def update
    @tweeter = Tweeter.find(params[:id])

    respond_to do |format|
      if @tweeter.update_attributes(params[:tweeter])
        format.html { redirect_to(@tweeter, :notice => 'Tweeter was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tweeter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tweeters/1
  # DELETE /tweeters/1.xml
  def destroy
    @tweeter = Tweeter.find(params[:id])
    @tweeter.destroy

    respond_to do |format|
      format.html { redirect_to(tweeters_url) }
      format.xml  { head :ok }
    end
  end
end
