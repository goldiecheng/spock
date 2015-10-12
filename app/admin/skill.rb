ActiveAdmin.register Skill do
  permit_params :name

  menu parent: 'Admin'

  index do
    selectable_column
    id_column

    column :name
    column :members do |skill|
      status_tag :gray, label: skill.members.count
    end

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

  sidebar 'Members', only: :show do
    table_for skill.members do
      column :name do |member|
        link_to(member.name, member_path(member))
      end
    end
  end
end
