ActiveAdmin.register Skill do
  permit_params :name

  menu parent: 'Admin'

  index do
    selectable_column
    id_column

    column :name

    actions
  end

  filter :name

  form do |f|
    f.inputs 'Skill Details' do
      f.input :name
    end

    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :created_at
    end
  end
end
