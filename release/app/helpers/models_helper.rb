module ModelsHelper

  def ethnicity_types
    ethnicity_types = []
    ethnicity_types << ['Muito clara', :muito_clara]
    ethnicity_types << ['Bege', :bege]
    ethnicity_types << ['Oriental', :oriental]
    ethnicity_types << ['Morena', :morena]
    ethnicity_types << ['Morena escura', :morena_escura]
    ethnicity_types << ['Mestico', :mestico]
    ethnicity_types << ['Mulata amarelada', :mulata_amarelada]
    ethnicity_types << ['Mulata escura', :mulata_escura]
    ethnicity_types << ['Negra amarelada', :negra_amarelada]
    ethnicity_types << ['Negra escura', :negra_amarelada]

    
    ethnicity_types
  end

  def biotype_types
    biotype_types = []
    biotype_types << ['b01', :b01]
    biotype_types << ['b02', :b02]
    biotype_types << ['b03', :b03]

    biotype_types
  end
end
