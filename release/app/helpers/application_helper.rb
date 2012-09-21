module ApplicationHelper

  def states
    states = []
    states << ['', '']
    states << ['Acre', :AC]
    states << ['Alagoas', :AL]
    states << ['Amapa', :AP]
    states << ['Amazonas', :AM]
    states << ['Bahia', :BH]
    states << ['Ceara', :CE]
    states << ['Distrito Federal', :DF]
    states << ['Espirito Santo', :ES]
    states << ['Goias', :GO]
    states << ['Maranhao', :MA]
    states << ['Mato Grosso', :MT]
    states << ['Mato Grosso do Sul', :MS]
    states << ['Minas Gerais', :MG]
    states << ['Para', :PA]
    states << ['Paraiba', :PB]
    states << ['Parana', :PR]
    states << ['Pernambuco', :PE]
    states << ['Piaui', :PI]
    states << ['Rio de Janeiro', :RJ]
    states << ['Rio Grande do Norte', :RN]
    states << ['Rio Grande do Sul', :RS]
    states << ['Rondonia', :RO]
    states << ['Roraima', :RR]
    states << ['Santa Catarina', :SC]
    states << ['Sao Paulo', :SP]
    states << ['Sergipe', :SE]
    states << ['Tocantins', :TO]

    states
  end

  def models_scores
    models_scores = []
    (0..5).each do |score|
      models_scores << [score, score]
    end

    models_scores
  end
end
