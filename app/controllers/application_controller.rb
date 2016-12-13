class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Authenticable
  def api
    str = File.open("#{Rails.root}/app/controllers/api/api_document.md").read
    str = BlueCloth.new(str).to_html
    html = to_html str, t(".title")
    render text: html.html_safe
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {
      |u| u.permit(:name, :email, :full_name, :phone_number, :password) }
    devise_parameter_sanitizer.permit(:account_update) {
      |u| u.permit(:name, :email, :full_name, :phone_number, :password, :current_password, :avatar) }
  end

  private
  def to_html str, title
    <<-HTML
      <html lang="en">
        <head>
          <title>#{title}</title>
          <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
            crossorigin="anonymous">
        </head>
        <body>
          <div class="container">
            #{str}
          </div>
        </body>
      </html>
    HTML
  end
end
