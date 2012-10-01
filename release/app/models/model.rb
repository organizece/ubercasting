class Model < ActiveRecord::Base

  ETHNICITIES = %w( muito_clara 
                    bege 
                    oriental 
                    morena 
                    morena_escura 
                    mestico 
                    mulata_amarelada 
                    mulata_escura 
                    negra_amarelada 
                    negra_escura )

  BIOTYPES = %w( b01 
                 b02 
                 b03 )

  GENDERS = %w( male
                female )

  belongs_to :agency
  has_many :photos

  attr_accessible :name, :birthday, :age, :gender, :ethnicity, :biotype, :responsible, :responsible_cpf, :responsible_rg,
    :height, :eyes_color, :hair_color, :bust, :waist, :hip, :shoes, :sector, :job, :rg, :cpf, :cel_phone, :home_phone,
    :job_phone, :address, :address_number, :neighborhood, :complement, :cep, :city, :state, :country, :bank, 
    :bank_account, :bank_account_type, :bank_agency, :personal_email, :job_email, :other_email, :site_url, :score

  attr_readonly :ETHNICITIES, :BIOTYPES, :GENDERS
  
  validates :name, presence: true
  validates :birthday, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :gender, presence: true, inclusion: { in: GENDERS }
  validates :ethnicity, presence: true, inclusion: { in: ETHNICITIES }
  validates :biotype, presence: true, inclusion: { in: BIOTYPES }
  
  validates :responsible, presence: true, if: :minor_aged?
  validates :responsible_cpf, presence: true, cpf: true, if: :minor_aged?
  validates :responsible_rg, presence: true, if: :minor_aged?

  def minor_aged?
    age < 18
  end

end
