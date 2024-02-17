# frozen_string_literal: true

class CurrencyMapper
  def self.eur_to(target_currency)
    map['eur'][target_currency]
  end

  # this method reads values from a yml file
  def self.map
    @_map ||= YAML.load_file(File.join(File.dirname(__FILE__), 'currency_map.yml'))
  end
end
