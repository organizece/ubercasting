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

  BIOTYPES = %w( branco 
                 mulato 
                 negro 
                 mestico 
                 latino 
                 oriental )

  GENDERS = %w( male
                female )

  EYES_COLOR = %w( azul_claro
                   azul_escuro 
                   castanho_claro 
                   castanho_escuro 
                   verde_claro 
                   verde_escuro )
  
  HAIR_COLOR = %w( branco 
                   castanho_claro 
                   castanho_escuro 
                   preto 
                   loiro 
                   ruivo )

  SPECIALTIES = %w( moda_passarela 
                    moda_editorial 
                    eventos 
                    publicidade 
                    atuacao )

  belongs_to :agency
  has_many :photos, dependent: :destroy

  attr_accessible :name, :birthday, :age, :gender, :ethnicity, :biotype, :responsible, :responsible_cpf, :responsible_rg,
    :height, :weight, :eyes_color, :hair_color, :bust, :waist, :hip, :shoes, :sector, :job, :rg, :cpf, :cel_phone, :home_phone,
    :job_phone, :specialty, :address, :address_number, :neighborhood, :complement, :cep, :city, :state, :country, :bank, 
    :bank_account, :bank_account_type, :bank_agency, :personal_email, :job_email, :other_email, :site_url, :score, :avatar_photo_id

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
    age != nil and age < 18
  end

  def avatar
    self.photos.find_by_id(avatar_photo_id)
  end

  def self.search(criteria)
    models = Model.where(agency_id: criteria.agency_id)
    models = models.where("gender = ?", "#{criteria.gender}") if criteria.gender.present?
    models = models.where("age >= ?", "#{criteria.age_from}") if criteria.age_from.present?
    models = models.where("age <= ?", "#{criteria.age_to}") if criteria.age_to.present?
    models = models.where("biotype = ?", "#{criteria.biotype}") if criteria.biotype.present?
    models = models.where("eyes_color = ?", "#{criteria.eyes_color}") if criteria.eyes_color.present?
    models = models.where("hair_color = ?", "#{criteria.hair_color}") if criteria.hair_color.present?
    models = models.where("specialty like ?", "%#{criteria.specialty}%") if criteria.specialty.present?
    models = models.where("weight >= ?", "#{criteria.weight_from}") if criteria.weight_from.present?
    models = models.where("weight <= ?", "#{criteria.weight_to}") if criteria.weight_to.present?
    models = models.where("bust >= ?", "#{criteria.bust_from}") if criteria.bust_from.present?
    models = models.where("bust <= ?", "#{criteria.bust_to}") if criteria.bust_to.present?
    models = models.where("waist >= ?", "#{criteria.waist_from}") if criteria.waist_from.present?
    models = models.where("waist <= ?", "#{criteria.waist_to}") if criteria.waist_to.present?
    models = models.where("hip >= ?", "#{criteria.hip_from}") if criteria.hip_from.present?
    models = models.where("hip <= ?", "#{criteria.hip_to}") if criteria.hip_to.present?

    models
  end

end
