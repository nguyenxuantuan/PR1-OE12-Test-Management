class ExamController < ApplicationController
  before_action :define_pagetitle, only: [:filter_show, :create_show, :info_show]
  before_action :get_subject, only: [:create_show, :info_show, :filter_show]
  before_action :get_user, only: [:create_show, :info_show, :filter_show]
  skip_before_action :verify_authenticity_token, only: [:create_exam, :update_exam, :student_on_flag, :student_off_flag, :update_happening_status, :read_student]
  before_action :validate_student, only: [:filter_show]
  before_action :student_validate

  def filter_show
    if @current_user.role == "admin"
      @list_exam = Exam.all
    else
     @list_exam = @current_user.exams
    end

    if params[:in_period].present?
    end

    if params[:exam_code].present?
    end

    if params[:exam_name].present?
    end

    if params[:exam_status].present?
    end

  end

  def create_show; end

  def create_exam
    exam_obj= Exam.new name: params[:exam_name], code: params[:exam_code],
      subject_id: Subject.where(:id => params[:subject_id]).first.id, 
      period_for: params[:period_for].to_i, supervisor: params[:supervisor],
      extra_info: params[:extra_info], user_id: @current_user.id
    exam_obj.save
    redirect_to "/exam/#{exam_obj.id.to_s}/info_show"
  end

  def update_exam
    exam_obj = Exam.where(:id => params[:exam_id]).first, name: params[:exam_name]
      code: params[:exam_code], subject_id: Subject.where(:id => params[:subject_id]).first.id,
      period_for: params[:period_for].to_i, supervisor: params[:supervistor],
      extra_info: params[:extra_info]
    if exam_obj.save
      render json: {status: 200, message: "Update thành công", noti: 'success'}, status: 200
    else
      render json: {status: 400, message: 'Update thất bại', noti: 'error'}, status: 200
    end

  end

  def info_show
    @exam_obj = Exam.where(:id => params[:id]).first
    @exam_thread_detail_obj = ExamThreadDetail.where(:exam_id => params[:id]).first
  end

  def validate_student
  end

  def student_on_flag
    exam_id = params[:exam_id]
    i = 0
    exam_obj = Exam.where(:id => exam_id).first
    list_student = exam_obj.students
    list_student.each do |std|
      std.flag = true
      if std.save
        i = i + 1
      end
    end
    if i == list_student.count
      render json: {status: 200, message: "Tác vụ thành công", noti: 'success'}, status: 200
    else
      render json: {status: 400, message: 'Tác vụ thất bại', noti: 'error'}, status: 200
    end
  end

  def student_off_flag
    exam_id = params[:exam_id]
    i = 0
    exam_obj = Exam.where(:id => exam_id).first
    list_student = exam_obj.students
    list_student.each do |std|
      std.flag = false
      if std.save
        i = i + 1
      end
    end
    if i == list_student.count
      render json: {status: 200, message: "Tác vụ thành công", noti: 'success'}, status: 200
    else
      render json: {status: 400, message: 'Tác vụ thất bại', noti: 'error'}, status: 200
    end
  end

  def update_happening_status
    exam_id = params[:exam_id]
    exam_obj = Exam.where(:id => exam_id).first
    exam_obj.time_begin = Time.now
    exam_obj.status = "happening"
    exam_obj.time_finish = exam_obj.time_begin + (exam_obj.period_for)*60
    if exam_obj.save
      render json: {status: 200, message: "Tác vụ thành công", noti: 'success'}, status: 200
    else
      render json: {status: 400, message: 'Tác vụ thất bại', noti: 'error'}, status: 200
    end
    exam_service_obj = ExamService.new
    exam_service_obj.update_success_status exam_obj
  end

  def task_detail
    @student_obj = Student.where(:id => params[:id]).first
    @exam_thread_obj = @student_obj.exam_thread
    render layout: false
  end

  def read_student
    Student.import(params[:file])
    redirect_to users_path, notice: "Users imported."
  end

  def student_validate
    if @current_user.present? && @current_user.role == "student"
      redirect_to "/warning/not_found"
    end
  end
end
