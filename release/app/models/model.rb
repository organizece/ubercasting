class Model < ActiveRecord::Base
  attr_accessible :name, :birthday, :age, :sex, :ethnicity, :biotype, :responsible, :responsible_cpf, :responsible_rg,
    :height, :eyes_color, :hair_color, :bust, :waist, :hip, :shoes, :sector, :job, :rg, :cpf, :cel_phone, :home_phone,
    :job_phone, :address, :address_number, :neighborhood, :complement, :cep, :city, :state, :country, :bank, 
    :bank_account, :bank_account_type, :bank_agency, :personal_email, :job_email, :other_email, :site_url, :score

    validates :name, presence: true
    validates :birthday, presence:true
    validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :sex, presence: true#, inclusion: { in: %w(m f) }, message: "%{value} is not valid"
    validates :ethnicity, presence: true#, inclusion: { in: %w(:muito_clara :bege :oriental :morena :morena_escura :mestico 
      #:mulata_amarelada :mulata_escura :negra_amarelada :negra_escura) }# message: "%{value} is not valid"
    validates :biotype, presence: true#, inclusion: { in: %w(:01 :02 :03) }, message: "%{value} is not valid"

  belongs_to :agency
end
