class CurrencyInput < SimpleForm::Inputs::Base
  def input
    "#{I18n.t('number.currency.format.unit')} #{@builder.text_field(attribute_name, input_html_options)}".html_safe
  end
end
