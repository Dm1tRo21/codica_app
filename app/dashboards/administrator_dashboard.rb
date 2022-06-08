require "administrate/base_dashboard"

class AdministratorDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    phone: Field::String,
    encrypted_password: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    gender: Field::Select.with_options(
      collection: ['male', 'feminine'],
      include_blank: true
    ),
    birthday: Field::Date,
    email: Field::Email,
    address: Field::String,
    description: Field::Text,
    user_role: Field::Select.with_options(
      collection: ['user', 'doctor', 'admin'],
    ),
    department: Field::BelongsTo,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    password: Field::Password,
    password_confirmation: Field::Password,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    first_name
    last_name
    user_role
    phone
    email
    address
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    phone
    first_name
    last_name
    gender
    birthday
    email
    address
    description
    user_role
    department
    reset_password_token
    reset_password_sent_at
    remember_created_at
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    phone
    first_name
    last_name
    gender
    birthday
    email
    address
    description
    user_role
    department
    password
    password_confirmation
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User #{user.first_name} #{user.last_name}"
  # end
end
