ActiveAdmin.register Member do
  permit_params :name, :skill_id

  menu priority: 2

  index do
    selectable_column
    id_column

    column :name
    column :skill

    actions
  end

  filter :name
  filter :skill

  form do |f|
    f.inputs 'Skill Details' do
      f.input :name
      f.input :skill
    end

    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :skill
      row :created_at
    end
  end
end
