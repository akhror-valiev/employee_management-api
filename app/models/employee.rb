# frozen_string_literal: true

class Employee < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :contact_number, presence: true, length: { maximum: 20 }
  validates :address, presence: true, length: { maximum: 255 }
end
