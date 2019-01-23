class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    # ログイン後に遷移するページ
    def after_sign_in_path_for(resource)
        posts_path
    end
    # サインアウト後のリダイレクト先をトップページへ
    def after_sign_out_path_for(resource)
        flash[:alert] = "ログアウトしました"
        root_path
    end
    
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :username])
    end
end
