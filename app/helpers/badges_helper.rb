module BadgesHelper

  def types_collection
    Badge::TYPES.map { |type| [I18n.t(:rule_desc, scope: type.underscore.to_sym),type]}
  end
end
