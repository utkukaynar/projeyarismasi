require 'i18n'
I18n.default_locale = :tr

RailsAdmin.config do |config|

  ### Popular gems integration

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with do
    redirect_to main_app.root_path, flash: { error: "Sadece yöneticiler bu bölgeye erişebilir" } unless current_user.admin?
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'User' do
    list do
      field :email
    end
    edit do
      field :email
      field :password
      field :role
      field :name
      field :university
      field :department
      field :mobile_phone
    end
  end
end
