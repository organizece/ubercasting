module ModelsHelper

  def ethnicities
    ethnicities = []
    Model::ETHNICITIES.each { |ethnicity|
        ethnicities << [t(ethnicity, scope: :ethnicities), ethnicity]
    }
    
    ethnicities
  end

  def biotypes
    biotypes = []
    Model::BIOTYPES.each { |biotype|
        biotypes << [t(biotype, scope: :biotypes), biotype]
    }

    biotypes
  end

  def scores
    scores = []
    (0..5).each do |score|
      scores << [score, score]
    end

    scores
  end
end
