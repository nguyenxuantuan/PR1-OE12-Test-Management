class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  include SessionsHelper

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    I18n.locale = I18n.available_locales.include?(locale) ?
      locale : I18n.default_locale
  end

  def define_pagetitle
    case params["action"]
    when "filter_show"
      @title_page = "Kỳ Thi"
    when "create_show"
      @title_page = "Tạo Kỳ Thi"
    when "list_subject_show"
      @title_page = "Danh Sách Môn"
    when "list_question_bank_show"
      @title_page = "Ngân Hàng Câu Hỏi"
    when "detail_question_bank"
      @title_page = "Chi Tiết Câu Hỏi"
    when "update_show"
       @title_page = "Danh Sách Giảng Viên"
    else
      @title_page = "Thông Tin Kỳ Thi"
    end
  end

  def get_user
    @list_user = User.where(:role => "user").pluck(:email, :id)
  end

  def get_subject
    @list_subject = Subject.all
  end
end
