class CandidatesController < ApplicationController
  before_action :find_candidate, only: [:edit, :update, :destroy, :vote]
  before_action :authenticate_user!, only: [:edit, :update, :new, :destroy ,:vote]

  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new

  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      # 成功
      redirect_to candidates_path, notice: "新增候選人成功!"
    else
      # 失敗
      render :new
    end
  end

  def edit

  end

  def update
    if @candidate.update(candidate_params)
      # 成功
      redirect_to candidates_path, notice: "資料更新成功!"
    else
      # 失敗
      render :edit
    end
  end

  def destroy
    @candidate.destroy if @candidate
    redirect_to candidates_path, notice: "候選人資料已刪除!"
  end

  def vote
    vote = VoteLog.find_by user_id: current_user
    if vote.nil?
      @candidate.vote_logs.create(user: current_user) if @candidate
      redirect_to candidates_path, notice: "完成投票!"
    else
      redirect_to candidates_path, alert: "您已經投過票了!"
    end
    
  end

  private
    def candidate_params
      params.require(:candidate).permit(:department, :grade, :name, :sex, :position, :reason, :politics)
    end

    def find_candidate
        @candidate = Candidate.find_by(id: params[:id])
    end
end
