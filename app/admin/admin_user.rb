ActiveAdmin.register AdminUser, as: 'User' do
  permit_params :email, :password, :password_confirmation

  menu parent: 'Admin'

  member_action :unlock, method: :post do
    user = AdminUser.find(params[:id])
    user.unlock_access!
    redirect_to user_path(params[:id]), notice: 'User unlocked!'
  end

  index do
    selectable_column
    id_column

    column :email
    column :last_sign_in_at
    column :sign_in_count
    column :locked do |user|
      if user.locked_at
        status_tag :red, label: 'YES'
      else
        status_tag :green, label: 'NO'
      end
    end

    actions
  end

  filter :email

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end

    f.actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :sign_in_count
      row :current_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_at
      row :last_sign_in_ip
      row :created_at
    end
  end

  sidebar 'Security', only: :show do
    attributes_table_for user do
      locked = user.locked_at?
      row :locked do
        if locked
          status_tag :red, label: 'YES'
        else
          status_tag :green, label: 'NO'
        end
      end

      row :failed_attempts if locked
      row :locked_at if locked
      if locked
        row :unlock do
          link_to('Unlock', unlock_user_path(user), method: :post) unless user == current_admin_user
        end
      end
    end
  end
end
