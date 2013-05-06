class ProfilesController < ApplicationController
  before_filter :authorize_user, only: [:confirm, :invite]
  before_filter :first_profile, only: [:create, :new]
  before_filter :authorize_candidate, only: [:create, :new]
  before_filter :correct_candidate, only: [:edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    
    if session[:query_id]
      @query = Query.find(session[:query_id])
    else
      @query = Query.create!
      session[:query_id] = @query.id
  
    end


    @profiles = Profile.all.select {|i| i.candidate }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(params[:profile])
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
        current_candidate.profile_id = @profile.id #unless current_candidate.profile
        current_candidate.save!
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end

    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end

  def confirm
    @profile = Profile.find(params[:id])
        respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
  end

  def invite
    @profile = Profile.find(params[:id])
    invitation = Invitation.new
      invitation.user_id = current_user.id
      invitation.candidate_id = @profile.candidate.id
    invitation.save
    redirect_to @profile, :notice => "Candidate has been invited."
  end

  end

end
