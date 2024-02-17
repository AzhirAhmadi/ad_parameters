class String
  def to_euro_from(from_currency)
    return to_f if from_currency == 'EUR'

    (to_f * CurrencyMapper.eur_to(from_currency.downcase)).round(5)
  end
end
